
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Tail Light Controller Verilog Code
//////////////////////////////////////////////////////////////////////////////////


module taillight_controller(
   input wire clk,
   input wire rst_n,
   input wire turn_right,
   input wire turn_left,
   input wire brake,
   output reg [2:0]  right_taillight_control,
   output reg [2:0]  left_taillight_control
);


   // Internal sequential varibales - states and counters
   reg [3:0]  count_left;    // 3-bit counter for 5 clock cycles
   reg [3:0]  count_right;
   reg [1:0]  state_left;      // 2-bit state for sequence control
   reg [1:0]  state_right;




   // Combinational variables - next state logic
   reg [2:0]  right_taillight_control_next;
   reg [2:0]  left_taillight_control_next;

   reg [2:0]  count_next_left;
   reg [2:0]  count_next_right;

   reg [1:0]  state_next_left;
   reg [1:0]  state_next_right;


   // Sequential Logic
   always @(posedge clk or negedge rst_n) begin
       if (rst_n == 0) begin
           left_taillight_control  <= 3'b000;
           right_taillight_control <= 3'b000;
           count_left              <= 3'b000;
           count_right             <= 3'b000;
           state_left              <= 2'b00;
           state_right             <= 2'b00;
          
       end else begin
           left_taillight_control  <= left_taillight_control_next;
           right_taillight_control <= right_taillight_control_next;
           count_left              <= count_next_left;
           count_right             <= count_next_right;
           state_left              <= state_next_left;
           state_right             <= state_next_right;
       end
   end

// Combinationa logic
always @(*)
begin
   // Default assignments
   left_taillight_control_next   = left_taillight_control;
   right_taillight_control_next  = right_taillight_control;
   count_next_left               = count_left;
   count_next_right              = count_right;
   state_next_left               = state_left;
   state_next_right              = state_right;


   if((!turn_left && turn_right) || (turn_right && brake && !turn_left)) begin
       count_next_left = 3'b000;
       left_taillight_control_next = 3'b000;
       state_next_left = 2'b00;
   end
   if((turn_left && !turn_right) || (turn_left && brake && !turn_right)) begin
       count_next_right = 3'b000;
       right_taillight_control_next = 3'b000;
       state_next_right = 2'b00;
   end


   // 1. Functional requirement - when only left turn is active
   if (turn_left && !brake && !turn_right)
   begin
       case (state_left)
           2'b00: left_taillight_control_next = 3'b001;
           2'b01: left_taillight_control_next = 3'b011;
           2'b10: left_taillight_control_next = 3'b111;
           default: left_taillight_control_next = 3'b000;
       endcase
  
       if (count_left == 4) begin
           state_next_left = state_left + 1;
           count_next_left = 0;
       end else begin
           count_next_left = count_left + 1;
       end 
   end
   // 2. Functional requirement - when only right turn is active
   if (turn_right && !brake && !turn_left)
   begin
       case (state_right)
           2'b00: right_taillight_control_next = 3'b001;
           2'b01: right_taillight_control_next = 3'b011;
           2'b10: right_taillight_control_next = 3'b111;
           default: right_taillight_control_next = 3'b000;
       endcase


       if (count_right == 4) begin
           state_next_right = state_right + 1;
           count_next_right = 0;
       end else begin
           count_next_right = count_right + 1;
       end
   end


   // 3, 4 & 5. when brake is active
   if(brake) begin
       right_taillight_control_next = 3'b111;
       left_taillight_control_next  = 3'b111;
   // 2. when left turn is active and brake is active
       if(turn_left) begin
           case(state_left)
               2'b00: left_taillight_control_next = 3'b111;
               2'b01: left_taillight_control_next = 3'b110;
               2'b10: left_taillight_control_next = 3'b100;
               default : left_taillight_control_next = 3'b000;
           endcase


           if (count_left == 4) begin
               state_next_left = state_left + 1;
               count_next_left = 0;
           end else begin
               count_next_left = count_left + 1;
           end 
       end
       if(turn_right) begin
           case (state_right)
               2'b00: right_taillight_control_next = 3'b111;
               2'b01: right_taillight_control_next = 3'b110;
               2'b10: right_taillight_control_next = 3'b100;
               default: right_taillight_control_next = 3'b000;
           endcase


           if (count_right == 4) begin
               state_next_right = state_right + 1;
               count_next_right = 0;
           end else begin
               count_next_right = count_right + 1;
           end
       end

   end

   if((turn_left && turn_right && !brake) || (!turn_left && !turn_right && !brake)) begin
       left_taillight_control_next = 3'b000;
       right_taillight_control_next = 3'b000;
       state_next_left = 2'b00;
       count_next_left = 3'b000;
       state_next_right = 2'b00;
       count_next_right = 3'b000;
   end
end
endmodule
