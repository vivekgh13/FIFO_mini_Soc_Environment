class rd_seq extends uvm_sequence#(rd_tx);

rd_tx r_t;

  `uvm_object_utils(rd_seq)

`NEW_OBJ

task body();
  repeat(`WIDTH) begin
  `uvm_do_with(req,{req.rd_en==1;})
  end
endtask

endclass

