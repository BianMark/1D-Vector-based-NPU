#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Wed Mar 19 21:30:50 2025                
#                                                     
#######################################################

#@(#)CDS: Innovus v15.23-s045_1 (64bit) 04/22/2016 12:32 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute 15.23-s045_1 NR160414-1105/15_23-UB (database version 2.30, 317.6.1) {superthreading v1.26}
#@(#)CDS: AAE 15.23-s014 (64bit) 04/22/2016 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 15.23-s022_1 () Apr 22 2016 09:38:45 ( )
#@(#)CDS: SYNTECH 15.23-s008_1 () Apr 12 2016 21:52:59 ( )
#@(#)CDS: CPE v15.23-s045
#@(#)CDS: IQRC/TQRC 15.1.4-s213 (64bit) Tue Feb  9 17:31:28 PST 2016 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getDrawView
loadWorkspace -name Physical
win
setMultiCpuUsage -localCpu 8
set init_pwr_net VDD
set init_gnd_net VSS
set init_verilog ./netlist/core.v
set init_design_netlisttype Verilog
set init_design_settop 1
set init_top_cell core
set init_lef_file /home/linux/ieng6/ee260bwi25/public/PDKdata/lef/tcbn65gplus_8lmT2.lef
create_library_set -name WC_LIB -timing $worst_timing_lib
create_library_set -name BC_LIB -timing $best_timing_lib
create_library_set -name TC_LIB -timing $typical_timing_lib
create_rc_corner -name Cmax -cap_table $worst_captbl -T 125
create_rc_corner -name Cmin -cap_table $best_captbl -T -40
create_delay_corner -name WC -library_set WC_LIB -rc_corner Cmax
create_delay_corner -name BC -library_set BC_LIB -rc_corner Cmin
create_delay_corner -name TC -library_set TC_LIB -rc_corner Cmin
create_constraint_mode -name CON -sdc_file [list $sdc]
create_analysis_view -name WC_VIEW -delay_corner WC -constraint_mode CON
create_analysis_view -name BC_VIEW -delay_corner BC -constraint_mode CON
create_analysis_view -name TC_VIEW -delay_corner TC -constraint_mode CON
init_design -setup WC_VIEW -hold BC_VIEW
set_interactive_constraint_modes {CON}
setDesignMode -process 65
floorPlan -site core -r 1 0.50 10 10 10 10
globalNetConnect VDD -type pgpin -pin VDD -inst * -verbose
globalNetConnect VSS -type pgpin -pin VSS -inst * -verbose
addRing -spacing {top 2 bottom 2 left 2 right 2} -width {top 3 bottom 3 left 3 right 3} -layer {top M1 bottom M1 left M2 right M2} -center 1 -type core_rings -nets {VSS VDD}
setAddStripeMode -break_at block_ring
addStripe -nets {VDD VSS} -layer M4 -direction vertical -width 2 -spacing 6 -number_of_sets 19 -start_from left -start 20 -stop 535
sroute
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixedPin True -fixOverlap True -unit MICRON -spreadDirection clockwise -side Left -layer 3 -spreadType center -spacing 4 -pin {clk {inst[*]} reset		 {mem_in[*]} }
editPin -fixedPin True -fixOverlap True -unit MICRON -spreadDirection clockwise -side Right -layer 3 -spreadType center -spacing 2.5 -pin {{out[*]}	 {sum_out[*]} }
setPinAssignMode -pinEditInBatch false
saveDesign floorplan.enc
setPlaceMode -timingDriven true -reorderScan false -congEffort medium -modulePlan false -placeIOPins false
setOptMode -effort high -powerEffort high -leakageToDynamicRatio 0.5 -fixFanoutLoad true -restruct true -verbose true
place_opt_design
addFiller -cell {FILL FILL4 DCAP8 DCAP16 DCAP32} -merge true
saveDesign placement.enc
set_ccopt_property -update_io_latency false
create_ccopt_clock_tree_spec -file ./constraints/core.ccopt
ccopt_design
set_propagated_clock [all_clocks]
optDesign -postCTS -hold
saveDesign cts.enc
setNanoRouteMode -quiet -drouteAllowMergedWireAtPin false
setNanoRouteMode -quiet -drouteFixAntenna true
setNanoRouteMode -quiet -routeWithTimingDriven true
setNanoRouteMode -quiet -routeWithSiDriven true
setNanoRouteMode -quiet -routeSiEffort medium
setNanoRouteMode -quiet -routeWithSiPostRouteFix false
setNanoRouteMode -quiet -drouteAutoStop true
setNanoRouteMode -quiet -routeSelectedNetOnly false
setNanoRouteMode -quiet -drouteStartIteration default
routeDesign
setExtractRCMode -engine postRoute
extractRC
setAnalysisMode -analysisType onChipVariation -cppr both
optDesign -postRoute -setup -hold
optDesign -postRoute -drv
optDesign -postRoute -inc
saveDesign route.enc
verifyGeometry
verifyConnectivity
report_timing -max_paths 5 > ${design}.post_route.timing.rpt
report_power -outfile core.post_route.power.rpt
summaryReport -nohtml -outfile core.post_route.summary.rpt
report_ccopt_worst_chain -file core.post_route.worst_chain.rpt
streamOut core.gds2
write_lef_abstract -stripePin -PGPinLayers 4 -extractBlockPGPinLayers 4 core.lef -specifyTopLayer 4
defOut -netlist -routing core.def
saveNetlist core.pnr.v
setAnalysisMode -setup
set_analysis_view -setup WC_VIEW -hold WC_VIEW
do_extract_model -view WC_VIEW -format dotlib ${design}_WC.lib
write_sdf -view WC_VIEW ${design}_WC.sdf
setAnalysisMode -hold
set_analysis_view -setup BC_VIEW -hold BC_VIEW
do_extract_model -view BC_VIEW -format dotlib ${design}_BC.lib
write_sdf -view BC_VIEW ${design}_BC.sdf
selectInst FILLER_11830
fit
deselectAll
selectInst FILLER_11830
deselectAll
selectInst FILLER_11830
deselectAll
selectInst FILLER_11830
deselectAll
selectInst FILLER_11830
deselectAll
selectInst FILLER_11830
deselectAll
selectInst U10425
zoomIn
zoomIn
deselectAll
selectInst U10425
deselectAll
selectWire 228.4500 240.9500 228.5500 252.4500 4 intadd_7_n1
gui_select -rect {225.213 253.377 232.527 249.495}
zoomSelected
deselectAll
selectInst U10425
deselectAll
selectInst U10425
deselectAll
selectWire 228.4500 240.9500 228.5500 252.4500 4 intadd_7_n1
gui_select -rect {228.099 252.242 228.910 251.633}
zoomSelected
deselectAll
selectMarker 228.5500 251.9000 228.5550 251.9100 1 1 37
deselectAll
selectMarker 228.5500 251.9000 228.5550 251.9100 1 1 37
setLayerPreference violation -isVisible 1
uiKit::addWidget vb -type main
violationBrowser -all -no_display_false
zoomBox 228.05 251.4 229.055 252.41
zoomBox 228.05 251.4 229.055 252.41
deselectAll
selectInst U10425
setLayerPreference term -isVisible 0
setLayerPreference violation -isVisible 0
setLayerPreference busguide -isVisible 0
setLayerPreference aggress -isVisible 0
setLayerPreference text -isVisible 0
setLayerPreference pinText -isVisible 0
setLayerPreference flightLine -isVisible 0
setLayerPreference portNum -isVisible 0
setLayerPreference dpt -isVisible 0
setLayerPreference term -isVisible 1
setLayerPreference violation -isVisible 1
setLayerPreference busguide -isVisible 1
setLayerPreference aggress -isVisible 1
setLayerPreference text -isVisible 1
setLayerPreference pinText -isVisible 1
setLayerPreference flightLine -isVisible 1
setLayerPreference portNum -isVisible 1
setLayerPreference dpt -isVisible 1
setLayerPreference term -isVisible 0
setLayerPreference violation -isVisible 0
setLayerPreference busguide -isVisible 0
setLayerPreference aggress -isVisible 0
setLayerPreference text -isVisible 0
setLayerPreference pinText -isVisible 0
setLayerPreference flightLine -isVisible 0
setLayerPreference portNum -isVisible 0
setLayerPreference dpt -isVisible 0
setLayerPreference term -isVisible 1
setLayerPreference violation -isVisible 1
setLayerPreference busguide -isVisible 1
setLayerPreference aggress -isVisible 1
setLayerPreference text -isVisible 1
setLayerPreference pinText -isVisible 1
setLayerPreference flightLine -isVisible 1
setLayerPreference portNum -isVisible 1
setLayerPreference dpt -isVisible 1
redraw
zoomBox 228.05 251.4 229.055 252.41
fit
verifyGeometry
verifyConnectivity
report_timing -max_paths 5 > ${design}.post_route.timing.rpt
report_power -outfile core.post_route.power.rpt
summaryReport -nohtml -outfile core.post_route.summary.rpt
report_ccopt_worst_chain -file core.post_route.worst_chain.rpt
optDesign -postRoute -drv
fit
gui_select -rect {573.992 359.882 592.264 530.038}
verifyGeometry
verifyConnectivity
report_timing -max_paths 5 > ${design}.post_route.timing.rpt
report_power -outfile core.post_route.power.rpt
summaryReport -nohtml -outfile core.post_route.summary.rpt
report_ccopt_worst_chain -file core.post_route.worst_chain.rpt
streamOut core.gds2
write_lef_abstract -stripePin -PGPinLayers 4 -extractBlockPGPinLayers 4 core.lef -specifyTopLayer 4
defOut -netlist -routing core.def
saveNetlist core.pnr.v
setAnalysisMode -setup
set_analysis_view -setup WC_VIEW -hold WC_VIEW
do_extract_model -view WC_VIEW -format dotlib ${design}_WC.lib
write_sdf -view WC_VIEW ${design}_WC.sdf
setAnalysisMode -setup
set_analysis_view -setup TC_VIEW -hold TC_VIEW
do_extract_model -view TC_VIEW -format dotlib ${design}_TC.lib
write_sdf -view TC_VIEW ${design}_TC.sdf
setAnalysisMode -hold
set_analysis_view -setup BC_VIEW -hold BC_VIEW
do_extract_model -view BC_VIEW -format dotlib ${design}_BC.lib
write_sdf -view BC_VIEW ${design}_BC.sdf
streamOut core.gds2
write_lef_abstract core.lef
defOut -netlist -routing core.def
saveNetlist core.pnr.v
setAnalysisMode -setup
set_analysis_view -setup WC_VIEW -hold WC_VIEW
do_extract_model -view WC_VIEW -format dotlib ${design}_WC.lib
write_sdf -view WC_VIEW ${design}_WC.sdf
setAnalysisMode -setup
set_analysis_view -setup TC_VIEW -hold TC_VIEW
do_extract_model -view TC_VIEW -format dotlib ${design}_TC.lib
write_sdf -view TC_VIEW ${design}_TC.sdf
setAnalysisMode -hold
set_analysis_view -setup BC_VIEW -hold BC_VIEW
do_extract_model -view BC_VIEW -format dotlib ${design}_BC.lib
write_sdf -view BC_VIEW ${design}_BC.sdf
fit
