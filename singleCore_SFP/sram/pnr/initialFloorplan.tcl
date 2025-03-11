# Floorplan
floorPlan -site core -r 1 0.50 10 10 10 10

globalNetConnect VDD -type pgpin -pin VDD -inst * -verbose
globalNetConnect VSS -type pgpin -pin VSS -inst * -verbose


# addRing -spacing {top 2 bottom 2 left 2 right 2} -width {top 3 bottom 3 left 3 right 3} -layer {top M1 bottom M1 left M2 right M2} -center 1 -type core_rings -nets {VSS VDD}

setAddStripeMode -break_at {block_ring}

addStripe -nets {VDD VSS} -layer M4 -direction vertical -width 2 -spacing 6 -number_of_sets 19 -start_from left -start 20 -stop 535

sroute


