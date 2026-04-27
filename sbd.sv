class sbd;
mailbox#(wr_tx) wr_mon2sbd;
mailbox#(rd_tx) rd_mon2sbd;
wr_tx w_t;
rd_tx r_t;
int q[$];
int data;
function new(mailbox#(wr_tx) wr_mon2sbd,
             mailbox#(rd_tx) rd_mon2sbd);
 this.wr_mon2sbd=wr_mon2sbd;
 this.rd_mon2sbd=rd_mon2sbd;
endfunction
task run();
forever begin
 wr_mon2sbd.get(w_t);
// w_t.print("wr_sbd");
 q.push_back(w_t.w_data);
 end
 endtask

 task run1();
   forever begin
   rd_mon2sbd.get(r_t);
  // r_t.print("rd_sbd");
   if(q.size!=0) begin
   data=q.pop_front();
   if(r_t.r_data==data) common::matchings++;
   else common::mis_matchings++;
   end
   end

 endtask

endclass

