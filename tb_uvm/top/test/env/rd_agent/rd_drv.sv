class rd_drv extends uvm_driver#(rd_tx);

virtual fifo_if vif;

`uvm_component_utils(rd_drv);

`NEW_COMP

function void build_phase(uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db#(virtual fifo_if)::get(this,"","fifo_pif",vif))
`uvm_fatal("rd_drv","no vif")
endfunction

task run_phase(uvm_phase phase);
forever begin
seq_item_port.get_next_item(req);
drive_tx(req);
seq_item_port.item_done();

end
endtask

task drive_tx(rd_tx t);

@(vif.rd_drv_cb);

vif.rd_drv_cb.rd_en<=t.rd_en;
  wait(vif.rd_drv_cb.r_data!=0);

if(t.rd_en==1) 
t.r_data<=vif.rd_drv_cb.r_data;
else
t.r_data<=0;
t.empty<=vif.rd_drv_cb.empty;
t.underflow<=vif.rd_drv_cb.underflow;

@(vif.rd_drv_cb);
vif.rd_drv_cb.rd_en<=0;

  
endtask

endclass


