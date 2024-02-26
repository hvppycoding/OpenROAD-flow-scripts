export PLATFORM               = asap7

export DESIGN_NAME            = ethmac

export VERILOG_FILES         = $(sort $(wildcard ./designs/src/$(DESIGN_NICKNAME)/*.v))
export SDC_FILE              = ./designs/$(PLATFORM)/_ethmac/constraint.sdc
export ABC_AREA               = 1

export CORE_UTILIZATION       = 40
export CORE_ASPECT_RATIO      = 1
export CORE_MARGIN            = 2
export PLACE_DENSITY          = 0.60

export DFF_LIB_FILE           = $($(CORNER)_DFF_LIB_FILE)

# My custom settings
export SKIP_INCREMENTAL_REPAIR = 1
export FLOW_VARIANT = _all_pl0p5
export STEINERTREE_ALGORITHM = 7
export WEIGHT_WIRELENGTH = 70
export WEIGHT_MAXPATHLENGTH = 30
export WEIGHT_OVERFLOW = 10
export ALL_WEIGHT_WIRELENGTH = 0.5
export ALL_WEIGHT_DETOUR = 0.5
export ALL_WEIGHT_OVERFLOW   = 0.2
export ALL_DETOUR_COST_FUNCTION = partial_linear
# DEFAULT_ALGORITHM	0
# FLUTE_ALGORITHM 	1
# REST_ALGORITHM	2
# MY_ALGORITHM		3
# HYBRID_ALGORITHM	4
# HYBRID_REST_ALGORITHM	5
# TD_ALGORITHM		6
# ALL_ALGORITHM		7

export PRE_GLOBAL_ROUTE = ./designs/$(PLATFORM)/_aes/pre_global_route_all.tcl

export GLOBAL_ROUTE_ARGS=-congestion_iterations 30