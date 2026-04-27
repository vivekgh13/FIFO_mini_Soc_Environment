class rd_mon;
  virtual fifo_if vif;
  rd_tx t;
   mailbox#(rd_tx) mon2cov;
   mailbox#(rd_tx) mon2sbd;
  function new(virtual fifo_if vif,
               mailbox#(rd_tx) mon2cov,
    mailbox#(rd_tx) mon2sbd);
     this.vif=vif;
	 this.mon2cov=mon2cov;
	 this.mon2sbd=mon2sbd;

  endfunction
task run();
   forever begin
    @(posedge vif.rd_mon_cb);
	if(vif.rd_mon_cb.rd_en==1) begin
	t=new();
   
    t.rd_en<=vif.rd_mon_cb.rd_en;
      wait(vif.rd_mon_cb.r_data!=0);
    t.r_data<=vif.rd_mon_cb.r_data;
    t.empty<=vif.rd_mon_cb.empty;
    t.underflow<=vif.rd_mon_cb.underflow;
	mon2cov.put(t);
	mon2sbd.put(t);
   // t.print("rd_mon");
    end
  end
endtask

endclass



