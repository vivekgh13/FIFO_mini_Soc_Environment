class rd_tx extends uvm_sequence_item;
  
       bit [`WIDTH-1:0] r_data;
  rand bit rd_en;
       bit empty;
	   bit underflow;
 
 constraint rd{
  rd_en==1;
 }

 `uvm_object_utils_begin(rd_tx)
    `uvm_field_int(rd_en,UVM_ALL_ON);
    `uvm_field_int(r_data,UVM_ALL_ON);
    `uvm_field_int(empty,UVM_ALL_ON);
    `uvm_field_int(underflow,UVM_ALL_ON);
 `uvm_object_utils_end

 `NEW_OBJ

endclass
