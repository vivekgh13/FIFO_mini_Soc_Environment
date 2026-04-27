class wr_tx;

rand bit [`WIDTH-1:0] w_data;
 rand bit wr_en;
	 bit full;
	 bit overflow;

	 function void print(string name="wr_tx");
       $display("%0t=========%s==========",$time,name);
       $display("w_data=%0d",w_data);
       $display("wr_en=%0d",wr_en);
       $display("full=%0d",full);
       $display("overflow=%0d",overflow);
	 endfunction
  
	 constraint c{
      wr_en==1'b1;
	 }

endclass

