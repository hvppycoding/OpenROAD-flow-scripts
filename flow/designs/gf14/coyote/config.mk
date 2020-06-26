export DESIGN_NICKNAME = coyote
export DESIGN_NAME = bsg_rocket_node_client_rocc
export PLATFORM    = gf14

export VERILOG_FILES   = ./designs/src/$(DESIGN_NICKNAME)/coyote.sv2v.v \
                         ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/macros.v

export SDC_FILE        = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

export WRAP_LEFS       = ./platforms/$(PLATFORM)/lef/gf14_1rf_lg6_w80_bit.lef \
                         ./platforms/$(PLATFORM)/lef/gf14_1rf_lg8_w128_all.lef \
                         ./platforms/$(PLATFORM)/lef/gf14_2rf_lg6_w44_bit.lef \
                         ./platforms/$(PLATFORM)/lef/gf14_2rf_lg8_w64_bit.lef

export WRAP_LIBS       = ./platforms/$(PLATFORM)/lib/gf14_1rf_lg6_w80_bit_nn_nominal_0p80v_0p80v_25c.lib \
                         ./platforms/$(PLATFORM)/lib/gf14_1rf_lg8_w128_all_nn_nominal_0p80v_0p80v_25c.lib \
                         ./platforms/$(PLATFORM)/lib/gf14_2rf_lg6_w44_bit_nn_nominal_0p80v_0p80v_25c.lib \
                         ./platforms/$(PLATFORM)/lib/gf14_2rf_lg8_w64_bit_nn_nominal_0p80v_0p80v_25c.lib

export ADDITIONAL_GDS  = ./platforms/$(PLATFORM)/gds/gf14_1rf_lg6_w80_bit.gds2 \
                         ./platforms/$(PLATFORM)/gds/gf14_1rf_lg8_w128_all.gds2 \
                         ./platforms/$(PLATFORM)/gds/gf14_2rf_lg6_w44_bit.gds2 \
                         ./platforms/$(PLATFORM)/gds/gf14_2rf_lg8_w64_bit.gds2

# These values must be multiples of placement site
export DIE_AREA    = 0 0 1099.98 1099.584
export CORE_AREA   = 19.992 20.16 1079.988 1080

export ABC_CLOCK_PERIOD_IN_PS = 1250

export PLACE_DENSITY = 0.20

export MACRO_WRAPPERS = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/wrappers.tcl

# TODO: replace this with max(CHANNEL_WIDTH_[HV]) from IP_global.cfg
export MACRO_BLOCKAGE_HALO = 25
