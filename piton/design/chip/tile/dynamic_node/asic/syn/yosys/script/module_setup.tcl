set DV_ROOT $::env(DV_ROOT)
set DESIGN_NAME dynamic_node_top_wrap

# Preprocess the RTL with PyHP
eval "source ${DV_ROOT}/tools/asic/common/synopsys/script/design_setup.tcl"
eval "source ${DV_ROOT}/tools/asic/common/synopsys/script/pyhp_preprocess_setup.tcl"

# Get custom functions
eval "source ${DV_ROOT}/tools/asic/common/func/func.tcl"

# Files just for PyHP pre-processing
set RTL_SOURCE_FILES "${DV_ROOT}/design/include/define.h "

# Preprocess the RTL with PyHP
eval "pyhp_preprocess ${RTL_SOURCE_FILES}"

# Design files
set RTL_SOURCE_FILES "${DV_ROOT}/design/chip/tile/dynamic_node/rtl/dynamic_node_top_wrap.v "
append RTL_SOURCE_FILES "${DV_ROOT}/design/chip/tile/dynamic_node/rtl/dynamic_node_top.v "
append RTL_SOURCE_FILES "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_input_top_16.v "
append RTL_SOURCE_FILES "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_input_top_4.v "
append RTL_SOURCE_FILES "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_input_route_request_calc.v "
append RTL_SOURCE_FILES "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_input_control.v "
append RTL_SOURCE_FILES "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_output_top.v "
append RTL_SOURCE_FILES "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_output_datapath.v "
append RTL_SOURCE_FILES "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_output_control.v "
append RTL_SOURCE_FILES "${DV_ROOT}/design/chip/tile/dynamic_node/components/rtl/bus_compare_equal.v "
append RTL_SOURCE_FILES "${DV_ROOT}/design/chip/tile/dynamic_node/components/rtl/flip_bus.v "
append RTL_SOURCE_FILES "${DV_ROOT}/design/chip/tile/dynamic_node/components/rtl/net_dff.v "
append RTL_SOURCE_FILES "${DV_ROOT}/design/chip/tile/dynamic_node/components/rtl/one_of_eight.v "
append RTL_SOURCE_FILES "${DV_ROOT}/design/chip/tile/dynamic_node/components/rtl/one_of_five.v "
append RTL_SOURCE_FILES "${DV_ROOT}/design/chip/tile/dynamic_node/common/rtl/network_input_blk_multi_out.v "
append RTL_SOURCE_FILES "${DV_ROOT}/design/chip/tile/dynamic_node/common/rtl/space_avail_top.v "
append RTL_SOURCE_FILES "${DV_ROOT}/design/chip/tile/common/rtl/valrdy_to_credit.v "
append RTL_SOURCE_FILES "${DV_ROOT}/design/chip/tile/common/rtl/credit_to_valrdy.v "

# Preprocess the RTL with PyHP
eval "pyhp_preprocess ${RTL_SOURCE_FILES}"

yosys verilog_defaults -add -I${DV_ROOT}/design/include

foreach RTL_SOURCE_FILE ${RTL_SOURCE_FILES} {
    yosys read_verilog "${RTL_SOURCE_FILE}"
}

# check design hierarchy
yosys hierarchy -top ${DESIGN_NAME}
