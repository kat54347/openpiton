/*
Copyright (c) 2018 Princeton University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Princeton University nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
`include "iop.h" 
module vex_l15_transducer (
    input                           clk,
    input                           rst_n,

    //--- vex -> L1.5
    input                           vex_transducer_iBus_cmd_valid,          
    input [31:0]                    vex_transducer_iBus_cmd_payload_pc, 

    input                           vex_transducer_dBus_cmd_valid,          
    input                           vex_transducer_dBus_cmd_payload_wr,     
    input [31:0]                    vex_transducer_dBus_cmd_payload_address,
    input [31:0]                    vex_transducer_dBus_cmd_payload_data,   
    input [1:0]                     vex_transducer_dBus_cmd_payload_size,   
    
    input                           l15_transducer_ack,
    input                           l15_transducer_header_ack,

    // outputs vex uses                    
    output reg [4:0]                transducer_l15_rqtype,
    output [`L15_AMO_OP_WIDTH-1:0]  transducer_l15_amo_op,
    output reg [2:0]                transducer_l15_size,
    output                          transducer_l15_val,
    output [`PHY_ADDR_WIDTH-1:0]    transducer_l15_address,
    output [63:0]                   transducer_l15_data,
    output                          transducer_l15_nc,


    // outputs vex doesn't use                    
    output [0:0]                    transducer_l15_threadid,
    output                          transducer_l15_prefetch,
    output                          transducer_l15_invalidate_cacheline,
    output                          transducer_l15_blockstore,
    output                          transducer_l15_blockinitstore,
    output [1:0]                    transducer_l15_l1rplway,
    output [63:0]                   transducer_l15_data_next_entry,
    output [32:0]                   transducer_l15_csm_data,

    //--- L1.5 -> vex
    input                           l15_transducer_val,
    input [3:0]                     l15_transducer_returntype,
    
    input [63:0]                    l15_transducer_data_0,
    input [63:0]                    l15_transducer_data_1,
   
    output reg                      transducer_vex_iBus_cmd_ready,        
    output reg                      transducer_vex_iBus_rsp_valid,        
    output                          transducer_vex_iBus_rsp_payload_error,
    output [31:0]                   transducer_vex_iBus_rsp_payload_inst, 

    output reg                      transducer_vex_dBus_cmd_ready,        
    output reg                      transducer_vex_dBus_rsp_ready,        
    output                          transducer_vex_dBus_rsp_error,        
    output [31:0]                   transducer_vex_dBus_rsp_data,         
    
    output                          transducer_l15_req_ack,
    output reg                      vex_int
);

// not supported at the moment
//assign transducer_l15_amo_op = `L15_AMO_OP_NONE;

//--- vex -> L1.5
// decoder
localparam ACK_IDLE = 1'b0;
localparam ACK_WAIT = 1'b1;

assign transducer_l15_amo_op = `L15_AMO_OP_NONE;

reg current_val;
reg prev_val;

// is this a new request from vex?
// TODO: mux between iBus and dBus?
wire new_request = current_val & ~prev_val;
reg req_active_reg;
always @ (posedge clk)
begin
    if (!rst_n) begin
        current_val <= 0;
        prev_val <= 0;
    end
    else begin
        current_val <= (vex_transducer_dBus_cmd_valid | vex_transducer_iBus_cmd_valid) & ~req_active_reg;
        prev_val <= current_val;
    end
end 

// are we waiting for an ack
reg ack_reg;
reg ack_next;
always @ (posedge clk) begin
    if (!rst_n) begin
        ack_reg <= 0;
    end
    else begin
        ack_reg <= ack_next;
    end
end
always @ (*) begin
    // be careful with these conditionals.
    if (l15_transducer_ack) begin
        ack_next = ACK_IDLE;
    end
    else if (new_request) begin
        ack_next = ACK_WAIT;
    end
    else begin
        ack_next = ack_reg;
    end
end

reg data_req_reg;
reg data_req_next;
reg req_active_next;
wire vex_data_req;
always @ (posedge clk) begin
    if (!rst_n) begin
        data_req_reg <= 1'b0;
        req_active_reg <= 1'b0;
    end
    else begin
        data_req_reg <= data_req_next;
        req_active_reg <= req_active_next;
    end
end
always @ (*) begin
    // be careful with these conditionals.
    if (l15_transducer_val) begin
        data_req_next = 1'b0;
        req_active_next = 1'b0;
    end
    else if (new_request) begin
        data_req_next = vex_data_req;
        req_active_next = 1'b1;
    end
    else begin
        data_req_next = ack_reg;
        req_active_next = req_active_reg;
    end
end

// TODO
// if we haven't got an ack and it's an old request, valid should be high
// otherwise if we got an ack valid should be high only if we got a new
// request
assign transducer_l15_val = (ack_reg == ACK_WAIT) ? (vex_transducer_dBus_cmd_valid | vex_transducer_iBus_cmd_valid) 
                                : (ack_reg == ACK_IDLE) ? new_request
                                : (vex_transducer_dBus_cmd_valid | vex_transducer_iBus_cmd_valid);
assign vex_data_req = transducer_l15_val & vex_transducer_dBus_cmd_valid;
assign vex_instr_req = transducer_l15_val & vex_transducer_iBus_cmd_valid;
reg [31:0] vex_wdata_flipped;

// unused wires tie to zero
assign transducer_l15_threadid = 1'b0;
assign transducer_l15_prefetch = 1'b0;
assign transducer_l15_csm_data = 33'b0;
assign transducer_l15_data_next_entry = 64'b0;

assign transducer_l15_blockstore = 1'b0;
assign transducer_l15_blockinitstore = 1'b0;

// is this set when something in the l1 gets replaced? vex has no cache
assign transducer_l15_l1rplway = 2'b0;
// will vex ever need to invalidate cachelines?
assign transducer_l15_invalidate_cacheline = 1'b0;

// logic to check if a request is new
//assign transducer_l15_address = vex_data_req ? {{8{vex_transducer_dBus_cmd_payload_address[31]}}, vex_transducer_dBus_cmd_payload_address}
//                                            : {{8{vex_transducer_iBus_cmd_payload_pc[31]}}, vex_transducer_iBus_cmd_payload_pc};
assign transducer_l15_address = vex_data_req ? {8'b0, vex_transducer_dBus_cmd_payload_address}
                                            : {8'b0, vex_transducer_iBus_cmd_payload_pc};

assign transducer_l15_nc = (transducer_l15_rqtype == `PCX_REQTYPE_AMO);

assign transducer_l15_data = {vex_wdata_flipped, vex_wdata_flipped};
// set rqtype specific data
always @ *
begin
    transducer_vex_dBus_cmd_ready = 1'b0;
    transducer_vex_iBus_cmd_ready = 1'b0;
    if (transducer_l15_val & ~vex_data_req) begin
        vex_wdata_flipped = 32'b0;
        transducer_l15_rqtype = `LOAD_RQ;
        transducer_l15_size = `PCX_SZ_4B;
        if (l15_transducer_ack) begin
            transducer_vex_iBus_cmd_ready = 1'b1;
        end
    end
    else if (transducer_l15_val & vex_data_req) begin
        case(vex_transducer_dBus_cmd_payload_size)
            2'b10: begin
                transducer_l15_size = `PCX_SZ_4B;
            end
            2'b01: begin
                transducer_l15_size = `PCX_SZ_2B;
            end
            2'b00: begin
                transducer_l15_size = `PCX_SZ_1B;
            end
            // this should never happen
            default: begin
                transducer_l15_size = 0;
            end
        endcase
        if (l15_transducer_ack) begin
            transducer_vex_dBus_cmd_ready = 1'b1;
        end

        // store or atomic operation 
        if (vex_transducer_dBus_cmd_payload_wr) begin
            transducer_l15_rqtype = `STORE_RQ;
            // endian wizardry
            vex_wdata_flipped = {vex_transducer_dBus_cmd_payload_data[7:0], vex_transducer_dBus_cmd_payload_data[15:8],
                                    vex_transducer_dBus_cmd_payload_data[23:16], vex_transducer_dBus_cmd_payload_data[31:24]};

            // if it's an atomic operation, modify the request type.
            // That's it
            if (transducer_l15_amo_op != `L15_AMO_OP_NONE) begin
                transducer_l15_rqtype = `PCX_REQTYPE_AMO;
            end
        end
        // load operation
        else begin
            vex_wdata_flipped = 32'b0;
            transducer_l15_rqtype = `LOAD_RQ;
        end 
    end
    else begin
        vex_wdata_flipped = 32'b0;
        transducer_l15_rqtype = 5'b0;
        transducer_l15_size = 3'b0;
    end
end

//--- L1.5 -> vex
// encoder
reg [31:0] rdata_part;
assign transducer_vex_iBus_rsp_payload_inst = {rdata_part[7:0], rdata_part[15:8],
                            rdata_part[23:16], rdata_part[31:24]};
assign transducer_vex_dBus_rsp_data = {rdata_part[7:0], rdata_part[15:8],
                            rdata_part[23:16], rdata_part[31:24]};
assign transducer_l15_req_ack = l15_transducer_val;

assign transducer_vex_dBus_rsp_error = 1'b0;
assign transducer_vex_iBus_rsp_payload_error = 1'b0;
    
// keep track of whether we have received the wakeup interrupt
reg int_recv;
always @ (posedge clk) begin
    if (!rst_n) begin
        vex_int <= 1'b0;
    end
    else if (int_recv) begin
        vex_int <= 1'b1;
    end
    else if (vex_int) begin
        vex_int <= 1'b0;
    end
end
    
always @ * begin
    transducer_vex_iBus_rsp_valid = 1'b0;
    transducer_vex_dBus_rsp_ready = 1'b0;
    if (l15_transducer_val) begin
        case(l15_transducer_returntype)
            `LOAD_RET, `CPX_RESTYPE_ATOMIC_RES: begin
                // load
                int_recv = 1'b0;
                transducer_vex_iBus_rsp_valid = req_active_reg & ~data_req_reg;
                transducer_vex_dBus_rsp_ready = req_active_reg & data_req_reg;
                case(transducer_l15_address[3:2])
                    2'b00: begin
                        rdata_part = l15_transducer_data_0[63:32];
                    end
                    2'b01: begin
                        rdata_part = l15_transducer_data_0[31:0];
                    end
                    2'b10: begin
                        rdata_part = l15_transducer_data_1[63:32];
                    end
                    2'b11: begin
                        rdata_part = l15_transducer_data_1[31:0];
                    end
                    default: begin
                    end
                endcase 
            end
            `ST_ACK: begin
                int_recv = 1'b0;
                transducer_vex_iBus_rsp_valid = req_active_reg & ~data_req_reg;
                transducer_vex_dBus_rsp_ready = req_active_reg & data_req_reg;
                rdata_part = 32'b0;
            end
            `INT_RET: begin
                if (l15_transducer_data_0[17:16] == 2'b01) begin
                    int_recv = 1'b1;
                end
                else begin
                    int_recv = 1'b0;
                end
                rdata_part = 32'b0;
            end
            default: begin
                int_recv = 1'b0;
                rdata_part = 32'b0;
            end
        endcase 
    end
    else begin
        int_recv = 1'b0;
        rdata_part = 32'b0;
    end
end
endmodule

// module vex_decoder(
//     input wire         clk,
//     input wire         rst_n,
    
//     input wire         vex_mem_valid,
//     input wire [31:0]  vex_mem_addr,
//     input wire [ 3:0]  vex_mem_wstrb,
    
//     input wire [31:0]  vex_mem_wdata,
//     input wire [`L15_AMO_OP_WIDTH-1:0] vex_mem_amo_op,
//     input wire         l15_transducer_ack,
//     input wire         l15_transducer_header_ack,
    
//     // outputs vex uses                    
//     output reg  [4:0]  transducer_l15_rqtype,
//     output      [`L15_AMO_OP_WIDTH-1:0] transducer_l15_amo_op,
//     output reg  [2:0]  transducer_l15_size,
//     output wire        transducer_l15_val,
//     output wire [39:0] transducer_l15_address,
//     output wire [63:0] transducer_l15_data,
//     output wire        transducer_l15_nc,
    
    
//     // outputs vex doesn't use                    
//     output wire [0:0]  transducer_l15_threadid,
//     output wire        transducer_l15_prefetch,
//     output wire        transducer_l15_invalidate_cacheline,
//     output wire        transducer_l15_blockstore,
//     output wire        transducer_l15_blockinitstore,
//     output wire [1:0]  transducer_l15_l1rplway,
//     output wire [63:0] transducer_l15_data_next_entry,
//     output wire [32:0] transducer_l15_csm_data
// );


// endmodule

// module l15_transducer(
//     input wire          clk,
//     input wire          rst_n,
    
//     input wire          l15_transducer_val,
//     input wire [3:0]    l15_transducer_returntype,
    
//     input wire [63:0]   l15_transducer_data_0,
//     input wire [63:0]   l15_transducer_data_1,
    
//     input wire [39:0]   transducer_l15_address,  
    
//     output reg          vex_mem_ready,
//     output wire [31:0]  vex_mem_rdata,
    
//     output wire         transducer_l15_req_ack,
//     output reg          vex_int
// );
    
// endmodule // l15_transducer
