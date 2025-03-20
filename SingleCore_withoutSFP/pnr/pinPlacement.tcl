
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true

editPin -fixedPin True				\
	-fixOverlap True			\
	-unit MICRON				\
	-spreadDirection clockwise		\
	-side Left				\
	-layer 3				\
	-spreadType center			\
	-spacing 4				\
	-pin {clk {inst[*]} reset		\
		{mem_in[*]} }

editPin -fixedPin True				\
	-fixOverlap True			\
	-unit MICRON				\
	-spreadDirection clockwise		\
	-side Right				\
	-layer 3				\
	-spreadType center			\
	-spacing 2.5				\
	-pin {{out[*]}	\
		{sum_out[*]} }

setPinAssignMode -pinEditInBatch false