module top;

bit wr_clk=0,rd_clk=0,rst;

always #5 wr_clk=~wr_clk;

always#5 rd_clk=~rd_clk;

initial begin
  rst=1;
  repeat(2);
@(posedge wr_clk);
rst=0;
end

  fifo_if pif(wr_clk,rd_clk,rst);

fifo dut(.wr_clk(wr_clk),
         .rd_clk(rd_clk),
		 .rst   (rst),
		 .wr_en (pif.wr_en),
		 .rd_en (pif.rd_en ),  
		 .w_data(pif.w_data), 
		 .r_data(pif.r_data),
		 .full      (pif.full),    
		 .overflow (pif.overflow),
		 .empty    (pif.empty), 
		 .underflow(pif.underflow)); 
		 
env env_h;

initial begin
$value$plusargs("test=%s",common::testname);
  env_h=new(pif);
env_h.run();

end
initial begin
#800;
  
if(common::matchings!=0 && common::mis_matchings==0)begin
    $display("test passed");
    $display("macthings=%0d mismatchings=%0d",common::matchings,common::mis_matchings);
  end
else begin 
  $display("test failed");
  $display("macthings=%0d mismatchings=%0d",common::matchings,common::mis_matchings);
end
  $finish;

end

  initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0,top);
end

endmodule

