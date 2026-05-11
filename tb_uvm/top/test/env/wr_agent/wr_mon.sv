class wr_mon extends uvm_monitor;

wr_tx t;
virtual fifo_if vif;
uvm_analysis_port#(wr_tx) mon_ap_h;

`uvm_component_utils(wr_mon)

function new(string name="",uvm_component parent);
 super.new(name,parent);
 mon_ap_h=new("mon_ap_h",this);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db#(virtual fifo_if)::get(this,"","fifo_pif",vif))
`uvm_fatal("wr_mon","no vif")
endfunction

task run_phase(uvm_phase phase);
forever begin
@(vif.wr_mon_cb);
t=wr_tx::type_id::create("t",this);
t.wr_en<=vif.wr_mon_cb.wr_en;
t.w_data<=vif.wr_mon_cb.w_data;
t.full<=vif.wr_mon_cb.full;
t.overflow<=vif.wr_mon_cb.overflow;

mon_ap_h.write(t);
end

endtask

endclass


