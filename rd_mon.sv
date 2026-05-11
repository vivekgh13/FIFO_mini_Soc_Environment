class rd_mon extends uvm_monitor;

rd_tx t;
virtual fifo_if vif;
uvm_analysis_port#(rd_tx) mon_ap_h;

`uvm_component_utils(rd_mon)

function new(string name="",uvm_component parent);
 super.new(name,parent);
 mon_ap_h=new("mon_ap_h",this);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db#(virtual fifo_if)::get(this,"","fifo_pif",vif))
`uvm_fatal("rd_mon","no vif")
endfunction

task run_phase(uvm_phase phase);
forever begin
@(vif.rd_mon_cb);
t=rd_tx::type_id::create("t",this);
t.rd_en<=vif.rd_mon_cb.rd_en;
t.r_data<=vif.rd_mon_cb.r_data;
t.empty<=vif.rd_mon_cb.empty;
t.underflow<=vif.rd_mon_cb.underflow;

mon_ap_h.write(t);
end

endtask

endclass

