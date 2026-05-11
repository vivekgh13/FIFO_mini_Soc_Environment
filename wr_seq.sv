class wr_seq extends uvm_sequence#(wr_tx);

wr_tx w_t;

  `uvm_object_utils(wr_seq)

`NEW_OBJ

task body();
  repeat(`WIDTH) begin
  `uvm_do_with(req,{req.wr_en==1;})
  end
endtask

endclass

