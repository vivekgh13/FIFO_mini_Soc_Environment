class wr_drv extends uvm_driver#(wr_tx);

virtual fifo_if vif;

`uvm_component_utils(wr_drv)

`NEW_COMP

function void build_phase(uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db#(virtual fifo_if)::get(this,"","fifo_pif",vif))
`uvm_fatal("wr_drv","no vif")
endfunction

task run_phase(uvm_phase phase);
forever begin
seq_item_port.get_next_item(req);
drive_tx(req);
seq_item_port.item_done();

end
endtask

task drive_tx(wr_tx t);

@(vif.wr_drv_cb);

vif.wr_drv_cb.wr_en<=t.wr_en;
if(t.wr_en==1) 
vif.wr_drv_cb.w_data<=t.w_data;
else
vif.wr_drv_cb.w_data<=0;
t.full<=vif.wr_drv_cb.full;
t.overflow<=vif.wr_drv_cb.overflow;

@(vif.wr_drv_cb);
vif.wr_drv_cb.wr_en<=0;
vif.wr_drv_cb.w_data<=0;

endtask

endclass

