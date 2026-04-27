class wr_cov;
 mailbox#(wr_tx) mon2cov;
 wr_tx t;
covergroup cg;
WRITES: coverpoint t.wr_en{
bins WRITES={1'b1};
}
endgroup


  function new(mailbox#(wr_tx) mon2cov);
this.mon2cov=mon2cov;
cg=new();
endfunction
task run();
  forever begin
    mon2cov.get(t);
//	t.print("wr_cov");
    cg.sample();
  end
 endtask

endclass


