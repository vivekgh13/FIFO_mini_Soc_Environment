class rd_cov extends uvm_subscriber#(rd_tx);
rd_tx tx;
`uvm_component_utils(rd_cov)


covergroup cg;
 READS : coverpoint tx.rd_en{
 bins READS={1'b1};
 }
 endgroup

 function new(string name="",uvm_component parent);
 super.new(name,parent);
 cg=new();
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
endfunction

virtual function void write(rd_tx t);
  $cast(tx,t);
cg.sample();
endfunction

endclass
