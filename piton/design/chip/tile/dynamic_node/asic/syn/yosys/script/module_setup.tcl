set DV_ROOT $::env(DV_ROOT)
set DESIGN_NAME dynamic_node_top_wrap

# Preprocess the RTL with PyHP
eval "source ${DV_ROOT}/tools/asic/common/synopsys/script/design_setup.tcl"
eval "source ${DV_ROOT}/tools/asic/common/synopsys/script/pyhp_preprocess_setup.tcl"

# Get custom functions
eval "source ${DV_ROOT}/tools/asic/common/func/func.tcl"

yosys verilog_defaults -add -I${DV_ROOT}/design/include

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
eval "pyhp_preprocess -rtl ${RTL_SOURCE_FILES}"

# Read design
yosys read_verilog "${DV_ROOT}/design/chip/tile/dynamic_node/rtl/dynamic_node_top_wrap.v"
yosys read_verilog "${DV_ROOT}/design/chip/tile/dynamic_node/rtl/dynamic_node_top.v"

yosys read_verilog "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_input_top_16.v"
yosys read_verilog "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_input_top_4.v"
yosys read_verilog "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_input_route_request_calc.v"
yosys read_verilog "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_input_control.v"
yosys read_verilog "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_output_top.v"
yosys read_verilog "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_output_datapath.v"
yosys read_verilog "${DV_ROOT}/design/chip/tile/dynamic_node/dynamic/rtl/dynamic_output_control.v"

yosys read_verilog "${DV_ROOT}/design/chip/tile/dynamic_node/components/rtl/bus_compare_equal.v"
yosys read_verilog "${DV_ROOT}/design/chip/tile/dynamic_node/components/rtl/flip_bus.v"
yosys read_verilog "${DV_ROOT}/design/chip/tile/dynamic_node/components/rtl/net_dff.v"
yosys read_verilog "${DV_ROOT}/design/chip/tile/dynamic_node/components/rtl/one_of_eight.v"
yosys read_verilog "${DV_ROOT}/design/chip/tile/dynamic_node/components/rtl/one_of_five.v"

yosys read_verilog "${DV_ROOT}/design/chip/tile/dynamic_node/common/rtl/network_input_blk_multi_out.v"
yosys read_verilog "${DV_ROOT}/design/chip/tile/dynamic_node/common/rtl/space_avail_top.v"

yosys read_verilog "${DV_ROOT}/design/chip/tile/common/rtl/valrdy_to_credit.v"
yosys read_verilog "${DV_ROOT}/design/chip/tile/common/rtl/credit_to_valrdy.v"


# check design hierarchy
yosys hierarchy -top ${DESIGN_NAME}
