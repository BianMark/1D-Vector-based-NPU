# Synopsis design constraints for sram_in
set clock_cycle 3.5
set io_delay 0.55
set clock_port clk

create_clock -name clk -period $clock_cycle [get_ports $clock_port]

# Input delay
set_input_delay -clock [get_clocks clk] -add_delay -max $io_delay [get_ports {WEN}]
set_input_delay -clock [get_clocks clk] -add_delay -max $io_delay [get_ports {CEN}]
set_input_delay -clock [get_clocks clk] -add_delay -max $io_delay [get_ports {D}]
set_input_delay -clock [get_clocks clk] -add_delay -max $io_delay [get_ports {A}]

# Output delay
set_output_delay -clock [get_clocks clk] -add_delay -max $io_delay [get_ports {Q}]


