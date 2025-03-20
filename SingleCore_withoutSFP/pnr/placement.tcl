# Placement
saveDesign floorplan.enc
#setPlaceMode -timingDriven true -reorderScan false -congEffort medium -modulePlan false -placeIOPins false 

# Note Hierarchical design need "-modulePlan true" 
# Flatten design need "-modulePlan false"
# If the Pins are already placed(pinPlacement.tcl), use "-placeIOPins false"
setPlaceMode -timingDriven true -reorderScan false -congEffort medium -modulePlan false -placeIOPins false 

setOptMode -effort high -powerEffort high -leakageToDynamicRatio 0.5 -fixFanoutLoad true -restruct true -verbose true 
place_opt_design

addFiller -cell {FILL FILL4 DCAP8 DCAP16 DCAP32} -merge true

saveDesign placement.enc