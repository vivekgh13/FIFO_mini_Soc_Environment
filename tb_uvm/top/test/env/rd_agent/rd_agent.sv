class rd_agent extends uvm_agent;
rd_sqr sqr_h;
rd_drv drv_h;
rd_mon mon_h;
rd_cov cov_h;

`uvm_component_utils(rd_agent)

`NEW_COMP

function void build_phase(uvm_phase phase);
super.build_phase(phase);
sqr_h=rd_sqr::type_id::create("sqr_h",this);
drv_h=rd_drv::type_id::create("drv_h",this);
mon_h=rd_mon::type_id::create("mon_h",this);
cov_h=rd_cov::type_id::create("cov_h",this);
endfunction

function void connect_phase(uvm_phase phase);
drv_h.seq_item_port.connect(sqr_h.seq_item_export);
mon_h.mon_ap_h.connect(cov_h.analysis_export);
endfunction

endclass

