module top;
 
 bit wr_clk,rd_clk,rst;
 
 always #5 wr_clk=~wr_clk;
 always #5 rd_clk=~rd_clk;

 fifo_if pif(wr_clk,rd_clk,rst);
 
 fifo dut(.wr_clk(wr_clk),
          .rd_clk(rd_clk),
		  .rst(rst),
		  .w_data(pif.w_data),
		  .r_data(pif.r_data),
		  .wr_en(pif.wr_en),
		  .rd_en(pif.rd_en),
		  .full(pif.full),
		  .overflow(pif.overflow),
          .underflow(pif.underflow),
          .empty(pif.empty));

 initial begin
  rst=1;
   pif.w_data=0;
   pif.wr_en=0;
   pif.rd_en=0;
  repeat(2)
  @(posedge wr_clk)
  rst=0;
 end

 initial begin
  uvm_config_db#(virtual fifo_if)::set(null,"*.env_h.*","fifo_pif",pif);
  run_test();
 end

 initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0,top);
 end

endmodule

