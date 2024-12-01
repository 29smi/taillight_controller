`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//
// Project - Tail light controller Gate-Level Simulation testbench
// 
// 
//////////////////////////////////////////////////////////////////////////////////

module taillight_controller_syn_tb;

   // inputs to DUT
   reg clk;
   reg rst_n;
   reg turn_right;
   reg turn_left;
   reg brake;

   // outputs from DUT
   wire [2:0] right_taillight_control;
   wire [2:0] left_taillight_control;  
   integer file;

   // Instantiate Taillight Controller
   taillight_controller DUT (
                       .brake(brake),
                       .clk(clk),
                       .rst_n(rst_n),
                       .turn_right(turn_right),
                       .turn_left(turn_left),
                       .right_taillight_control(right_taillight_control),
                       .left_taillight_control(left_taillight_control)
                       );
   

   // 10n period clock generation - 100 MHz
   always begin
      #5 clk = ~clk;  // Half of 10ns is 5ns
   end
   // initial block for SDF back annotation
   initial begin
      $sdf_annotate("../../synthesis/netlists/taillight_controller_syn.sdf",taillight_controller_syn_tb.DUT, ,"back_annotate_taillight.log");
   end

    // Testbench stimulus
   initial begin
      
      // This File can be removed if not need, just included to have a seperate file instead the output console 
      file = $fopen("Taillight_Controller_syn.txt", "w");
      if(file == 0) begin
         $display("Error: Could not open file");
         $finish;
      end

      $fdisplay(file, "ti = time");
      $fdisplay(file, "rst = reset");
      $fdisplay(file, "bk = brake");
      $fdisplay(file, "tr = turn_right");
      $fdisplay(file, "tl = turn_left");
      $fdisplay(file, "rtc = right_taillight_controller");
      $fdisplay(file, "ltc = left_taillight_controller");

      // Initialization
      $fdisplay(file, "+-----------------------------------------------------------------------------------+");
      $fdisplay(file, "\t\tti\t | rst\t | bk\t | tr\t | tl\t | rtc\t | ltc\t |");
      $fmonitor(file, "%t\t | %1b\t | %1b\t | %1b\t | %1b\t | %3b\t | %3b\t |", $time, rst_n, brake, turn_right, turn_left, right_taillight_control, left_taillight_control);
      clk = 0;
      rst_n = 0;     
      turn_left = 0;
      turn_right = 0;
      brake = 0;

      repeat(3)
      @(negedge clk);

      // reset goes inactive
      rst_n = 1;

      repeat(2)
      @(negedge clk);

      
      $fdisplay(file, "+-----------------------------------------------------------------------------------+");
      $fdisplay(file, "Test Case 1: when only turn left is active ");
      // Test Case 1: Only turn_left is active and 
      // the sequencer should illuminate in a 
      // repeating {001}{011}{111}{000} sequence
      // with each lasting five clock cyles

      turn_left = 1;
      repeat(20) @(negedge clk);
      turn_left = 0;
      repeat(3) @(negedge clk);
      
      $fdisplay(file, "+-----------------------------------------------------------------------------------+");
      $fdisplay(file, "Test Case 2: when only turn right is active ");
      // Test Case 2: Only turn_right is active and 
      // the sequencer should illuminate in a 
      // repeating {001}{011}{111}{000} sequence
      // with each lasting five clock cyles

      turn_right = 1;
      repeat(20) @(negedge clk);
      turn_right = 0;
      repeat(3) @(negedge clk);
      
      $fdisplay(file, "+-----------------------------------------------------------------------------------+");
      $fdisplay(file, "Test Case 3: when only brake is active ");
      // Test Case 3: when only brake is active, all
      // tail light must illuminate
      brake = 1;
      repeat(5) @(negedge clk);
      brake = 0;
      repeat(3) @(negedge clk);
      
      
      $fdisplay(file, "+-----------------------------------------------------------------------------------+");
      $fdisplay(file, "Test Case 4: when both turn right and brake are active ");
      // Test Case 4: both turn_right and brake are active, 
      // all left tail lights must illuminate {111} and right tail light
      // must illumunate in a repeating {111}{110}{100}{000}
      // sequence with each lasting five clock cycles.
      turn_right = 1;
      brake = 1;
      repeat(20) @(negedge clk);
      turn_right = 0;
      brake = 0;
      repeat(3) @(negedge clk);
      
      $fdisplay(file, "+-----------------------------------------------------------------------------------+");
      $fdisplay(file, "Test Case 5: when both turn left and active are active ");
      // Test Case 5: both turn_left and brake are active, 
      // all right tail lights must illuminate {111} and left tail light
      // must illumunate in a repeating {111}{110}{100}{000}
      // sequence with each lasting five clock cycles.
      turn_left = 1;
      brake = 1;
      repeat(20) @(negedge clk);
      turn_left = 0;
      brake = 0;
      repeat(3) @(negedge clk);
      
      
      $fdisplay(file, "+-----------------------------------------------------------------------------------+");
      $fdisplay(file, "Test Case 6: when going from turn left to turn right ");
      // Test Case 6: Going from turn left to turn right 

      turn_left = 1;

      repeat(5) @(negedge clk);
      
      repeat(3) @(negedge clk);
      
      turn_left = 0;
      turn_right = 1;
      
      repeat(15) @(negedge clk);
      turn_right = 0;
      repeat(5) @(negedge clk);

      $fdisplay(file, "+-----------------------------------------------------------------------------------+");
      $fdisplay(file, "Test Case 7: when going from turn right to turn left ");
      // Test Case 7: Going from turn right to turn left

      turn_right = 1;

      repeat(5) @(negedge clk);
      
      repeat(3) @(negedge clk);
      
      turn_right = 0;
      turn_left = 1;
      
      repeat(15) @(negedge clk);
      turn_left = 0;
      repeat(5) @(negedge clk);

      
      $fdisplay(file, "+-----------------------------------------------------------------------------------+");
      
      // Perform finalization (close file)
      $fclose(file);
      $display("File closed and simulation finished");
     
     $finish;
   end

endmodule
