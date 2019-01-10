if {[info exists ::env(ASIC_PROCESS)]} {
    set ASIC_PROCESS $::env(ASIC_PROCESS)
} else {
    puts "====================================\n"
    puts " Warning: ASIC_PROCESS not defined. \n"
    puts "====================================\n"
    exit;
}

set DV_ROOT $::env(DV_ROOT)

eval "source script/module_setup.tcl"

# check design hierarchy
yosys hierarchy

# translate processes (always blocks)
yosys proc
yosys opt

# detect and optimize FSM encodings
yosys fsm
yosys opt

# implement memories (arrays)
yosys memory
yosys opt

# convert to gate logic
yosys techmap
yosys opt

if {$ASIC_PROCESS eq "asap7"} {
    set ASAP7_IP $::env(ASAP7_IP)
    # mapping flip-flops to mycells.lib
    yosys dfflibmap -liberty "${ASAP7_IP}/asap7libs_24/lib/asap7sc7p5t_24_SEQ_RVT_TT.lib"

    # mapping logic to mycells.lib
    yosys abc -liberty "${ASAP7_IP}/asap7libs_24/lib/asap_7nm.lib"
}


set RESULTS_DIR "results"
if {![file exists ${RESULTS_DIR}]} {
    file mkdir $RESULTS_DIR
}

set DCRM_FINAL_VERILOG_OUTPUT_FILE  ${DESIGN_NAME}.mapped.v

yosys write_verilog ${RESULTS_DIR}/${DCRM_FINAL_VERILOG_OUTPUT_FILE}
