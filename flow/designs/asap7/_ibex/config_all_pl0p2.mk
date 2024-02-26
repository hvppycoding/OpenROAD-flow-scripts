export PLATFORM               = asap7

export DESIGN_NICKNAME        = ibex
export DESIGN_NAME            = ibex_core

export VERILOG_FILES         = $(sort $(wildcard ./designs/src/$(DESIGN_NICKNAME)/*.v))
export SDC_FILE              = ./designs/$(PLATFORM)/_ibex/constraint.sdc

export CORE_UTILIZATION       =  40
export CORE_ASPECT_RATIO      = 1
export CORE_MARGIN            = 2
export PLACE_DENSITY_LB_ADDON  = 0.20

export ENABLE_DPO = 0

export DFF_LIB_FILE           = $($(CORNER)_DFF_LIB_FILE)
export TNS_END_PERCENT        = 100



# My custom settings
export SKIP_INCREMENTAL_REPAIR = 1
export FLOW_VARIANT = _all_pl0p2
export STEINERTREE_ALGORITHM = 7
export WEIGHT_WIRELENGTH = 70
export WEIGHT_MAXPATHLENGTH = 30
export WEIGHT_OVERFLOW = 10
export ALL_WEIGHT_WIRELENGTH = 0.8
export ALL_WEIGHT_DETOUR = 0.2
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