class wr_bfm;

mailbox#(wr_tx) gen2bfm;
virtual fifo_if vif;
wr_tx t;

function new(mailbox#(wr_tx) gen2bfm,
             virtual fifo_if vif);
  this.gen2bfm=gen2bfm;
  this.vif=vif;
endfunction

task run();
  forever begin
  gen2bfm.get(t);
 // t.print("wr_bfm");
  drive_t(t);
    common::wr_bfm_count++;
   //  $display("bfm c=%0d",common::wr_bfm_count);
  end
 
endtask
 task drive_t(wr_tx t);
    
 @(vif.wr_bfm_cb);
 vif.wr_bfm_cb.wr_en<=t.wr_en;
 
   if(t.wr_en==1)
  vif.wr_bfm_cb.w_data<=t.w_data;
  else vif.wr_bfm_cb.w_data<=0;
   t.full<=vif.wr_bfm_cb.full;
  t.overflow<=vif.wr_bfm_cb.overflow;
 @(vif.wr_bfm_cb);
 vif.wr_bfm_cb.wr_en<=0;
 vif.wr_bfm_cb.w_data<=0;
 
endtask
             

endclass


