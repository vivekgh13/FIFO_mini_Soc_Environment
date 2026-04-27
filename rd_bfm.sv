class rd_bfm;
  mailbox#(rd_tx) gen2bfm;
  virtual fifo_if vif;
  rd_tx t;
 
  function new(mailbox#(rd_tx) gen2bfm,
               virtual fifo_if vif);
    this.gen2bfm=gen2bfm;
    this.vif=vif;
    
  endfunction
  
  task run();
    forever begin
     
    gen2bfm.get(t);
  //  t.print("rd_bfm");
       drive_tx(t);
     
    end
 endtask
  task drive_tx(rd_tx t);
    @(vif.rd_bfm_cb);
    vif.rd_bfm_cb.rd_en<=t.rd_en;
    wait(vif.rd_bfm_cb.r_data!=0);
    if(t.rd_en==1) begin
      t.r_data=vif.rd_bfm_cb.r_data;
    end
    else t.r_data=0;
      t.empty=vif.rd_bfm_cb.empty;
      t.underflow=vif.rd_bfm_cb.underflow;
    @(vif.rd_bfm_cb);
    vif.rd_bfm_cb.rd_en<=0;
    
    
  endtask
endclass

