interface fifo_if(input reg wr_clk,rd_clk,rst);
 bit wr_en;
 bit [`WIDTH-1:0] w_data;
 bit full;
 bit overflow;

 bit rd_en;
 bit [`WIDTH-1:0] r_data;
 bit empty;
 bit underflow;

clocking wr_bfm_cb@(posedge wr_clk);
default input#0 output#1;
input full,overflow;
output wr_en,w_data;
endclocking

  clocking rd_bfm_cb@(posedge rd_clk);
default input#0 output#1;
input empty,r_data,underflow;
output rd_en;
endclocking
 
 clocking wr_mon_cb@(posedge wr_clk);
 default input#1;
 input wr_en,w_data,full,overflow;
 endclocking

 clocking rd_mon_cb@(posedge rd_clk);
 default input#1;
 input rd_en,r_data,empty,underflow;
 endclocking

endinterface
