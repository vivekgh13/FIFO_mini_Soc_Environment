class wr_gen;

wr_tx t;
mailbox#(wr_tx) gen2bfm;

function new(mailbox#(wr_tx) gen2bfm);
 this.gen2bfm=gen2bfm;
endfunction
task run();
  case(common::testname)
   "FULL":begin
     writes(`FIFO_SIZE);
   end
    "EMPTY":begin
     writes(`FIFO_SIZE);
      common::wr_gen_count=`FIFO_SIZE;
      // $display("gen c=%0d",common::wr_gen_count);
   end
   "OVERFLOW":begin
   writes(18);
   end
    "CONCURRENT":begin
     writes(`FIFO_SIZE);
   end
 endcase

endtask
task writes(int n);
  repeat(n) begin
  t=new();
  t.randomize();
     gen2bfm.put(t);
  //  t.print("wr_gen");
   
    end
endtask
endclass



