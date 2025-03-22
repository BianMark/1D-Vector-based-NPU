
editPin -fixedPin True -fixOverlap True -unit MICRON -spreadDirection clockwise -side Top -layer 4 -spreadType center -spacing 4 -pin {clk clk_o {inst[*]} reset {sum_in[*]} fifo_ext_rd {sum_out[*]}}

# Assign pins
setPinAssignMode -pinEditInBatch true

# Assign Bottom Pins
editPin -fixedPin True				\
	-fixOverlap True			\
	-unit MICRON				\
	-spreadDirection counterclockwise	\
	-side Bottom				\
	-layer 4				\
	-spreadType center			\
	-spacing 4				\
	-pin {{out[*]}}

# Assign Top pins
editPin -fixedPin True				\
	-fixOverlap True			\
	-unit MICRON				\
	-spreadDirection clockwise		\
	-side Top				\
	-layer 4				\
	-spreadType center			\
	-spacing 4				\
	-pin {clk {inst[*]} }

# Assign Left pins
editPin -fixedPin True				\
	-fixOverlap True			\
	-unit MICRON				\
	-spreadDirection counterclockwise	\
	-side Left				\
	-layer 3				\
	-spreadType center			\
	-spacing 4				\
	-pin {{mem_in[*]}}

