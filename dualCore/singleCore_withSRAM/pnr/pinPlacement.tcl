
# Assign pins
setPinAssignMode -pinEditInBatch true

# Assign Bottom Pins
#editPin -fixedPin True				\
	-fixOverlap True			\
	-unit MICRON				\
	-spreadDirection clockwise	\
	-side Bottom				\
	-layer 4				\
	-start 770.0 0.0			\
	-spacing 4				\
	-pin {{out[*]}}

editPin -pinWidth 0.1 -pinDepth 0.52 -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 4 -spreadType start -spacing 4.0 -start 780 0.0 -pin {{out[*]}}


# Assign Top pins
editPin -fixedPin True				\
	-fixOverlap True			\
	-unit MICRON				\
	-spreadDirection clockwise		\
	-side Top				\
	-layer 4				\
	-spreadType center			\
	-start 280.0 900				\
	-spacing 8				\
	-pin {clk {inst[*]} clk_o div_ready fifo_ext_rd reset}

# Assign Left pins
editPin -fixedPin True				\
	-fixOverlap True			\
	-unit MICRON				\
	-spreadDirection clockwise	\
	-side Left				\
	-layer 3				\
	-spreadType center			\
	-start 0.0 300				\
	-spacing 6				\
	-pin {{mem_in[*]}}

# Assign Right pins
editPin -fixedPin True				\
	-fixOverlap True			\
	-unit MICRON				\
	-spreadDirection counterclockwise		\
	-side Right				\
	-layer 3				\
	-spreadType center			\
	-start 0 300				\
	-spacing 8				\
	-pin {sum_out[*]}