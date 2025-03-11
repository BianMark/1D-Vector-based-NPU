# Floorplan
floorPlan -site core -r 1 0.50 10 10 10 10

globalNetConnect VDD -type pgpin -pin VDD -inst * -verbose
globalNetConnect VSS -type pgpin -pin VSS -inst * -verbose

addRing -spacing {top 1 bottom 1 left 1 right 1} -width {top 2 bottom 2 left 2 right 2}  -layer {top M1 bottom M1 left M2 right M2} -center 1 -type core_rings -nets {VSS  VDD}

setAddStripeMode -break_at {block_ring}

### Note: Change the number of strip  by looking at the layout #########
addStripe -number_of_sets 5 -spacing 2 -direction horizontal -layer M5 -width 2 -nets { VDD VSS }
#################################################


setObjFPlanBox Instance add_instance1 25 75.4675 52.9745 99.8675
setObjFPlanBox Instance add_instance0 25 25.831 52.971 52.231

addHaloToBlock {3 3 3 3} add_instance0
addHaloToBlock {3 3 3 3} add_instance1


addRing -nets {VDD VSS} -type block_rings -around each_block -layer {top M1 bottom M1 left M2 right M2} -width {top 0.5 bottom 0.5 left 0.5 right 0.5} -spacing {top 0.5 bottom 0.5 left 0.5 right 0.5} 


globalNetConnect VDD -type pgpin -pin VDD -sinst add_instance0 -verbose -override
globalNetConnect VSS -type pgpin -pin VSS -sinst add_instance1 -verbose -override        


sroute 


