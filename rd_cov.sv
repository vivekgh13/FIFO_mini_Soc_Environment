class rd_cov;
 mailbox#(rd_tx) mon2cov;
 rd_tx t;
covergroup cg;
READS: coverpoint t.rd_en{
bins READS={1'b1};
}
endgroup


  function new(mailbox#(rd_tx) mon2cov);
this.mon2cov=mon2cov;
cg=new();
endfunction
task run();
  forever begin
    mon2cov.get(t);
//	t.print("rd_cov");
    cg.sample();
  end
 endtask

endclass

