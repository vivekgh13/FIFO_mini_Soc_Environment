class rd_gen;

rd_tx t;
mailbox#(rd_tx) gen2bfm;

function new(mailbox#(rd_tx) gen2bfm);
 this.gen2bfm=gen2bfm;
endfunction
task run();
  case(common::testname)
   "FULL":begin
   end
    "EMPTY":begin
      wait(common::wr_gen_count==common::wr_bfm_count);
      reads(`FIFO_SIZE);
    end
   "OVERFLOW":begin
    
   end
    "CONCURRENT":begin
    end
 endcase
 
endtask
task reads(int n);
  repeat(n) begin
  t=new();
  t.randomize();
  gen2bfm.put(t);
   // t.print("rd_gen");
  end
endtask
endclass



