// Testbench
module vending_fsm_tb();
  reg clk, rst;
  reg [1:0] coin;
  wire pr, change;

  time t;
  reg check_product;
  reg check_change;

  vending_fsm dut (clk, rst, coin, pr, change);  

  task reset();
  begin
    @(posedge clk)
    rst = 1'b1;
    @(posedge clk)
    rst = 1'b0;
  end
  endtask

  task self_check();
  begin
    insert(2'd2);
    insert(2'd1);
    check_product = 1;
    check_change = 0;
    compare(check_product, check_change);

    reset();
    insert(2'd2);
    insert(2'd2);
    check_product = 1;
    check_change = 1;
    compare(check_product, check_change);

    reset();
    insert(2'd1);
    insert(2'd1);
    check_product = 1;
    check_change = 0;
    compare(check_product, check_change);
  end
  endtask 

  task compare(input pr_chk, change_chk);
  begin
    @(negedge clk)
    if(pr == pr_chk && change == change_chk)
      $display("Working properly");
    else
      $display("Not working pr = %d change", pr, change);
  end
  endtask

  task insert(input [1:0] money);
  begin
    @(negedge clk)
    coin = money;
  end
  endtask

  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end

  initial begin
    reset();
    self_check();
    #300 $finish();
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    end 
endmodule