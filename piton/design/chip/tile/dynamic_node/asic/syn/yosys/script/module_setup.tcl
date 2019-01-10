set DV_ROOT $::env(DV_ROOT)
set DESIGN_NAME dynamic_node_top_wrap

yosys verilog_defaults -add -I${DV_ROOT}/design/include

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
