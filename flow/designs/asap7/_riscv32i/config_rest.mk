export DESIGN_NICKNAME = riscv32i
export DESIGN_NAME = riscv_top
export PLATFORM    = asap7

export SYNTH_HIERARCHICAL = 1
export RTLMP_FLOW = True

export RTLMP_MIN_INST = 1000
export RTLMP_MAX_INST = 3500
export RTLMP_MIN_MACRO = 1
export RTLMP_MAX_MACRO = 5

export MAX_UNGROUP_SIZE ?= 1000

export VERILOG_FILES = $(sort $(wildcard ./designs/src/$(DESIGN_NICKNAME)/*.v))
export SDC_FILE      = ./designs/$(PLATFORM)/_riscv32i/constraint.sdc
export ADDITIONAL_LEFS = ./platforms/$(PLATFORM)/lef/fakeram7_256x32.lef
export ADDITIONAL_LIBS = ./platforms/$(PLATFORM)/lib/fakeram7_256x32.lib

export DIE_AREA = 0 0 80 90
export CORE_AREA = 5 5 75 85 

export PLACE_DENSITY_LB_ADDON = 0.10

export HAS_IO_CONSTRAINTS = 1
export PLACE_PINS_ARGS    = -exclude left:* -exclude right:* -exclude top:*
export MACRO_PLACE_HALO    = 1 1
export MACRO_PLACE_CHANNEL = 6 6
#
export TNS_END_PERCENT   = 100


# My custom settings
export SKIP_INCREMENTAL_REPAIR = 1
export FLOW_VARIANT = _rest
export STEINERTREE_ALGORITHM = 0
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

# export PRE_GLOBAL_ROUTE = ./designs/$(PLATFORM)/_aes/pre_global_route_all.tcl

export GLOBAL_ROUTE_ARGS=-congestion_iterations 30