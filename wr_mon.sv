class wr_mon;
  virtual fifo_if vif;
  wr_tx t;
   mailbox#(wr_tx) mon2cov;
   mailbox#(wr_tx) mon2sbd;
  function new(virtual fifo_if vif,
                mailbox#(wr_tx) mon2cov,
                mailbox#(wr_tx) mon2sbd);
     this.vif=vif;
	 this.mon2cov=mon2cov;
	 this.mon2sbd=mon2sbd;

  endfunction
task run();
   forever begin
    t=new();
    @(posedge vif.wr_mon_cb);
    t.wr_en<=vif.wr_mon_cb.wr_en;
    t.w_data<=vif.wr_mon_cb.w_data;
    t.full<=vif.wr_mon_cb.full;
    t.overflow<=vif.wr_mon_cb.overflow;
	mon2cov.put(t);
	mon2sbd.put(t);
   // t.print("wr_mon");
  end
endtask

endclass


