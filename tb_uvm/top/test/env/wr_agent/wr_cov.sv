class wr_cov extends uvm_subscriber#(wr_tx);
wr_tx tx;
  
`uvm_component_utils(wr_cov)


covergroup cg;
 WRITES : coverpoint tx.wr_en{
 bins WRITES={1'b1};
 }
 endgroup

 function new(string name="",uvm_component parent);
 super.new(name,parent);
 cg=new();
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
endfunction

  virtual function void write(wr_tx t);
    $cast(tx,t);
cg.sample();
endfunction

endclass

