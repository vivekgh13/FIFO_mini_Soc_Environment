interface fifo_if(input reg wr_clk,rd_clk,rst);
 logic wr_en,rd_en;
 logic [`WIDTH-1:0] w_data;
 logic [`WIDTH-1:0] r_data;
 logic full,empty,overflow,underflow;

 clocking wr_drv_cb@(posedge wr_clk);
 default input#0 output#1;
 output w_data,wr_en;
 input full,overflow;
 endclocking

 clocking rd_drv_cb@(posedge rd_clk);
 default input#0 output#1;
 output rd_en;
 input r_data,empty,underflow;
 endclocking

 clocking wr_mon_cb@(posedge wr_clk);
 default input#1;
  input w_data,wr_en;
 input full,overflow;
 endclocking

 clocking rd_mon_cb@(posedge rd_clk);
 default input#1;
 input rd_en;
 input r_data,empty,underflow;
 endclocking


endinterface

