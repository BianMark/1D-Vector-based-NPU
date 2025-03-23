# Assign pins
setPinAssignMode -pinEditInBatch true

# Assign D pins
editPin -fixedPin True				\
	-fixOverlap True			\
	-unit MICRON				\
	-spreadDirection counterclockwise	\
	-side Left				\
	-layer 4				\
	-spreadType center			\
	-spacing 2.5				\
	-pin {{D[*]}}

# Assign Q pins
editPin -fixedPin True				\
	-fixOverlap True			\
	-unit MICRON				\
	-spreadDirection clockwise		\
	-side Right				\
	-layer 4				\
	-spreadType center			\
	-spacing 2.5				\
	-pin {{Q[*]}}

# Assign other pins
editPin -fixedPin True				\
	-fixOverlap True			\
	-unit MICRON				\
	-spreadDirection counterclockwise	\
	-side Top				\
	-layer 3				\
	-spreadType center			\
	-spacing 4				\
	-pin {{A[*]} CEN clk WEN}

