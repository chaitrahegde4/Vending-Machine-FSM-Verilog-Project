// Code your design here
module vending_fsm(input clk, rst, input [1:0] coin, output reg pr, change);

  parameter ideal = 3'b000, rs1 = 3'b001, rs2 = 3'b010, rs3 = 3'b011, rs4 = 3'b100;

  reg [2:0] pr_state;
  reg [2:0] nxt_state;
  reg [2:0] count = 0;

  always @(posedge clk) begin
    if (rst) begin
      count = 0;
      pr_state = ideal;
    end else begin
      count = count + 1;
      pr_state = nxt_state;
    end
  end

  always @(pr_state, coin, count) begin
    case (pr_state)
      ideal: begin
        pr = 0;
        change = 0;
        if (coin == 1)
          nxt_state = rs1;
        else if (coin == 2)
          nxt_state = rs2;
        else
          nxt_state = ideal;
      end

      rs1: begin
        pr = 0;
        change = 0;
        if (coin == 1)
          nxt_state = rs2;
        else if (coin == 2)
          nxt_state = rs3;
        else begin
          if (count == 4)
            nxt_state = ideal;
          else
            nxt_state = rs1;
        end
      end

      rs2: begin
        pr = 0;
        change = 0;
        if (coin == 1)
          nxt_state = rs3;
        else if (coin == 2)
          nxt_state = rs4;
        else begin
          if (count == 4)
            nxt_state = ideal;
          else
            nxt_state = rs2;
        end
      end

      rs3: begin
        nxt_state = ideal;
        pr = 1;
        change = 0;
      end

      rs4: begin
        nxt_state = ideal;
        pr = 1;
        change = 1;
      end
    endcase
  end

endmodule