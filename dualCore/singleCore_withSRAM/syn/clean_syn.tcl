
set hidden_file ".template"

set patterns { \
    "*old" \
    ".template" \
    "template"  \
    "gate"}

foreach pattern $patterns {
    set files [glob -nocomplain $pattern]
    foreach f $files {
        if {[file exists $f]} {
            puts "Deleting: $f"
            file delete -force $f}}}

if {[file exists $hidden_file]} {
    puts "Deleting: $hidden_file"
    file delete -force $hidden_file
}
