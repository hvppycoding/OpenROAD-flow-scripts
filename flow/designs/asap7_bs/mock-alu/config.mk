export PLATFORM               = asap7_bs

include designs/src/mock-alu/defaults.mk

export PLACE_DENSITY          = 0.75
export CORE_UTILIZATION       = 50
export CORNER            = BC

export FASTROUTE_TCL = ./designs/$(PLATFORM)/mock-alu/fastroute.tcl
