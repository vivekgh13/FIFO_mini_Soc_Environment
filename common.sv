`define WIDTH 8
`define FIFO_SIZE 16
`define PTR_WIDTH $clog2(`FIFO_SIZE)
class common;
static string testname;
 static int wr_gen_count;
  static int wr_bfm_count;
  static int matchings;
  static int mis_matchings;
endclass

