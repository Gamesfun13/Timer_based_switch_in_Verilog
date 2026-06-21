# Timer_based_switch_in_Verilog
Timer in Verilog that triggers Out signal based on input reference time.

Simulation:
1. iverilog -o sim inputmodule.v multiplexer.v  inputmodule2.v  fullinput.v dflipflop.v counter1to9.v counter1to5.v  bcdto7segment.v  digitalclock.v comparator.v   mainmodule.v finaltestbench.v
2. vvp sim
3. gtkwave wave.vcd
