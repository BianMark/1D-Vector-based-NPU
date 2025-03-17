
set clock_cycle 3.5
set io_delay 0.2 

set clock_port clk

create_clock -name clk -period $clock_cycle [get_ports $clock_port]

set_input_delay -clock [get_clocks clk] -add_delay -max $io_delay [get_ports {*}]
set_output_delay -clock [get_clocks clk] -add_delay -max $io_delay [get_ports {*}]



#set_multicycle_path -setup 2 -from [get_cells fifo_top_instance/fifo_instance/rd_ptr*] -to [get_cells out_reg*]
#set_multicycle_path -hold 1 -from [get_cells fifo_top_instance/fifo_instance/rd_ptr*] -to [get_cells out_reg*]

#set_multicycle_path -setup 2 -from [get_cells fifo_top_instance/fifo_instance/q*] -to [get_cells out_reg*]
#set_multicycle_path -hold 1 -from [get_cells fifo_top_instance/fifo_instance/q*] -to [get_cells out_reg*]

#set_multicycle_path -setup 2 -from [get_cells sum_q_reg*] -to [get_cells out_reg*]
#set_multicycle_path -hold 1 -from [get_cells sum_q_reg*] -to [get_cells out_reg*]


