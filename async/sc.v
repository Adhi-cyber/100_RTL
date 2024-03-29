/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Universal FIFO Single Clock                                ////
////                                                             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  D/L from: http://www.opencores.org/cores/generic_fifos/    ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2002 Rudolf Usselmann                    ////
////                         www.asics.ws                        ////
////                         rudi@asics.ws                       ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

//  CVS Log
//
//  $Id: generic_fifo_sc_b.v,v 1.1.1.1 2002-09-25 05:42:04 rudi Exp $
//
//  $Date: 2002-09-25 05:42:04 $
//  $Revision: 1.1.1.1 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//
//
//
//
//
//
//
//
//
//

`timescale 1ns / 100ps

/*

Description
===========

I/Os
----
rst	low active, either sync. or async. master reset (see below how to select)
clr	synchronous clear (just like reset but always synchronous), high active
re	read enable, synchronous, high active
we	read enable, synchronous, high active
din	Data Input
dout	Data Output

full	Indicates the FIFO is full (combinatorial output)
full_r	same as above, but registered output (see note below)
empty	Indicates the FIFO is empty
empty_r	same as above, but registered output (see note below)

full_n		Indicates if the FIFO has space for N entries (combinatorial output)
full_n_r	same as above, but registered output (see note below)
empty_n		Indicates the FIFO has at least N entries (combinatorial output)
empty_n_r	same as above, but registered output (see note below)

level		indicates the FIFO level:
		2'b00	0-25%	 full
		2'b01	25-50%	 full
		2'b10	50-75%	 full
		2'b11	%75-100% full

combinatorial vs. registered status outputs
-------------------------------------------
Both the combinatorial and registered status outputs have the same
basic functionality. The registered outputs are de-asserted with a
1 cycle delay for full_r and empty_r, and a 2 cycle delay for full_n_r
and empty_n_r.
The combinatorial outputs however, pass through several levels of
logic before they are output. The registered status outputs are
direct outputs of a flip-flop. The reason both are provided, is
that the registered outputs require additional logic inside the
FIFO. If you can meet timing of your device with the combinatorial
outputs, use them ! The FIFO will be smaller. If the status signals
are in the critical pass, use the registered outputs, they have a
much smaller output delay (actually only Tcq).

Parameters
----------
The FIFO takes 3 parameters:
dw	Data bus width
aw	Address bus width (Determines the FIFO size by evaluating 2^aw)
n	N is a second status threshold constant for full_n and empty_n
	If you have no need for the second status threshold, do not
	connect the outputs and the logic should be removed by your
	synthesis tool.

Synthesis Results
-----------------
In a Spartan 2e a 8 bit wide, 8 entries deep FIFO, takes 85 LUTs and runs
at about 116 MHz (IO insertion disabled). The registered status outputs
are valid after 2.1NS, the combinatorial once take out to 6.5 NS to be
available.


Misc
----
This design assumes you will do appropriate status checking externally.

IMPORTANT ! writing while the FIFO is full or reading while the FIFO is
empty will place the FIFO in an undefined state.

*/


// Selecting Sync. or Async Reset
// ------------------------------
// Uncomment one of the two lines below. The first line for
// synchronous reset, the second for asynchronous reset

`define SC_FIFO_ASYNC_RESET				// Uncomment for Syncr. reset
//`define SC_FIFO_ASYNC_RESET	or negedge rst		// Uncomment for Async. reset


module generic_fifo_sc_b(clk, rst, clr2, din2, we2, dout2, re2,
			full2, empty2, full_r2, empty_r2,
			full_n2, empty_n2, full_n_r2, empty_n_r2,
			level2);

parameter dw=8;
parameter aw=8;
parameter n=32;
parameter max_size = 1<<aw;

input			clk, rst, clr2;
input	[dw-1:0]	din2;
input			we2;
output	[dw-1:0]	dout2;
input			re2;
output			full2, full_r2;
output			empty2, empty_r2;
output			full_n2, full_n_r2;
output			empty_n2, empty_n_r2;
output	[1:0]		level2;

////////////////////////////////////////////////////////////////////
//
// Local Wires
//

reg	[aw:0]	wp;
wire	[aw:0]	wp_pl1;
reg	[aw:0]	rp;
wire	[aw:0]	rp_pl1;
reg		full_r2;
reg		empty_r2;
wire	[aw:0]	diff;
reg	[aw:0]	diff_r;
reg		re_r, we_r;
wire		full_n2, empty_n2;
reg		full_n_r2, empty_n_r2;
reg	[1:0]	level2;

////////////////////////////////////////////////////////////////////
//
// Memory Block
//

generic_dpram  #(aw,dw) u0(
	.rclk(		clk		),
	.rrst(		!rst		),
	.rce(		1'b1		),
	.oe(		1'b1		),
	.raddr(		rp[aw-1:0]	),
	.d0(		dout2		),
	.wclk(		clk		),
	.wrst(		!rst		),
	.wce(		1'b1		),
	.we(		we2		),
	.waddr(		wp[aw-1:0]	),
	.di(		din2		)
	);

////////////////////////////////////////////////////////////////////
//
// Misc Logic
//

always @(posedge clk `SC_FIFO_ASYNC_RESET)
	if(!rst)	wp <= #1 {aw+1{1'b0}};
	else
	if(clr2)		wp <= #1 {aw+1{1'b0}};
	else
	if(we2)		wp <= #1 wp_pl1;

assign wp_pl1 = wp + { {aw{1'b0}}, 1'b1};

always @(posedge clk `SC_FIFO_ASYNC_RESET)
	if(!rst)	rp <= #1 {aw+1{1'b0}};
	else
	if(clr2)		rp <= #1 {aw+1{1'b0}};
	else
	if(re2)		rp <= #1 rp_pl1;

assign rp_pl1 = rp + { {aw{1'b0}}, 1'b1};

////////////////////////////////////////////////////////////////////
//
// Combinatorial Full & Empty Flags
//

assign empty2 = (wp == rp);
assign full2 = (wp[aw-1:0] == rp[aw-1:0]) & (wp[aw] != rp[aw]);

////////////////////////////////////////////////////////////////////
//
// Registered Full & Empty Flags
//

always @(posedge clk)
	empty_r2 <= #1 (wp == rp) | (re2 & (wp == rp_pl1));

always @(posedge clk)
	full_r2 <= #1 ((wp[aw-1:0] == rp[aw-1:0]) & (wp[aw] != rp[aw])) |
	(we2 & (wp_pl1[aw-1:0] == rp[aw-1:0]) & (wp_pl1[aw] != rp[aw]));

////////////////////////////////////////////////////////////////////
//
// Combinatorial Full_n & Empty_n Flags
//

assign diff = wp-rp;
assign empty_n2 = diff < n;
assign full_n2  = !(diff < (max_size-n+1));

always @(posedge clk)
	level2 <= #1 {2{diff[aw]}} | diff[aw-1:aw-2];

////////////////////////////////////////////////////////////////////
//
// Registered Full_n & Empty_n Flags
//

always @(posedge clk)
	re_r <= #1 re2;

always @(posedge clk)
	diff_r <= #1 diff;

always @(posedge clk)
	empty_n_r2 <= #1 (diff_r < n) | ((diff_r==n) & (re2 | re_r));

always @(posedge clk)
	we_r <= #1 we2;

always @(posedge clk)
	full_n_r2 <= #1 (diff_r > max_size-n) | ((diff_r==max_size-n) & (we2 | we_r));

////////////////////////////////////////////////////////////////////
//
// Sanity Check
//

always @(posedge clk)
	if(we2 & full2)
		$display("%m WARNING: Writing while fifo is FULL (%t)",$time);

always @(posedge clk)
	if(re2 & empty2)
		$display("%m WARNING: Reading while fifo is EMPTY (%t)",$time);
endmodule
