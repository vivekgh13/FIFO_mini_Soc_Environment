class env;
wr_agent w_a;
rd_agent r_a;
sbd sbd_h;
  mailbox#(wr_tx) wr_gen2bfm;
  mailbox#(wr_tx) wr_mon2cov;
  mailbox#(wr_tx) wr_mon2sbd;
  mailbox#(rd_tx) rd_gen2bfm;
  mailbox#(rd_tx) rd_mon2cov;
  mailbox#(rd_tx) rd_mon2sbd;

function new(virtual fifo_if vif);
wr_gen2bfm=new();
wr_mon2cov=new(); 
wr_mon2sbd=new();
rd_gen2bfm=new();
rd_mon2cov=new();
rd_mon2sbd=new();

w_a=new(vif,wr_gen2bfm,wr_mon2cov,wr_mon2sbd);
  r_a=new(vif,rd_gen2bfm,rd_mon2cov,rd_mon2sbd);
sbd_h=new(wr_mon2sbd,rd_mon2sbd);


endfunction

task run();
  fork
 w_a.run();
 r_a.run();
 sbd_h.run();
    sbd_h.run1();
  join
endtask

endclass

