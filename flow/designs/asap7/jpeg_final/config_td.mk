export PLATFORM               = asap7

export DESIGN_NAME            = jpeg_encoder
export DESIGN_NICKNAME        = jpeg

export VERILOG_FILES          = $(sort $(wildcard ./designs/src/$(DESIGN_NICKNAME)/*.v))
export VERILOG_INCLUDE_DIRS   = ./designs/src/$(DESIGN_NICKNAME)/include
export SDC_FILE               = ./designs/$(PLATFORM)/jpeg_final/jpeg_encoder15_7nm.sdc
export ABC_AREA               = 1

export CORE_UTILIZATION       = 30
export CORE_ASPECT_RATIO      = 1
export CORE_MARGIN            = 2
export PLACE_DENSITY          = 0.60

export DFF_LIB_FILE           = $($(CORNER)_DFF_LIB_FILE)

export TNS_END_PERCENT        = 100
# export EQUIVALENCE_CHECK     ?=   1
export REMOVE_CELLS_FOR_EQY   = TAPCELL*

# My custom settings
export SKIP_INCREMENTAL_REPAIR = 1
export FLOW_VARIANT = final_td
export STEINERTREE_ALGORITHM = 6
export WEIGHT_WIRELENGTH = 70
export WEIGHT_MAXPATHLENGTH = 30
export WEIGHT_OVERFLOW = 10
# DEFAULT_ALGORITHM	0
# FLUTE_ALGORITHM 	1
# REST_ALGORITHM	2
# MY_ALGORITHM		3
# HYBRID_ALGORITHM	4
# HYBRID_REST_ALGORITHM	5

export PRE_GLOBAL_ROUTE = ./designs/$(PLATFORM)/aes_final/pre_global_route_td.tcl

export GLOBAL_ROUTE_ARGS=-congestion_iterations 30