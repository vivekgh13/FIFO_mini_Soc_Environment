class wr_tx extends uvm_sequence_item;
  
  rand bit [`WIDTH-1:0] w_data;
  rand bit wr_en;
       bit full;
	   bit overflow;
 
 constraint wr{
  wr_en==1;
 }

 `uvm_object_utils_begin(wr_tx)
    `uvm_field_int(wr_en,UVM_ALL_ON);
    `uvm_field_int(w_data,UVM_ALL_ON);
    `uvm_field_int(full,UVM_ALL_ON);
    `uvm_field_int(overflow,UVM_ALL_ON);
 `uvm_object_utils_end

 `NEW_OBJ

endclass

