class seq extends uvm_sequence#(wr_tx);

wr_tx w_t;

`uvm_object_utils(seq)

`NEW_OBJ

task body();
`uvm_do_with(req,{req.wr_en==1})
                  
endtask

endclass
