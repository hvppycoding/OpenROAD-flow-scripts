export PLATFORM               = asap7

export DESIGN_NICKNAME        = ibex
export DESIGN_NAME            = ibex_core

export VERILOG_FILES         = $(sort $(wildcard ./designs/src/$(DESIGN_NICKNAME)/*.v))
export SDC_FILE              = ./designs/$(PLATFORM)/ibex_final/constraint.sdc

export CORE_UTILIZATION       =  40
export CORE_ASPECT_RATIO      = 1
export CORE_MARGIN            = 2
export PLACE_DENSITY_LB_ADDON  = 0.20

export ENABLE_DPO = 0

export DFF_LIB_FILE           = $($(CORNER)_DFF_LIB_FILE)
export TNS_END_PERCENT        = 100

# MY
export SKIP_INCREMENTAL_REPAIR = 1
export FLOW_VARIANT = final_flute
export STEINERTREE_ALGORITHM = 1
export WEIGHT_WIRELENGTH = 7.0
export WEIGHT_MAXPATHLENGTH = 3.0
export WEIGHT_OVERFLOW = 1.0
# DEFAULT_ALGORITHM	0
# FLUTE_ALGORITHM 	1
# REST_ALGORITHM	2
# MY_ALGORITHM		3
# HYBRID_ALGORITHM	4
# HYBRID_REST_ALGORITHM	5