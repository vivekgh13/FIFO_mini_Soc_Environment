class rd_tx;

rand bit [`WIDTH-1:0] r_data;
 rand bit rd_en;
	 bit empty;
	 bit underflow;

	 function void print(string name="rd_tx");
       $display("%0t=========%s==========",$time,name);
       $display("r_data=%0d",r_data);
       $display("rd_en=%0d",rd_en);
       $display("empty=%0d",empty);
       $display("underflow=%0d",underflow);
	 endfunction
    constraint c{
       rd_en==1'b1;
	}
endclass


