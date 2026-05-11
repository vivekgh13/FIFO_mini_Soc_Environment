class fifo_test extends uvm_test;
 env env_h;
 wr_seq wr_seq_h;
 rd_seq rd_seq_h;
int match_count;
int mismatch_count;
bit test_f;

 `uvm_component_utils(fifo_test)

`NEW_COMP

function void build_phase(uvm_phase phase);
super.build_phase(phase);
env_h=env::type_id::create("env_h",this);
wr_seq_h=wr_seq::type_id::create("wr_seq_h",this);
rd_seq_h=rd_seq::type_id::create("rd_seq_h",this);
endfunction

function void end_of_elaboration();
 uvm_top.print_topology();
endfunction

task run_phase(uvm_phase phase);
 phase.raise_objection(this);
  wr_seq_h.start(env_h.w_a.sqr_h);
  rd_seq_h.start(env_h.r_a.sqr_h);
 phase.phase_done.set_drain_time(this,100);
 phase.drop_objection(this);
endtask

/* function void extract_phase(uvm_phase phase);
match_count=env_h.sbd_h.match_count;
mismatch_count=env_h.sbd_h.mismatch_count;
endfunction

function void check_phase(uvm_phase phase);
if(match_count==`WIDTH && mismatch_count==0) 
test_f=1;
else
test_f=0;
endfunction

function void report_phase(uvm_phase phase);
if(test_f)
`uvm_info("uvm_test","=========test_pass=========",UVM_NONE)
else
`uvm_fatal("uvm_test","==========test_fail========")
endfunction */

endclass

