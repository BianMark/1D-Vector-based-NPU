
grep -E "WARN|Warn|warn" out.log > warning.log
grep -E "ERROR|Error|error" out.log > error.log
tclsh clean_syn.tcl