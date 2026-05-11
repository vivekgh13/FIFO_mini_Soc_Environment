`uvm_analysis_imp_decl(_wr)
`uvm_analysis_imp_decl(_rd)

class sbd extends uvm_scoreboard;

int match_count;
int mismatch_count;

`uvm_analysis_imp_wr #(wr_tx,sbd) wr_imp;
`uvm_analysis_imp_rd #(rd_tx,sbd) rd_imp;


bit [`WIDTH-1:0]q[$];

`uvm_component_utils(sbd);

function new(string name="",uvm_component parent); 
 super.new(name,parent); 
  wr_imp=new("wr_imp",this);
rd_imp=new("rd_imp",this);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);

endfunction
function void write_wr(wr_tx t);
$cast(tx,t);
 if(tx.wr_en)
 q.push_back(tx.w_data);
endfunction

function void write_rd(rd_tx t);
bit [`WIDTH-1:0] exp_data;
$cast(tx,t);
if(tx.rd_en) begin
exp_data=q.pop_front();
if(exp_data==tx.r_data) begin
match_count++;
`uvm_info("sbd",$sformatf("exp_data=%0d is matching with actual data=%0d",exp_data,tx.r_data),UVM_NONE);
end
else begin
mismatch_count++;
`uvm_error("sbd",$sformatf("exp_data=%0d is not matching with actual data=%0d",exp_data,tx.r_data));
end
end
endfunction
 endclass
