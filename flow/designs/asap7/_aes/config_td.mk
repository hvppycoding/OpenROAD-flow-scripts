export PLATFORM               = asap7

export DESIGN_NAME            = aes_cipher_top
export DESIGN_NICKNAME        = aes

export VERILOG_FILES = $(sort $(wildcard ./designs/src/$(DESIGN_NICKNAME)/*.v))
export SDC_FILE      = ./designs/$(PLATFORM)/_aes/constraint.sdc

export ABC_AREA                 = 1

export CORE_UTILIZATION         = 40
export CORE_ASPECT_RATIO        = 1
export CORE_MARGIN              = 2
export PLACE_DENSITY            = 0.65
export TNS_END_PERCENT          = 100
# export EQUIVALENCE_CHECK       ?=   1
export REMOVE_CELLS_FOR_EQY     = TAPCELL*

# My custom settings
export SKIP_INCREMENTAL_REPAIR = 1
export FLOW_VARIANT = _td
export STEINERTREE_ALGORITHM = 6
export WEIGHT_WIRELENGTH = 70
export WEIGHT_MAXPATHLENGTH = 30
export WEIGHT_OVERFLOW = 10
export ALL_WEIGHT_WIRELENGTH = 0.3
export ALL_WEIGHT_DETOUR = 0.7
export ALL_WEIGHT_OVERFLOW   = 0.5
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