if {[info exist env(FASTROUTE_TCL)]} {
  source $env(FASTROUTE_TCL)
} else {
  set_global_routing_layer_adjustment $env(MIN_ROUTING_LAYER)-$env(MAX_ROUTING_LAYER) 0.5
  set_routing_layers -signal $env(MIN_ROUTING_LAYER)-$env(MAX_ROUTING_LAYER)
  if {[info exist env(MACRO_EXTENSION)]} {
    set_macro_extension $env(MACRO_EXTENSION)
  }
}

set PREV_STEINERTREE_ALGORITHM $::env(STEINERTREE_ALGORITHM)
set env(STEINERTREE_ALGORITHM) "5"
source $env(SCRIPTS_DIR)/report_metrics.tcl
global_route {*}$::env(GLOBAL_ROUTE_ARGS)
set_propagated_clock [all_clocks]
estimate_parasitics -global_routing
report_metrics 5 "1 REST"
set env(STEINERTREE_ALGORITHM) $PREV_STEINERTREE_ALGORITHM

global_route {*}$::env(GLOBAL_ROUTE_ARGS)
set_propagated_clock [all_clocks]
estimate_parasitics -global_routing
report_metrics 5 "2 TD1"

global_route {*}$::env(GLOBAL_ROUTE_ARGS)
set_propagated_clock [all_clocks]
estimate_parasitics -global_routing
report_metrics 5 "3 TD2"

global_route {*}$::env(GLOBAL_ROUTE_ARGS)
set_propagated_clock [all_clocks]
estimate_parasitics -global_routing
report_metrics 5 "4 TD3"

global_route {*}$::env(GLOBAL_ROUTE_ARGS)
set_propagated_clock [all_clocks]
estimate_parasitics -global_routing
report_metrics 5 "5 TD4"