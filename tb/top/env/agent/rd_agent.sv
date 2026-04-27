class rd_agent;

rd_gen r_g;
rd_bfm r_b;
rd_mon r_m;
rd_cov r_c;
rd_tx r_t;
 function new(virtual fifo_if vif,
              mailbox#(rd_tx) gen2bfm,
              mailbox#(rd_tx) mon2cov,
              mailbox#(rd_tx) mon2sbd
			     );
  r_g=new(gen2bfm);
  r_b=new(gen2bfm,vif);
   r_m=new(vif,mon2cov,mon2sbd);
  r_c=new(mon2cov);
endfunction

task run();
  fork
  r_g.run();
  r_b.run();
  r_m.run();
  r_c.run();
  join
endtask

endclass
