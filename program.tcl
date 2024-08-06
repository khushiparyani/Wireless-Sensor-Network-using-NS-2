algorithm ring-star-hybrid-topology:
set ns [new Simulator]
set topo [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god $val(nn)
set tracefile [open mmout.tr w]
$ns trace-all $tracefile
set namfile [open mmout.nam w]
$ns namtrace-all $namfile
$ns namtrace-all-wireless $namfile $val(x) $val(y)
set chan [new $val(chan)];#Create wireless channel
$ns node-config -adhocRouting $val(rp) \
set n0 [$ns node]
$n0 set X_ 382
$n0 set Y_ 208
$n0 set Z_ 0.0
$nsinitial_node_pos $n0 20
set n1 [$ns node]
$n1 set X_ 371
$n1 set Y_ 336
$n1 set Z_ 0.0
$nsinitial_node_pos $n1 20
set n2 [$ns node]
$n2 set X_ 546
$n2 set Y_ 342
proc finish {} {
global ns tracefile namfile
$ns flush-trace
close $tracefile
close $namfile
exec nam mmout.nam &
exit 0
}
for {set i 0} {$i < $val(nn) } { incr i } {
$ns at $val(stop) "\$n$i reset"
}
$ns at $val(stop) "$n