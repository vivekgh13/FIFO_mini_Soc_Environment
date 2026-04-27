class wr_agent;

wr_gen w_g;
wr_bfm w_b;
wr_mon w_m;
wr_cov w_c;
wr_tx w_t;
 function new(virtual fifo_if vif,
              mailbox#(wr_tx) gen2bfm,
                      mailbox#(wr_tx) mon2cov,
                              mailbox#(wr_tx) mon2sbd
			     );
  w_g=new(gen2bfm);
  w_b=new(gen2bfm,vif);
  w_m=new(vif,mon2cov,mon2sbd);
  w_c=new(mon2cov);
endfunction

task run();
  fork
  w_g.run();
  w_b.run();
  w_m.run();
  w_c.run();
  join
endtask

endclass
