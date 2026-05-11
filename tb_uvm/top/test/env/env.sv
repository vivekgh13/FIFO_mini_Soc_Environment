class env extends uvm_env;

wr_agent w_a;
rd_agent r_a;
//sbd sbd_h;
  
`uvm_component_utils(env)

`NEW_COMP

function void build_phase(uvm_phase phase);
super.build_phase(phase);
w_a=wr_agent::type_id::create("w_a",this);
r_a=rd_agent::type_id::create("r_a",this);
//sbd_h=sbd::type_id::create("sbd_h",this);
endfunction

//function void connect_phase(uvm_phase phase);
//w_a.mon_h.mon_ap_h.connect(sbd_h.wr_imp);
//r_a.mon_h.mon_ap_h.connect(sbd_h.rd_imp);
//endfunction

endclass

