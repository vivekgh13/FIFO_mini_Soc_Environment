`include "uvm_pkg.sv"
import uvm_pkg::*;

`include"uvm_macros.svh"

`include "fifo_common.sv"
`include "fifo.v"

`include "fifo_if.sv"
`include "wr_tx.sv"
`include "rd_tx.sv"

`include "wr_sqr.sv"
`include "rd_sqr.sv"

`include "wr_drv.sv"
`include "rd_drv.sv"
`include "wr_mon.sv"
`include "rd_mon.sv"
`include "wr_cov.sv"
`include "rd_cov.sv"

`include "wr_agent.sv"
`include "rd_agent.sv"

//`include "sbd.sv"
`include "env.sv"
`include "wr_seq.sv"
`include "rd_seq.sv"

`include "fifo_test.sv"
`include "fifo_top.sv"

