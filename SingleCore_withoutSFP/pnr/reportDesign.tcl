

verifyGeometry
verifyConnectivity

# Timing report
report_timing -max_paths 5 > ${design}.post_route.timing.rpt

# Power report
report_power -outfile ${design}.post_route.power.rpt

# Design report
summaryReport -outfile ${design}.post_route.summary.rpt

report_ccopt_worst_chain -file ${design}.post_route.worst_chain.rpt

#report_area -out_file ${design}.post_route.area.rpt