##################################
# Input/Output Constraints File
##################################
set CLK_PERIOD 12.50 
set CLK_LATENCY 1.50
set CLK_SKEW 0.80
set CLK_JITTER 0.40
set SETUP_UNCERTAINTY [expr $CLK_SKEW + $CLK_JITTER]
set INPUT_DELAY 2.00
set OUTPUT_DELAY 3.00

#######################
### Clock constraints
#######################
create_clock clk -period $CLK_PERIOD -waveform {0.0 7.5}
    ### remember to update -waveform when you change clock period
set_clock_latency $CLK_LATENCY clk
set_clock_uncertainty -setup $SETUP_UNCERTAINTY clk
set_clock_uncertainty -hold $CLK_SKEW clk
set_clock_transition -rise 0.15 clk
set_clock_transition -fall 0.13 clk

# Virtual clock for input/output signals
create_clock -name v_clk -period $CLK_PERIOD -waveform {0.0 7.5}
    ### remember to update -waveform when you change clock period

#######################
### Max transition/capacitance
#######################
set_max_transition 1.5 [current_design]
set_max_capacitance 0.5 [current_design]

#######################
#### Input constraints
#######################
set_input_delay $INPUT_DELAY -clock v_clk [remove_from_collection [all_inputs] clk]
set_max_fanout 1 [all_inputs]
set_input_transition -rise 0.25 [all_inputs]
set_input_transition -fall 0.28 [all_inputs]

#######################
#### Outputs constraints
#######################
set_output_delay $OUTPUT_DELAY -clock v_clk [all_outputs]
set_load 0.0005 [all_outputs]
