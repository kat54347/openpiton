`timescale 1ps/1ps






// Copyright (c) 2015 Princeton University
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

//==================================================================================================
//  Filename      : define.h
//  Created On    : 2014-02-20
//  Last Modified : 2018-11-16 17:14:11
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : main header file defining global architecture parameters
//
//
//==================================================================================================




// Uncomment to define USE_GENERIC_SRAM_IMPLEMENTATION to use the old unsynthesizable BRAM
// `define USE_GENERIC_SRAM_IMPLEMENTATION




/*
Copyright (c) 2015 Princeton University
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

/////////////////////////////////////////////////////////////////////////////////////////////
// 63         50 49      42 41      34 33           30 29      22 21                 0   
// ------------------------------------------------------------------------------------
// |            |          |          |               |          |                    |
// |  Chip ID   |  Dest X  |  Dest Y  |  Final Route  |  Length  |    Header Payload  | 
// |            |          |          |               |          |                    |
// ------------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////////////////////











 //whether the routing is based on chipid or x y position
 //`define    ROUTING_CHIP_ID
 

 //defines for different topology, only one should be active
 //`define    NETWORK_TOPO_2D_MESH
 //`define    NETWORK_TOPO_3D_MESH
 

// Tile config

// /tigress/pjj/openpiton/single-file/princeton-parallel-processor/piton/verif/env/manycore/devices.xml





// NoC interface





















// NodeID decomposition








//========================
//Packet format
//=========================

//Header decomposition































// these shifted fields are added for convienience
// HEADER 2







// HEADER 3








//NoC header information










// Width of MSG_ADDR field - you're probably looking for PHY_ADDR_WIDTH


//Coherence information





//Requests from L15 to L2
// Should always make #0 an error








//condition satisfied

//condition not satisfied

//Both SWAP and LDSTUB are the same for L2









//RISC-V AMO requests









//RISC-V AMO L2-internal phase 1









//RISC-V AMO L2-internal phase 2










//Forward requests from L2 to L15







//Memory requests from L2 to DRAM






//Forward acks from L15 to L2







//Memory acks from memory to L2









//Acks from L2 to L15


//TODO



//Only exist within L2





//`define MSG_TYPE_LOAD_REQ           8'd31 if this is enabled, don't use 31





// These should be defined in l2.vh, not the global defines











//Physical address










//Transition data size












//`define HOME_ID_MASK_X          10:10
//Additional fields for Sharer Domain ID and Logical Sharer ID
//For coherence domain restriction only


// Tri: dynamically adjust these parameters based on how many tiles are available
//  Assumption: 8x8 topology























































//`define DMBR_TAG_WIDTH 4

//Clumpy Shared Memory






////////////////////////////////////////////
// SOME CONFIGURATION REGISTERS DEFINES
////////////////////////////////////////////
// example: read/write to csm_en would be 0xba_0000_0100

// `define ASI_ADDRESS_MASK    `L15_ADDR_TYPE
// `define CONFIG_ASI_ADDRESS  `L15_ADDR_TYPE_WIDTH'hba










// DMBR Config register 1 fields















// DMBR Config register 2 fields



//Home allocation method






//Additional fields for Sharer Domain ID and Logical Sharer ID
//For coherence domain restriction only

































//`define TTE_CSM_WIDTH           64
//`define TTE_CSM                 63:0
//`define TTE_CSM_VALID           63
//`define TTE_CSM_SZL             62:61
//`define TTE_CSM_NFO             60
//`define TTE_CSM_IE              59
//`define TTE_CSM_SOFT2           58:49
//`define TTE_CSM_SZH             48
//`define TTE_CSM_DIAG            47:40
//`define TTE_CSM_RES1            39
//`define TTE_CSM_SDID            38:29
//`define TTE_CSM_HDID            28:19
//`define TTE_CSM_LSID            18:13
//`define TTE_CSM_SOFT            12:8
//`define TTE_CSM_RES2            7
//`define TTE_CSM_LOCK            6
//`define TTE_CSM_CP              5
//`define TTE_CSM_CV              4
//`define TTE_CSM_E               3
//`define TTE_CSM_P               2
//`define TTE_CSM_W               1
//`define TTE_CSM_RES3            0












// Packet format for home id





/////////////////////////////////////
// BIST
/////////////////////////////////////

// the data width from tap to individual sram wrappers



//deprecated































/////////////////////////////////////
// IDs for JTAG-Core interface
/////////////////////////////////////

// 48b for writing the PC reset vector

// 94b for reading the sscan data











// Execution Drafting Synchronization Method Values





// Execution Drafting timeout counter bit width


// Configuration registers












// Execution Drafting configuration register bit positions








// Execution Drafting configuration register default values
// ED disabled, STSM sync method, LFSR seed = 16'b0, LFSR load = 1'b0,
// Counter Timeout = 16'd32



//Clumpy sharer memory configuration registers
























/*
Copyright (c) 2015 Princeton University
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

//==================================================================================================
//  Filename      : l2.h.pyv
//  Created On    : 2014-02-20
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : header file for the L2 cache
//
//
//==================================================================================================

// /tigress/pjj/openpiton/single-file/princeton-parallel-processor/piton/verif/env/manycore/devices.xml



// Input buffer for pipeline1













// Input buffer for pipeline2














// Output buffer















// L2 cache configuration







//`define L2_SIZE                  65536
//`define L2_SIZE_WIDTH            16






//`define L2_LINE_SIZE             64
//`define L2_LINE_SIZE_WIDTH       6













//`define L2_WAYS                  4
//`define L2_WAYS_WIDTH            2
//`define L2_WAY_0                 2'b00
//`define L2_WAY_1                 2'b01
//`define L2_WAY_2                 2'b10
//`define L2_WAY_3                 2'b11





// Tag array







//`define L2_TAG_INDEX_WIDTH      8
//`define L2_TAG_WIDTH            26
//`define L2_TAG_WAY_WIDTH        26
//`define L2_TAG_ARRAY_WIDTH      104


// Tag Address decomposition 




//`define L2_TAG_INDEX            13:6
//`define L2_TAG                  39:14


//Data array












//`define L2_DATA_INDEX_WIDTH         12 








// Data Address decomposition 







//Dir array



//`define L2_DIR_INDEX_WIDTH      10 





//State array

















//Whether the cache line is in Icaches or Dcaches
















//Round Robin selection














// State decomposition 












//MSHR array



































//`define L2_MSHR_CMP_ADDR        13:6
//`define L2_MSHR_ADDR            39:0
//`define L2_MSHR_WAY             41:40
//`define L2_MSHR_MSHRID          49:42
//`define L2_MSHR_CACHE_TYPE      50
//`define L2_MSHR_DATA_SIZE       53:51
//`define L2_MSHR_MSG_TYPE        61:54
//`define L2_MSHR_L2_MISS         62
//`define L2_MSHR_SRC_CHIPID      76:63
//`define L2_MSHR_SRC_X           84:77
//`define L2_MSHR_SRC_Y           92:85
//`define L2_MSHR_SRC_FBITS       96:93
//`define L2_MSHR_SDID            106:97
//`define L2_MSHR_LSID            112:107      
//`define L2_MSHR_MISS_LSID       118:113
//`define L2_MSHR_SMC_MISS        119
//`define L2_MSHR_RECYCLED        120
//`define L2_MSHR_INV_FWD_PENDING 121


//SMC array


































//Message destination_type







//L2 public sharer beyond the maximum clump size



//L2 registers



//Special addresses





















//L2 core ID





//L2 dir array reuse







//Control Signal 








//AMO ALU OP macros












//Control Signal in Stage 1























































/*
Copyright (c) 2015 Princeton University
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

//l15.h
// Copyright (c) 2015 Princeton University
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

//==================================================================================================
//  Filename      : define.h
//  Created On    : 2014-02-20
//  Last Modified : 2018-11-16 17:14:11
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : main header file defining global architecture parameters
//
//
//==================================================================================================


































































































































































































































































































































































































































































































































































































// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iop.h
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/
//-*- verilog -*-
////////////////////////////////////////////////////////////////////////
/*
//
//  Description:	Global header file that contain definitions that 
//                      are common/shared at the IOP chip level
*/
////////////////////////////////////////////////////////////////////////


// Address Map Defines
// ===================




// CMP space



// IOP space




                               //`define ENET_ING_CSR     8'h84
                               //`define ENET_EGR_CMD_CSR 8'h85















// L2 space



// More IOP space





//Cache Crossbar Width and Field Defines
//======================================













































//bits 133:128 are shared by different fields
//for different packet types.
























//`define CPX_INV_PA_HI   116
//`define CPX_INV_PA_LO   112






// cache invalidation format
// `define CPX_INV_DCACHE_WORD0_VAL 0
// `define CPX_INV_ICACHE_WORD0_VAL 1
// `define CPX_INV_WORD0_WAY 5:2
// `define CPX_INV_DCACHE_WORD0_VAL 6
// `define CPX_INV_ICACHE_WORD0_VAL 7
// `define CPX_INV_WORD0_WAY 11:8
// `define CPX_INV_DCACHE_WORD0_VAL 12
// // `define CPX_INV_ICACHE_WORD0_VAL 13
// `define CPX_INV_WORD0_WAY 17:14
// `define CPX_INV_DCACHE_WORD0_VAL 18
// // `define CPX_INV_ICACHE_WORD0_VAL 19
// `define CPX_INV_WORD0_WAY 23:20




// 4 extra bits for bigger icache/dcache
// up to 512KB l1 icache, 256KB l1 dcache

































//Pico defines













//End cache crossbar defines


// Number of COS supported by EECU 



// 
// BSC bus sizes
// =============
//

// General




// CTags













// reinstated temporarily




// CoS






// L2$ Bank



// L2$ Req













// L2$ Ack








// Enet Egress Command Unit














// Enet Egress Packet Unit













// This is cleaved in between Egress Datapath Ack's








// Enet Egress Datapath
















// In-Order / Ordered Queue: EEPU
// Tag is: TLEN, SOF, EOF, QID = 15






// Nack + Tag Info + CTag




// ENET Ingress Queue Management Req












// ENET Ingress Queue Management Ack








// Enet Ingress Packet Unit












// ENET Ingress Packet Unit Ack







// In-Order / Ordered Queue: PCI
// Tag is: CTAG





// PCI-X Request











// PCI_X Acknowledge











//
// BSC array sizes
//================
//












// ECC syndrome bits per memory element




//
// BSC Port Definitions
// ====================
//
// Bits 7 to 4 of curr_port_id








// Number of ports of each type


// Bits needed to represent above


// How wide the linked list pointers are
// 60b for no payload (2CoS)
// 80b for payload (2CoS)

//`define BSC_OBJ_PTR   80
//`define BSC_HD1_HI    69
//`define BSC_HD1_LO    60
//`define BSC_TL1_HI    59
//`define BSC_TL1_LO    50
//`define BSC_CT1_HI    49
//`define BSC_CT1_LO    40
//`define BSC_HD0_HI    29
//`define BSC_HD0_LO    20
//`define BSC_TL0_HI    19
//`define BSC_TL0_LO    10
//`define BSC_CT0_HI     9
//`define BSC_CT0_LO     0


































// I2C STATES in DRAMctl







//
// IOB defines
// ===========
//



















//`define IOB_INT_STAT_WIDTH   32
//`define IOB_INT_STAT_HI      31
//`define IOB_INT_STAT_LO       0

















































// fixme - double check address mapping
// CREG in `IOB_INT_CSR space










// CREG in `IOB_MAN_CSR space





































// Address map for TAP access of SPARC ASI













//
// CIOP UCB Bus Width
// ==================
//
//`define IOB_EECU_WIDTH       16  // ethernet egress command
//`define EECU_IOB_WIDTH       16

//`define IOB_NRAM_WIDTH       16  // NRAM (RLDRAM previously)
//`define NRAM_IOB_WIDTH        4




//`define IOB_ENET_ING_WIDTH   32  // ethernet ingress
//`define ENET_ING_IOB_WIDTH    8

//`define IOB_ENET_EGR_WIDTH    4  // ethernet egress
//`define ENET_EGR_IOB_WIDTH    4

//`define IOB_ENET_MAC_WIDTH    4  // ethernet MAC
//`define ENET_MAC_IOB_WIDTH    4




//`define IOB_BSC_WIDTH         4  // BSC
//`define BSC_IOB_WIDTH         4







//`define IOB_CLSP_WIDTH        4  // clk spine unit
//`define CLSP_IOB_WIDTH        4





//
// CIOP UCB Buf ID Type
// ====================
//



//
// Interrupt Device ID
// ===================
//
// Caution: DUMMY_DEV_ID has to be 9 bit wide
//          for fields to line up properly in the IOB.



//
// Soft Error related definitions 
// ==============================
//



//
// CMP clock
// =========
//




//
// NRAM/IO Interface
// =================
//










//
// NRAM/ENET Interface
// ===================
//







//
// IO/FCRAM Interface
// ==================
//






//
// PCI Interface
// ==================
// Load/store size encodings
// -------------------------
// Size encoding
// 000 - byte
// 001 - half-word
// 010 - word
// 011 - double-word
// 100 - quad






//
// JBI<->SCTAG Interface
// =======================
// Outbound Header Format



























// Inbound Header Format




















//
// JBI->IOB Mondo Header Format
// ============================
//














// JBI->IOB Mondo Bus Width/Cycle
// ==============================
// Cycle  1 Header[15:8]
// Cycle  2 Header[ 7:0]
// Cycle  3 J_AD[127:120]
// Cycle  4 J_AD[119:112]
// .....
// Cycle 18 J_AD[  7:  0]






// `define L15_CACHELINE_WIDTH 128

















// /tigress/pjj/openpiton/single-file/princeton-parallel-processor/piton/verif/env/manycore/devices.xml
// this is used in the ariane SV packages to derive the parameterization

















































// 7

// 7




// 16B cache lines

// 10




// 40 - 4 (16B line) - 7 (index width) = 29

// 11

// 39


// this need to be defined when L1.5 has more sets than L1D
// for correct operations
// `define L15_WMT_EXTENDED_ALIAS


















// `define L15_WMT_ENTRY_0_MASK 1*`L15_WMT_ENTRY_WIDTH-1 -: `L15_WMT_ENTRY_WIDTH
// `define L15_WMT_ENTRY_1_MASK 2*`L15_WMT_ENTRY_WIDTH-1 -: `L15_WMT_ENTRY_WIDTH
// `define L15_WMT_ENTRY_2_MASK 3*`L15_WMT_ENTRY_WIDTH-1 -: `L15_WMT_ENTRY_WIDTH
// `define L15_WMT_ENTRY_3_MASK 4*`L15_WMT_ENTRY_WIDTH-1 -: `L15_WMT_ENTRY_WIDTH
// `define L15_WMT_ENTRY_0_VALID_MASK 1*`L15_WMT_ENTRY_WIDTH-1
// `define L15_WMT_ENTRY_1_VALID_MASK 2*`L15_WMT_ENTRY_WIDTH-1
// `define L15_WMT_ENTRY_2_VALID_MASK 3*`L15_WMT_ENTRY_WIDTH-1
// `define L15_WMT_ENTRY_3_VALID_MASK 4*`L15_WMT_ENTRY_WIDTH-1


  
  


  
  


  
  


  
  







// LRU array storage
// keeps 6 bits per cache set: 4 "used" bits, 1 each cache line, and 2 bits for wayid round robin (4w)





// source





// MSHR






// controls how many mshr there are
// `define L15_MSHR_COUNT 10
// should be more than the count above when 2^n











// pipeline OPs




// `define L15_MSHR_ALLOCATE_TYPE_WIDTH 2
// `define L15_MSHR_ALLOCATE_TYPE_LD 2'd1
// `define L15_MSHR_ALLOCATE_TYPE_ST 2'd2
// `define L15_MSHR_ALLOCATE_TYPE_IFILL 2'd3


































































































// `define PCX_REQ_SIZE_WIDTH 4


























// define the width of the flattened, native L15 interface, used for ARIANE_RV64 option



























// [L15_DTAG_OP_WIDTH-1:0]


























































































// `define L15_NOC1_DUMMY_GEN_NOC1_CREDIT 5'd11








































// L2 shared states


// `define L15_NOC2_ACK_STATE_WIDTH 2
// `define L15_NOC2_ACK_STATE_S 2'd1
// `define L15_NOC2_ACK_STATE_E 2'd2
// `define L15_NOC2_ACK_STATE_M 2'd3

// `define L15_NOC1_REQTYPE_WIDTH `MSG_TYPE_WIDTH
// `define L15_NOC1_REQTYPE_WRITEBACK_GUARD `MSG_TYPE_WBGUARD_REQ
// `define L15_NOC1_REQTYPE_LD_REQUEST `MSG_TYPE_LOAD_REQ
// `define L15_NOC1_REQTYPE_LD_PREFETCH_REQUEST `MSG_TYPE_PREFETCH_REQ
// `define L15_NOC1_REQTYPE_LD_NC_REQUEST `MSG_TYPE_NC_LOAD_REQ
// `define L15_NOC1_REQTYPE_IFILL_REQUEST `MSG_TYPE_LOAD_REQ
// // `define L15_NOC1_REQTYPE_WRITETHROUGH_REQUEST 6'd4
// `define L15_NOC1_REQTYPE_ST_REQUEST `MSG_TYPE_STORE_REQ
// `define L15_NOC1_REQTYPE_BLK_ST_REQUEST `MSG_TYPE_BLK_STORE_REQ
// `define L15_NOC1_REQTYPE_BLK_ST_INIT_REQUEST `MSG_TYPE_BLKINIT_STORE_REQ
// // `define L15_NOC1_REQTYPE__REQUEST
// // `define L15_NOC1_REQTYPE__REQUEST
// // `define L15_NOC1_REQTYPE_ST_UPGRADE_REQUEST 6
// // `define L15_NOC1_REQTYPE_ST_FILL_REQUEST 6'd6
// `define L15_NOC1_REQTYPE_CAS_REQUEST `MSG_TYPE_CAS_REQ
// `define L15_NOC1_REQTYPE_SWAP_REQUEST `MSG_TYPE_SWAP_REQ

// `define L15_NOC3_REQTYPE_WIDTH `MSG_TYPE_WIDTH
// `define L15_NOC3_REQTYPE_WRITEBACK `MSG_TYPE_WB_REQ
// `define L15_NOC3_REQTYPE_NO_DATA_FWD_ACK `MSG_TYPE_NODATA_ACK
// `define L15_NOC3_REQTYPE_DATA_FWD_ACK `MSG_TYPE_DATA_ACK

// `define L2_REQTYPE_WIDTH `MSG_TYPE_WIDTH
// `define L2_REQTYPE_INVALIDATE 6'd1
// `define L2_REQTYPE_DOWNGRADE 6'd2
// `define L2_REQTYPE_ACKDT_LD_NC 6'd3
// `define L2_REQTYPE_ACKDT_IFILL 6'd4
// `define L2_REQTYPE_ACKDT_LD 6'd5
// `define L2_REQTYPE_ACKDT_ST_IM 6'd6
// `define L2_REQTYPE_ACKDT_ST_SM 6'd7
// `define L2_REQTYPE_ACK_WRITETHROUGH 6'd8
// `define L2_REQTYPE_ACK_ATOMIC 6'd9





































// NOC1 ENCODER











// NOC3 ENCODER










// NOC2 BUFFER





// DMBR
// put this here for now, should be moved to a more appropriate location


// NOC1 CREDIT MANAGEMENT
// becareful, the noc1buffer module assumes these are power of two
// also, please change the corresponding pyv value in noc1buffer.v.pyv























// `define L15_NOC1BUFFER_BLKSTORE_LO  `L15_NOC1BUFFER_PREFETCH_HI + 1
// `define L15_NOC1BUFFER_BLKSTORE_HI  `L15_NOC1BUFFER_BLKSTORE_LO + 1 - 1
// `define L15_NOC1BUFFER_BLKINITSTORE_LO  `L15_NOC1BUFFER_BLKSTORE_HI + 1
// `define L15_NOC1BUFFER_BLKINITSTORE_HI  `L15_NOC1BUFFER_BLKINITSTORE_LO + 1 - 1
// `define L15_NOC1BUFFER_DATA_INDEX_LO  `L15_NOC1BUFFER_BLKINITSTORE_HI + 1
































// `define L15_CPUID_ADDRESS 40'h9800000900






////////////////
// CSM
////////////////



// Tri: save space on l15 sram






















//HMC array
































//Special addresses for HMC


//`define L15_ADDR_TYPE_TAG_ACCESS     8'hb4 // later
//`define L15_ADDR_TYPE_STATE_ACCESS   8'hb6 // later
//`define L15_ADDR_TYPE_DIR_ACCESS     8'hb1 // later
//`define L15_ADDR_TYPE_CTRL_REG       8'hb9
//`define L15_ADDR_TYPE_DIS_FLUSH      8'hbc, 8'hbd, 8'hbe, 8'hbf
// `define L15_ADDR_TYPE_HMT_BASE_REG      8'hb7


















// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: lsu.h
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/

// /tigress/pjj/openpiton/single-file/princeton-parallel-processor/piton/verif/env/manycore/devices.xml






// 1:0


// 128

// 32


// 10

// 7


// 6:0



// 29 + 1 parity





// 144




























//`define STB_PCX_WY_HI   107
//`define STB_PCX_WY_LO   106



















































































// TLB Tag and Data Format
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	


// I-TLB version - lsu_tlb only.
























// // Invalidate Format
// //addr<5:4>=00
// `define CPX_A00_C0_LO	0
// `define CPX_A00_C0_HI	3
// `define CPX_A00_C1_LO	4
// `define CPX_A00_C1_HI	7
// `define CPX_A00_C2_LO	8
// `define CPX_A00_C2_HI	11
// `define CPX_A00_C3_LO	12
// `define CPX_A00_C3_HI	15
// `define CPX_A00_C4_LO	16
// `define CPX_A00_C4_HI	19
// `define CPX_A00_C5_LO	20
// `define CPX_A00_C5_HI	23
// `define CPX_A00_C6_LO	24
// `define CPX_A00_C6_HI	27
// `define CPX_A00_C7_LO	28
// `define CPX_A00_C7_HI	31

// //addr<5:4>=01
// `define CPX_A01_C0_LO	32
// `define CPX_A01_C0_HI	34
// `define CPX_A01_C1_LO	35
// `define CPX_A01_C1_HI	37
// `define CPX_A01_C2_LO	38
// `define CPX_A01_C2_HI	40
// `define CPX_A01_C3_LO	41
// `define CPX_A01_C3_HI	43
// `define CPX_A01_C4_LO	44
// `define CPX_A01_C4_HI	46
// `define CPX_A01_C5_LO	47
// `define CPX_A01_C5_HI	49
// `define CPX_A01_C6_LO	50
// `define CPX_A01_C6_HI	52
// `define CPX_A01_C7_LO	53
// `define CPX_A01_C7_HI	55

// //addr<5:4>=10
// `define CPX_A10_C0_LO	56
// `define CPX_A10_C0_HI	59
// `define CPX_A10_C1_LO	60
// `define CPX_A10_C1_HI	63
// `define CPX_A10_C2_LO	64
// `define CPX_A10_C2_HI	67
// `define CPX_A10_C3_LO	68
// `define CPX_A10_C3_HI	71
// `define CPX_A10_C4_LO	72
// `define CPX_A10_C4_HI	75
// `define CPX_A10_C5_LO	76
// `define CPX_A10_C5_HI	79
// `define CPX_A10_C6_LO	80
// `define CPX_A10_C6_HI	83
// `define CPX_A10_C7_LO	84
// `define CPX_A10_C7_HI	87

// //addr<5:4>=11
// `define CPX_A11_C0_LO	88
// `define CPX_A11_C0_HI	90
// `define CPX_A11_C1_LO	91
// `define CPX_A11_C1_HI	93
// `define CPX_A11_C2_LO	94
// `define CPX_A11_C2_HI	96
// `define CPX_A11_C3_LO	97
// `define CPX_A11_C3_HI	99
// `define CPX_A11_C4_LO	100
// `define CPX_A11_C4_HI	102
// `define CPX_A11_C5_LO	103
// `define CPX_A11_C5_HI	105
// `define CPX_A11_C6_LO	106
// `define CPX_A11_C6_HI	108
// `define CPX_A11_C7_LO	109
// `define CPX_A11_C7_HI	111

// cpuid - 4b



// CPUany, addr<5:4>=00,10
// `define CPX_AX0_INV_DVLD 0
// `define CPX_AX0_INV_IVLD 1
// `define CPX_AX0_INV_WY_LO 2
// `define CPX_AX0_INV_WY_HI 3

// CPUany, addr<5:4>=01,11
// `define CPX_AX1_INV_DVLD 0
// `define CPX_AX1_INV_WY_LO 1
// `define CPX_AX1_INV_WY_HI 2

// CPUany, addr<5:4>=01,11
// `define CPX_AX1_INV_DVLD 0
// `define CPX_AX1_INV_WY_LO 1
// `define CPX_AX1_INV_WY_HI 2

// DTAG parity error Invalidate




// CPX BINIT STORE

// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: ifu.h
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/
////////////////////////////////////////////////////////////////////////
/*
//
//  Module Name: ifu.h
//  Description:	
//  All ifu defines
*/

//--------------------------------------------
// Icache Values in IFU::ICD/ICV/ICT/FDP/IFQDP
//--------------------------------------------

// /tigress/pjj/openpiton/single-file/princeton-parallel-processor/piton/verif/env/manycore/devices.xml








// `IC_WAY_MASK

// Set Values
// !!IMPORTANT!! a change to IC_LINE_SZ will mean a change to the code as
//   well.  Unfortunately this has not been properly parametrized.
//   Changing the IC_LINE_SZ param alone is *not* enough.
// `define IC_LINE_SZ  32



// !!IMPORTANT!! a change to IC_TAG_HI will mean a change to the code as
//   well.  Changing the IC_TAG_HI param alone is *not* enough to
//   change the PA range. 
// highest bit of PA


// Derived Values
// IC_IDX_HI = log(icache_size/4ways) - 1
// 11


// 4095
// `define IC_ARR_HI (`IC_SZ/`IC_NUM_WAY - 1)

// number of entries - 1 = 511

// 128 - 1

// 32


// 12


// 28

// `define IC_TAG_MASK_ALL ((`IC_TLB_TAG_SZ * `IC_NUM_WAY)-1):0


// 4

// `define IC_PARITY_PADDING (32 - `IC_TAG_SZ - 1)



// 7


// tags for all 4 ways + parity
// 116
// `define IC_TAG_ALL   ((`IC_TAG_SZ * `IC_NUM_WAY) + 4)

// 115
// `define IC_TAG_ALL_HI   ((`IC_TAG_SZ * `IC_NUM_WAY) + 3)

// physical implementation defines














// TLB
// `define IC_TLB_TAG_SZ 30
// tag + 1 bit parity



























//----------------------------------------------------------------------
// For thread scheduler in IFU::DTU::SWL
//----------------------------------------------------------------------
// thread states:  (thr_state[4:0])









// thread configuration register bit fields







//----------------------------------------------------------------------
// For MIL fsm in IFU::IFQ
//----------------------------------------------------------------------











//---------------------------------------------------
// Interrupt Block
//---------------------------------------------------







//-------------------------------------
// IFQ
//-------------------------------------
// valid bit plus ifill













//`ifdef SPARC_L2_64B


//`else
//`define BANK_ID_HI 8
//`define BANK_ID_LO 7
//`endif

//`define CPX_INV_PA_HI  116
//`define CPX_INV_PA_LO  112







//----------------------------------------
// IFU Traps
//----------------------------------------
// precise















// disrupting












/*
Copyright (c) 2015 Princeton University
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

//Function: This maintains the control of where different signals want to go
//and counters of how many words are left in messages
//
//State:
//header_temp_f  //header_temp from the previous cycle
//count_f       //the counter of how much more we have to go
//tail_last_f   //what the tail bit wa the last cycle
//count_zero_f  //whether the counter now is zero
//count_one_f   //whether the counter now is one
//
//Instantiates: dynamic_input_route_request_calc
//
//Note:
//
/*
Copyright (c) 2015 Princeton University
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

/////////////////////////////////////////////////////////////////////////////////////////////
// 63         50 49      42 41      34 33           30 29      22 21                 0   
// ------------------------------------------------------------------------------------
// |            |          |          |               |          |                    |
// |  Chip ID   |  Dest X  |  Dest Y  |  Final Route  |  Length  |    Header Payload  | 
// |            |          |          |               |          |                    |
// ------------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////////////////////











 //whether the routing is based on chipid or x y position
 //`define    ROUTING_CHIP_ID
 

 //defines for different topology, only one should be active
 //`define    NETWORK_TOPO_2D_MESH
 //`define    NETWORK_TOPO_3D_MESH
 
module dynamic_input_control(thanks_all_temp_out,
                             route_req_n_out, route_req_e_out, route_req_s_out, route_req_w_out, route_req_p_out,
                             default_ready_n, default_ready_e, default_ready_s, default_ready_w, default_ready_p,
                             tail_out, clk, reset,
                             my_loc_x_in, my_loc_y_in, my_chip_id_in,
                             abs_x, abs_y, abs_chip_id, final_bits, valid_in,
                             thanks_n, thanks_e, thanks_s, thanks_w, thanks_p,
                             length);

// begin port declarations

output thanks_all_temp_out;
output route_req_n_out;
output route_req_e_out;
output route_req_s_out;
output route_req_w_out;
output route_req_p_out;
output default_ready_n;
output default_ready_e;
output default_ready_s;
output default_ready_w;
output default_ready_p;
output tail_out;

input clk;
input reset;

input [8-1:0] my_loc_x_in;
input [8-1:0] my_loc_y_in;
input [14-1:0] my_chip_id_in;
input [8-1:0] abs_x;
input [8-1:0] abs_y;
input [14-1:0] abs_chip_id;
input [2:0] final_bits;
input valid_in;
input thanks_n;
input thanks_e;
input thanks_s;
input thanks_w;
input thanks_p;
input [8-1:0] length;

// end port declarations

//This is the state
reg [8-1:0] count_f;
reg header_last_f;
reg thanks_all_f;
reg count_zero_f;
reg count_one_f;
reg tail_last_f;

//inputs to the state
reg [8-1:0] count_temp;
wire header_last_temp;
wire thanks_all_temp;
wire count_zero_temp;
wire count_one_temp;
wire tail_last_temp;


//wires
wire header;
wire [8-1:0] count_minus_one;
wire length_zero; //for use in calculating tail bit for
                  //zero length messages on the default route
wire tail;

//wire regs
reg header_temp;

//assigns
assign thanks_all_temp = thanks_n | thanks_e | thanks_s | thanks_w | thanks_p;
assign header = valid_in & header_temp;
assign count_zero_temp = count_temp == 0;
assign count_one_temp = count_temp == 1;
assign thanks_all_temp_out = thanks_all_temp;
assign tail_out = tail;
assign count_minus_one = count_f - 1;
assign length_zero = length == 0;
assign header_last_temp = header_temp;
//nasty control logic which I really hope is correct
assign tail = (header & length_zero) | ((~thanks_all_f) & tail_last_f) | (thanks_all_f & count_one_f);
assign tail_last_temp = tail;

//instantiations
dynamic_input_route_request_calc tail_calc(.route_req_n(route_req_n_out),
                                           .route_req_e(route_req_e_out),
                                           .route_req_s(route_req_s_out),
                                           .route_req_w(route_req_w_out),
                                           .route_req_p(route_req_p_out),
                                           .default_ready_n(default_ready_n),
                                           .default_ready_e(default_ready_e),
                                           .default_ready_s(default_ready_s),
                                           .default_ready_w(default_ready_w),
                                           .default_ready_p(default_ready_p),
                                           .my_loc_x_in(my_loc_x_in),
                                           .my_loc_y_in(my_loc_y_in),
                                           .my_chip_id_in(my_chip_id_in),
                                           .abs_x(abs_x),
                                           .abs_y(abs_y),
                                           .abs_chip_id(abs_chip_id),
                                           .final_bits(final_bits),
                                           .length(length),
                                           .header_in(header));

always @ (header_last_f or thanks_all_f or count_zero_f)
begin
        case({header_last_f, count_zero_f, thanks_all_f})
        3'b000: header_temp <= 1'b0;
        3'b001: header_temp <= 1'b0;
        3'b010: header_temp <= 1'b0;
        3'b011: header_temp <= 1'b1;
        3'b100: header_temp <= 1'b1;
        //yanqiz change 0->1
        3'b101: header_temp <= 1'b0;
        3'b110: header_temp <= 1'b1;
        3'b111: header_temp <= 1'b1;
        default:
                header_temp <= 1'b1;
        endcase
end

always @ (header or thanks_all_f or count_f or count_minus_one or length)
begin
        if(header)
        begin
                count_temp <= length;
        end
        else
        begin
                if(thanks_all_f)
                begin
                        count_temp <= count_minus_one;
                end
                else
                begin
                        count_temp <= count_f;
                end
        end
end

//take care of synchronous stuff
always @ (posedge clk)
begin
        if(reset)
        begin
                count_f <= 5'd0;
                header_last_f <= 1'b1;
                thanks_all_f <= 1'b0;
                count_zero_f <= 1'b1; //I think that this must reset to 1 to work!
                count_one_f <= 1'b0;
                tail_last_f <= 1'b0;
        end
        else
        begin
                count_f <= count_temp;
                header_last_f <= header_last_temp;
                thanks_all_f <= thanks_all_temp;
                count_zero_f <= count_zero_temp;
                count_one_f <= count_one_temp;
                tail_last_f <= tail_last_temp;
        end
end
endmodule

/*
Copyright (c) 2015 Princeton University
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

//Function: This generates all of the route_request lines and the default_ready lines from
//the absolute location of the tile, the abs address of the message, and the fbits of the message
//
//State: 
//NONE
//
//Instantiates: 
//
//Note:
//

/*
Copyright (c) 2015 Princeton University
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

/////////////////////////////////////////////////////////////////////////////////////////////
// 63         50 49      42 41      34 33           30 29      22 21                 0   
// ------------------------------------------------------------------------------------
// |            |          |          |               |          |                    |
// |  Chip ID   |  Dest X  |  Dest Y  |  Final Route  |  Length  |    Header Payload  | 
// |            |          |          |               |          |                    |
// ------------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////////////////////











 //whether the routing is based on chipid or x y position
 //`define    ROUTING_CHIP_ID
 

 //defines for different topology, only one should be active
 //`define    NETWORK_TOPO_2D_MESH
 //`define    NETWORK_TOPO_3D_MESH
 

module dynamic_input_route_request_calc(route_req_n, route_req_e, route_req_s, route_req_w, route_req_p, 
                                        default_ready_n, default_ready_e, default_ready_s, default_ready_w, default_ready_p, 
                                        my_loc_x_in, my_loc_y_in, my_chip_id_in, abs_x, abs_y, abs_chip_id, final_bits, length, header_in);

// begin port declarations

output route_req_n;
output route_req_e;
output route_req_s;
output route_req_w;
output route_req_p;
output default_ready_n;
output default_ready_e;
output default_ready_s;
output default_ready_w;
output default_ready_p;

input [8-1:0] my_loc_x_in;
input [8-1:0] my_loc_y_in;
input [14-1:0] my_chip_id_in;
input [8-1:0] abs_x;
input [8-1:0] abs_y;
input [14-1:0] abs_chip_id;

input [2:0] final_bits;
input [8-1:0] length;
input header_in;

// end port declarations
   
//fbit declarations






//This is the state
//NONE

//inputs to the state
//NONE

//wires
wire more_x;
wire more_y;
wire less_x;
wire less_y;
wire done_x;
wire done_y;
wire off_chip;

wire done;

wire north;
wire east;
wire south;
wire west;
wire proc;

wire north_calc;
wire south_calc;

//wire regs

//assigns

assign off_chip = abs_chip_id != my_chip_id_in;
assign more_x = off_chip ? 0 > my_loc_x_in : abs_x > my_loc_x_in;
assign more_y = off_chip ? 0 > my_loc_y_in : abs_y > my_loc_y_in;

assign less_x = off_chip ? 0 < my_loc_x_in : abs_x < my_loc_x_in;
assign less_y = off_chip ? 0 < my_loc_y_in : abs_y < my_loc_y_in;

assign done_x = off_chip ? 0 == my_loc_x_in : abs_x == my_loc_x_in;
assign done_y = off_chip ? 0 == my_loc_y_in : abs_y == my_loc_y_in;

assign done = done_x & done_y;

assign north_calc = done_x & less_y;
assign south_calc = done_x & more_y;

assign north = north_calc | ((final_bits == 3'b101) & done);
assign south = south_calc | ((final_bits == 3'b011) & done);
assign east = more_x | ((final_bits == 3'b100) & done);
assign west = less_x | ((final_bits == 3'b010) & done);
assign proc = ((final_bits == 3'b000) & done);

assign route_req_n = header_in & north;
assign route_req_e = header_in & east;
assign route_req_s = header_in & south;
assign route_req_w = header_in & west;
assign route_req_p = header_in & proc;

assign default_ready_n = route_req_n;
assign default_ready_e = route_req_e;
assign default_ready_s = route_req_s;
assign default_ready_w = route_req_w;
assign default_ready_p = route_req_p;

//instantiations

endmodule
   
/*
Copyright (c) 2015 Princeton University
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

//Function: This ties together a 16 space NIB with the dynamic_input_control logic
//
//State: 
//
//Instantiates: dynamic_input_control, network_input_blk_4elmt
//
//Note:
//
/*
Copyright (c) 2015 Princeton University
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

/////////////////////////////////////////////////////////////////////////////////////////////
// 63         50 49      42 41      34 33           30 29      22 21                 0   
// ------------------------------------------------------------------------------------
// |            |          |          |               |          |                    |
// |  Chip ID   |  Dest X  |  Dest Y  |  Final Route  |  Length  |    Header Payload  | 
// |            |          |          |               |          |                    |
// ------------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////////////////////











 //whether the routing is based on chipid or x y position
 //`define    ROUTING_CHIP_ID
 

 //defines for different topology, only one should be active
 //`define    NETWORK_TOPO_2D_MESH
 //`define    NETWORK_TOPO_3D_MESH
 

module dynamic_input_top_16(route_req_n_out, route_req_e_out, route_req_s_out, route_req_w_out, route_req_p_out, default_ready_n_out, default_ready_e_out, default_ready_s_out, default_ready_w_out, default_ready_p_out, tail_out, yummy_out, data_out, valid_out, clk, reset, my_loc_x_in, my_loc_y_in, my_chip_id_in, valid_in, data_in, thanks_n, thanks_e, thanks_s, thanks_w, thanks_p);

// begin port declarations

output route_req_n_out;
output route_req_e_out;
output route_req_s_out;
output route_req_w_out;
output route_req_p_out;
output default_ready_n_out;
output default_ready_e_out;
output default_ready_s_out;
output default_ready_w_out;
output default_ready_p_out;
output tail_out;
output yummy_out;
output [64-1:0] data_out;
output valid_out;
//yanqi fixed

input clk;
input reset;

input [8-1:0] my_loc_x_in;
input [8-1:0] my_loc_y_in;
input [14-1:0] my_chip_id_in;
input valid_in;
input [64-1:0] data_in;
input thanks_n;
input thanks_e;
input thanks_s;
input thanks_w;
input thanks_p;

// end port declarations
   
//This is the state

//inputs to the state

//wires
wire thanks_all_temp;
wire valid_out_internal;
wire [64-1:0] data_out_internal;
wire [64-1:0] data_out_internal_pre;
//wire regs

//assigns
assign valid_out = valid_out_internal;
assign data_out = data_out_internal;

//instantiations
network_input_blk_multi_out #(.LOG2_NUMBER_FIFO_ELEMENTS(4)) NIB(.clk(clk), .reset(reset), .data_in(data_in), .valid_in(valid_in), .yummy_out(yummy_out), .thanks_in(thanks_all_temp), .data_val(data_out_internal_pre), .data_val1(), .data_avail(valid_out_internal));

// need buffering for this one
// rBuffer #(`DATA_WIDTH, 1) NIB_buf(.A(data_out_internal_pre), .Z(data_out_internal));   
assign data_out_internal = data_out_internal_pre;

// Change fbits position in order to be compatible   
dynamic_input_control control(.thanks_all_temp_out(thanks_all_temp), .route_req_n_out(route_req_n_out), .route_req_e_out(route_req_e_out), .route_req_s_out(route_req_s_out), .route_req_w_out(route_req_w_out), .route_req_p_out(route_req_p_out), .default_ready_n(default_ready_n_out), .default_ready_e(default_ready_e_out), .default_ready_s(default_ready_s_out), .default_ready_w(default_ready_w_out), .default_ready_p(default_ready_p_out), .tail_out(tail_out), .clk(clk), .reset(reset), .my_loc_x_in(my_loc_x_in), .my_loc_y_in(my_loc_y_in), 
    .my_chip_id_in(my_chip_id_in), .abs_x(data_out_internal[64-14-1:64-14-8]), .abs_y(data_out_internal[64-14-8-1:64-14-2*8]), .abs_chip_id(data_out_internal[64-1:64-14]),.final_bits(data_out_internal[64-14-2*8-2:64-14-2*8-4]), .valid_in(valid_out_internal), .thanks_n(thanks_n), .thanks_e(thanks_e), .thanks_s(thanks_s), .thanks_w(thanks_w), .thanks_p(thanks_p), .length(data_out_internal[64-14-2*8-5:64-14-2*8-4-8]));

endmodule
/*
Copyright (c) 2015 Princeton University
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

//Function: This ties together a 4 space NIB with the dynamic_input_control logic
//
//State:
//
//Instantiates: dynamic_input_control, network_input_blk_4elmt
//
//Note:
//
/*
Copyright (c) 2015 Princeton University
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

/////////////////////////////////////////////////////////////////////////////////////////////
// 63         50 49      42 41      34 33           30 29      22 21                 0   
// ------------------------------------------------------------------------------------
// |            |          |          |               |          |                    |
// |  Chip ID   |  Dest X  |  Dest Y  |  Final Route  |  Length  |    Header Payload  | 
// |            |          |          |               |          |                    |
// ------------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////////////////////











 //whether the routing is based on chipid or x y position
 //`define    ROUTING_CHIP_ID
 

 //defines for different topology, only one should be active
 //`define    NETWORK_TOPO_2D_MESH
 //`define    NETWORK_TOPO_3D_MESH
 

module dynamic_input_top_4(route_req_n_out, route_req_e_out, route_req_s_out, route_req_w_out, route_req_p_out,
                           default_ready_n_out, default_ready_e_out, default_ready_s_out, default_ready_w_out, default_ready_p_out,
                           tail_out, yummy_out, data_out, valid_out, clk, reset,
                           my_loc_x_in, my_loc_y_in, my_chip_id_in,  valid_in, data_in,
                           thanks_n, thanks_e, thanks_s, thanks_w, thanks_p);

// begin port declarations

output route_req_n_out;
output route_req_e_out;
output route_req_s_out;
output route_req_w_out;
output route_req_p_out;
output default_ready_n_out;
output default_ready_e_out;
output default_ready_s_out;
output default_ready_w_out;
output default_ready_p_out;
output tail_out;
output yummy_out;
output [64-1:0] data_out;
output valid_out;

input clk;
input reset;

input [8-1:0] my_loc_x_in;
input [8-1:0] my_loc_y_in;
input [14-1:0] my_chip_id_in;
input valid_in;
input [64-1:0] data_in;
input thanks_n;
input thanks_e;
input thanks_s;
input thanks_w;
input thanks_p;

// end port declarations

//This is the state

//inputs to the state

//wires
wire thanks_all_temp;
wire [64-1:0] data_internal;
wire valid_out_internal;

//wire regs

//assigns
assign valid_out = valid_out_internal;

//instantiations
network_input_blk_multi_out #(.LOG2_NUMBER_FIFO_ELEMENTS(2)) NIB(.clk(clk),
                                      .reset(reset),
                                      .data_in(data_in),
                                      .valid_in(valid_in),
                                      .yummy_out(yummy_out),
                                      .thanks_in(thanks_all_temp),
                                      .data_val(data_out),
                                      .data_val1(data_internal), // same as data_val, done for buffering
                                      .data_avail(valid_out_internal));

dynamic_input_control control(.thanks_all_temp_out(thanks_all_temp),
                              .route_req_n_out(route_req_n_out), 
                              .route_req_e_out(route_req_e_out), 
                              .route_req_s_out(route_req_s_out), 
                              .route_req_w_out(route_req_w_out), 
                              .route_req_p_out(route_req_p_out),
                              .default_ready_n(default_ready_n_out), 
                              .default_ready_e(default_ready_e_out), 
                              .default_ready_s(default_ready_s_out), 
                              .default_ready_w(default_ready_w_out), 
                              .default_ready_p(default_ready_p_out),
                              .tail_out(tail_out),
                              .clk(clk), .reset(reset),
                              .my_loc_x_in(my_loc_x_in), 
                              .my_loc_y_in(my_loc_y_in), 
                              .my_chip_id_in(my_chip_id_in),
                              .abs_x(data_internal[64-14-1:64-14-8]), 
                              .abs_y(data_internal[64-14-8-1:64-14-2*8]), 
                              .abs_chip_id(data_internal[64-1:64-14]),
                              .final_bits(data_internal[64-14-2*8-2:64-14-2*8-4]),
                              .valid_in(valid_out_internal),
                              .thanks_n(thanks_n), .thanks_e(thanks_e), .thanks_s(thanks_s), .thanks_w(thanks_w), .thanks_p(thanks_p),
                              .length(data_internal[64-14-2*8-5:64-14-2*8-4-8]));

endmodule
/*
Copyright (c) 2015 Princeton University
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

//Function: This maintains the control of the output mux for a dynamic network port.
//	This does the scheduling for the output.
//	It takes as input what all of the other ports want to do and outputs the control
//	for the respective crossbar mux and the validOut signal for a respective direction.
//
//Instantiates:
//
//State: current_route_f [2:0], planned_f
//
//Note:
//
/*
Copyright (c) 2015 Princeton University
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

/////////////////////////////////////////////////////////////////////////////////////////////
// 63         50 49      42 41      34 33           30 29      22 21                 0   
// ------------------------------------------------------------------------------------
// |            |          |          |               |          |                    |
// |  Chip ID   |  Dest X  |  Dest Y  |  Final Route  |  Length  |    Header Payload  | 
// |            |          |          |               |          |                    |
// ------------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////////////////////











 //whether the routing is based on chipid or x y position
 //`define    ROUTING_CHIP_ID
 

 //defines for different topology, only one should be active
 //`define    NETWORK_TOPO_2D_MESH
 //`define    NETWORK_TOPO_3D_MESH
 

module dynamic_output_control(thanks_a, thanks_b, thanks_c, thanks_d, thanks_x, valid_out, current_route, ec_wants_to_send_but_cannot, clk, reset, route_req_a_in, route_req_b_in, route_req_c_in, route_req_d_in, route_req_x_in, tail_a_in, tail_b_in, tail_c_in, tail_d_in, tail_x_in, valid_out_temp, default_ready, space_avail);

// begin port declarations

output thanks_a;
output thanks_b;
output thanks_c;
output thanks_d;
output thanks_x;

output valid_out;

output [2:0] current_route;
output    ec_wants_to_send_but_cannot;

input clk;
input reset;

input route_req_a_in;
input route_req_b_in;
input route_req_c_in;
input route_req_d_in;
input route_req_x_in;

input tail_a_in;
input tail_b_in;
input tail_c_in;
input tail_d_in;
input tail_x_in;

input valid_out_temp;

input default_ready;

input space_avail;

// end port declarations







//This is the state
reg [2:0]current_route_f;
reg planned_f;

//inputs to the state
wire [2:0] current_route_temp;

//wires
wire planned_or_default;
// wire route_req_all_or;
wire route_req_all_or_with_planned;
wire route_req_all_but_default;
wire valid_out_internal;

//wire regs
reg new_route_needed;
reg planned_temp;
reg [2:0] new_route;
reg tail_current_route;
/*reg route_req_planned;*/
reg route_req_a_mask;
reg route_req_b_mask;
reg route_req_c_mask;
reg route_req_d_mask;
reg route_req_x_mask;


//more wire regs for the thanks lines
reg thanks_a;
reg thanks_b;
reg thanks_c;
reg thanks_d;
reg thanks_x;

reg    ec_wants_to_send_but_cannot;

//assigns
assign planned_or_default = planned_f | default_ready;
assign valid_out_internal = valid_out_temp & planned_or_default & space_avail;

// mbt: if valid_out_interal is a critical path, we can use some "bleeder" gates to decrease the load of the ec stuff
always @(posedge clk)
  begin
     ec_wants_to_send_but_cannot <= valid_out_temp & planned_or_default & ~space_avail;
  end

/* assign route_req_all_or = route_req_a_in | route_req_b_in | route_req_c_in | route_req_d_in | route_req_x_in; */
assign current_route_temp = (new_route_needed) ? new_route : current_route_f;
assign current_route = current_route_f;
//this is everything except the currentl planned route's request
assign route_req_all_or_with_planned = (route_req_a_in & route_req_a_mask) | (route_req_b_in & route_req_b_mask) | (route_req_c_in & route_req_c_mask) | (route_req_d_in & route_req_d_mask) | (route_req_x_in & route_req_x_mask);
//calculates whether the nib that we are going to has space
assign route_req_all_but_default = route_req_b_in | route_req_c_in | route_req_d_in | route_req_x_in;

assign valid_out = valid_out_internal;

//instantiations
//space_avail space(.valid(valid_out_internal), .clk(clk), .reset(reset), .yummy(yummy_in), .spc_avail(space_avail));
//THIS HAS BEEN MOVED to dynamic_output_top

//a mux for current_route_f's tail bit
always @ (current_route_f or tail_a_in or tail_b_in or tail_c_in or tail_d_in or tail_x_in)
begin
	case(current_route_f) //synopsys parallel_case
	3'b000:
	begin
		tail_current_route <= tail_a_in;
	end
	3'b001:
	begin
		tail_current_route <= tail_b_in;
	end
	3'b010:
	begin
		tail_current_route <= tail_c_in;
	end
	3'b011:
	begin
		tail_current_route <= tail_d_in;
	end
	3'b100:
	begin
		tail_current_route <= tail_x_in;
	end
	default:
	begin
		tail_current_route <= 1'bx; //This is probably dangerous, but I
					    //really need the speed here and
					    //I don't want the synthesizer to
					    //mess me up if I put a real value
					    //here
	end
	endcase
end

always @ (current_route_f or valid_out_internal)
begin
	case(current_route_f)
	3'b000:
	begin
		thanks_a <= valid_out_internal;
		thanks_b <= 1'b0;
		thanks_c <= 1'b0;
		thanks_d <= 1'b0;
		thanks_x <= 1'b0;
	end
	3'b001:
	begin
		thanks_a <= 1'b0;
		thanks_b <= valid_out_internal;
		thanks_c <= 1'b0;
		thanks_d <= 1'b0;
		thanks_x <= 1'b0;
	end
	3'b010:
	begin
		thanks_a <= 1'b0;
		thanks_b <= 1'b0;
		thanks_c <= valid_out_internal;
		thanks_d <= 1'b0;
		thanks_x <= 1'b0;
	end
	3'b011:
	begin
		thanks_a <= 1'b0;
		thanks_b <= 1'b0;
		thanks_c <= 1'b0;
		thanks_d <= valid_out_internal;
		thanks_x <= 1'b0;
	end
	3'b100:
	begin
		thanks_a <= 1'b0;
		thanks_b <= 1'b0;
		thanks_c <= 1'b0;
		thanks_d <= 1'b0;
		thanks_x <= valid_out_internal;
	end
	default:
	begin
		thanks_a <= 1'bx;
		thanks_b <= 1'bx;
		thanks_c <= 1'bx;
		thanks_d <= 1'bx;
		thanks_x <= 1'bx;
					//once again this is very dangerous
					//but I want to see the timing this
					//way and we sould never get here
	end
	endcase
end

//this is the rotating priority encoder
/*
always @(current_route_f or route_req_a_in or route_req_b_in or route_req_c_in or route_req_d_in or route_req_x_in)
begin
	case(current_route_f)
	`ROUTE_A:
	begin
		new_route <= (route_req_b_in)?`ROUTE_B:((route_req_c_in)?`ROUTE_C:((route_req_d_in)?`ROUTE_D:((route_req_x_in)?`ROUTE_X:`ROUTE_A)));
	end
	`ROUTE_B:
	begin
		new_route <= (route_req_c_in)?`ROUTE_C:((route_req_d_in)?`ROUTE_D:((route_req_x_in)?`ROUTE_X:((route_req_a_in)?`ROUTE_A:((route_req_b_in)?`ROUTE_B:`ROUTE_A))));
	end
	`ROUTE_C:
	begin
		new_route <= (route_req_d_in)?`ROUTE_D:((route_req_x_in)?`ROUTE_X:((route_req_a_in)?`ROUTE_A:((route_req_b_in)?`ROUTE_B:((route_req_c_in)?`ROUTE_C:`ROUTE_A))));
	end
	`ROUTE_D:
	begin
		new_route <= (route_req_c_in)?`ROUTE_C:((route_req_d_in)?`ROUTE_D:((route_req_x_in)?`ROUTE_X:((route_req_a_in)?`ROUTE_A:((route_req_b_in)?`ROUTE_B:`ROUTE_A))));
	end
	`ROUTE_X:
	begin
		new_route <= (route_req_x_in)?`ROUTE_X:((route_req_a_in)?`ROUTE_A:((route_req_b_in)?`ROUTE_B:((route_req_c_in)?`ROUTE_C:((route_req_d_in)?`ROUTE_D:`ROUTE_A))));
	end
	default:
	begin
		new_route <= `ROUTE_A;
			//this one I am not willing to chince on
	end
	endcase
end
*/
//end the rotating priority encoder

//this is the rotating priority encoder
always @(current_route_f or route_req_a_in or route_req_b_in or route_req_c_in or route_req_d_in or route_req_x_in)
begin
	case(current_route_f)
	3'b000:
	begin
		new_route <= (route_req_b_in)?3'b001:((route_req_c_in)?3'b010:((route_req_d_in)?3'b011:((route_req_x_in)?3'b100:3'b000)));
	end
	3'b001:
	begin
		new_route <= (route_req_c_in)?3'b010:((route_req_d_in)?3'b011:((route_req_x_in)?3'b100:((route_req_a_in)?3'b000:3'b000)));
	end
	3'b010:
	begin
		new_route <= (route_req_d_in)?3'b011:((route_req_x_in)?3'b100:((route_req_a_in)?3'b000:((route_req_b_in)?3'b001:3'b000)));
	end
	3'b011:
	begin
		new_route <= (route_req_x_in)?3'b100:((route_req_a_in)?3'b000:((route_req_b_in)?3'b001:((route_req_c_in)?3'b010:3'b000)));
	end
	3'b100:
	begin
		new_route <= (route_req_a_in)?3'b000:((route_req_b_in)?3'b001:((route_req_c_in)?3'b010:((route_req_d_in)?3'b011:3'b000)));
	end
	default:
	begin
		new_route <= 3'b000;
			//this one I am not willing to chince on
	end
	endcase
end
//end the rotating priority encoder

always @(current_route_f or planned_f)
begin
	if(planned_f)
	begin
		case(current_route_f)
		3'b000:	
			begin
				route_req_a_mask <= 1'b0;
				route_req_b_mask <= 1'b1;
				route_req_c_mask <= 1'b1;
				route_req_d_mask <= 1'b1;
				route_req_x_mask <= 1'b1;
			end
		3'b001:
			begin
				route_req_a_mask <= 1'b1;
				route_req_b_mask <= 1'b0;
				route_req_c_mask <= 1'b1;
				route_req_d_mask <= 1'b1;
				route_req_x_mask <= 1'b1;
			end
		3'b010:
			begin
				route_req_a_mask <= 1'b1;
				route_req_b_mask <= 1'b1;
				route_req_c_mask <= 1'b0;
				route_req_d_mask <= 1'b1;
				route_req_x_mask <= 1'b1;
			end
		3'b011:
			begin
				route_req_a_mask <= 1'b1;
				route_req_b_mask <= 1'b1;
				route_req_c_mask <= 1'b1;
				route_req_d_mask <= 1'b0;
				route_req_x_mask <= 1'b1;
			end
		3'b100:
			begin
				route_req_a_mask <= 1'b1;
				route_req_b_mask <= 1'b1;
				route_req_c_mask <= 1'b1;
				route_req_d_mask <= 1'b1;
				route_req_x_mask <= 1'b0;
			end
		default:
			begin
				route_req_a_mask <= 1'b1;
				route_req_b_mask <= 1'b1;
				route_req_c_mask <= 1'b1;
				route_req_d_mask <= 1'b1;
				route_req_x_mask <= 1'b1;
			end
		endcase
	end
	else
	begin
		route_req_a_mask <= 1'b1;
		route_req_b_mask <= 1'b1;
		route_req_c_mask <= 1'b1;
		route_req_d_mask <= 1'b1;
		route_req_x_mask <= 1'b1;
	end
end

//calculation of new_route_needed
always @ (planned_f or tail_current_route or valid_out_internal or default_ready)
begin
	case({default_ready, valid_out_internal, tail_current_route, planned_f}) //synopsys parallel_case
	4'b0000:	new_route_needed <= 1'b1;
	4'b0001:	new_route_needed <= 1'b0;
	4'b0010:	new_route_needed <= 1'b1;
	4'b0011:	new_route_needed <= 1'b0;
	4'b0100:	new_route_needed <= 1'b0;	//This line should probably be turned to a 1 if we are to implement "Mikes fairness" schema
	4'b0101:	new_route_needed <= 1'b0;	//This line should probably be turned to a 1 if we are to implement "Mikes fairness" schema
	4'b0110:	new_route_needed <= 1'b1;
	4'b0111:	new_route_needed <= 1'b1;

	4'b1000:	new_route_needed <= 1'b1;
	4'b1001:	new_route_needed <= 1'b0;
//	4'b1010:	new_route_needed <= 1'b0;	//this is scary CHECK THIS BEFORE CHIP SHIPS
	4'b1010:	new_route_needed <= 1'b1;	//this is the case where there is a zero length message on the default route that is not being sent this cycle therefore we should let something be locked in, but it doesn't necessarily just the default route.  Remember that the default route is the last choice in the priority encoder, but if nothing else is requesting, the default route will be planned and locked in.
    //yanqiz change from 0->1
	4'b1011:	new_route_needed <= 1'b0;
	4'b1100:	new_route_needed <= 1'b0;
	4'b1101:	new_route_needed <= 1'b0;
	4'b1110:	new_route_needed <= 1'b1;
	4'b1111:	new_route_needed <= 1'b1;
	default:	new_route_needed <= 1'b1;
			//safest choice should never occur
	endcase
end

//calculation of planned_temp
//random five input function
always @ (planned_f or tail_current_route or valid_out_internal or default_ready or route_req_all_or_with_planned or route_req_all_but_default)
begin
	case({route_req_all_or_with_planned, default_ready, valid_out_internal, tail_current_route, planned_f}) //synopsys parallel_case
	5'b00000:	planned_temp <= 1'b0;
	5'b00001:	planned_temp <= 1'b1;
	5'b00010:	planned_temp <= 1'b0;
	5'b00011:	planned_temp <= 1'b1;
	5'b00100:	planned_temp <= 1'b0;	//error what did we just send
	5'b00101:	planned_temp <= 1'b1;
	5'b00110:	planned_temp <= 1'b0;	//error
	5'b00111:	planned_temp <= 1'b0;

	5'b01000:	planned_temp <= 1'b0;	//error
	5'b01001:	planned_temp <= 1'b1;
	5'b01010:	planned_temp <= 1'b0;	//This actually cannot happen
	5'b01011:	planned_temp <= 1'b1;
	5'b01100:	planned_temp <= 1'b0;	//What did we just send?
	5'b01101:	planned_temp <= 1'b1;
	5'b01110:	planned_temp <= 1'b0;	//error
	5'b01111:	planned_temp <= 1'b0;	//The default route is
						//currently planned but
						//is ending this cycle
						//and nobody else wants to go
						//This is a delayed zero length
						//message on the through route
	5'b10000:	planned_temp <= 1'b1;
	5'b10001:	planned_temp <= 1'b1;
	5'b10010:	planned_temp <= 1'b1;
	5'b10011:	planned_temp <= 1'b1;
	5'b10100:	planned_temp <= 1'b1;
	5'b10101:	planned_temp <= 1'b1;
	5'b10110:	planned_temp <= 1'b1;
	5'b10111:	planned_temp <= 1'b1;
	5'b11000:	planned_temp <= 1'b1;
	5'b11001:	planned_temp <= 1'b1;
	5'b11010:	planned_temp <= 1'b1;
	5'b11011:	planned_temp <= 1'b1;
	5'b11100:	planned_temp <= 1'b1;
	5'b11101:	planned_temp <= 1'b1;
//	5'b11110:	planned_temp <= 1'b0;	//This is wrong becasue if
						//there is a default
						//route zero length message
						//that is being sent and
						//somebody else wants to send
						//on the next cycle
	5'b11110:	planned_temp <= route_req_all_but_default;
	5'b11111:	planned_temp <= 1'b1;
	default:	planned_temp <= 1'b0;
	endcase
end

//take care of syncrhonous stuff
always @(posedge clk)
begin
	if(reset)
	begin
		current_route_f <= 3'd0;
		planned_f <= 1'd0;
	end
	else
	begin
		current_route_f <= current_route_temp;
		planned_f <= planned_temp;
	end
end

endmodule
/*
Copyright (c) 2015 Princeton University
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

//Function: This is the Datapath for the dynamic output
//
//Instantiates: 
//
//State: NONE
//
//Note:
//
/*
Copyright (c) 2015 Princeton University
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

/////////////////////////////////////////////////////////////////////////////////////////////
// 63         50 49      42 41      34 33           30 29      22 21                 0   
// ------------------------------------------------------------------------------------
// |            |          |          |               |          |                    |
// |  Chip ID   |  Dest X  |  Dest Y  |  Final Route  |  Length  |    Header Payload  | 
// |            |          |          |               |          |                    |
// ------------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////////////////////











 //whether the routing is based on chipid or x y position
 //`define    ROUTING_CHIP_ID
 

 //defines for different topology, only one should be active
 //`define    NETWORK_TOPO_2D_MESH
 //`define    NETWORK_TOPO_3D_MESH
 

module dynamic_output_datapath(data_out, valid_out_temp, data_a_in, data_b_in, data_c_in, data_d_in, data_x_in, valid_a_in, valid_b_in, valid_c_in, valid_d_in, valid_x_in, current_route_in);

// begin port declarations

output [64-1:0] data_out;
output valid_out_temp;

input [64-1:0] data_a_in;
input [64-1:0] data_b_in;
input [64-1:0] data_c_in;
input [64-1:0] data_d_in;
input [64-1:0] data_x_in;
input valid_a_in;
input valid_b_in;
input valid_c_in;
input valid_d_in;
input valid_x_in;
input [2:0] current_route_in;

// end port declarations

// `define ROUTE_A 3'b000
// `define ROUTE_B 3'b001
// `define ROUTE_C 3'b010
// `define ROUTE_D 3'b011
// `define ROUTE_X 3'b100

//This is the state
//NONE HERE

//inputs to the state
//NOTHING HERE EITHER

//wires

//wire regs

//assigns

//instantiations
one_of_five #(64) data_mux(.in0(data_a_in), .in1(data_b_in), .in2(data_c_in), .in3(data_d_in), .in4(data_x_in), .sel(current_route_in), .out(data_out));
one_of_five #(1) valid_mux(.in0(valid_a_in), .in1(valid_b_in), .in2(valid_c_in), .in3(valid_d_in), .in4(valid_x_in), .sel(current_route_in), .out(valid_out_temp));

endmodule
/*
Copyright (c) 2015 Princeton University
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

//Function: The top level module that glues together the datapath and
//the control for a dynamic_output port
//
//Instantiates: dynamic_output_control dynamic_output_datapath space_avail
//
//State: NONE
//
//Note:
//
/*
Copyright (c) 2015 Princeton University
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

/////////////////////////////////////////////////////////////////////////////////////////////
// 63         50 49      42 41      34 33           30 29      22 21                 0   
// ------------------------------------------------------------------------------------
// |            |          |          |               |          |                    |
// |  Chip ID   |  Dest X  |  Dest Y  |  Final Route  |  Length  |    Header Payload  | 
// |            |          |          |               |          |                    |
// ------------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////////////////////











 //whether the routing is based on chipid or x y position
 //`define    ROUTING_CHIP_ID
 

 //defines for different topology, only one should be active
 //`define    NETWORK_TOPO_2D_MESH
 //`define    NETWORK_TOPO_3D_MESH
 

module dynamic_output_top(data_out, thanks_a_out, thanks_b_out, thanks_c_out, thanks_d_out, thanks_x_out, valid_out, popped_interrupt_mesg_out, popped_memory_ack_mesg_out, popped_memory_ack_mesg_out_sender, ec_wants_to_send_but_cannot, clk, reset, route_req_a_in, route_req_b_in, route_req_c_in, route_req_d_in, route_req_x_in, tail_a_in, tail_b_in, tail_c_in, tail_d_in, tail_x_in, data_a_in, data_b_in, data_c_in, data_d_in, data_x_in, valid_a_in, valid_b_in, valid_c_in, valid_d_in, valid_x_in, default_ready_in, yummy_in);

parameter KILL_HEADERS = 1'b0;

// begin port declarations
output [64-1:0] data_out;

output thanks_a_out;
output thanks_b_out;
output thanks_c_out;
output thanks_d_out;
output thanks_x_out;

output valid_out;

output popped_interrupt_mesg_out;
output popped_memory_ack_mesg_out;
output [9:0] popped_memory_ack_mesg_out_sender;

output ec_wants_to_send_but_cannot;

input clk;
input reset;

input route_req_a_in;
input route_req_b_in;
input route_req_c_in;
input route_req_d_in;
input route_req_x_in;

input tail_a_in;
input tail_b_in;
input tail_c_in;
input tail_d_in;
input tail_x_in;

input [64-1:0] data_a_in;
input [64-1:0] data_b_in;
input [64-1:0] data_c_in;
input [64-1:0] data_d_in;
input [64-1:0] data_x_in;
input valid_a_in;
input valid_b_in;
input valid_c_in;
input valid_d_in;
input valid_x_in;

input default_ready_in;
input yummy_in;

// end port declarations







//This is the state
//NOTHING HERE BUT US CHICKENS

//inputs to the state
//NOTHING HERE EITHER

//wires
wire valid_out_temp_connection;
wire [2:0] current_route_connection;
wire space_avail_connection;
wire valid_out_pre;
wire data_out_len_zero;
wire data_out_interrupt_user_bits_set;
wire data_out_memory_ack_user_bits_set;
wire [64-1:0] data_out_internal;
wire valid_out_internal;

//wire regs
reg current_route_req;

//assigns
assign valid_out_internal = valid_out_pre & ~(KILL_HEADERS & current_route_req);
assign data_out_len_zero = data_out_internal[64-14-2*8-4:64-14-2*8-3-8] == 8'd0;
assign data_out_interrupt_user_bits_set = data_out_internal[23:20] == 4'b1111;
assign data_out_memory_ack_user_bits_set = data_out_internal[23:20] == 4'b1110;
//assign popped_zero_len_mesg_out = data_out_len_zero & valid_out_pre & (KILL_HEADERS & current_route_req);
assign popped_interrupt_mesg_out = data_out_interrupt_user_bits_set & data_out_len_zero & valid_out_pre & (KILL_HEADERS & current_route_req);
assign popped_memory_ack_mesg_out = data_out_memory_ack_user_bits_set & data_out_len_zero & valid_out_pre & (KILL_HEADERS & current_route_req);
assign popped_memory_ack_mesg_out_sender = data_out_internal[19:10] & { 10 { KILL_HEADERS} };

assign data_out = data_out_internal;
assign valid_out = valid_out_internal;

//instantiations
space_avail_top space(.valid(valid_out_internal), .clk(clk), .reset(reset), .yummy(yummy_in),.spc_avail(space_avail_connection));
dynamic_output_datapath datapath(.data_out(data_out_internal), .valid_out_temp(valid_out_temp_connection), .data_a_in(data_a_in), .data_b_in(data_b_in), .data_c_in(data_c_in), .data_d_in(data_d_in), .data_x_in(data_x_in), .valid_a_in(valid_a_in), .valid_b_in(valid_b_in), .valid_c_in(valid_c_in), .valid_d_in(valid_d_in), .valid_x_in(valid_x_in), .current_route_in(current_route_connection));

dynamic_output_control control(.thanks_a(thanks_a_out), .thanks_b(thanks_b_out), .thanks_c(thanks_c_out), .thanks_d(thanks_d_out), .thanks_x(thanks_x_out), .valid_out(valid_out_pre), .current_route(current_route_connection), .ec_wants_to_send_but_cannot(ec_wants_to_send_but_cannot), .clk(clk), .reset(reset), .route_req_a_in(route_req_a_in), .route_req_b_in(route_req_b_in), .route_req_c_in(route_req_c_in), .route_req_d_in(route_req_d_in), .route_req_x_in(route_req_x_in), .tail_a_in(tail_a_in), .tail_b_in(tail_b_in), .tail_c_in(tail_c_in), .tail_d_in(tail_d_in), .tail_x_in(tail_x_in), .valid_out_temp(valid_out_temp_connection), .default_ready(default_ready_in), .space_avail(space_avail_connection));
//NOTE TO READER.  I like the way that these instantiations look so if it
//really bothers you go open this in emacs and re-tabify everything
//and don't complain to me

always @ (current_route_connection or route_req_a_in or route_req_b_in or route_req_c_in or route_req_d_in or route_req_x_in)
begin
	case(current_route_connection)
	3'b000:	current_route_req <= route_req_a_in;
	3'b001:	current_route_req <= route_req_b_in;
	3'b010:	current_route_req <= route_req_c_in;
	3'b011:	current_route_req <= route_req_d_in;
	3'b100:	current_route_req <= route_req_x_in;
	default:	current_route_req <= 1'bx;
	endcase
end

endmodule
/*
Copyright (c) 2015 Princeton University
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

//Function: This maintains the control of where different signals want to go
//and counters of how many words are left in messages
//
//State:
//header_temp_f  //header_temp from the previous cycle
//count_f       //the counter of how much more we have to go
//tail_last_f   //what the tail bit wa the last cycle
//count_zero_f  //whether the counter now is zero
//count_one_f   //whether the counter now is one
//
//Instantiates: dynamic_input_route_request_calc_para
//
//Note:
//
// /tigress/pjj/openpiton/single-file/princeton-parallel-processor/piton/verif/env/manycore/devices.xml

/*
Copyright (c) 2015 Princeton University
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

/////////////////////////////////////////////////////////////////////////////////////////////
// 63         50 49      42 41      34 33           30 29      22 21                 0   
// ------------------------------------------------------------------------------------
// |            |          |          |               |          |                    |
// |  Chip ID   |  Dest X  |  Dest Y  |  Final Route  |  Length  |    Header Payload  | 
// |            |          |          |               |          |                    |
// ------------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////////////////////











 //whether the routing is based on chipid or x y position
 //`define    ROUTING_CHIP_ID
 

 //defines for different topology, only one should be active
 //`define    NETWORK_TOPO_2D_MESH
 //`define    NETWORK_TOPO_3D_MESH
 
module dynamic_input_control_para(thanks_all_temp_out,
                             route_req_0_out, route_req_1_out, 
                             default_ready_0, default_ready_1, 
                             tail_out, clk, reset,
                             my_loc_x_in, my_loc_y_in, my_chip_id_in,
                             abs_x, abs_y, abs_chip_id, final_bits, valid_in,
                             thanks_0, thanks_1, 
                             length);

// begin port declarations

output thanks_all_temp_out;
output route_req_0_out;
output route_req_1_out;
output default_ready_0;
output default_ready_1;

output tail_out;

input clk;
input reset;

input [8-1:0] my_loc_x_in;
input [8-1:0] my_loc_y_in;
input [14-1:0] my_chip_id_in;
input [8-1:0] abs_x;
input [8-1:0] abs_y;
input [14-1:0] abs_chip_id;
input [2:0] final_bits;
input valid_in;
input thanks_0;
input thanks_1;

input [8-1:0] length;

// end port declarations

//This is the state
reg [8-1:0] count_f;
reg header_last_f;
reg thanks_all_f;
reg count_zero_f;
reg count_one_f;
reg tail_last_f;

//inputs to the state
reg [8-1:0] count_temp;
wire header_last_temp;
wire thanks_all_temp;
wire count_zero_temp;
wire count_one_temp;
wire tail_last_temp;


//wires
wire header;
wire [8-1:0] count_minus_one;
wire length_zero; //for use in calculating tail bit for
                  //zero length messages on the default route
wire tail;

//wire regs
reg header_temp;

//assigns

assign thanks_all_temp = thanks_0 | thanks_1;
assign header = valid_in & header_temp;
assign count_zero_temp = count_temp == 0;
assign count_one_temp = count_temp == 1;
assign thanks_all_temp_out = thanks_all_temp;
assign tail_out = tail;
assign count_minus_one = count_f - 1;
assign length_zero = length == 0;
assign header_last_temp = header_temp;
//nasty control logic which I really hope is correct
assign tail = (header & length_zero) | ((~thanks_all_f) & tail_last_f) | (thanks_all_f & count_one_f);
assign tail_last_temp = tail;

//instantiations

dynamic_input_route_request_calc_para tail_calc(.route_req_0(route_req_0_out),
                                           .route_req_1(route_req_1_out),

                                           .default_ready_0(default_ready_0),
                                           .default_ready_1(default_ready_1),

                                           .my_loc_x_in(my_loc_x_in),
                                           .my_loc_y_in(my_loc_y_in),
                                           .my_chip_id_in(my_chip_id_in),
                                           .abs_x(abs_x),
                                           .abs_y(abs_y),
                                           .abs_chip_id(abs_chip_id),
                                           .final_bits(final_bits),
                                           .length(length),
                                           .header_in(header));

always @ (header_last_f or thanks_all_f or count_zero_f)
begin
        case({header_last_f, count_zero_f, thanks_all_f})
        3'b000: header_temp <= 1'b0;
        3'b001: header_temp <= 1'b0;
        3'b010: header_temp <= 1'b0;
        3'b011: header_temp <= 1'b1;
        3'b100: header_temp <= 1'b1;
        //yanqiz change 0->1
        3'b101: header_temp <= 1'b0;
        3'b110: header_temp <= 1'b1;
        3'b111: header_temp <= 1'b1;
        default:
                header_temp <= 1'b1;
        endcase
end

always @ (header or thanks_all_f or count_f or count_minus_one or length)
begin
        if(header)
        begin
                count_temp <= length;
        end
        else
        begin
                if(thanks_all_f)
                begin
                        count_temp <= count_minus_one;
                end
                else
                begin
                        count_temp <= count_f;
                end
        end
end

//take care of synchronous stuff
always @ (posedge clk)
begin
        if(reset)
        begin
                count_f <= 5'd0;
                header_last_f <= 1'b1;
                thanks_all_f <= 1'b0;
                count_zero_f <= 1'b1; //I think that this must reset to 1 to work!
                count_one_f <= 1'b0;
                tail_last_f <= 1'b0;
        end
        else
        begin
                count_f <= count_temp;
                header_last_f <= header_last_temp;
                thanks_all_f <= thanks_all_temp;
                count_zero_f <= count_zero_temp;
                count_one_f <= count_one_temp;
                tail_last_f <= tail_last_temp;
        end
end
endmodule

/*
Copyright (c) 2015 Princeton University
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

//Function: This generates all of the route_request lines and the default_ready lines from
//the absolute location of the tile, the abs address of the message, and the fbits of the message
//
//State: 
//NONE
//
//Instantiates: 
//
//Note:
//

/*
Copyright (c) 2015 Princeton University
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

/////////////////////////////////////////////////////////////////////////////////////////////
// 63         50 49      42 41      34 33           30 29      22 21                 0   
// ------------------------------------------------------------------------------------
// |            |          |          |               |          |                    |
// |  Chip ID   |  Dest X  |  Dest Y  |  Final Route  |  Length  |    Header Payload  | 
// |            |          |          |               |          |                    |
// ------------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////////////////////











 //whether the routing is based on chipid or x y position
 //`define    ROUTING_CHIP_ID
 

 //defines for different topology, only one should be active
 //`define    NETWORK_TOPO_2D_MESH
 //`define    NETWORK_TOPO_3D_MESH
 
// /tigress/pjj/openpiton/single-file/princeton-parallel-processor/piton/verif/env/manycore/devices.xml

module dynamic_input_route_request_calc_para(route_req_0, route_req_1, 
                                        default_ready_0, default_ready_1, 
                                        my_loc_x_in, my_loc_y_in, my_chip_id_in, abs_x, abs_y, abs_chip_id, final_bits, length, header_in);

// begin port declarations
output route_req_0;
output route_req_1;
output default_ready_0;
output default_ready_1;

input [8-1:0] my_loc_x_in;
input [8-1:0] my_loc_y_in;
input [14-1:0] my_chip_id_in;
input [8-1:0] abs_x;
input [8-1:0] abs_y;
input [14-1:0] abs_chip_id;

input [2:0] final_bits;
input [8-1:0] length;
input header_in;

// end port declarations

wire off_chip;
wire [8*3+3-1:0]              stub;

assign off_chip = abs_chip_id != my_chip_id_in;
assign route_req_0 = header_in & (!off_chip) & (abs_x == 8'd0);
assign route_req_1 = header_in & (off_chip);

assign default_ready_0 = route_req_0;
assign default_ready_1 = route_req_1;

assign stub = {my_loc_x_in, my_loc_y_in, abs_y, final_bits};










































































































































































endmodule
   
/*
Copyright (c) 2015 Princeton University
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

//Function: This ties together a 16 space NIB with the dynamic_input_control_para logic
//
//State: 
//
//Instantiates: dynamic_input_control_para, network_input_blk_4elmt
//
//Note:
//
/*
Copyright (c) 2015 Princeton University
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

/////////////////////////////////////////////////////////////////////////////////////////////
// 63         50 49      42 41      34 33           30 29      22 21                 0   
// ------------------------------------------------------------------------------------
// |            |          |          |               |          |                    |
// |  Chip ID   |  Dest X  |  Dest Y  |  Final Route  |  Length  |    Header Payload  | 
// |            |          |          |               |          |                    |
// ------------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////////////////////











 //whether the routing is based on chipid or x y position
 //`define    ROUTING_CHIP_ID
 

 //defines for different topology, only one should be active
 //`define    NETWORK_TOPO_2D_MESH
 //`define    NETWORK_TOPO_3D_MESH
 
// /tigress/pjj/openpiton/single-file/princeton-parallel-processor/piton/verif/env/manycore/devices.xml

module dynamic_input_top_16_para(route_req_0_out, route_req_1_out, default_ready_0_out, default_ready_1_out, tail_out, yummy_out, data_out, valid_out, clk, reset, my_loc_x_in, my_loc_y_in, my_chip_id_in, valid_in, data_in,thanks_0, thanks_1);

// begin port declarations

output route_req_0_out;
output route_req_1_out;
output default_ready_0_out;
output default_ready_1_out;

output tail_out;
output yummy_out;
output [64-1:0] data_out;
output valid_out;
//yanqi fixed

input clk;
input reset;

input [8-1:0] my_loc_x_in;
input [8-1:0] my_loc_y_in;
input [14-1:0] my_chip_id_in;
input valid_in;
input [64-1:0] data_in;
input thanks_0;
input thanks_1;

// end port declarations
   
//This is the state

//inputs to the state

//wires
wire thanks_all_temp;
wire valid_out_internal;
wire [64-1:0] data_out_internal;
wire [64-1:0] data_out_internal_pre;
//wire regs

//assigns
assign valid_out = valid_out_internal;
assign data_out = data_out_internal;

//instantiations
network_input_blk_multi_out #(.LOG2_NUMBER_FIFO_ELEMENTS(4)) NIB(.clk(clk), .reset(reset), .data_in(data_in), .valid_in(valid_in), .yummy_out(yummy_out), .thanks_in(thanks_all_temp), .data_val(data_out_internal_pre), .data_val1(), .data_avail(valid_out_internal));

// need buffering for this one
// rBuffer #(`DATA_WIDTH, 1) NIB_buf(.A(data_out_internal_pre), .Z(data_out_internal));   
assign data_out_internal = data_out_internal_pre;


// Change fbits position in order to be compatible   
dynamic_input_control_para control(.thanks_all_temp_out(thanks_all_temp), .route_req_0_out(route_req_0_out), .route_req_1_out(route_req_1_out), .default_ready_0(default_ready_0_out), .default_ready_1(default_ready_1_out), .tail_out(tail_out), .clk(clk), .reset(reset), .my_loc_x_in(my_loc_x_in), .my_loc_y_in(my_loc_y_in), 
    .my_chip_id_in(my_chip_id_in), .abs_x(data_out_internal[64-14-1:64-14-8]), .abs_y(data_out_internal[64-14-8-1:64-14-2*8]), .abs_chip_id(data_out_internal[64-1:64-14]),.final_bits(data_out_internal[64-14-2*8-2:64-14-2*8-4]), .valid_in(valid_out_internal), .thanks_0(thanks_0), .thanks_1(thanks_1), .length(data_out_internal[64-14-2*8-5:64-14-2*8-4-8]));

endmodule
/*
Copyright (c) 2015 Princeton University
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

//Function: This ties together a 4 space NIB with the dynamic_input_control_para logic
//
//State:
//
//Instantiates: dynamic_input_control_para, network_input_blk_4elmt
//
//Note:
//
/*
Copyright (c) 2015 Princeton University
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

/////////////////////////////////////////////////////////////////////////////////////////////
// 63         50 49      42 41      34 33           30 29      22 21                 0   
// ------------------------------------------------------------------------------------
// |            |          |          |               |          |                    |
// |  Chip ID   |  Dest X  |  Dest Y  |  Final Route  |  Length  |    Header Payload  | 
// |            |          |          |               |          |                    |
// ------------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////////////////////











 //whether the routing is based on chipid or x y position
 //`define    ROUTING_CHIP_ID
 

 //defines for different topology, only one should be active
 //`define    NETWORK_TOPO_2D_MESH
 //`define    NETWORK_TOPO_3D_MESH
 
// /tigress/pjj/openpiton/single-file/princeton-parallel-processor/piton/verif/env/manycore/devices.xml

module dynamic_input_top_4_para(route_req_0_out, route_req_1_out, 
                           default_ready_0_out, default_ready_1_out, 
                           tail_out, yummy_out, data_out, valid_out, clk, reset,
                           my_loc_x_in, my_loc_y_in, my_chip_id_in,  valid_in, data_in,
                           thanks_0, thanks_1);

// begin port declarations

output route_req_0_out;
output route_req_1_out;
output default_ready_0_out;
output default_ready_1_out;

output tail_out;
output yummy_out;
output [64-1:0] data_out;
output valid_out;

input clk;
input reset;

input [8-1:0] my_loc_x_in;
input [8-1:0] my_loc_y_in;
input [14-1:0] my_chip_id_in;
input valid_in;
input [64-1:0] data_in;
input thanks_0;
input thanks_1;


// end port declarations

//This is the state

//inputs to the state

//wires
wire thanks_all_temp;
wire [64-1:0] data_internal;
wire valid_out_internal;

//wire regs

//assigns
assign valid_out = valid_out_internal;

//instantiations
network_input_blk_multi_out #(.LOG2_NUMBER_FIFO_ELEMENTS(2)) NIB(.clk(clk),
                                      .reset(reset),
                                      .data_in(data_in),
                                      .valid_in(valid_in),
                                      .yummy_out(yummy_out),
                                      .thanks_in(thanks_all_temp),
                                      .data_val(data_out),
                                      .data_val1(data_internal), // same as data_val, done for buffering
                                      .data_avail(valid_out_internal));

dynamic_input_control_para control(.thanks_all_temp_out(thanks_all_temp),
                              .route_req_0_out(route_req_0_out), .route_req_1_out(route_req_1_out), 
                              .default_ready_0(default_ready_0_out), .default_ready_1(default_ready_1_out), 
                              .tail_out(tail_out),
                              .clk(clk), .reset(reset),
                              .my_loc_x_in(my_loc_x_in), 
                              .my_loc_y_in(my_loc_y_in), 
                              .my_chip_id_in(my_chip_id_in),
                              .abs_x(data_internal[64-14-1:64-14-8]), 
                              .abs_y(data_internal[64-14-8-1:64-14-2*8]), 
                              .abs_chip_id(data_internal[64-1:64-14]),
                              .final_bits(data_internal[64-14-2*8-2:64-14-2*8-4]),
                              .valid_in(valid_out_internal),
                              .thanks_0(thanks_0), .thanks_1(thanks_1), 
                              .length(data_internal[64-14-2*8-5:64-14-2*8-4-8]));

endmodule
/*
Copyright (c) 2015 Princeton University
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

//Function: This maintains the control of the output mux for a dynamic network port.
//	This does the scheduling for the output.
//	It takes as input what all of the other ports want to do and outputs the control
//	for the respective crossbar mux and the validOut signal for a respective direction.
//
//Instantiates:
//
//State: current_route_f [2:0], planned_f
//
//Note:
//
/*
Copyright (c) 2015 Princeton University
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

/////////////////////////////////////////////////////////////////////////////////////////////
// 63         50 49      42 41      34 33           30 29      22 21                 0   
// ------------------------------------------------------------------------------------
// |            |          |          |               |          |                    |
// |  Chip ID   |  Dest X  |  Dest Y  |  Final Route  |  Length  |    Header Payload  | 
// |            |          |          |               |          |                    |
// ------------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////////////////////











 //whether the routing is based on chipid or x y position
 //`define    ROUTING_CHIP_ID
 

 //defines for different topology, only one should be active
 //`define    NETWORK_TOPO_2D_MESH
 //`define    NETWORK_TOPO_3D_MESH
 
// /tigress/pjj/openpiton/single-file/princeton-parallel-processor/piton/verif/env/manycore/devices.xml

module dynamic_output_control_para(thanks_0, thanks_1, 
                              valid_out, current_route, ec_wants_to_send_but_cannot, clk, reset, 
                              route_req_0_in, route_req_1_in, 
                              tail_0_in, tail_1_in, 
                              valid_out_temp, default_ready, space_avail);
// begin port declarations
output thanks_0;
output thanks_1;

output valid_out;

output [0:0] current_route;
output    ec_wants_to_send_but_cannot;

input clk;
input reset;

input route_req_0_in;
input route_req_1_in;

input tail_0_in;
input tail_1_in;

input valid_out_temp;

input default_ready;

input space_avail;

// end port declarations




//This is the state
reg [0:0]current_route_f;
reg planned_f;

//inputs to the state
wire [0:0] current_route_temp;

//wires
wire planned_or_default;
// wire route_req_all_or;
wire route_req_all_or_with_planned;
wire route_req_all_but_default;
wire valid_out_internal;

//wire regs
reg new_route_needed;
reg planned_temp;
reg [0:0] new_route;
reg tail_current_route;
/*reg route_req_planned;*/
reg route_req_0_mask;
reg route_req_1_mask;


//more wire regs for the thanks lines
reg thanks_0;
reg thanks_1;

reg    ec_wants_to_send_but_cannot;

//assigns
assign planned_or_default = planned_f | default_ready;
assign valid_out_internal = valid_out_temp & planned_or_default & space_avail;

// mbt: if valid_out_interal is a critical path, we can use some "bleeder" gates to decrease the load of the ec stuff
always @(posedge clk)
  begin
     ec_wants_to_send_but_cannot <= valid_out_temp & planned_or_default & ~space_avail;
  end

/* assign route_req_all_or = route_req_a_in | route_req_b_in | route_req_c_in | route_req_d_in | route_req_x_in; */
assign current_route_temp = (new_route_needed) ? new_route : current_route_f;
assign current_route = current_route_f;
//this is everything except the currentl planned route's request

assign route_req_all_or_with_planned = (route_req_0_in & route_req_0_mask) | (route_req_1_in & route_req_1_mask);
//calculates whether the nib that we are going to has space

assign route_req_all_but_default = (route_req_1_in);

assign valid_out = valid_out_internal;

//instantiations
//space_avail space(.valid(valid_out_internal), .clk(clk), .reset(reset), .yummy(yummy_in), .spc_avail(space_avail));
//THIS HAS BEEN MOVED to dynamic_output_top

//a mux for current_route_f's tail bit

always @ (current_route_f or tail_0_in or tail_1_in)
begin
	case(current_route_f) //synopsys parallel_case
	
	1'b0:
	begin
		tail_current_route <= tail_0_in;
	end
	1'b1:
	begin
		tail_current_route <= tail_1_in;
	end

	default:
	begin
		tail_current_route <= 1'bx; //This is probably dangerous, but I
					    //really need the speed here and
					    //I don't want the synthesizer to
					    //mess me up if I put a real value
					    //here
	end
	endcase
end

always @ (current_route_f or valid_out_internal)
begin
	case(current_route_f)
	/*
	//original
	`ROUTE_A:
	begin
		thanks_a <= valid_out_internal;
		thanks_b <= 1'b0;
		thanks_c <= 1'b0;
		thanks_d <= 1'b0;
		thanks_x <= 1'b0;
	end
	*/
	
	1'b0:
	begin
		thanks_0 <= valid_out_internal;
		thanks_1 <= 1'b0;
	end
	1'b1:
	begin
		thanks_0 <= 1'b0;
		thanks_1 <= valid_out_internal;
	end

	default:
	begin
	
		thanks_0 <= 1'bx;
		thanks_1 <= 1'bx;

	/*
	//original
		thanks_a <= 1'bx;
		thanks_b <= 1'bx;
		thanks_c <= 1'bx;
		thanks_d <= 1'bx;
		thanks_x <= 1'bx;
	*/
					//once again this is very dangerous
					//but I want to see the timing this
					//way and we sould never get here
	end
	endcase
end

//this is the rotating priority encoder
/*
always @(current_route_f or route_req_a_in or route_req_b_in or route_req_c_in or route_req_d_in or route_req_x_in)
begin
	case(current_route_f)
	`ROUTE_A:
	begin
		new_route <= (route_req_b_in)?`ROUTE_B:((route_req_c_in)?`ROUTE_C:((route_req_d_in)?`ROUTE_D:((route_req_x_in)?`ROUTE_X:`ROUTE_A)));
	end
	`ROUTE_B:
	begin
		new_route <= (route_req_c_in)?`ROUTE_C:((route_req_d_in)?`ROUTE_D:((route_req_x_in)?`ROUTE_X:((route_req_a_in)?`ROUTE_A:((route_req_b_in)?`ROUTE_B:`ROUTE_A))));
	end
	`ROUTE_C:
	begin
		new_route <= (route_req_d_in)?`ROUTE_D:((route_req_x_in)?`ROUTE_X:((route_req_a_in)?`ROUTE_A:((route_req_b_in)?`ROUTE_B:((route_req_c_in)?`ROUTE_C:`ROUTE_A))));
	end
	`ROUTE_D:
	begin
		new_route <= (route_req_c_in)?`ROUTE_C:((route_req_d_in)?`ROUTE_D:((route_req_x_in)?`ROUTE_X:((route_req_a_in)?`ROUTE_A:((route_req_b_in)?`ROUTE_B:`ROUTE_A))));
	end
	`ROUTE_X:
	begin
		new_route <= (route_req_x_in)?`ROUTE_X:((route_req_a_in)?`ROUTE_A:((route_req_b_in)?`ROUTE_B:((route_req_c_in)?`ROUTE_C:((route_req_d_in)?`ROUTE_D:`ROUTE_A))));
	end
	default:
	begin
		new_route <= `ROUTE_A;
			//this one I am not willing to chince on
	end
	endcase
end
*/
//end the rotating priority encoder

//this is the rotating priority encoder
always @(current_route_f or route_req_0_in or route_req_1_in)
begin
	case(current_route_f)
	/*
	//original
	`ROUTE_A:
	begin
		new_route <= (route_req_b_in)?`ROUTE_B:((route_req_c_in)?`ROUTE_C:((route_req_d_in)?`ROUTE_D:((route_req_x_in)?`ROUTE_X:`ROUTE_A)));
	end
	*/
	
	1'b0:
	begin
		new_route <= (route_req_1_in)?1'b1:1'b0;
	end
	1'b1:
	begin
		new_route <= (route_req_0_in)?1'b0:1'b0;
	end

	default:
	begin
		new_route <= 1'b0;
			//this one I am not willing to chince on
	end
	endcase
end
//end the rotating priority encoder

always @(current_route_f or planned_f)
begin
	if(planned_f)
	begin
		case(current_route_f)
		
		1'b0:
			begin
				route_req_0_mask <= 1'b0;
				route_req_1_mask <= 1'b1;
			end
		1'b1:
			begin
				route_req_0_mask <= 1'b1;
				route_req_1_mask <= 1'b0;
			end
		default:
			begin
				route_req_0_mask <= 1'b1;
				route_req_1_mask <= 1'b1;
			end

		/*
		original
		`ROUTE_A:	
			begin
				route_req_a_mask <= 1'b0;
				route_req_b_mask <= 1'b1;
				route_req_c_mask <= 1'b1;
				route_req_d_mask <= 1'b1;
				route_req_x_mask <= 1'b1;
			end
		default:
			begin
				route_req_a_mask <= 1'b1;
				route_req_b_mask <= 1'b1;
				route_req_c_mask <= 1'b1;
				route_req_d_mask <= 1'b1;
				route_req_x_mask <= 1'b1;
			end
		*/
		endcase
	end
	else
	begin
	
		route_req_0_mask <= 1'b1;
		route_req_1_mask <= 1'b1;

	/*
	//original
		route_req_a_mask <= 1'b1;
		route_req_b_mask <= 1'b1;
		route_req_c_mask <= 1'b1;
		route_req_d_mask <= 1'b1;
		route_req_x_mask <= 1'b1;
	*/
	end
end

//calculation of new_route_needed
always @ (planned_f or tail_current_route or valid_out_internal or default_ready)
begin
	case({default_ready, valid_out_internal, tail_current_route, planned_f}) //synopsys parallel_case
	4'b0000:	new_route_needed <= 1'b1;
	4'b0001:	new_route_needed <= 1'b0;
	4'b0010:	new_route_needed <= 1'b1;
	4'b0011:	new_route_needed <= 1'b0;
	4'b0100:	new_route_needed <= 1'b0;	//This line should probably be turned to a 1 if we are to implement "Mikes fairness" schema
	4'b0101:	new_route_needed <= 1'b0;	//This line should probably be turned to a 1 if we are to implement "Mikes fairness" schema
	4'b0110:	new_route_needed <= 1'b1;
	4'b0111:	new_route_needed <= 1'b1;

	4'b1000:	new_route_needed <= 1'b1;
	4'b1001:	new_route_needed <= 1'b0;
//	4'b1010:	new_route_needed <= 1'b0;	//this is scary CHECK THIS BEFORE CHIP SHIPS
	4'b1010:	new_route_needed <= 1'b1;	//this is the case where there is a zero length message on the default route that is not being sent this cycle therefore we should let something be locked in, but it doesn't necessarily just the default route.  Remember that the default route is the last choice in the priority encoder, but if nothing else is requesting, the default route will be planned and locked in.
    //yanqiz change from 0->1
	4'b1011:	new_route_needed <= 1'b0;
	4'b1100:	new_route_needed <= 1'b0;
	4'b1101:	new_route_needed <= 1'b0;
	4'b1110:	new_route_needed <= 1'b1;
	4'b1111:	new_route_needed <= 1'b1;
	default:	new_route_needed <= 1'b1;
			//safest choice should never occur
	endcase
end

//calculation of planned_temp
//random five input function
always @ (planned_f or tail_current_route or valid_out_internal or default_ready or route_req_all_or_with_planned or route_req_all_but_default)
begin
	case({route_req_all_or_with_planned, default_ready, valid_out_internal, tail_current_route, planned_f}) //synopsys parallel_case
	5'b00000:	planned_temp <= 1'b0;
	5'b00001:	planned_temp <= 1'b1;
	5'b00010:	planned_temp <= 1'b0;
	5'b00011:	planned_temp <= 1'b1;
	5'b00100:	planned_temp <= 1'b0;	//error what did we just send
	5'b00101:	planned_temp <= 1'b1;
	5'b00110:	planned_temp <= 1'b0;	//error
	5'b00111:	planned_temp <= 1'b0;

	5'b01000:	planned_temp <= 1'b0;	//error
	5'b01001:	planned_temp <= 1'b1;
	5'b01010:	planned_temp <= 1'b0;	//This actually cannot happen
	5'b01011:	planned_temp <= 1'b1;
	5'b01100:	planned_temp <= 1'b0;	//What did we just send?
	5'b01101:	planned_temp <= 1'b1;
	5'b01110:	planned_temp <= 1'b0;	//error
	5'b01111:	planned_temp <= 1'b0;	//The default route is
						//currently planned but
						//is ending this cycle
						//and nobody else wants to go
						//This is a delayed zero length
						//message on the through route
	5'b10000:	planned_temp <= 1'b1;
	5'b10001:	planned_temp <= 1'b1;
	5'b10010:	planned_temp <= 1'b1;
	5'b10011:	planned_temp <= 1'b1;
	5'b10100:	planned_temp <= 1'b1;
	5'b10101:	planned_temp <= 1'b1;
	5'b10110:	planned_temp <= 1'b1;
	5'b10111:	planned_temp <= 1'b1;
	5'b11000:	planned_temp <= 1'b1;
	5'b11001:	planned_temp <= 1'b1;
	5'b11010:	planned_temp <= 1'b1;
	5'b11011:	planned_temp <= 1'b1;
	5'b11100:	planned_temp <= 1'b1;
	5'b11101:	planned_temp <= 1'b1;
//	5'b11110:	planned_temp <= 1'b0;	//This is wrong becasue if
						//there is a default
						//route zero length message
						//that is being sent and
						//somebody else wants to send
						//on the next cycle
	5'b11110:	planned_temp <= route_req_all_but_default;
	5'b11111:	planned_temp <= 1'b1;
	default:	planned_temp <= 1'b0;
	endcase
end

//take care of syncrhonous stuff
always @(posedge clk)
begin
	if(reset)
	begin
		current_route_f <= 3'd0;
		planned_f <= 1'd0;
	end
	else
	begin
		current_route_f <= current_route_temp;
		planned_f <= planned_temp;
	end
end

endmodule
/*
Copyright (c) 2015 Princeton University
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

//Function: This is the Datapath for the dynamic output
//
//Instantiates: 
//
//State: NONE
//
//Note:
//
/*
Copyright (c) 2015 Princeton University
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

/////////////////////////////////////////////////////////////////////////////////////////////
// 63         50 49      42 41      34 33           30 29      22 21                 0   
// ------------------------------------------------------------------------------------
// |            |          |          |               |          |                    |
// |  Chip ID   |  Dest X  |  Dest Y  |  Final Route  |  Length  |    Header Payload  | 
// |            |          |          |               |          |                    |
// ------------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////////////////////











 //whether the routing is based on chipid or x y position
 //`define    ROUTING_CHIP_ID
 

 //defines for different topology, only one should be active
 //`define    NETWORK_TOPO_2D_MESH
 //`define    NETWORK_TOPO_3D_MESH
 
// /tigress/pjj/openpiton/single-file/princeton-parallel-processor/piton/verif/env/manycore/devices.xml

module dynamic_output_datapath_para(data_out, valid_out_temp, data_0_in, data_1_in, valid_0_in, valid_1_in, current_route_in);

// begin port declarations

output [64-1:0] data_out;
output valid_out_temp;
input [64-1:0] data_0_in;
input [64-1:0] data_1_in;
input valid_0_in;
input valid_1_in;

input [0:0] current_route_in;

// end port declarations

// `define ROUTE_A 3'b000
// `define ROUTE_B 3'b001
// `define ROUTE_C 3'b010
// `define ROUTE_D 3'b011
// `define ROUTE_X 3'b100

//This is the state
//NONE HERE

//inputs to the state
//NOTHING HERE EITHER

//wires

//wire regs

//assigns

//instantiations

one_of_n #(64) data_mux(.in0(data_0_in), .in1(data_1_in), .sel(current_route_in), .out(data_out));
one_of_n #(1) valid_mux(.in0(valid_0_in), .in1(valid_1_in), .sel(current_route_in), .out(valid_out_temp));

endmodule
/*
Copyright (c) 2015 Princeton University
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

//Function: The top level module that glues together the datapath and
//the control for a dynamic_output port
//
//Instantiates: dynamic_output_control_para dynamic_output_datapath_para space_avail
//
//State: NONE
//
//Note:
//
/*
Copyright (c) 2015 Princeton University
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

/////////////////////////////////////////////////////////////////////////////////////////////
// 63         50 49      42 41      34 33           30 29      22 21                 0   
// ------------------------------------------------------------------------------------
// |            |          |          |               |          |                    |
// |  Chip ID   |  Dest X  |  Dest Y  |  Final Route  |  Length  |    Header Payload  | 
// |            |          |          |               |          |                    |
// ------------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////////////////////











 //whether the routing is based on chipid or x y position
 //`define    ROUTING_CHIP_ID
 

 //defines for different topology, only one should be active
 //`define    NETWORK_TOPO_2D_MESH
 //`define    NETWORK_TOPO_3D_MESH
 
// /tigress/pjj/openpiton/single-file/princeton-parallel-processor/piton/verif/env/manycore/devices.xml

module dynamic_output_top_para(data_out, 
                          thanks_0_out, thanks_1_out, 
                          valid_out, popped_interrupt_mesg_out, popped_memory_ack_mesg_out, popped_memory_ack_mesg_out_sender, ec_wants_to_send_but_cannot, clk, reset, 
                          route_req_0_in, route_req_1_in, 
                          tail_0_in, tail_1_in, 
                          data_0_in, data_1_in, 
                          valid_0_in, valid_1_in, 
                          default_ready_in, yummy_in);

parameter KILL_HEADERS = 1'b0;

// begin port declarations
output [64-1:0] data_out;

output thanks_0_out;
output thanks_1_out;

output valid_out;

output popped_interrupt_mesg_out;
output popped_memory_ack_mesg_out;
output [9:0] popped_memory_ack_mesg_out_sender;

output ec_wants_to_send_but_cannot;

input clk;
input reset;

input route_req_0_in;
input route_req_1_in;

input tail_0_in;
input tail_1_in;

input [64-1:0] data_0_in;
input [64-1:0] data_1_in;
input valid_0_in;
input valid_1_in;

input default_ready_in;
input yummy_in;

// end port declarations



//This is the state
//NOTHING HERE BUT US CHICKENS

//inputs to the state
//NOTHING HERE EITHER

//wires
wire valid_out_temp_connection;
wire [0:0] current_route_connection;
wire space_avail_connection;
wire valid_out_pre;
wire data_out_len_zero;
wire data_out_interrupt_user_bits_set;
wire data_out_memory_ack_user_bits_set;
wire [64-1:0] data_out_internal;
wire valid_out_internal;

//wire regs
reg current_route_req;

//assigns
assign valid_out_internal = valid_out_pre & ~(KILL_HEADERS & current_route_req);
assign data_out_len_zero = data_out_internal[64-14-2*8-4:64-14-2*8-3-8] == 8'd0;
assign data_out_interrupt_user_bits_set = data_out_internal[23:20] == 4'b1111;
assign data_out_memory_ack_user_bits_set = data_out_internal[23:20] == 4'b1110;
//assign popped_zero_len_mesg_out = data_out_len_zero & valid_out_pre & (KILL_HEADERS & current_route_req);
assign popped_interrupt_mesg_out = data_out_interrupt_user_bits_set & data_out_len_zero & valid_out_pre & (KILL_HEADERS & current_route_req);
assign popped_memory_ack_mesg_out = data_out_memory_ack_user_bits_set & data_out_len_zero & valid_out_pre & (KILL_HEADERS & current_route_req);
assign popped_memory_ack_mesg_out_sender = data_out_internal[19:10] & { 10 { KILL_HEADERS} };

assign data_out = data_out_internal;
assign valid_out = valid_out_internal;

//instantiations
space_avail_top space(.valid(valid_out_internal), .clk(clk), .reset(reset), .yummy(yummy_in),.spc_avail(space_avail_connection));

dynamic_output_datapath_para datapath(.data_out(data_out_internal), .valid_out_temp(valid_out_temp_connection), .data_0_in(data_0_in), .data_1_in(data_1_in), .valid_0_in(valid_0_in), .valid_1_in(valid_1_in), .current_route_in(current_route_connection));


dynamic_output_control_para control(.thanks_0(thanks_0_out), .thanks_1(thanks_1_out), 
                               .valid_out(valid_out_pre), .current_route(current_route_connection), .ec_wants_to_send_but_cannot(ec_wants_to_send_but_cannot), .clk(clk), .reset(reset), 
                               .route_req_0_in(route_req_0_in), .route_req_1_in(route_req_1_in), 
                               .tail_0_in(tail_0_in), .tail_1_in(tail_1_in), 
                               .valid_out_temp(valid_out_temp_connection), .default_ready(default_ready_in), .space_avail(space_avail_connection));
//NOTE TO READER.  I like the way that these instantiations look so if it
//really bothers you go open this in emacs and re-tabify everything
//and don't complain to me
always @ (current_route_connection or route_req_0_in or route_req_1_in)
begin
	case(current_route_connection)
    
	1'b0:    current_route_req <= route_req_0_in;
	1'b1:    current_route_req <= route_req_1_in;

    /*
    //original
	`ROUTE_A:	current_route_req <= route_req_a_in;
	`ROUTE_B:	current_route_req <= route_req_b_in;
	`ROUTE_C:	current_route_req <= route_req_c_in;
	`ROUTE_D:	current_route_req <= route_req_d_in;
	`ROUTE_X:	current_route_req <= route_req_x_in;
    */
	default:	current_route_req <= 1'bx;
	endcase
end

endmodule
/*
Copyright (c) 2015 Princeton University
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

module bus_compare_equal (a, b, bus_equal);
    parameter WIDTH = 8;
    parameter BHC = 10;

    input [WIDTH-1:0] a, b;
    output wire bus_equal;

    assign bus_equal = (a==b) ? 1'b1 : 1'b0;
endmodule
/*
Copyright (c) 2015 Princeton University
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

module flip_bus (in, out);
    parameter WIDTH = 8;
    parameter BHC = 10;

    input [WIDTH-1:0] in;
    output wire [WIDTH-1:0] out;
    
    assign out = ~in;
endmodule
/*
Copyright (c) 2015 Princeton University
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

module one_of_eight(in0,in1,in2,in3,in4,in5,in6,in7,sel,out);
    parameter WIDTH = 8;
    parameter BHC = 10;
    input [2:0] sel;
    input [WIDTH-1:0] in0,in1,in2,in3,in4,in5,in6,in7;
    output reg [WIDTH-1:0] out;
    always@ (*)
    begin
        case(sel)
            3'd0:out=in0;
            3'd1:out=in1;
            3'd2:out=in2;
            3'd3:out=in3;
            3'd4:out=in4;
            3'd5:out=in5;
            3'd6:out=in6;
            3'd7:out=in7;
            default:; // indicates null
        endcase
    end
endmodule


/*
Copyright (c) 2015 Princeton University
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

module one_of_five(in0,in1,in2,in3,in4,sel,out);
    parameter WIDTH = 8;
    parameter BHC = 10;
    input [2:0] sel;
    input [WIDTH-1:0] in0,in1,in2,in3,in4;
    output reg [WIDTH-1:0] out;
    always@(*)
    begin
        case(sel)
            3'd0:out=in0;
            3'd1:out=in1;
            3'd2:out=in2;
            3'd3:out=in3;
            3'd4:out=in4;
            default:; // indicates null
        endcase
    end
endmodule


/*
Copyright (c) 2015 Princeton University
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
// /tigress/pjj/openpiton/single-file/princeton-parallel-processor/piton/verif/env/manycore/devices.xml

module one_of_n(
  
  in0,
  in1,

  sel,
  out);
    parameter WIDTH = 8;
    parameter BHC = 10;
    input [0:0] sel;
    input [WIDTH-1:0] in0,in1;

    output reg [WIDTH-1:0] out;
    always@(*)
    begin
        case(sel)
        
            1'd0:out=in0;
            1'd1:out=in1;

            default:; // indicates null
        endcase
    end
endmodule


/*
Copyright (c) 2015 Princeton University
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
// /tigress/pjj/openpiton/single-file/princeton-parallel-processor/piton/verif/env/manycore/devices.xml

module one_of_n_plus_3(
  
  in0,
  in1,
  in2,
  in3,
  in4,

  sel,
  out);
    parameter WIDTH = 8;
    parameter BHC = 10;
    input [2:0] sel;
    
    input [WIDTH-1:0] in0,in1,in2,in3,in4;
    output reg [WIDTH-1:0] out;
    always@(*)
    begin
        case(sel)
        
            3'd0:out=in0;
            3'd1:out=in1;
            3'd2:out=in2;
            3'd3:out=in3;
            3'd4:out=in4;

            default:; // indicates null
        endcase
    end
endmodule


/*
Copyright (c) 2015 Princeton University
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

// Just a simple D Flip Flip without a reset

module net_dff #(parameter WIDTH=8, parameter BHC=10) 
    (input wire [WIDTH-1:0] d, 
    output reg [WIDTH-1:0] q,
    input wire clk);

always @ (posedge clk)
begin
    q <= d;
end

endmodule
/*
Copyright (c) 2015 Princeton University
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

//File: network_input_blk_multi_out.v

/*
Copyright (c) 2015 Princeton University
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

/////////////////////////////////////////////////////////////////////////////////////////////
// 63         50 49      42 41      34 33           30 29      22 21                 0   
// ------------------------------------------------------------------------------------
// |            |          |          |               |          |                    |
// |  Chip ID   |  Dest X  |  Dest Y  |  Final Route  |  Length  |    Header Payload  | 
// |            |          |          |               |          |                    |
// ------------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////////////////////











 //whether the routing is based on chipid or x y position
 //`define    ROUTING_CHIP_ID
 

 //defines for different topology, only one should be active
 //`define    NETWORK_TOPO_2D_MESH
 //`define    NETWORK_TOPO_3D_MESH
 
module network_input_blk_multi_out 
   #(parameter LOG2_NUMBER_FIFO_ELEMENTS = 2)
(
   input wire clk, 
   input wire reset,
   input wire [64-1:0] data_in, 
   input wire valid_in, 
   input wire thanks_in,

   output wire yummy_out, 
   // data_val and data_val1 are the same, this is just done for buffering to
   // convince the synthesis tool to buffer up these high fanout nets
   output wire [64-1:0] data_val, 
   output wire [64-1:0] data_val1, 
   output wire data_avail 
);

reg [64-1:0] storage_data_f [0:(1<<LOG2_NUMBER_FIFO_ELEMENTS)-1];

reg [LOG2_NUMBER_FIFO_ELEMENTS-1:0] head_ptr_f;
reg [LOG2_NUMBER_FIFO_ELEMENTS-1:0] tail_ptr_f;
reg [LOG2_NUMBER_FIFO_ELEMENTS:0] elements_in_array_f;

reg [LOG2_NUMBER_FIFO_ELEMENTS-1:0] head_ptr_next;
reg [LOG2_NUMBER_FIFO_ELEMENTS-1:0] tail_ptr_next;
reg [LOG2_NUMBER_FIFO_ELEMENTS:0] elements_in_array_next;

reg yummy_out_f;

assign yummy_out = yummy_out_f;

// data_val and data_val1 are the same, just done for buffering
assign data_val = storage_data_f[head_ptr_f];
assign data_val1 = storage_data_f[head_ptr_f];
assign data_avail = elements_in_array_f != 0;

always @ *
begin
   head_ptr_next = head_ptr_f;
   tail_ptr_next = tail_ptr_f;
   elements_in_array_next = elements_in_array_f;
   case({valid_in,thanks_in})
      2'b00:
         begin
            // do nothing here
         end
      2'b01:
         begin
            // we are being dequeued from
            head_ptr_next = head_ptr_f + 1;
            elements_in_array_next = elements_in_array_f - 1;
         end
      2'b10:
         begin
            // we are being enqueued into
            tail_ptr_next = tail_ptr_f + 1;
            elements_in_array_next = elements_in_array_f + 1;
         end
      2'b11:
         begin
            // simultaneous enqueue and dequeue
            head_ptr_next = head_ptr_f + 1;
            tail_ptr_next = tail_ptr_f + 1;
         end
      default:
         begin
            // this is an error because this is a full parallel case statement
         end
   endcase
end

always @ (posedge clk)
begin
   if (reset)
   begin
      yummy_out_f <= 0;
      head_ptr_f <= 0;
      tail_ptr_f <= 0;
      elements_in_array_f <= 0;
   end
   else
   begin
      yummy_out_f <= thanks_in; // this is just a feed through via a flip flop
      head_ptr_f <= head_ptr_next;
      tail_ptr_f <= tail_ptr_next;
      elements_in_array_f <= elements_in_array_next;
      if(valid_in)
      begin
         storage_data_f[tail_ptr_f] <= data_in;
      end
   end
end

endmodule
/*
Copyright (c) 2015 Princeton University
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

//Function: This module keeps track of how many spots are free in the NIB that
//	we are sending to
//
//State: count_f, yummy_f, valid_f
//
//Instantiates: 

module space_avail_top (valid,
		    yummy,
		    spc_avail,
		    clk,
		    reset);

parameter BUFFER_SIZE = 4;
parameter BUFFER_BITS = 3;
   
 
input valid;			// sending data to the output
input yummy;			// output consumed data

output spc_avail;		// is there space available?

input clk;
input reset;

//This is the state
reg yummy_f;
reg valid_f;
reg [BUFFER_BITS-1:0] count_f;

reg is_one_f;
reg is_two_or_more_f;

//wires
wire [BUFFER_BITS-1:0] count_plus_1;
wire [BUFFER_BITS-1:0] count_minus_1;
wire up;
wire down;

//wire regs
reg [BUFFER_BITS-1:0] count_temp;


//assigns
assign count_plus_1 = count_f + 1'b1;
assign count_minus_1 = count_f - 1'b1;
assign spc_avail = (is_two_or_more_f | yummy_f | (is_one_f & ~valid_f));
assign up = yummy_f & ~valid_f;
assign down = ~yummy_f & valid_f;

always @ (count_f or count_plus_1 or count_minus_1 or up or down)
begin
	case (count_f)
	0:
		begin
			if(up)
			begin
				count_temp <= count_plus_1;
			end
			else
			begin
				count_temp <= count_f;
			end
		end
	BUFFER_SIZE:
		begin
			if(down)
			begin
				count_temp <= count_minus_1;
			end
			else
			begin
				count_temp <= count_f;
			end
		end
	default:
		begin
			case ({up, down})
				2'b10:	count_temp <= count_plus_1;
				2'b01:	count_temp <= count_minus_1;
				default:	count_temp <= count_f;
			endcase
		end
	endcase
end

wire top_bits_zero_temp = ~| count_temp[BUFFER_BITS-1:1];


always @ (posedge clk)
begin
	if(reset)
	begin
	   count_f <= BUFFER_SIZE;
	   yummy_f <= 1'b0;
	   valid_f <= 1'b0;
	   is_one_f <= (BUFFER_SIZE == 1);
	   is_two_or_more_f <= (BUFFER_SIZE >= 2);
	end
	else
	begin
	   count_f <= count_temp;
	   yummy_f <= yummy;
	   valid_f <= valid;
	   is_one_f         <= top_bits_zero_temp & count_temp[0];
   	   is_two_or_more_f <= ~top_bits_zero_temp;
	end
end

endmodule
      
/*
Copyright (c) 2015 Princeton University
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

//File: dynamic_node_top_wrap.v
////Creator: Michael McKeown
////Created: Sept. 21, 2014
////
////Function: This wraps the dynamic_node top and ties off signals
//            we will not be using at the tile level
////
////State: 
////
////Instantiates: dynamic_node_top
////
////

// Copyright (c) 2015 Princeton University
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

//==================================================================================================
//  Filename      : define.h
//  Created On    : 2014-02-20
//  Last Modified : 2018-11-16 17:14:11
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : main header file defining global architecture parameters
//
//
//==================================================================================================



































































































































































































































































































































































































































































































































































































module dynamic_node_top_wrap
(
    input clk,
    input reset_in,
       
    input [64-1:0] dataIn_N,   // data inputs from neighboring tiles
    input [64-1:0] dataIn_E,
    input [64-1:0] dataIn_S,
    input [64-1:0] dataIn_W,
     input [64-1:0] dataIn_P,   // data input from processor
       
    input validIn_N,        // valid signals from neighboring tiles
    input validIn_E,
    input validIn_S,
    input validIn_W,
    input validIn_P,        // valid signal from processor
       
    input yummyIn_N,        // neighbor consumed output data
    input yummyIn_E,
    input yummyIn_S,
    input yummyIn_W,
    input yummyIn_P,        // processor consumed output data
       
    input [8-1:0] myLocX,       // this tile's position
    input [8-1:0] myLocY,
    input [14-1:0] myChipID,

    output [64-1:0] dataOut_N, // data outputs to neighbors
    output [64-1:0] dataOut_E,
    output [64-1:0] dataOut_S,
     output [64-1:0] dataOut_W,
     output [64-1:0] dataOut_P, // data output to processor
    
    output validOut_N,      // valid outputs to neighbors
    output validOut_E,
    output validOut_S,
    output validOut_W,
    output validOut_P,      // valid output to processor
       
    output yummyOut_N,      // yummy signal to neighbors' output buffers
    output yummyOut_E,
    output yummyOut_S,
    output yummyOut_W,
    output yummyOut_P,      // yummy signal to processor's output buffer
    
    
    output thanksIn_P      // thanksIn to processor's space_avail
);

    dynamic_node_top dynamic_node_top
    (
        .clk(clk),
        .reset_in(reset_in),
        .dataIn_N(dataIn_N),
        .dataIn_E(dataIn_E),
        .dataIn_S(dataIn_S),
        .dataIn_W(dataIn_W),
        .dataIn_P(dataIn_P),
        .validIn_N(validIn_N),
        .validIn_E(validIn_E),
        .validIn_S(validIn_S),
        .validIn_W(validIn_W),
        .validIn_P(validIn_P),
        .yummyIn_N(yummyIn_N),
        .yummyIn_E(yummyIn_E),
        .yummyIn_S(yummyIn_S),
        .yummyIn_W(yummyIn_W),
        .yummyIn_P(yummyIn_P),
        .myLocX(myLocX),
        .myLocY(myLocY),
        .myChipID(myChipID),
        .ec_cfg(15'b0),
        .store_meter_partner_address_X(5'b0),
        .store_meter_partner_address_Y(5'b0),
        .dataOut_N(dataOut_N),
        .dataOut_E(dataOut_E),
        .dataOut_S(dataOut_S),
        .dataOut_W(dataOut_W),
        .dataOut_P(dataOut_P),
        .validOut_N(validOut_N),
        .validOut_E(validOut_E),
        .validOut_S(validOut_S),
        .validOut_W(validOut_W),
        .validOut_P(validOut_P),
        .yummyOut_N(yummyOut_N),
        .yummyOut_E(yummyOut_E),
        .yummyOut_W(yummyOut_W),
        .yummyOut_S(yummyOut_S),
        .yummyOut_P(yummyOut_P),
        .thanksIn_P(thanksIn_P),
        .external_interrupt(),
        .store_meter_ack_partner(),
        .store_meter_ack_non_partner(),
        .ec_out()
    ); 

endmodule
/*
Copyright (c) 2015 Princeton University
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

//Function: This wires everything together to make a crossbar
//

// Copyright (c) 2015 Princeton University
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

//==================================================================================================
//  Filename      : define.h
//  Created On    : 2014-02-20
//  Last Modified : 2018-11-16 17:14:11
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : main header file defining global architecture parameters
//
//
//==================================================================================================



































































































































































































































































































































































































































































































































































































module dynamic_node_top(clk,
		    reset_in,
		    dataIn_N,
		    dataIn_E,
		    dataIn_S,
		    dataIn_W,
		    dataIn_P,
		    validIn_N,
		    validIn_E,
		    validIn_S,
		    validIn_W,
		    validIn_P,
		    yummyIn_N,
		    yummyIn_E,
		    yummyIn_S,
		    yummyIn_W,
		    yummyIn_P,
		    myLocX,
		    myLocY,
            myChipID,
		    store_meter_partner_address_X,
		    store_meter_partner_address_Y,
		    ec_cfg,
		    dataOut_N,
		    dataOut_E,
		    dataOut_S,
		    dataOut_W,
		    dataOut_P,
		    validOut_N,
		    validOut_E,
		    validOut_S,
		    validOut_W,
		    validOut_P,
		    yummyOut_N,
		    yummyOut_E,
		    yummyOut_S,
		    yummyOut_W,
		    yummyOut_P,
		    thanksIn_P,
		    external_interrupt,
		    store_meter_ack_partner,
		    store_meter_ack_non_partner,
		    ec_out);

// begin port declarations

input clk;
input reset_in;
   
input [64-1:0] dataIn_N;	// data inputs from neighboring tiles
input [64-1:0] dataIn_E;
input [64-1:0] dataIn_S;
input [64-1:0] dataIn_W;
input [64-1:0] dataIn_P;	// data input from processor
   
input validIn_N;		// valid signals from neighboring tiles
input validIn_E;
input validIn_S;
input validIn_W;
input validIn_P;		// valid signal from processor
   
input yummyIn_N;		// neighbor consumed output data
input yummyIn_E;
input yummyIn_S;
input yummyIn_W;
input yummyIn_P;		// processor consumed output data
   
input [8-1:0] myLocX;		// this tile's position
input [8-1:0] myLocY;
input [14-1:0] myChipID;

input [4:0] store_meter_partner_address_X;
input [4:0] store_meter_partner_address_Y;

input [14:0] ec_cfg;            // NESWP 3 bits each selecter of event to monitor


output [64-1:0] dataOut_N;	// data outputs to neighbors
output [64-1:0] dataOut_E;
output [64-1:0] dataOut_S;
output [64-1:0] dataOut_W;
output [64-1:0] dataOut_P;	// data output to processor

output validOut_N;		// valid outputs to neighbors
output validOut_E;
output validOut_S;
output validOut_W;
output validOut_P;		// valid output to processor
   
output yummyOut_N;		// yummy signal to neighbors' output buffers
output yummyOut_E;
output yummyOut_S;
output yummyOut_W;
output yummyOut_P;		// yummy signal to processor's output buffer

output thanksIn_P;		// thanksIn to processor's space_avail

output external_interrupt;	//is used for the proc to know
				//that an external interrupt occured
output store_meter_ack_partner;      // strobes high when a memory ack word is popped off of the network
                                     // and the sender ID matches the "partner port" id from the STORE_METER
output store_meter_ack_non_partner;  // strobes high when a memory ack word is popped off of the network
                                     // and the sender ID does not match the "partner port" id from the STORE_METER


output [4:0] ec_out;


wire   ec_wants_to_send_but_cannot_N,
       ec_wants_to_send_but_cannot_E,
       ec_wants_to_send_but_cannot_S,
       ec_wants_to_send_but_cannot_W,
       ec_wants_to_send_but_cannot_P;

// end port declarations

   wire store_ack_received;
   wire store_ack_received_r;
   wire [9:0] store_ack_addr;
   wire [9:0] store_ack_addr_r;

//wires

wire north_input_tail;
wire east_input_tail;
wire south_input_tail;
wire west_input_tail;
wire proc_input_tail;

wire [64-1:0] north_input_data;
wire [64-1:0] east_input_data;
wire [64-1:0] south_input_data;
wire [64-1:0] west_input_data;
wire [64-1:0] proc_input_data;

wire north_input_valid;
wire east_input_valid;
wire south_input_valid;
wire west_input_valid;
wire proc_input_valid;

wire thanks_n_to_n;
wire thanks_n_to_e;
wire thanks_n_to_s;
wire thanks_n_to_w;
wire thanks_n_to_p;

wire thanks_e_to_n;
wire thanks_e_to_e;
wire thanks_e_to_s;
wire thanks_e_to_w;
wire thanks_e_to_p;

wire thanks_s_to_n;
wire thanks_s_to_e;
wire thanks_s_to_s;
wire thanks_s_to_w;
wire thanks_s_to_p;

wire thanks_w_to_n;
wire thanks_w_to_e;
wire thanks_w_to_s;
wire thanks_w_to_w;
wire thanks_w_to_p;

wire thanks_p_to_n;
wire thanks_p_to_e;
wire thanks_p_to_s;
wire thanks_p_to_w;
wire thanks_p_to_p;

wire route_req_n_to_n;
wire route_req_n_to_e;
wire route_req_n_to_s;
wire route_req_n_to_w;
wire route_req_n_to_p;

wire route_req_e_to_n;
wire route_req_e_to_e;
wire route_req_e_to_s;
wire route_req_e_to_w;
wire route_req_e_to_p;

wire route_req_s_to_n;
wire route_req_s_to_e;
wire route_req_s_to_s;
wire route_req_s_to_w;
wire route_req_s_to_p;

wire route_req_w_to_n;
wire route_req_w_to_e;
wire route_req_w_to_s;
wire route_req_w_to_w;
wire route_req_w_to_p;

wire route_req_p_to_n;
wire route_req_p_to_e;
wire route_req_p_to_s;
wire route_req_p_to_w;
wire route_req_p_to_p;

wire default_ready_n_to_s;
wire default_ready_e_to_w;
wire default_ready_s_to_n;
wire default_ready_s_to_p;
wire default_ready_w_to_e;

// input/output buffered signals
wire yummyOut_N_internal;
wire yummyOut_E_internal;
wire yummyOut_S_internal;
wire yummyOut_W_internal;
wire yummyOut_P_internal;

wire validOut_N_internal;
wire validOut_E_internal;
wire validOut_S_internal;
wire validOut_W_internal;
wire validOut_P_internal;

wire [64-1:0] dataOut_N_internal;
wire [64-1:0] dataOut_E_internal;
wire [64-1:0] dataOut_S_internal;
wire [64-1:0] dataOut_W_internal;
wire [64-1:0] dataOut_P_internal;

wire yummyOut_N_flip1_out;
wire yummyOut_E_flip1_out;
wire yummyOut_S_flip1_out;
wire yummyOut_W_flip1_out;
//wire yummyOut_P_flip1_out;

wire validOut_N_flip1_out;
wire validOut_E_flip1_out;
wire validOut_S_flip1_out;
wire validOut_W_flip1_out;
//wire validOut_P_flip1_out;

wire [64-1:0] dataOut_N_flip1_out;
wire [64-1:0] dataOut_E_flip1_out;
wire [64-1:0] dataOut_S_flip1_out;
wire [64-1:0] dataOut_W_flip1_out;
//wire [`DATA_WIDTH-1:0] dataOut_P_flip1_out;

wire yummyIn_N_internal;
wire yummyIn_E_internal;
wire yummyIn_S_internal;
wire yummyIn_W_internal;
wire yummyIn_P_internal;

wire validIn_N_internal;
wire validIn_E_internal;
wire validIn_S_internal;
wire validIn_W_internal;
//wire validIn_P_internal;

wire [64-1:0] dataIn_N_internal;
wire [64-1:0] dataIn_E_internal;
wire [64-1:0] dataIn_S_internal;
wire [64-1:0] dataIn_W_internal;
//wire [`DATA_WIDTH-1:0] dataIn_P_internal;

wire yummyIn_N_flip1_out;
wire yummyIn_E_flip1_out;
wire yummyIn_S_flip1_out;
wire yummyIn_W_flip1_out;
//wire yummyIn_P_flip1_out;

wire validIn_N_flip1_out;
wire validIn_E_flip1_out;
wire validIn_S_flip1_out;
wire validIn_W_flip1_out;
//wire validIn_P_flip1_out;

wire [64-1:0] dataIn_N_flip1_out;
wire [64-1:0] dataIn_E_flip1_out;
wire [64-1:0] dataIn_S_flip1_out;
wire [64-1:0] dataIn_W_flip1_out;
//wire [`DATA_WIDTH-1:0] dataIn_P_flip1_out;

//state
reg [8-1:0] myLocX_f;
reg [8-1:0] myLocY_f;
reg [14-1:0] myChipID_f;
wire   reset;


// event counter logic
//
//

reg ec_thanks_n_to_n_reg, ec_thanks_n_to_e_reg, ec_thanks_n_to_s_reg, ec_thanks_n_to_w_reg, ec_thanks_n_to_p_reg;
reg ec_thanks_e_to_n_reg, ec_thanks_e_to_e_reg, ec_thanks_e_to_s_reg, ec_thanks_e_to_w_reg, ec_thanks_e_to_p_reg;
reg ec_thanks_s_to_n_reg, ec_thanks_s_to_e_reg, ec_thanks_s_to_s_reg, ec_thanks_s_to_w_reg, ec_thanks_s_to_p_reg;
reg ec_thanks_w_to_n_reg, ec_thanks_w_to_e_reg, ec_thanks_w_to_s_reg, ec_thanks_w_to_w_reg, ec_thanks_w_to_p_reg;
reg ec_thanks_p_to_n_reg, ec_thanks_p_to_e_reg, ec_thanks_p_to_s_reg, ec_thanks_p_to_w_reg, ec_thanks_p_to_p_reg;
reg ec_wants_to_send_but_cannot_N_reg, ec_wants_to_send_but_cannot_E_reg, ec_wants_to_send_but_cannot_S_reg, ec_wants_to_send_but_cannot_W_reg, ec_wants_to_send_but_cannot_P_reg;
reg ec_north_input_valid_reg, ec_east_input_valid_reg, ec_south_input_valid_reg, ec_west_input_valid_reg, ec_proc_input_valid_reg;


// let's register these babies before they do any damage to the cycle time -- mbt
always @(posedge clk)
  begin
     ec_thanks_n_to_n_reg <= thanks_n_to_n; ec_thanks_n_to_e_reg <= thanks_n_to_e; ec_thanks_n_to_s_reg <= thanks_n_to_s; ec_thanks_n_to_w_reg <= thanks_n_to_w; ec_thanks_n_to_p_reg <= thanks_n_to_p;
     ec_thanks_e_to_n_reg <= thanks_e_to_n; ec_thanks_e_to_e_reg <= thanks_e_to_e; ec_thanks_e_to_s_reg <= thanks_e_to_s; ec_thanks_e_to_w_reg <= thanks_e_to_w; ec_thanks_e_to_p_reg <= thanks_e_to_p;
     ec_thanks_s_to_n_reg <= thanks_s_to_n; ec_thanks_s_to_e_reg <= thanks_s_to_e; ec_thanks_s_to_s_reg <= thanks_s_to_s; ec_thanks_s_to_w_reg <= thanks_s_to_w; ec_thanks_s_to_p_reg <= thanks_s_to_p;
     ec_thanks_w_to_n_reg <= thanks_w_to_n; ec_thanks_w_to_e_reg <= thanks_w_to_e; ec_thanks_w_to_s_reg <= thanks_w_to_s; ec_thanks_w_to_w_reg <= thanks_w_to_w; ec_thanks_w_to_p_reg <= thanks_w_to_p;
     ec_thanks_p_to_n_reg <= thanks_p_to_n; ec_thanks_p_to_e_reg <= thanks_p_to_e; ec_thanks_p_to_s_reg <= thanks_p_to_s; ec_thanks_p_to_w_reg <= thanks_p_to_w; ec_thanks_p_to_p_reg <= thanks_p_to_p;
     ec_wants_to_send_but_cannot_N_reg <= ec_wants_to_send_but_cannot_N;
     ec_wants_to_send_but_cannot_E_reg <= ec_wants_to_send_but_cannot_E;
     ec_wants_to_send_but_cannot_S_reg <= ec_wants_to_send_but_cannot_S;
     ec_wants_to_send_but_cannot_W_reg <= ec_wants_to_send_but_cannot_W;
     ec_wants_to_send_but_cannot_P_reg <= ec_wants_to_send_but_cannot_P;
     ec_north_input_valid_reg <= north_input_valid;
     ec_east_input_valid_reg  <= east_input_valid;
     ec_south_input_valid_reg <= south_input_valid;
     ec_west_input_valid_reg  <= west_input_valid;
     ec_proc_input_valid_reg  <= proc_input_valid;
  end

   wire ec_thanks_to_n = ec_thanks_n_to_n_reg | ec_thanks_e_to_n_reg | ec_thanks_s_to_n_reg | ec_thanks_w_to_n_reg | ec_thanks_p_to_n_reg;
   wire ec_thanks_to_e = ec_thanks_n_to_e_reg | ec_thanks_e_to_e_reg | ec_thanks_s_to_e_reg | ec_thanks_w_to_e_reg | ec_thanks_p_to_e_reg;
   wire ec_thanks_to_s = ec_thanks_n_to_s_reg | ec_thanks_e_to_s_reg | ec_thanks_s_to_s_reg | ec_thanks_w_to_s_reg | ec_thanks_p_to_s_reg;
   wire ec_thanks_to_w = ec_thanks_n_to_w_reg | ec_thanks_e_to_w_reg | ec_thanks_s_to_w_reg | ec_thanks_w_to_w_reg | ec_thanks_p_to_w_reg;
   wire ec_thanks_to_p = ec_thanks_n_to_p_reg | ec_thanks_e_to_p_reg | ec_thanks_s_to_p_reg | ec_thanks_w_to_p_reg | ec_thanks_p_to_p_reg;

one_of_eight #(1) ec_mux_north(.in0(ec_wants_to_send_but_cannot_N),
                        .in1(ec_thanks_p_to_n_reg),
                        .in2(ec_thanks_w_to_n_reg),
                        .in3(ec_thanks_s_to_n_reg),
                        .in4(ec_thanks_e_to_n_reg),
                        .in5(ec_thanks_n_to_n_reg),
                        .in6(ec_thanks_to_n),
                        .in7(ec_north_input_valid_reg & ~ec_thanks_to_n),
                        .sel(ec_cfg[14:12]),
                        .out(ec_out[4]));

one_of_eight #(1) ec_mux_east(.in0(ec_wants_to_send_but_cannot_E),
                       .in1(ec_thanks_p_to_e_reg),
                       .in2(ec_thanks_w_to_e_reg),
                       .in3(ec_thanks_s_to_e_reg),
                       .in4(ec_thanks_e_to_e_reg),
                       .in5(ec_thanks_n_to_e_reg),
                       .in6(ec_thanks_to_e),
                       .in7(ec_east_input_valid_reg & ~ec_thanks_to_e),
                       .sel(ec_cfg[11:9]),
                       .out(ec_out[3]));

one_of_eight #(1) ec_mux_south(.in0(ec_wants_to_send_but_cannot_S),
                        .in1(ec_thanks_p_to_s_reg),
                        .in2(ec_thanks_w_to_s_reg),
                        .in3(ec_thanks_s_to_s_reg),
                        .in4(ec_thanks_e_to_s_reg),
                        .in5(ec_thanks_n_to_s_reg),
                        .in6(ec_thanks_to_s),
                        .in7(ec_south_input_valid_reg & ~ec_thanks_to_s),
                        .sel(ec_cfg[8:6]),
                        .out(ec_out[2]));

one_of_eight #(1) ec_mux_west( .in0(ec_wants_to_send_but_cannot_W),
                        .in1(ec_thanks_p_to_w_reg),
                        .in2(ec_thanks_w_to_w_reg),
                        .in3(ec_thanks_s_to_w_reg),
                        .in4(ec_thanks_e_to_w_reg),
                        .in5(ec_thanks_n_to_w_reg),
                        .in6(ec_thanks_to_w),
                        .in7(ec_west_input_valid_reg & ~ec_thanks_to_w),
                        .sel(ec_cfg[5:3]),
                        .out(ec_out[1]));

one_of_eight #(1) ec_mux_proc( .in0(ec_wants_to_send_but_cannot_P),
                        .in1(ec_thanks_p_to_p_reg),
                        .in2(ec_thanks_w_to_p_reg),
                        .in3(ec_thanks_s_to_p_reg),
                        .in4(ec_thanks_e_to_p_reg),
                        .in5(ec_thanks_n_to_p_reg),
                        .in6(ec_thanks_to_p),
                        .in7(ec_proc_input_valid_reg & ~ec_thanks_to_p),
                        .sel(ec_cfg[2:0]),
                        .out(ec_out[0]));

// end event counter logic

net_dff #(1) REG_reset_fin(.d(reset_in), .q(reset), .clk(clk));

net_dff #(10) REG_store_ack_addr(   .d(store_ack_addr),     .q(store_ack_addr_r),     .clk(clk));
net_dff #(1) REG_store_ack_received(.d(store_ack_received), .q(store_ack_received_r), .clk(clk));

   wire is_partner_address_v_r;
   bus_compare_equal #(10) CMP_partner_address (.a(store_ack_addr_r),
                                        .b({ store_meter_partner_address_Y, store_meter_partner_address_X } ),
                                        .bus_equal(is_partner_address_v_r));

   assign store_meter_ack_partner     = is_partner_address_v_r & store_ack_received_r;
   assign store_meter_ack_non_partner = ~is_partner_address_v_r & store_ack_received_r;

//make it so that the mdn_cfg location register has
//one cycle latency when being changed
//this was done so that these flops could be put near the
//dynamic network but this does mean that the cycle directly
//folowing a mtsr MDN_CFG which changes the location bits
//will still use the old value
//likewise it would be best to make sure there are no in-flight memory
//operations when setting the X and Y location for a tile.
always @ (posedge clk)
begin
        if(reset)
        begin
                myLocY_f <= 8'd0;
                myLocX_f <= 8'd0;
                myChipID_f <= 14'd0;
        end
        else
        begin
                myLocY_f <= myLocY;
                myLocX_f <= myLocX;
                myChipID_f <= myChipID;
        end
end

// mmckeown: Removing DUMMY modules
//dummy signals
/*`ifdef NO_DUMMY
`else
   rDUMMY #(1) default_ready_n_to_s_dummy (.A(default_ready_n_to_s));

   rDUMMY #(1) default_ready_e_to_w_dummy (.A(default_ready_e_to_w));

   rDUMMY #(1) default_ready_s_to_n_dummy (.A(default_ready_s_to_n));

   rDUMMY #(1) default_ready_s_to_p_dummy (.A(default_ready_s_to_p));

   rDUMMY #(1) default_ready_w_to_e_dummy (.A(default_ready_w_to_e));
`endif

//dummy signals for detecting the critical path for the valid and data signals
`ifdef NO_DUMMY
`else
   rDUMMY #(1) valid_out_north(.A(validOut_N_internal));
   rDUMMY #(1) valid_out_east(.A(validOut_E_internal));
   rDUMMY #(1) valid_out_south(.A(validOut_S_internal));
   rDUMMY #(1) valid_out_west(.A(validOut_W_internal));
   rDUMMY #(1) valid_out_proc(.A(validOut_P_internal));

   rDUMMY #(`DATA_WIDTH) data_out_north(.A(dataOut_N_internal));
   rDUMMY #(`DATA_WIDTH) data_out_east(.A(dataOut_E_internal));
   rDUMMY #(`DATA_WIDTH) data_out_south(.A(dataOut_S_internal));
   rDUMMY #(`DATA_WIDTH) data_out_west(.A(dataOut_W_internal));
   rDUMMY #(`DATA_WIDTH) data_out_proc(.A(dataOut_P_internal));
`endif*/

//wire regs

//assigns
assign thanksIn_P = thanks_n_to_p | thanks_e_to_p | thanks_s_to_p | thanks_w_to_p | thanks_p_to_p;

//assign validOut_N = validOut_N_internal;
//assign validOut_E = validOut_E_internal;
//assign validOut_S = validOut_S_internal;
//assign validOut_W = validOut_W_internal;
assign validOut_P = validOut_P_internal;

//assign dataOut_N = dataOut_N_internal;
//assign dataOut_E = dataOut_E_internal;
//assign dataOut_S = dataOut_S_internal;
//assign dataOut_W = dataOut_W_internal;
assign dataOut_P = dataOut_P_internal;

//more assigns
assign yummyIn_P_internal = yummyIn_P;
assign yummyOut_P = yummyOut_P_internal;

   
// two sets of inverters for output signals (buffering for timing purposes)
flip_bus #(1, 14) yummyOut_N_flip1(yummyOut_N_internal, yummyOut_N_flip1_out);
flip_bus #(1, 14) yummyOut_E_flip1(yummyOut_E_internal, yummyOut_E_flip1_out);
flip_bus #(1, 14) yummyOut_S_flip1(yummyOut_S_internal, yummyOut_S_flip1_out);
flip_bus #(1, 14) yummyOut_W_flip1(yummyOut_W_internal, yummyOut_W_flip1_out);
//flip_bus #(1, 14) yummyOut_P_flip1(yummyOut_P_internal, yummyOut_P_flip1_out);
flip_bus #(1, 21) yummyOut_N_flip2(yummyOut_N_flip1_out, yummyOut_N);
flip_bus #(1, 21) yummyOut_E_flip2(yummyOut_E_flip1_out, yummyOut_E);
flip_bus #(1, 21) yummyOut_S_flip2(yummyOut_S_flip1_out, yummyOut_S);
flip_bus #(1, 21) yummyOut_W_flip2(yummyOut_W_flip1_out, yummyOut_W);
//flip_bus #(1, 21) yummyOut_P_flip2(yummyOut_P_flip1_out, yummyOut_P);

flip_bus #(1, 14) validOut_N_flip1(validOut_N_internal, validOut_N_flip1_out);
flip_bus #(1, 14) validOut_E_flip1(validOut_E_internal, validOut_E_flip1_out);
flip_bus #(1, 14) validOut_S_flip1(validOut_S_internal, validOut_S_flip1_out);
flip_bus #(1, 14) validOut_W_flip1(validOut_W_internal, validOut_W_flip1_out);
//flip_bus #(1, 14) validOut_P_flip1(validOut_P_internal, validOut_P_flip1_out);
flip_bus #(1, 21) validOut_N_flip2(validOut_N_flip1_out, validOut_N);
flip_bus #(1, 21) validOut_E_flip2(validOut_E_flip1_out, validOut_E);
flip_bus #(1, 21) validOut_S_flip2(validOut_S_flip1_out, validOut_S);
flip_bus #(1, 21) validOut_W_flip2(validOut_W_flip1_out, validOut_W);
//flip_bus #(1, 21) validOut_P_flip2(validOut_P_flip1_out, validOut_P);

flip_bus #(64, 14) dataOut_N_flip1(dataOut_N_internal, dataOut_N_flip1_out);
flip_bus #(64, 14) dataOut_E_flip1(dataOut_E_internal, dataOut_E_flip1_out);
flip_bus #(64, 14) dataOut_S_flip1(dataOut_S_internal, dataOut_S_flip1_out);
flip_bus #(64, 14) dataOut_W_flip1(dataOut_W_internal, dataOut_W_flip1_out);
//flip_bus #(`DATA_WIDTH, 14) dataOut_P_flip1(dataOut_P_internal, dataOut_P_flip1_out);
flip_bus #(64, 21) dataOut_N_flip2(dataOut_N_flip1_out, dataOut_N);
flip_bus #(64, 21) dataOut_E_flip2(dataOut_E_flip1_out, dataOut_E);
flip_bus #(64, 21) dataOut_S_flip2(dataOut_S_flip1_out, dataOut_S);
flip_bus #(64, 21) dataOut_W_flip2(dataOut_W_flip1_out, dataOut_W);
//flip_bus #(`DATA_WIDTH, 21) dataOut_P_flip2(dataOut_P_flip1_out, dataOut_P);

// two sets of inverters for input signals (buffering for timing purposes)
flip_bus #(1, 14) yummyIn_N_flip1(yummyIn_N, yummyIn_N_flip1_out);
flip_bus #(1, 14) yummyIn_E_flip1(yummyIn_E, yummyIn_E_flip1_out);
flip_bus #(1, 14) yummyIn_S_flip1(yummyIn_S, yummyIn_S_flip1_out);
flip_bus #(1, 14) yummyIn_W_flip1(yummyIn_W, yummyIn_W_flip1_out);
//flip_bus #(1, 14) yummyIn_P_flip1(yummyIn_P, yummyIn_P_flip1_out);
flip_bus #(1, 10) yummyIn_N_flip2(yummyIn_N_flip1_out, yummyIn_N_internal);
flip_bus #(1, 10) yummyIn_E_flip2(yummyIn_E_flip1_out, yummyIn_E_internal);
flip_bus #(1, 10) yummyIn_S_flip2(yummyIn_S_flip1_out, yummyIn_S_internal);
flip_bus #(1, 10) yummyIn_W_flip2(yummyIn_W_flip1_out, yummyIn_W_internal);
//flip_bus #(1, 10) yummyIn_P_flip2(yummyIn_P_flip1_out, yummyIn_P_internal);

flip_bus #(1, 14) validIn_N_flip1(validIn_N, validIn_N_flip1_out);
flip_bus #(1, 14) validIn_E_flip1(validIn_E, validIn_E_flip1_out);
flip_bus #(1, 14) validIn_S_flip1(validIn_S, validIn_S_flip1_out);
flip_bus #(1, 14) validIn_W_flip1(validIn_W, validIn_W_flip1_out);
//flip_bus #(1, 14) validIn_P_flip1(validIn_P, validIn_P_flip1_out);
flip_bus #(1, 10) validIn_N_flip2(validIn_N_flip1_out, validIn_N_internal);
flip_bus #(1, 10) validIn_E_flip2(validIn_E_flip1_out, validIn_E_internal);
flip_bus #(1, 10) validIn_S_flip2(validIn_S_flip1_out, validIn_S_internal);
flip_bus #(1, 10) validIn_W_flip2(validIn_W_flip1_out, validIn_W_internal);
//flip_bus #(1, 10) validIn_P_flip2(validIn_P_flip1_out, validIn_P_internal);

flip_bus #(64, 14) dataIn_N_flip1(dataIn_N, dataIn_N_flip1_out);
flip_bus #(64, 14) dataIn_E_flip1(dataIn_E, dataIn_E_flip1_out);
flip_bus #(64, 14) dataIn_S_flip1(dataIn_S, dataIn_S_flip1_out);
flip_bus #(64, 14) dataIn_W_flip1(dataIn_W, dataIn_W_flip1_out);
//flip_bus #(`DATA_WIDTH, 14) dataIn_P_flip1(dataIn_P, dataIn_P_flip1_out);
flip_bus #(64, 10) dataIn_N_flip2(dataIn_N_flip1_out, dataIn_N_internal);
flip_bus #(64, 10) dataIn_E_flip2(dataIn_E_flip1_out, dataIn_E_internal);
flip_bus #(64, 10) dataIn_S_flip2(dataIn_S_flip1_out, dataIn_S_internal);
flip_bus #(64, 10) dataIn_W_flip2(dataIn_W_flip1_out, dataIn_W_internal);
//flip_bus #(`DATA_WIDTH, 10) dataIn_P_flip2(dataIn_P_flip1_out, dataIn_P_internal);


//instantiations


//the following dense code impliments a full crossbar.
//The two main components are a dynamic_input_top_X and a dynamic_output_top

//the difference between dynamic_input_top_4 and dynamic_input_top_16 are the size of
//the nibs inside of them.

//dynamic inputs
dynamic_input_top_4 north_input(.route_req_n_out(route_req_n_to_n), .route_req_e_out(route_req_n_to_e), .route_req_s_out(route_req_n_to_s), .route_req_w_out(route_req_n_to_w), .route_req_p_out(route_req_n_to_p), .default_ready_n_out(), .default_ready_e_out(), .default_ready_s_out(default_ready_n_to_s), .default_ready_w_out(), .default_ready_p_out(), .tail_out(north_input_tail), .yummy_out(yummyOut_N_internal), .data_out(north_input_data), .valid_out(north_input_valid), .clk(clk), .reset(reset), .my_loc_x_in(myLocX_f), .my_loc_y_in(myLocY_f), .my_chip_id_in(myChipID_f), .valid_in(validIn_N_internal), .data_in(dataIn_N_internal), .thanks_n(thanks_n_to_n), .thanks_e(thanks_e_to_n), .thanks_s(thanks_s_to_n), .thanks_w(thanks_w_to_n), .thanks_p(thanks_p_to_n));

dynamic_input_top_4 east_input(.route_req_n_out(route_req_e_to_n), .route_req_e_out(route_req_e_to_e), .route_req_s_out(route_req_e_to_s), .route_req_w_out(route_req_e_to_w), .route_req_p_out(route_req_e_to_p), .default_ready_n_out(), .default_ready_e_out(), .default_ready_s_out(), .default_ready_w_out(default_ready_e_to_w), .default_ready_p_out(), .tail_out(east_input_tail), .yummy_out(yummyOut_E_internal), .data_out(east_input_data), .valid_out(east_input_valid), .clk(clk), .reset(reset), .my_loc_x_in(myLocX_f), .my_loc_y_in(myLocY_f), .my_chip_id_in(myChipID_f), .valid_in(validIn_E_internal), .data_in(dataIn_E_internal), .thanks_n(thanks_n_to_e), .thanks_e(thanks_e_to_e), .thanks_s(thanks_s_to_e), .thanks_w(thanks_w_to_e), .thanks_p(thanks_p_to_e));

dynamic_input_top_4 south_input(.route_req_n_out(route_req_s_to_n), .route_req_e_out(route_req_s_to_e), .route_req_s_out(route_req_s_to_s), .route_req_w_out(route_req_s_to_w), .route_req_p_out(route_req_s_to_p), .default_ready_n_out(default_ready_s_to_n), .default_ready_e_out(), .default_ready_s_out(), .default_ready_w_out(), .default_ready_p_out(default_ready_s_to_p), .tail_out(south_input_tail), .yummy_out(yummyOut_S_internal), .data_out(south_input_data), .valid_out(south_input_valid), .clk(clk), .reset(reset), .my_loc_x_in(myLocX_f), .my_loc_y_in(myLocY_f), .my_chip_id_in(myChipID_f), .valid_in(validIn_S_internal), .data_in(dataIn_S_internal), .thanks_n(thanks_n_to_s), .thanks_e(thanks_e_to_s), .thanks_s(thanks_s_to_s), .thanks_w(thanks_w_to_s), .thanks_p(thanks_p_to_s));

dynamic_input_top_4 west_input(.route_req_n_out(route_req_w_to_n), .route_req_e_out(route_req_w_to_e), .route_req_s_out(route_req_w_to_s), .route_req_w_out(route_req_w_to_w), .route_req_p_out(route_req_w_to_p), .default_ready_n_out(), .default_ready_e_out(default_ready_w_to_e), .default_ready_s_out(), .default_ready_w_out(), .default_ready_p_out(), .tail_out(west_input_tail), .yummy_out(yummyOut_W_internal), .data_out(west_input_data), .valid_out(west_input_valid), .clk(clk), .reset(reset), .my_loc_x_in(myLocX_f), .my_loc_y_in(myLocY_f), .my_chip_id_in(myChipID_f), .valid_in(validIn_W_internal), .data_in(dataIn_W_internal), .thanks_n(thanks_n_to_w), .thanks_e(thanks_e_to_w), .thanks_s(thanks_s_to_w), .thanks_w(thanks_w_to_w), .thanks_p(thanks_p_to_w));

dynamic_input_top_16 proc_input(.route_req_n_out(route_req_p_to_n), .route_req_e_out(route_req_p_to_e), .route_req_s_out(route_req_p_to_s), .route_req_w_out(route_req_p_to_w), .route_req_p_out(route_req_p_to_p), .default_ready_n_out(), .default_ready_e_out(), .default_ready_s_out(), .default_ready_w_out(), .default_ready_p_out(), .tail_out(proc_input_tail), .yummy_out(yummyOut_P_internal), .data_out(proc_input_data), .valid_out(proc_input_valid), .clk(clk), .reset(reset), .my_loc_x_in(myLocX_f), .my_loc_y_in(myLocY_f), .my_chip_id_in(myChipID_f), .valid_in(validIn_P), .data_in(dataIn_P), .thanks_n(thanks_n_to_p), .thanks_e(thanks_e_to_p), .thanks_s(thanks_s_to_p), .thanks_w(thanks_w_to_p), .thanks_p(thanks_p_to_p));

//dynamic outputs

dynamic_output_top north_output(.data_out(dataOut_N_internal), .thanks_a_out(thanks_n_to_s), .thanks_b_out(thanks_n_to_w), .thanks_c_out(thanks_n_to_p), .thanks_d_out(thanks_n_to_e), .thanks_x_out(thanks_n_to_n), .valid_out(validOut_N_internal),  .popped_interrupt_mesg_out(), .popped_memory_ack_mesg_out(), .popped_memory_ack_mesg_out_sender(), .ec_wants_to_send_but_cannot(ec_wants_to_send_but_cannot_N), .clk(clk), .reset(reset), .route_req_a_in(route_req_s_to_n), .route_req_b_in(route_req_w_to_n), .route_req_c_in(route_req_p_to_n), .route_req_d_in(route_req_e_to_n), .route_req_x_in(route_req_n_to_n), .tail_a_in(south_input_tail), .tail_b_in(west_input_tail), .tail_c_in(proc_input_tail), .tail_d_in(east_input_tail), .tail_x_in(north_input_tail), .data_a_in(south_input_data), .data_b_in(west_input_data), .data_c_in(proc_input_data), .data_d_in(east_input_data), .data_x_in(north_input_data), .valid_a_in(south_input_valid), .valid_b_in(west_input_valid), .valid_c_in(proc_input_valid), .valid_d_in(east_input_valid), .valid_x_in(north_input_valid), .default_ready_in(default_ready_s_to_n), .yummy_in(yummyIn_N_internal));

dynamic_output_top east_output(.data_out(dataOut_E_internal), .thanks_a_out(thanks_e_to_w), .thanks_b_out(thanks_e_to_p), .thanks_c_out(thanks_e_to_n), .thanks_d_out(thanks_e_to_s), .thanks_x_out(thanks_e_to_e), .valid_out(validOut_E_internal),   .popped_interrupt_mesg_out(), .popped_memory_ack_mesg_out(), .popped_memory_ack_mesg_out_sender(),  .ec_wants_to_send_but_cannot(ec_wants_to_send_but_cannot_E), .clk(clk), .reset(reset), .route_req_a_in(route_req_w_to_e), .route_req_b_in(route_req_p_to_e), .route_req_c_in(route_req_n_to_e), .route_req_d_in(route_req_s_to_e), .route_req_x_in(route_req_e_to_e), .tail_a_in(west_input_tail), .tail_b_in(proc_input_tail), .tail_c_in(north_input_tail), .tail_d_in(south_input_tail), .tail_x_in(east_input_tail), .data_a_in(west_input_data), .data_b_in(proc_input_data), .data_c_in(north_input_data), .data_d_in(south_input_data), .data_x_in(east_input_data), .valid_a_in(west_input_valid), .valid_b_in(proc_input_valid), .valid_c_in(north_input_valid), .valid_d_in(south_input_valid), .valid_x_in(east_input_valid), .default_ready_in(default_ready_w_to_e), .yummy_in(yummyIn_E_internal));

dynamic_output_top south_output(.data_out(dataOut_S_internal), .thanks_a_out(thanks_s_to_n), .thanks_b_out(thanks_s_to_e), .thanks_c_out(thanks_s_to_w), .thanks_d_out(thanks_s_to_p), .thanks_x_out(thanks_s_to_s), .valid_out(validOut_S_internal),   .popped_interrupt_mesg_out(), .popped_memory_ack_mesg_out(), .popped_memory_ack_mesg_out_sender(),  .ec_wants_to_send_but_cannot(ec_wants_to_send_but_cannot_S), .clk(clk), .reset(reset), .route_req_a_in(route_req_n_to_s), .route_req_b_in(route_req_e_to_s), .route_req_c_in(route_req_w_to_s), .route_req_d_in(route_req_p_to_s), .route_req_x_in(route_req_s_to_s), .tail_a_in(north_input_tail), .tail_b_in(east_input_tail), .tail_c_in(west_input_tail), .tail_d_in(proc_input_tail), .tail_x_in(south_input_tail), .data_a_in(north_input_data), .data_b_in(east_input_data), .data_c_in(west_input_data), .data_d_in(proc_input_data), .data_x_in(south_input_data), .valid_a_in(north_input_valid), .valid_b_in(east_input_valid), .valid_c_in(west_input_valid), .valid_d_in(proc_input_valid), .valid_x_in(south_input_valid), .default_ready_in(default_ready_n_to_s), .yummy_in(yummyIn_S_internal));

dynamic_output_top west_output(.data_out(dataOut_W_internal), .thanks_a_out(thanks_w_to_e), .thanks_b_out(thanks_w_to_s), .thanks_c_out(thanks_w_to_p), .thanks_d_out(thanks_w_to_n), .thanks_x_out(thanks_w_to_w), .valid_out(validOut_W_internal),   .popped_interrupt_mesg_out(), .popped_memory_ack_mesg_out(), .popped_memory_ack_mesg_out_sender(),  .ec_wants_to_send_but_cannot(ec_wants_to_send_but_cannot_W), .clk(clk), .reset(reset), .route_req_a_in(route_req_e_to_w), .route_req_b_in(route_req_s_to_w), .route_req_c_in(route_req_p_to_w), .route_req_d_in(route_req_n_to_w), .route_req_x_in(route_req_w_to_w), .tail_a_in(east_input_tail), .tail_b_in(south_input_tail), .tail_c_in(proc_input_tail), .tail_d_in(north_input_tail), .tail_x_in(west_input_tail), .data_a_in(east_input_data), .data_b_in(south_input_data), .data_c_in(proc_input_data), .data_d_in(north_input_data), .data_x_in(west_input_data), .valid_a_in(east_input_valid), .valid_b_in(south_input_valid), .valid_c_in(proc_input_valid), .valid_d_in(north_input_valid), .valid_x_in(west_input_valid), .default_ready_in(default_ready_e_to_w), .yummy_in(yummyIn_W_internal));
//yanqi change kill headers to 0
dynamic_output_top #(1'b0) proc_output(.data_out(dataOut_P_internal), .thanks_a_out(thanks_p_to_s), .thanks_b_out(thanks_p_to_w), .thanks_c_out(thanks_p_to_n), .thanks_d_out(thanks_p_to_e), .thanks_x_out(thanks_p_to_p), .valid_out(validOut_P_internal),  .popped_interrupt_mesg_out(external_interrupt), .popped_memory_ack_mesg_out(store_ack_received), .popped_memory_ack_mesg_out_sender(store_ack_addr),  .ec_wants_to_send_but_cannot(ec_wants_to_send_but_cannot_P), .clk(clk), .reset(reset), .route_req_a_in(route_req_s_to_p), .route_req_b_in(route_req_w_to_p), .route_req_c_in(route_req_n_to_p), .route_req_d_in(route_req_e_to_p), .route_req_x_in(route_req_p_to_p), .tail_a_in(south_input_tail), .tail_b_in(west_input_tail), .tail_c_in(north_input_tail), .tail_d_in(east_input_tail), .tail_x_in(proc_input_tail), .data_a_in(south_input_data), .data_b_in(west_input_data), .data_c_in(north_input_data), .data_d_in(east_input_data), .data_x_in(proc_input_data), .valid_a_in(south_input_valid), .valid_b_in(west_input_valid), .valid_c_in(north_input_valid), .valid_d_in(east_input_valid), .valid_x_in(proc_input_valid), .default_ready_in(default_ready_s_to_p), .yummy_in(yummyIn_P_internal));


endmodule // dynamic_node
/*
Copyright (c) 2015 Princeton University
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

//File: dynamic_node_top_wrap.v
////Creator: Michael McKeown
////Created: Sept. 21, 2014
////
////Function: This wraps the dynamic_node top and ties off signals
//            we will not be using at the tile level
////
////State: 
////
////Instantiates: dynamic_node_top
////
////

// Copyright (c) 2015 Princeton University
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

//==================================================================================================
//  Filename      : define.h
//  Created On    : 2014-02-20
//  Last Modified : 2018-11-16 17:14:11
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : main header file defining global architecture parameters
//
//
//==================================================================================================


































































































































































































































































































































































































































































































































































































// /tigress/pjj/openpiton/single-file/princeton-parallel-processor/piton/verif/env/manycore/devices.xml

module dynamic_node_top_wrap_para
(
    input clk,
    input reset_in,
    
    input [64-1:0] dataIn_0,
    input [64-1:0] dataIn_1,

    input validIn_0,
    input validIn_1,

    input yummyIn_0,
    input yummyIn_1,

    /*
    //original
    input [`DATA_WIDTH-1:0] dataIn_N,   // data inputs from neighboring tiles
    input [`DATA_WIDTH-1:0] dataIn_E,
    input [`DATA_WIDTH-1:0] dataIn_S,
    input [`DATA_WIDTH-1:0] dataIn_W,
    input [`DATA_WIDTH-1:0] dataIn_P,   // data input from processor
       
    input validIn_N,        // valid signals from neighboring tiles
    input validIn_E,
    input validIn_S,
    input validIn_W,
    input validIn_P,        // valid signal from processor
       
    input yummyIn_N,        // neighbor consumed output data
    input yummyIn_E,
    input yummyIn_S,
    input yummyIn_W,
    input yummyIn_P,        // processor consumed output data
    */   
    input [8-1:0] myLocX,       // this tile's position
    input [8-1:0] myLocY,
    input [14-1:0] myChipID,
    
    output [64-1:0] dataOut_0,
    output [64-1:0] dataOut_1,

    output validOut_0,
    output validOut_1,

    output yummyOut_0,
    output yummyOut_1,


    /*
    //original
    output [`DATA_WIDTH-1:0] dataOut_N, // data outputs to neighbors
    output [`DATA_WIDTH-1:0] dataOut_E,
    output [`DATA_WIDTH-1:0] dataOut_S,
    output [`DATA_WIDTH-1:0] dataOut_W,
    output [`DATA_WIDTH-1:0] dataOut_P, // data output to processor
    
    output validOut_N,      // valid outputs to neighbors
    output validOut_E,
    output validOut_S,
    output validOut_W,
    output validOut_P,      // valid output to processor
       
    output yummyOut_N,      // yummy signal to neighbors' output buffers
    output yummyOut_E,
    output yummyOut_S,
    output yummyOut_W,
    output yummyOut_P,      // yummy signal to processor's output buffer
    */
    
    output thanksIn_1      // thanksIn to processor's space_avail
);

    dynamic_node_top_para dynamic_node_top
    (
        .clk(clk),
        .reset_in(reset_in),
        
        .dataIn_0(dataIn_0),
        .dataIn_1(dataIn_1),
        .validIn_0(validIn_0),
        .validIn_1(validIn_1),
        .yummyIn_0(yummyIn_0),
        .yummyIn_1(yummyIn_1),

        .myLocX(myLocX),
        .myLocY(myLocY),
        .myChipID(myChipID),
        .ec_cfg(6'b0),
        .store_meter_partner_address_X(5'b0),
        .store_meter_partner_address_Y(5'b0),
        
        .dataOut_0(dataOut_0),
        .dataOut_1(dataOut_1),
        .validOut_0(validOut_0),
        .validOut_1(validOut_1),
        .yummyOut_0(yummyOut_0),
        .yummyOut_1(yummyOut_1),

        .thanksIn_1(thanksIn_1),
        .external_interrupt(),
        .store_meter_ack_partner(),
        .store_meter_ack_non_partner(),
        .ec_out()
    ); 

endmodule
/*
Copyright (c) 2015 Princeton University
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

//Function: This wires everything together to make a crossbar
//

// Copyright (c) 2015 Princeton University
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

//==================================================================================================
//  Filename      : define.h
//  Created On    : 2014-02-20
//  Last Modified : 2018-11-16 17:14:11
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : main header file defining global architecture parameters
//
//
//==================================================================================================


































































































































































































































































































































































































































































































































































































// /tigress/pjj/openpiton/single-file/princeton-parallel-processor/piton/verif/env/manycore/devices.xml

module dynamic_node_top_para(clk,
		    reset_in,
        dataIn_0, dataIn_1, 
        validIn_0, validIn_1, 
        yummyIn_0,yummyIn_1,
		    myLocX,
		    myLocY,
            myChipID,
		    store_meter_partner_address_X,
		    store_meter_partner_address_Y,
		    ec_cfg,
        dataOut_0, dataOut_1, 
        validOut_0, validOut_1, 
        yummyOut_0,yummyOut_1,
		    thanksIn_1,
		    external_interrupt,
		    store_meter_ack_partner,
		    store_meter_ack_non_partner,
		    ec_out);

// begin port declarations

input clk;
input reset_in;

input [64-1:0] dataIn_0;
input [64-1:0] dataIn_1;

input validIn_0;
input validIn_1;

input yummyIn_0;
input yummyIn_1;

/*
//original 
input [`DATA_WIDTH-1:0] dataIn_N;	// data inputs from neighboring tiles
input [`DATA_WIDTH-1:0] dataIn_E;
input [`DATA_WIDTH-1:0] dataIn_S;
input [`DATA_WIDTH-1:0] dataIn_W;
input [`DATA_WIDTH-1:0] dataIn_P;	// data input from processor
   
input validIn_N;		// valid signals from neighboring tiles
input validIn_E;
input validIn_S;
input validIn_W;
input validIn_P;		// valid signal from processor
   
input yummyIn_N;		// neighbor consumed output data
input yummyIn_E;
input yummyIn_S;
input yummyIn_W;
input yummyIn_P;		// processor consumed output data
*/   
input [8-1:0] myLocX;		// this tile's position
input [8-1:0] myLocY;
input [14-1:0] myChipID;

input [4:0] store_meter_partner_address_X;
input [4:0] store_meter_partner_address_Y;

input [5:0] ec_cfg;            // NESWP 3 bits each selecter of event to monitor

output [64-1:0] dataOut_0;
output [64-1:0] dataOut_1;

output validOut_0;
output validOut_1;

output yummyOut_0;
output yummyOut_1;

/*
//original
output [`DATA_WIDTH-1:0] dataOut_N;	// data outputs to neighbors
output [`DATA_WIDTH-1:0] dataOut_E;
output [`DATA_WIDTH-1:0] dataOut_S;
output [`DATA_WIDTH-1:0] dataOut_W;
output [`DATA_WIDTH-1:0] dataOut_P;	// data output to processor

output validOut_N;		// valid outputs to neighbors
output validOut_E;
output validOut_S;
output validOut_W;
output validOut_P;		// valid output to processor
   
output yummyOut_N;		// yummy signal to neighbors' output buffers
output yummyOut_E;
output yummyOut_S;
output yummyOut_W;
output yummyOut_P;		// yummy signal to processor's output buffer
*/
output thanksIn_1;		// thanksIn to processor's space_avail

output external_interrupt;	//is used for the proc to know
				//that an external interrupt occured
output store_meter_ack_partner;      // strobes high when a memory ack word is popped off of the network
                                     // and the sender ID matches the "partner port" id from the STORE_METER
output store_meter_ack_non_partner;  // strobes high when a memory ack word is popped off of the network
                                     // and the sender ID does not match the "partner port" id from the STORE_METER


output [1:0] ec_out;

wire   ec_wants_to_send_but_cannot_0;
wire   ec_wants_to_send_but_cannot_1;

// end port declarations

   wire store_ack_received;
   wire store_ack_received_r;
   wire [9:0] store_ack_addr;
   wire [9:0] store_ack_addr_r;

//wires
wire node_0_input_tail;
wire node_1_input_tail;

wire [64-1:0] node_0_input_data;
wire [64-1:0] node_1_input_data;

wire node_0_input_valid;
wire node_1_input_valid;

wire thanks_0_to_0;
wire thanks_0_to_1;

wire thanks_1_to_0;
wire thanks_1_to_1;

wire route_req_0_to_0;
wire route_req_0_to_1;

wire route_req_1_to_0;
wire route_req_1_to_1;

wire default_ready_0_to_0;
wire default_ready_0_to_1;

wire yummyOut_0_internal;
wire yummyOut_1_internal;

wire validOut_0_internal;
wire validOut_1_internal;

wire [64-1:0] dataOut_0_internal;
wire [64-1:0] dataOut_1_internal;

wire yummyOut_0_flip1_out;

wire validOut_0_flip1_out;

wire [64-1:0] dataOut_0_flip1_out;

wire yummyIn_0_internal;
wire yummyIn_1_internal;

wire validIn_0_internal;

wire [64-1:0] dataIn_0_internal;

wire yummyIn_0_flip1_out;

wire validIn_0_flip1_out;

wire [64-1:0] dataIn_0_flip1_out;

/*
//original
wire default_ready_n_to_s;
wire default_ready_e_to_w;
wire default_ready_s_to_n;
wire default_ready_s_to_p;
wire default_ready_w_to_e;

// input/output buffered signals
wire yummyOut_N_internal;
wire yummyOut_E_internal;
wire yummyOut_S_internal;
wire yummyOut_W_internal;
wire yummyOut_P_internal;

wire validOut_N_internal;
wire validOut_E_internal;
wire validOut_S_internal;
wire validOut_W_internal;
wire validOut_P_internal;

wire [`DATA_WIDTH-1:0] dataOut_N_internal;
wire [`DATA_WIDTH-1:0] dataOut_E_internal;
wire [`DATA_WIDTH-1:0] dataOut_S_internal;
wire [`DATA_WIDTH-1:0] dataOut_W_internal;
wire [`DATA_WIDTH-1:0] dataOut_P_internal;

wire yummyOut_N_flip1_out;
wire yummyOut_E_flip1_out;
wire yummyOut_S_flip1_out;
wire yummyOut_W_flip1_out;
//wire yummyOut_P_flip1_out;

wire validOut_N_flip1_out;
wire validOut_E_flip1_out;
wire validOut_S_flip1_out;
wire validOut_W_flip1_out;
//wire validOut_P_flip1_out;

wire [`DATA_WIDTH-1:0] dataOut_N_flip1_out;
wire [`DATA_WIDTH-1:0] dataOut_E_flip1_out;
wire [`DATA_WIDTH-1:0] dataOut_S_flip1_out;
wire [`DATA_WIDTH-1:0] dataOut_W_flip1_out;
//wire [`DATA_WIDTH-1:0] dataOut_P_flip1_out;

wire yummyIn_N_internal;
wire yummyIn_E_internal;
wire yummyIn_S_internal;
wire yummyIn_W_internal;
wire yummyIn_P_internal;

wire validIn_N_internal;
wire validIn_E_internal;
wire validIn_S_internal;
wire validIn_W_internal;
//wire validIn_P_internal;

wire [`DATA_WIDTH-1:0] dataIn_N_internal;
wire [`DATA_WIDTH-1:0] dataIn_E_internal;
wire [`DATA_WIDTH-1:0] dataIn_S_internal;
wire [`DATA_WIDTH-1:0] dataIn_W_internal;
//wire [`DATA_WIDTH-1:0] dataIn_P_internal;

wire yummyIn_N_flip1_out;
wire yummyIn_E_flip1_out;
wire yummyIn_S_flip1_out;
wire yummyIn_W_flip1_out;
//wire yummyIn_P_flip1_out;

wire validIn_N_flip1_out;
wire validIn_E_flip1_out;
wire validIn_S_flip1_out;
wire validIn_W_flip1_out;
//wire validIn_P_flip1_out;

wire [`DATA_WIDTH-1:0] dataIn_N_flip1_out;
wire [`DATA_WIDTH-1:0] dataIn_E_flip1_out;
wire [`DATA_WIDTH-1:0] dataIn_S_flip1_out;
wire [`DATA_WIDTH-1:0] dataIn_W_flip1_out;
//wire [`DATA_WIDTH-1:0] dataIn_P_flip1_out;
*/
//state
reg [8-1:0] myLocX_f;
reg [8-1:0] myLocY_f;
reg [14-1:0] myChipID_f;
wire   reset;


// event counter logic
//
//
reg ec_thanks_0_to_0_reg, ec_thanks_0_to_1_reg;
reg ec_thanks_1_to_0_reg, ec_thanks_1_to_1_reg;
reg ec_wants_to_send_but_cannot_0_reg, ec_wants_to_send_but_cannot_1_reg;
reg ec_0_input_valid_reg, ec_1_input_valid_reg;

/*
//original
reg ec_thanks_n_to_n_reg, ec_thanks_n_to_e_reg, ec_thanks_n_to_s_reg, ec_thanks_n_to_w_reg, ec_thanks_n_to_p_reg;
reg ec_thanks_e_to_n_reg, ec_thanks_e_to_e_reg, ec_thanks_e_to_s_reg, ec_thanks_e_to_w_reg, ec_thanks_e_to_p_reg;
reg ec_thanks_s_to_n_reg, ec_thanks_s_to_e_reg, ec_thanks_s_to_s_reg, ec_thanks_s_to_w_reg, ec_thanks_s_to_p_reg;
reg ec_thanks_w_to_n_reg, ec_thanks_w_to_e_reg, ec_thanks_w_to_s_reg, ec_thanks_w_to_w_reg, ec_thanks_w_to_p_reg;
reg ec_thanks_p_to_n_reg, ec_thanks_p_to_e_reg, ec_thanks_p_to_s_reg, ec_thanks_p_to_w_reg, ec_thanks_p_to_p_reg;
reg ec_wants_to_send_but_cannot_N_reg, ec_wants_to_send_but_cannot_E_reg, ec_wants_to_send_but_cannot_S_reg, ec_wants_to_send_but_cannot_W_reg, ec_wants_to_send_but_cannot_P_reg;
reg ec_north_input_valid_reg, ec_east_input_valid_reg, ec_south_input_valid_reg, ec_west_input_valid_reg, ec_proc_input_valid_reg;
*/

// let's register these babies before they do any damage to the cycle time -- mbt
always @(posedge clk)
  begin
    
    ec_thanks_0_to_0_reg <= thanks_0_to_0; ec_thanks_0_to_1_reg <= thanks_0_to_1;
    ec_thanks_1_to_0_reg <= thanks_1_to_0; ec_thanks_1_to_1_reg <= thanks_1_to_1;
    ec_wants_to_send_but_cannot_0_reg <= ec_wants_to_send_but_cannot_0;
    ec_wants_to_send_but_cannot_1_reg <= ec_wants_to_send_but_cannot_1;
    ec_0_input_valid_reg <= node_0_input_valid;
    ec_1_input_valid_reg <= node_1_input_valid;

    /*
    //original
     ec_thanks_n_to_n_reg <= thanks_n_to_n; ec_thanks_n_to_e_reg <= thanks_n_to_e; ec_thanks_n_to_s_reg <= thanks_n_to_s; ec_thanks_n_to_w_reg <= thanks_n_to_w; ec_thanks_n_to_p_reg <= thanks_n_to_p;
     ec_thanks_e_to_n_reg <= thanks_e_to_n; ec_thanks_e_to_e_reg <= thanks_e_to_e; ec_thanks_e_to_s_reg <= thanks_e_to_s; ec_thanks_e_to_w_reg <= thanks_e_to_w; ec_thanks_e_to_p_reg <= thanks_e_to_p;
     ec_thanks_s_to_n_reg <= thanks_s_to_n; ec_thanks_s_to_e_reg <= thanks_s_to_e; ec_thanks_s_to_s_reg <= thanks_s_to_s; ec_thanks_s_to_w_reg <= thanks_s_to_w; ec_thanks_s_to_p_reg <= thanks_s_to_p;
     ec_thanks_w_to_n_reg <= thanks_w_to_n; ec_thanks_w_to_e_reg <= thanks_w_to_e; ec_thanks_w_to_s_reg <= thanks_w_to_s; ec_thanks_w_to_w_reg <= thanks_w_to_w; ec_thanks_w_to_p_reg <= thanks_w_to_p;
     ec_thanks_p_to_n_reg <= thanks_p_to_n; ec_thanks_p_to_e_reg <= thanks_p_to_e; ec_thanks_p_to_s_reg <= thanks_p_to_s; ec_thanks_p_to_w_reg <= thanks_p_to_w; ec_thanks_p_to_p_reg <= thanks_p_to_p;
     ec_wants_to_send_but_cannot_N_reg <= ec_wants_to_send_but_cannot_N;
     ec_wants_to_send_but_cannot_E_reg <= ec_wants_to_send_but_cannot_E;
     ec_wants_to_send_but_cannot_S_reg <= ec_wants_to_send_but_cannot_S;
     ec_wants_to_send_but_cannot_W_reg <= ec_wants_to_send_but_cannot_W;
     ec_wants_to_send_but_cannot_P_reg <= ec_wants_to_send_but_cannot_P;
     ec_north_input_valid_reg <= north_input_valid;
     ec_east_input_valid_reg  <= east_input_valid;
     ec_south_input_valid_reg <= south_input_valid;
     ec_west_input_valid_reg  <= west_input_valid;
     ec_proc_input_valid_reg  <= proc_input_valid;
    */
  end

wire ec_thanks_to_0= ec_thanks_0_to_0_reg | ec_thanks_1_to_0_reg ;
wire ec_thanks_to_1= ec_thanks_0_to_1_reg | ec_thanks_1_to_1_reg ;

/*
//original
   wire ec_thanks_to_n = ec_thanks_n_to_n_reg | ec_thanks_e_to_n_reg | ec_thanks_s_to_n_reg | ec_thanks_w_to_n_reg | ec_thanks_p_to_n_reg;
   wire ec_thanks_to_e = ec_thanks_n_to_e_reg | ec_thanks_e_to_e_reg | ec_thanks_s_to_e_reg | ec_thanks_w_to_e_reg | ec_thanks_p_to_e_reg;
   wire ec_thanks_to_s = ec_thanks_n_to_s_reg | ec_thanks_e_to_s_reg | ec_thanks_s_to_s_reg | ec_thanks_w_to_s_reg | ec_thanks_p_to_s_reg;
   wire ec_thanks_to_w = ec_thanks_n_to_w_reg | ec_thanks_e_to_w_reg | ec_thanks_s_to_w_reg | ec_thanks_w_to_w_reg | ec_thanks_p_to_w_reg;
   wire ec_thanks_to_p = ec_thanks_n_to_p_reg | ec_thanks_e_to_p_reg | ec_thanks_s_to_p_reg | ec_thanks_w_to_p_reg | ec_thanks_p_to_p_reg;
*/
one_of_n_plus_3 #(1) ec_mux_0(.in0(ec_wants_to_send_but_cannot_0),
                        .in1(ec_thanks_1_to_0_reg),
                        .in2(ec_thanks_0_to_0_reg),
                        .in3(ec_thanks_to_0),
                        .in4(ec_0_input_valid_reg & ~ec_thanks_to_0),
                        .sel(ec_cfg[5:3]),
                        .out(ec_out[1]));
one_of_n_plus_3 #(1) ec_mux_1(.in0(ec_wants_to_send_but_cannot_1),
                        .in1(ec_thanks_1_to_1_reg),
                        .in2(ec_thanks_0_to_1_reg),
                        .in3(ec_thanks_to_1),
                        .in4(ec_1_input_valid_reg & ~ec_thanks_to_1),
                        .sel(ec_cfg[2:0]),
                        .out(ec_out[0]));

/*
//original
one_of_eight #(1) ec_mux_north(.in0(ec_wants_to_send_but_cannot_N),
                        .in1(ec_thanks_p_to_n_reg),
                        .in2(ec_thanks_w_to_n_reg),
                        .in3(ec_thanks_s_to_n_reg),
                        .in4(ec_thanks_e_to_n_reg),
                        .in5(ec_thanks_n_to_n_reg),
                        .in6(ec_thanks_to_n),
                        .in7(ec_north_input_valid_reg & ~ec_thanks_to_n),
                        .sel(ec_cfg[14:12]),
                        .out(ec_out[4]));

one_of_eight #(1) ec_mux_east(.in0(ec_wants_to_send_but_cannot_E),
                       .in1(ec_thanks_p_to_e_reg),
                       .in2(ec_thanks_w_to_e_reg),
                       .in3(ec_thanks_s_to_e_reg),
                       .in4(ec_thanks_e_to_e_reg),
                       .in5(ec_thanks_n_to_e_reg),
                       .in6(ec_thanks_to_e),
                       .in7(ec_east_input_valid_reg & ~ec_thanks_to_e),
                       .sel(ec_cfg[11:9]),
                       .out(ec_out[3]));

one_of_eight #(1) ec_mux_south(.in0(ec_wants_to_send_but_cannot_S),
                        .in1(ec_thanks_p_to_s_reg),
                        .in2(ec_thanks_w_to_s_reg),
                        .in3(ec_thanks_s_to_s_reg),
                        .in4(ec_thanks_e_to_s_reg),
                        .in5(ec_thanks_n_to_s_reg),
                        .in6(ec_thanks_to_s),
                        .in7(ec_south_input_valid_reg & ~ec_thanks_to_s),
                        .sel(ec_cfg[8:6]),
                        .out(ec_out[2]));

one_of_eight #(1) ec_mux_west( .in0(ec_wants_to_send_but_cannot_W),
                        .in1(ec_thanks_p_to_w_reg),
                        .in2(ec_thanks_w_to_w_reg),
                        .in3(ec_thanks_s_to_w_reg),
                        .in4(ec_thanks_e_to_w_reg),
                        .in5(ec_thanks_n_to_w_reg),
                        .in6(ec_thanks_to_w),
                        .in7(ec_west_input_valid_reg & ~ec_thanks_to_w),
                        .sel(ec_cfg[5:3]),
                        .out(ec_out[1]));

one_of_eight #(1) ec_mux_proc( .in0(ec_wants_to_send_but_cannot_P),
                        .in1(ec_thanks_p_to_p_reg),
                        .in2(ec_thanks_w_to_p_reg),
                        .in3(ec_thanks_s_to_p_reg),
                        .in4(ec_thanks_e_to_p_reg),
                        .in5(ec_thanks_n_to_p_reg),
                        .in6(ec_thanks_to_p),
                        .in7(ec_proc_input_valid_reg & ~ec_thanks_to_p),
                        .sel(ec_cfg[2:0]),
                        .out(ec_out[0]));
*/
// end event counter logic

net_dff #(1) REG_reset_fin(.d(reset_in), .q(reset), .clk(clk));

net_dff #(10) REG_store_ack_addr(   .d(store_ack_addr),     .q(store_ack_addr_r),     .clk(clk));
net_dff #(1) REG_store_ack_received(.d(store_ack_received), .q(store_ack_received_r), .clk(clk));

   wire is_partner_address_v_r;
   bus_compare_equal #(10) CMP_partner_address (.a(store_ack_addr_r),
                                        .b({ store_meter_partner_address_Y, store_meter_partner_address_X } ),
                                        .bus_equal(is_partner_address_v_r));

   assign store_meter_ack_partner     = is_partner_address_v_r & store_ack_received_r;
   assign store_meter_ack_non_partner = ~is_partner_address_v_r & store_ack_received_r;

//make it so that the mdn_cfg location register has
//one cycle latency when being changed
//this was done so that these flops could be put near the
//dynamic network but this does mean that the cycle directly
//folowing a mtsr MDN_CFG which changes the location bits
//will still use the old value
//likewise it would be best to make sure there are no in-flight memory
//operations when setting the X and Y location for a tile.
always @ (posedge clk)
begin
        if(reset)
        begin
                myLocY_f <= 8'd0;
                myLocX_f <= 8'd0;
                myChipID_f <= 14'd0;
        end
        else
        begin
                myLocY_f <= myLocY;
                myLocX_f <= myLocX;
                myChipID_f <= myChipID;
        end
end

// mmckeown: Removing DUMMY modules
//dummy signals
/*`ifdef NO_DUMMY
`else
   rDUMMY #(1) default_ready_n_to_s_dummy (.A(default_ready_n_to_s));

   rDUMMY #(1) default_ready_e_to_w_dummy (.A(default_ready_e_to_w));

   rDUMMY #(1) default_ready_s_to_n_dummy (.A(default_ready_s_to_n));

   rDUMMY #(1) default_ready_s_to_p_dummy (.A(default_ready_s_to_p));

   rDUMMY #(1) default_ready_w_to_e_dummy (.A(default_ready_w_to_e));
`endif

//dummy signals for detecting the critical path for the valid and data signals
`ifdef NO_DUMMY
`else
   rDUMMY #(1) valid_out_north(.A(validOut_N_internal));
   rDUMMY #(1) valid_out_east(.A(validOut_E_internal));
   rDUMMY #(1) valid_out_south(.A(validOut_S_internal));
   rDUMMY #(1) valid_out_west(.A(validOut_W_internal));
   rDUMMY #(1) valid_out_proc(.A(validOut_P_internal));

   rDUMMY #(`DATA_WIDTH) data_out_north(.A(dataOut_N_internal));
   rDUMMY #(`DATA_WIDTH) data_out_east(.A(dataOut_E_internal));
   rDUMMY #(`DATA_WIDTH) data_out_south(.A(dataOut_S_internal));
   rDUMMY #(`DATA_WIDTH) data_out_west(.A(dataOut_W_internal));
   rDUMMY #(`DATA_WIDTH) data_out_proc(.A(dataOut_P_internal));
`endif*/

//wire regs

//assigns
assign thanksIn_1 = thanks_0_to_1 | thanks_1_to_1 ;

/*
//original
assign thanksIn_P = thanks_n_to_p | thanks_e_to_p | thanks_s_to_p | thanks_w_to_p | thanks_p_to_p;
*/
//assign validOut_N = validOut_N_internal;
//assign validOut_E = validOut_E_internal;
//assign validOut_S = validOut_S_internal;
//assign validOut_W = validOut_W_internal;
assign validOut_1 = validOut_1_internal;

//assign dataOut_N = dataOut_N_internal;
//assign dataOut_E = dataOut_E_internal;
//assign dataOut_S = dataOut_S_internal;
//assign dataOut_W = dataOut_W_internal;
assign dataOut_1 = dataOut_1_internal;

//more assigns
assign yummyIn_1_internal = yummyIn_1;
assign yummyOut_1 = yummyOut_1_internal;

flip_bus #(1, 14) yummyOut_0_flip1(yummyOut_0_internal, yummyOut_0_flip1_out);

flip_bus #(1, 21) yummyOut_0_flip2(yummyOut_0_flip1_out, yummyOut_0);

flip_bus #(1, 14) validOut_0_flip1(validOut_0_internal, validOut_0_flip1_out);

flip_bus #(1, 21) validOut_0_flip2(validOut_0_flip1_out, validOut_0);

flip_bus #(64, 14) dataOut_0_flip1(dataOut_0_internal, dataOut_0_flip1_out);

flip_bus #(64, 21) dataOut_0_flip2(dataOut_0_flip1_out, dataOut_0);

flip_bus #(1, 14) yummyIn_0_flip1(yummyIn_0, yummyIn_0_flip1_out);

flip_bus #(1, 10) yummyIn_0_flip2(yummyIn_0_flip1_out, yummyIn_0_internal);

flip_bus #(1, 14) validIn_0_flip1(validIn_0, validIn_0_flip1_out);

flip_bus #(1, 10) validIn_0_flip2(validIn_0_flip1_out, validIn_0_internal);

flip_bus #(64, 14) dataIn_0_flip1(dataIn_0, dataIn_0_flip1_out);

flip_bus #(64, 10) dataIn_0_flip2(dataIn_0_flip1_out, dataIn_0_internal);


/*
//original
// two sets of inverters for output signals (buffering for timing purposes)
flip_bus #(1, 14) yummyOut_N_flip1(yummyOut_N_internal, yummyOut_N_flip1_out);
flip_bus #(1, 14) yummyOut_E_flip1(yummyOut_E_internal, yummyOut_E_flip1_out);
flip_bus #(1, 14) yummyOut_S_flip1(yummyOut_S_internal, yummyOut_S_flip1_out);
flip_bus #(1, 14) yummyOut_W_flip1(yummyOut_W_internal, yummyOut_W_flip1_out);
//flip_bus #(1, 14) yummyOut_P_flip1(yummyOut_P_internal, yummyOut_P_flip1_out);
flip_bus #(1, 21) yummyOut_N_flip2(yummyOut_N_flip1_out, yummyOut_N);
flip_bus #(1, 21) yummyOut_E_flip2(yummyOut_E_flip1_out, yummyOut_E);
flip_bus #(1, 21) yummyOut_S_flip2(yummyOut_S_flip1_out, yummyOut_S);
flip_bus #(1, 21) yummyOut_W_flip2(yummyOut_W_flip1_out, yummyOut_W);
//flip_bus #(1, 21) yummyOut_P_flip2(yummyOut_P_flip1_out, yummyOut_P);

flip_bus #(1, 14) validOut_N_flip1(validOut_N_internal, validOut_N_flip1_out);
flip_bus #(1, 14) validOut_E_flip1(validOut_E_internal, validOut_E_flip1_out);
flip_bus #(1, 14) validOut_S_flip1(validOut_S_internal, validOut_S_flip1_out);
flip_bus #(1, 14) validOut_W_flip1(validOut_W_internal, validOut_W_flip1_out);
//flip_bus #(1, 14) validOut_P_flip1(validOut_P_internal, validOut_P_flip1_out);
flip_bus #(1, 21) validOut_N_flip2(validOut_N_flip1_out, validOut_N);
flip_bus #(1, 21) validOut_E_flip2(validOut_E_flip1_out, validOut_E);
flip_bus #(1, 21) validOut_S_flip2(validOut_S_flip1_out, validOut_S);
flip_bus #(1, 21) validOut_W_flip2(validOut_W_flip1_out, validOut_W);
//flip_bus #(1, 21) validOut_P_flip2(validOut_P_flip1_out, validOut_P);

flip_bus #(`DATA_WIDTH, 14) dataOut_N_flip1(dataOut_N_internal, dataOut_N_flip1_out);
flip_bus #(`DATA_WIDTH, 14) dataOut_E_flip1(dataOut_E_internal, dataOut_E_flip1_out);
flip_bus #(`DATA_WIDTH, 14) dataOut_S_flip1(dataOut_S_internal, dataOut_S_flip1_out);
flip_bus #(`DATA_WIDTH, 14) dataOut_W_flip1(dataOut_W_internal, dataOut_W_flip1_out);
//flip_bus #(`DATA_WIDTH, 14) dataOut_P_flip1(dataOut_P_internal, dataOut_P_flip1_out);
flip_bus #(`DATA_WIDTH, 21) dataOut_N_flip2(dataOut_N_flip1_out, dataOut_N);
flip_bus #(`DATA_WIDTH, 21) dataOut_E_flip2(dataOut_E_flip1_out, dataOut_E);
flip_bus #(`DATA_WIDTH, 21) dataOut_S_flip2(dataOut_S_flip1_out, dataOut_S);
flip_bus #(`DATA_WIDTH, 21) dataOut_W_flip2(dataOut_W_flip1_out, dataOut_W);
//flip_bus #(`DATA_WIDTH, 21) dataOut_P_flip2(dataOut_P_flip1_out, dataOut_P);

// two sets of inverters for input signals (buffering for timing purposes)
flip_bus #(1, 14) yummyIn_N_flip1(yummyIn_N, yummyIn_N_flip1_out);
flip_bus #(1, 14) yummyIn_E_flip1(yummyIn_E, yummyIn_E_flip1_out);
flip_bus #(1, 14) yummyIn_S_flip1(yummyIn_S, yummyIn_S_flip1_out);
flip_bus #(1, 14) yummyIn_W_flip1(yummyIn_W, yummyIn_W_flip1_out);
//flip_bus #(1, 14) yummyIn_P_flip1(yummyIn_P, yummyIn_P_flip1_out);
flip_bus #(1, 10) yummyIn_N_flip2(yummyIn_N_flip1_out, yummyIn_N_internal);
flip_bus #(1, 10) yummyIn_E_flip2(yummyIn_E_flip1_out, yummyIn_E_internal);
flip_bus #(1, 10) yummyIn_S_flip2(yummyIn_S_flip1_out, yummyIn_S_internal);
flip_bus #(1, 10) yummyIn_W_flip2(yummyIn_W_flip1_out, yummyIn_W_internal);
//flip_bus #(1, 10) yummyIn_P_flip2(yummyIn_P_flip1_out, yummyIn_P_internal);

flip_bus #(1, 14) validIn_N_flip1(validIn_N, validIn_N_flip1_out);
flip_bus #(1, 14) validIn_E_flip1(validIn_E, validIn_E_flip1_out);
flip_bus #(1, 14) validIn_S_flip1(validIn_S, validIn_S_flip1_out);
flip_bus #(1, 14) validIn_W_flip1(validIn_W, validIn_W_flip1_out);
//flip_bus #(1, 14) validIn_P_flip1(validIn_P, validIn_P_flip1_out);
flip_bus #(1, 10) validIn_N_flip2(validIn_N_flip1_out, validIn_N_internal);
flip_bus #(1, 10) validIn_E_flip2(validIn_E_flip1_out, validIn_E_internal);
flip_bus #(1, 10) validIn_S_flip2(validIn_S_flip1_out, validIn_S_internal);
flip_bus #(1, 10) validIn_W_flip2(validIn_W_flip1_out, validIn_W_internal);
//flip_bus #(1, 10) validIn_P_flip2(validIn_P_flip1_out, validIn_P_internal);

flip_bus #(`DATA_WIDTH, 14) dataIn_N_flip1(dataIn_N, dataIn_N_flip1_out);
flip_bus #(`DATA_WIDTH, 14) dataIn_E_flip1(dataIn_E, dataIn_E_flip1_out);
flip_bus #(`DATA_WIDTH, 14) dataIn_S_flip1(dataIn_S, dataIn_S_flip1_out);
flip_bus #(`DATA_WIDTH, 14) dataIn_W_flip1(dataIn_W, dataIn_W_flip1_out);
//flip_bus #(`DATA_WIDTH, 14) dataIn_P_flip1(dataIn_P, dataIn_P_flip1_out);
flip_bus #(`DATA_WIDTH, 10) dataIn_N_flip2(dataIn_N_flip1_out, dataIn_N_internal);
flip_bus #(`DATA_WIDTH, 10) dataIn_E_flip2(dataIn_E_flip1_out, dataIn_E_internal);
flip_bus #(`DATA_WIDTH, 10) dataIn_S_flip2(dataIn_S_flip1_out, dataIn_S_internal);
flip_bus #(`DATA_WIDTH, 10) dataIn_W_flip2(dataIn_W_flip1_out, dataIn_W_internal);
//flip_bus #(`DATA_WIDTH, 10) dataIn_P_flip2(dataIn_P_flip1_out, dataIn_P_internal);
*/

//instantiations


//the following dense code impliments a full crossbar.
//The two main components are a dynamic_input_top_X and a dynamic_output_top_para

//the difference between dynamic_input_top_4_para and dynamic_input_top_16_para are the size of
//the nibs inside of them.

//dynamic inputs
dynamic_input_top_4_para node_0_input(.route_req_0_out(route_req_0_to_0), .route_req_1_out(route_req_0_to_1), .default_ready_0_out(default_ready_0_to_0), .default_ready_1_out(default_ready_0_to_1), .tail_out(node_0_input_tail), .yummy_out(yummyOut_0_internal), .data_out(node_0_input_data), .valid_out(node_0_input_valid), .clk(clk), .reset(reset), .my_loc_x_in(myLocX_f), .my_loc_y_in(myLocY_f), .my_chip_id_in(myChipID_f), .valid_in(validIn_0_internal), .data_in(dataIn_0_internal), .thanks_0(thanks_0_to_0), .thanks_1(thanks_1_to_0));
dynamic_input_top_4_para node_1_input(.route_req_0_out(route_req_1_to_0), .route_req_1_out(route_req_1_to_1), .default_ready_0_out(), .default_ready_1_out(), .tail_out(node_1_input_tail), .yummy_out(yummyOut_1_internal), .data_out(node_1_input_data), .valid_out(node_1_input_valid), .clk(clk), .reset(reset), .my_loc_x_in(myLocX_f), .my_loc_y_in(myLocY_f), .my_chip_id_in(myChipID_f), .valid_in(validIn_1), .data_in(dataIn_1), .thanks_0(thanks_0_to_1), .thanks_1(thanks_1_to_1));

/*
//original
dynamic_input_top_4 north_input(.route_req_n_out(route_req_n_to_n), .route_req_e_out(route_req_n_to_e), .route_req_s_out(route_req_n_to_s), .route_req_w_out(route_req_n_to_w), .route_req_p_out(route_req_n_to_p), .default_ready_n_out(), .default_ready_e_out(), .default_ready_s_out(default_ready_n_to_s), .default_ready_w_out(), .default_ready_p_out(), .tail_out(north_input_tail), .yummy_out(yummyOut_N_internal), .data_out(north_input_data), .valid_out(north_input_valid), .clk(clk), .reset(reset), .my_loc_x_in(myLocX_f), .my_loc_y_in(myLocY_f), .my_chip_id_in(myChipID_f), .valid_in(validIn_N_internal), .data_in(dataIn_N_internal), .thanks_n(thanks_n_to_n), .thanks_e(thanks_e_to_n), .thanks_s(thanks_s_to_n), .thanks_w(thanks_w_to_n), .thanks_p(thanks_p_to_n));

dynamic_input_top_4 east _input(.route_req_n_out(route_req_e_to_n), .route_req_e_out(route_req_e_to_e), .route_req_s_out(route_req_e_to_s), .route_req_w_out(route_req_e_to_w), .route_req_p_out(route_req_e_to_p), .default_ready_n_out(), .default_ready_e_out(), .default_ready_s_out(), .default_ready_w_out(default_ready_e_to_w), .default_ready_p_out(), .tail_out(east_input_tail), .yummy_out(yummyOut_E_internal), .data_out(east_input_data), .valid_out(east_input_valid), .clk(clk), .reset(reset), .my_loc_x_in(myLocX_f), .my_loc_y_in(myLocY_f), .my_chip_id_in(myChipID_f), .valid_in(validIn_E_internal), .data_in(dataIn_E_internal), .thanks_n(thanks_n_to_e), .thanks_e(thanks_e_to_e), .thanks_s(thanks_s_to_e), .thanks_w(thanks_w_to_e), .thanks_p(thanks_p_to_e));

dynamic_input_top_4 south_input(.route_req_n_out(route_req_s_to_n), .route_req_e_out(route_req_s_to_e), .route_req_s_out(route_req_s_to_s), .route_req_w_out(route_req_s_to_w), .route_req_p_out(route_req_s_to_p), .default_ready_n_out(default_ready_s_to_n), .default_ready_e_out(), .default_ready_s_out(), .default_ready_w_out(), .default_ready_p_out(default_ready_s_to_p), .tail_out(south_input_tail), .yummy_out(yummyOut_S_internal), .data_out(south_input_data), .valid_out(south_input_valid), .clk(clk), .reset(reset), .my_loc_x_in(myLocX_f), .my_loc_y_in(myLocY_f), .my_chip_id_in(myChipID_f), .valid_in(validIn_S_internal), .data_in(dataIn_S_internal), .thanks_n(thanks_n_to_s), .thanks_e(thanks_e_to_s), .thanks_s(thanks_s_to_s), .thanks_w(thanks_w_to_s), .thanks_p(thanks_p_to_s));

dynamic_input_top_4 west_input(.route_req_n_out(route_req_w_to_n), .route_req_e_out(route_req_w_to_e), .route_req_s_out(route_req_w_to_s), .route_req_w_out(route_req_w_to_w), .route_req_p_out(route_req_w_to_p), .default_ready_n_out(), .default_ready_e_out(default_ready_w_to_e), .default_ready_s_out(), .default_ready_w_out(), .default_ready_p_out(), .tail_out(west_input_tail), .yummy_out(yummyOut_W_internal), .data_out(west_input_data), .valid_out(west_input_valid), .clk(clk), .reset(reset), .my_loc_x_in(myLocX_f), .my_loc_y_in(myLocY_f), .my_chip_id_in(myChipID_f), .valid_in(validIn_W_internal), .data_in(dataIn_W_internal), .thanks_n(thanks_n_to_w), .thanks_e(thanks_e_to_w), .thanks_s(thanks_s_to_w), .thanks_w(thanks_w_to_w), .thanks_p(thanks_p_to_w));

dynamic_input_top_16 proc_input(.route_req_n_out(route_req_p_to_n), .route_req_e_out(route_req_p_to_e), .route_req_s_out(route_req_p_to_s), .route_req_w_out(route_req_p_to_w), .route_req_p_out(route_req_p_to_p), .default_ready_n_out(), .default_ready_e_out(), .default_ready_s_out(), .default_ready_w_out(), .default_ready_p_out(), .tail_out(proc_input_tail), .yummy_out(yummyOut_P_internal), .data_out(proc_input_data), .valid_out(proc_input_valid), .clk(clk), .reset(reset), .my_loc_x_in(myLocX_f), .my_loc_y_in(myLocY_f), .my_chip_id_in(myChipID_f), .valid_in(validIn_P), .data_in(dataIn_P), .thanks_n(thanks_n_to_p), .thanks_e(thanks_e_to_p), .thanks_s(thanks_s_to_p), .thanks_w(thanks_w_to_p), .thanks_p(thanks_p_to_p));
*/


//dynamic outputs
dynamic_output_top_para node_0_output(.data_out(dataOut_0_internal), .thanks_0_out(thanks_0_to_1), .thanks_1_out(thanks_0_to_0), .valid_out(validOut_0_internal), .popped_interrupt_mesg_out(), .popped_memory_ack_mesg_out(), .popped_memory_ack_mesg_out_sender(), .ec_wants_to_send_but_cannot(ec_wants_to_send_but_cannot_0), .clk(clk), .reset(reset), .route_req_0_in(route_req_1_to_0), .route_req_1_in(route_req_0_to_0), .tail_0_in(node_1_input_tail), .tail_1_in(node_0_input_tail), .data_0_in(node_1_input_data), .data_1_in(node_0_input_data), .valid_0_in(node_1_input_valid), .valid_1_in(node_0_input_valid), .default_ready_in(default_ready_0_to_0),.yummy_in(yummyIn_0_internal));
dynamic_output_top_para #(1'b0) node_1_output(.data_out(dataOut_1_internal), .thanks_0_out(thanks_1_to_0), .thanks_1_out(thanks_1_to_1), .valid_out(validOut_1_internal), .popped_interrupt_mesg_out(external_interrupt), .popped_memory_ack_mesg_out(store_ack_received), .popped_memory_ack_mesg_out_sender(store_ack_addr), .ec_wants_to_send_but_cannot(ec_wants_to_send_but_cannot_1), .clk(clk), .reset(reset), .route_req_0_in(route_req_0_to_1), .route_req_1_in(route_req_1_to_1), .tail_0_in(node_0_input_tail), .tail_1_in(node_1_input_tail), .data_0_in(node_0_input_data), .data_1_in(node_1_input_data), .valid_0_in(node_0_input_valid), .valid_1_in(node_1_input_valid), .default_ready_in(default_ready_0_to_1),.yummy_in(yummyIn_1_internal));

/*
//original
dynamic_output_top north_output(.data_out(dataOut_N_internal), .thanks_a_out(thanks_n_to_s), .thanks_b_out(thanks_n_to_w), .thanks_c_out(thanks_n_to_p), .thanks_d_out(thanks_n_to_e), .thanks_x_out(thanks_n_to_n), .valid_out(validOut_N_internal),  .popped_interrupt_mesg_out(), .popped_memory_ack_mesg_out(), .popped_memory_ack_mesg_out_sender(), .ec_wants_to_send_but_cannot(ec_wants_to_send_but_cannot_N), .clk(clk), .reset(reset), .route_req_a_in(route_req_s_to_n), .route_req_b_in(route_req_w_to_n), .route_req_c_in(route_req_p_to_n), .route_req_d_in(route_req_e_to_n), .route_req_x_in(route_req_n_to_n), .tail_a_in(south_input_tail), .tail_b_in(west_input_tail), .tail_c_in(proc_input_tail), .tail_d_in(east_input_tail), .tail_x_in(north_input_tail), .data_a_in(south_input_data), .data_b_in(west_input_data), .data_c_in(proc_input_data), .data_d_in(east_input_data), .data_x_in(north_input_data), .valid_a_in(south_input_valid), .valid_b_in(west_input_valid), .valid_c_in(proc_input_valid), .valid_d_in(east_input_valid), .valid_x_in(north_input_valid), .default_ready_in(default_ready_s_to_n), .yummy_in(yummyIn_N_internal));

dynamic_output_top east_output(.data_out(dataOut_E_internal), .thanks_a_out(thanks_e_to_w), .thanks_b_out(thanks_e_to_p), .thanks_c_out(thanks_e_to_n), .thanks_d_out(thanks_e_to_s), .thanks_x_out(thanks_e_to_e), .valid_out(validOut_E_internal),   .popped_interrupt_mesg_out(), .popped_memory_ack_mesg_out(), .popped_memory_ack_mesg_out_sender(),  .ec_wants_to_send_but_cannot(ec_wants_to_send_but_cannot_E), .clk(clk), .reset(reset), .route_req_a_in(route_req_w_to_e), .route_req_b_in(route_req_p_to_e), .route_req_c_in(route_req_n_to_e), .route_req_d_in(route_req_s_to_e), .route_req_x_in(route_req_e_to_e), .tail_a_in(west_input_tail), .tail_b_in(proc_input_tail), .tail_c_in(north_input_tail), .tail_d_in(south_input_tail), .tail_x_in(east_input_tail), .data_a_in(west_input_data), .data_b_in(proc_input_data), .data_c_in(north_input_data), .data_d_in(south_input_data), .data_x_in(east_input_data), .valid_a_in(west_input_valid), .valid_b_in(proc_input_valid), .valid_c_in(north_input_valid), .valid_d_in(south_input_valid), .valid_x_in(east_input_valid), .default_ready_in(default_ready_w_to_e), .yummy_in(yummyIn_E_internal));

dynamic_output_top south_output(.data_out(dataOut_S_internal), .thanks_a_out(thanks_s_to_n), .thanks_b_out(thanks_s_to_e), .thanks_c_out(thanks_s_to_w), .thanks_d_out(thanks_s_to_p), .thanks_x_out(thanks_s_to_s), .valid_out(validOut_S_internal),   .popped_interrupt_mesg_out(), .popped_memory_ack_mesg_out(), .popped_memory_ack_mesg_out_sender(),  .ec_wants_to_send_but_cannot(ec_wants_to_send_but_cannot_S), .clk(clk), .reset(reset), .route_req_a_in(route_req_n_to_s), .route_req_b_in(route_req_e_to_s), .route_req_c_in(route_req_w_to_s), .route_req_d_in(route_req_p_to_s), .route_req_x_in(route_req_s_to_s), .tail_a_in(north_input_tail), .tail_b_in(east_input_tail), .tail_c_in(west_input_tail), .tail_d_in(proc_input_tail), .tail_x_in(south_input_tail), .data_a_in(north_input_data), .data_b_in(east_input_data), .data_c_in(west_input_data), .data_d_in(proc_input_data), .data_x_in(south_input_data), .valid_a_in(north_input_valid), .valid_b_in(east_input_valid), .valid_c_in(west_input_valid), .valid_d_in(proc_input_valid), .valid_x_in(south_input_valid), .default_ready_in(default_ready_n_to_s), .yummy_in(yummyIn_S_internal));

dynamic_output_top west_output(.data_out(dataOut_W_internal), .thanks_a_out(thanks_w_to_e), .thanks_b_out(thanks_w_to_s), .thanks_c_out(thanks_w_to_p), .thanks_d_out(thanks_w_to_n), .thanks_x_out(thanks_w_to_w), .valid_out(validOut_W_internal),   .popped_interrupt_mesg_out(), .popped_memory_ack_mesg_out(), .popped_memory_ack_mesg_out_sender(),  .ec_wants_to_send_but_cannot(ec_wants_to_send_but_cannot_W), .clk(clk), .reset(reset), .route_req_a_in(route_req_e_to_w), .route_req_b_in(route_req_s_to_w), .route_req_c_in(route_req_p_to_w), .route_req_d_in(route_req_n_to_w), .route_req_x_in(route_req_w_to_w), .tail_a_in(east_input_tail), .tail_b_in(south_input_tail), .tail_c_in(proc_input_tail), .tail_d_in(north_input_tail), .tail_x_in(west_input_tail), .data_a_in(east_input_data), .data_b_in(south_input_data), .data_c_in(proc_input_data), .data_d_in(north_input_data), .data_x_in(west_input_data), .valid_a_in(east_input_valid), .valid_b_in(south_input_valid), .valid_c_in(proc_input_valid), .valid_d_in(north_input_valid), .valid_x_in(west_input_valid), .default_ready_in(default_ready_e_to_w), .yummy_in(yummyIn_W_internal));
//yanqi change kill headers to 0
dynamic_output_top #(1'b0) proc_output(.data_out(dataOut_P_internal), .thanks_a_out(thanks_p_to_s), .thanks_b_out(thanks_p_to_w), .thanks_c_out(thanks_p_to_n), .thanks_d_out(thanks_p_to_e), .thanks_x_out(thanks_p_to_p), .valid_out(validOut_P_internal),  .popped_interrupt_mesg_out(external_interrupt), .popped_memory_ack_mesg_out(store_ack_received), .popped_memory_ack_mesg_out_sender(store_ack_addr),  .ec_wants_to_send_but_cannot(ec_wants_to_send_but_cannot_P), .clk(clk), .reset(reset), .route_req_a_in(route_req_s_to_p), .route_req_b_in(route_req_w_to_p), .route_req_c_in(route_req_n_to_p), .route_req_d_in(route_req_e_to_p), .route_req_x_in(route_req_p_to_p), .tail_a_in(south_input_tail), .tail_b_in(west_input_tail), .tail_c_in(north_input_tail), .tail_d_in(east_input_tail), .tail_x_in(proc_input_tail), .data_a_in(south_input_data), .data_b_in(west_input_data), .data_c_in(north_input_data), .data_d_in(east_input_data), .data_x_in(proc_input_data), .valid_a_in(south_input_valid), .valid_b_in(west_input_valid), .valid_c_in(north_input_valid), .valid_d_in(east_input_valid), .valid_x_in(proc_input_valid), .default_ready_in(default_ready_s_to_p), .yummy_in(yummyIn_P_internal));
*/

endmodule // dynamic_node
// Copyright (c) 2015 Princeton University
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

/****************************************************************************
 *
 *   FILE: credit_to_valrdy.v
 *
 *   Modified: Yaosheng Fu
 *   Date: May 2 2014

 ***************************************************************************/

/*
Copyright (c) 2015 Princeton University
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

/////////////////////////////////////////////////////////////////////////////////////////////
// 63         50 49      42 41      34 33           30 29      22 21                 0   
// ------------------------------------------------------------------------------------
// |            |          |          |               |          |                    |
// |  Chip ID   |  Dest X  |  Dest Y  |  Final Route  |  Length  |    Header Payload  | 
// |            |          |          |               |          |                    |
// ------------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////////////////////











 //whether the routing is based on chipid or x y position
 //`define    ROUTING_CHIP_ID
 

 //defines for different topology, only one should be active
 //`define    NETWORK_TOPO_2D_MESH
 //`define    NETWORK_TOPO_3D_MESH
 

module credit_to_valrdy (
   clk,
   reset,
   //credit based interface	
   data_in,
   valid_in,
   yummy_in,
            
   //val/rdy interface
   data_out,
   valid_out,
   ready_out
);

   input	 clk;
   input	 reset;
   input [64-1:0]	 data_in;
   input	 valid_in;
   input     ready_out;
    
   output	 yummy_in;
   output	 valid_out;
   output [64-1:0] data_out;
   
   wire	 thanksIn;

   wire valid_out_temp;

   assign valid_out = valid_out_temp;

   network_input_blk_multi_out #(.LOG2_NUMBER_FIFO_ELEMENTS(2)) data(
      .clk(clk),
      .reset(reset),
      .data_in(data_in),
      .valid_in(valid_in),

      .thanks_in(valid_out & ready_out),

      .yummy_out(yummy_in),
      .data_val(data_out),
      .data_val1(/*not used*/),
      .data_avail(valid_out_temp));

endmodule



// Copyright (c) 2015 Princeton University
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

//File: valrdy_to_credit.v (modified from space_avail_top.v)
//
//Modified: Yaosheng Fu
//May 2, 2014
//
//Function: This module keeps track of how many spots are free in the NIB that
//	we are sending to
//
//State: count_f, yummy_out_f, valid_in_f
//
//Instantiates: 
//

module valrdy_to_credit (
            clk,
            reset,
                
            //val/rdy interface
            data_in,
            valid_in,
            ready_in,

			//credit based interface	
            data_out,
            valid_out,
		    yummy_out);

parameter BUFFER_SIZE = 4;
parameter BUFFER_BITS = 3;
   
input clk;
input reset;

 
input [64-1:0]	 data_in;
 input valid_in;			// sending data to the output
 input yummy_out;			// output consumed data

output [64-1:0]  data_out;
 output valid_out;
 output ready_in;		// is there space available?


//This is the state
 reg yummy_out_f;
 reg valid_temp_f;
 reg [BUFFER_BITS-1:0] count_f;

reg is_one_f;
 reg is_two_or_more_f;

//wires
 wire [BUFFER_BITS-1:0] count_plus_1;
 wire [BUFFER_BITS-1:0] count_minus_1;
 wire up;
 wire down;

 wire valid_temp;

//wire regs
  reg [BUFFER_BITS-1:0] count_temp;


//assigns
assign data_out = data_in;
assign valid_temp = valid_in & ready_in;
assign valid_out = valid_temp;

assign count_plus_1 = count_f + 1'b1;
assign count_minus_1 = count_f - 1'b1;
assign ready_in = is_two_or_more_f;
assign up = yummy_out_f & ~valid_temp_f;
assign down = ~yummy_out_f & valid_temp_f;

always @ (count_f or count_plus_1 or count_minus_1 or up or down)
begin
	case (count_f)
	0:
		begin
			if(up)
			begin
				count_temp <= count_plus_1;
			end
			else
			begin
				count_temp <= count_f;
			end
		end
	BUFFER_SIZE:
		begin
			if(down)
			begin
				count_temp <= count_minus_1;
			end
			else
			begin
				count_temp <= count_f;
			end
		end
	default:
		begin
			case ({up, down})
				2'b10:	count_temp <= count_plus_1;
				2'b01:	count_temp <= count_minus_1;
				default:	count_temp <= count_f;
			endcase
		end
	endcase
end

//wire top_bits_zero_temp = ~| count_temp[BUFFER_BITS-1:1];
 wire top_bits_zero_temp = count_temp < 3 ? 1 : 0;

always @ (posedge clk)
begin
	if(reset)
	begin
	   count_f <= BUFFER_SIZE;
	   yummy_out_f <= 1'b0;
	   valid_temp_f <= 1'b0;
	   is_one_f <= (BUFFER_SIZE == 1);
	   is_two_or_more_f <= (BUFFER_SIZE >= 2);
	end
	else
	begin
	   count_f <= count_temp;
	   yummy_out_f <= yummy_out;
	   valid_temp_f <= valid_temp;
	   is_one_f         <= top_bits_zero_temp & count_temp[0];
   	   is_two_or_more_f <= ~top_bits_zero_temp;
	end
end

endmodule
      
/*
Copyright (c) 2015 Princeton University
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

/*
Copyright (c) 2015 Princeton University
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

//l15.h
// Copyright (c) 2015 Princeton University
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

//==================================================================================================
//  Filename      : define.h
//  Created On    : 2014-02-20
//  Last Modified : 2018-11-16 17:14:11
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : main header file defining global architecture parameters
//
//
//==================================================================================================


































































































































































































































































































































































































































































































































































































// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iop.h
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/
//-*- verilog -*-
////////////////////////////////////////////////////////////////////////
/*
//
//  Description:	Global header file that contain definitions that 
//                      are common/shared at the IOP chip level
*/
////////////////////////////////////////////////////////////////////////


// Address Map Defines
// ===================




// CMP space



// IOP space




                               //`define ENET_ING_CSR     8'h84
                               //`define ENET_EGR_CMD_CSR 8'h85















// L2 space



// More IOP space





//Cache Crossbar Width and Field Defines
//======================================













































//bits 133:128 are shared by different fields
//for different packet types.
























//`define CPX_INV_PA_HI   116
//`define CPX_INV_PA_LO   112






// cache invalidation format
// `define CPX_INV_DCACHE_WORD0_VAL 0
// `define CPX_INV_ICACHE_WORD0_VAL 1
// `define CPX_INV_WORD0_WAY 5:2
// `define CPX_INV_DCACHE_WORD0_VAL 6
// `define CPX_INV_ICACHE_WORD0_VAL 7
// `define CPX_INV_WORD0_WAY 11:8
// `define CPX_INV_DCACHE_WORD0_VAL 12
// // `define CPX_INV_ICACHE_WORD0_VAL 13
// `define CPX_INV_WORD0_WAY 17:14
// `define CPX_INV_DCACHE_WORD0_VAL 18
// // `define CPX_INV_ICACHE_WORD0_VAL 19
// `define CPX_INV_WORD0_WAY 23:20




// 4 extra bits for bigger icache/dcache
// up to 512KB l1 icache, 256KB l1 dcache

































//Pico defines













//End cache crossbar defines


// Number of COS supported by EECU 



// 
// BSC bus sizes
// =============
//

// General




// CTags













// reinstated temporarily




// CoS






// L2$ Bank



// L2$ Req













// L2$ Ack








// Enet Egress Command Unit














// Enet Egress Packet Unit













// This is cleaved in between Egress Datapath Ack's








// Enet Egress Datapath
















// In-Order / Ordered Queue: EEPU
// Tag is: TLEN, SOF, EOF, QID = 15






// Nack + Tag Info + CTag




// ENET Ingress Queue Management Req












// ENET Ingress Queue Management Ack








// Enet Ingress Packet Unit












// ENET Ingress Packet Unit Ack







// In-Order / Ordered Queue: PCI
// Tag is: CTAG





// PCI-X Request











// PCI_X Acknowledge











//
// BSC array sizes
//================
//












// ECC syndrome bits per memory element




//
// BSC Port Definitions
// ====================
//
// Bits 7 to 4 of curr_port_id








// Number of ports of each type


// Bits needed to represent above


// How wide the linked list pointers are
// 60b for no payload (2CoS)
// 80b for payload (2CoS)

//`define BSC_OBJ_PTR   80
//`define BSC_HD1_HI    69
//`define BSC_HD1_LO    60
//`define BSC_TL1_HI    59
//`define BSC_TL1_LO    50
//`define BSC_CT1_HI    49
//`define BSC_CT1_LO    40
//`define BSC_HD0_HI    29
//`define BSC_HD0_LO    20
//`define BSC_TL0_HI    19
//`define BSC_TL0_LO    10
//`define BSC_CT0_HI     9
//`define BSC_CT0_LO     0


































// I2C STATES in DRAMctl







//
// IOB defines
// ===========
//



















//`define IOB_INT_STAT_WIDTH   32
//`define IOB_INT_STAT_HI      31
//`define IOB_INT_STAT_LO       0

















































// fixme - double check address mapping
// CREG in `IOB_INT_CSR space










// CREG in `IOB_MAN_CSR space





































// Address map for TAP access of SPARC ASI













//
// CIOP UCB Bus Width
// ==================
//
//`define IOB_EECU_WIDTH       16  // ethernet egress command
//`define EECU_IOB_WIDTH       16

//`define IOB_NRAM_WIDTH       16  // NRAM (RLDRAM previously)
//`define NRAM_IOB_WIDTH        4




//`define IOB_ENET_ING_WIDTH   32  // ethernet ingress
//`define ENET_ING_IOB_WIDTH    8

//`define IOB_ENET_EGR_WIDTH    4  // ethernet egress
//`define ENET_EGR_IOB_WIDTH    4

//`define IOB_ENET_MAC_WIDTH    4  // ethernet MAC
//`define ENET_MAC_IOB_WIDTH    4




//`define IOB_BSC_WIDTH         4  // BSC
//`define BSC_IOB_WIDTH         4







//`define IOB_CLSP_WIDTH        4  // clk spine unit
//`define CLSP_IOB_WIDTH        4





//
// CIOP UCB Buf ID Type
// ====================
//



//
// Interrupt Device ID
// ===================
//
// Caution: DUMMY_DEV_ID has to be 9 bit wide
//          for fields to line up properly in the IOB.



//
// Soft Error related definitions 
// ==============================
//



//
// CMP clock
// =========
//




//
// NRAM/IO Interface
// =================
//










//
// NRAM/ENET Interface
// ===================
//







//
// IO/FCRAM Interface
// ==================
//






//
// PCI Interface
// ==================
// Load/store size encodings
// -------------------------
// Size encoding
// 000 - byte
// 001 - half-word
// 010 - word
// 011 - double-word
// 100 - quad






//
// JBI<->SCTAG Interface
// =======================
// Outbound Header Format



























// Inbound Header Format




















//
// JBI->IOB Mondo Header Format
// ============================
//














// JBI->IOB Mondo Bus Width/Cycle
// ==============================
// Cycle  1 Header[15:8]
// Cycle  2 Header[ 7:0]
// Cycle  3 J_AD[127:120]
// Cycle  4 J_AD[119:112]
// .....
// Cycle 18 J_AD[  7:  0]









































































































































































































































































































































































































































































































































































































































































































































































// Copyright (c) 2015 Princeton University
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

//==================================================================================================
//  Filename      : define.h
//  Created On    : 2014-02-20
//  Last Modified : 2018-11-16 17:14:11
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : main header file defining global architecture parameters
//
//
//==================================================================================================



































































































































































































































































































































































































































































































































































































// /tigress/pjj/openpiton/single-file/princeton-parallel-processor/piton/verif/env/manycore/devices.xml



module flat_id_to_xy(
    input  [(6-1):0] flat_id,
    output reg [(8-1):0] x_coord,
    output reg [(8-1):0] y_coord
);

    always @*
    begin
        case (flat_id)
        
//(`NOC_Y_WIDTH+`NOC_X_WIDTH)'d0: 
6'd0: 
begin
    x_coord = 3'd0;
    y_coord = 3'd0;
end

        default:
        begin
            x_coord = 3'dX;
            y_coord = 3'dX;
        end
        endcase
    end
endmodule
// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: ucb_bus_in.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
//
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
//
// The above named program is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
//
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
//
// ========== Copyright Header End ============================================
////////////////////////////////////////////////////////////////////////
/*
//  Module Name:	ucb_bus_in (ucb bus inbound interface block)
//  Description:	This interface block is instaniated by the
//                      UCB modules and IO Bridge to receive packets
//                      on the UCB bus.
*/
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: sys.h
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/
// -*- verilog -*-
////////////////////////////////////////////////////////////////////////
/*
//
// Description:		Global header file that contain definitions that 
//                      are common/shared at the systme level
*/
////////////////////////////////////////////////////////////////////////
//
// Setting the time scale
// If the timescale changes, JP_TIMESCALE may also have to change.
`timescale	1ps/1ps
`default_nettype wire

//
// Number of threads in a core
// ===========================
//

//`define CONFIG_NUM_THREADS // This must be defined for any of below to work
//`define THREADS_1
//`define THREADS_2
//`define THREADS_3


//
// JBUS clock
// =========
//
// `define SYSCLK_PERIOD   5000


// Afara Link Defines
// ==================

// Reliable Link




// Afara Link Objects


// Afara Link Object Format - Reliable Link










// Afara Link Object Format - Congestion



  







// Afara Link Object Format - Acknowledge











// Afara Link Object Format - Request

















// Afara Link Object Format - Message



// Acknowledge Types




// Request Types





// Afara Link Frame



//
// UCB Packet Type
// ===============
//

















//
// UCB Data Packet Format
// ======================
//






























// Size encoding for the UCB_SIZE_HI/LO field
// 000 - byte
// 001 - half-word
// 010 - word
// 011 - double-word
// 111 - quad-word







//
// UCB Interrupt Packet Format
// ===========================
//










//`define UCB_THR_HI             9      // (6) cpu/thread ID shared with
//`define UCB_THR_LO             4             data packet format
//`define UCB_PKT_HI             3      // (4) packet type shared with
//`define UCB_PKT_LO             0      //     data packet format







//
// FCRAM Bus Widths
// ================
//






//
// ENET clock periods
// ==================
//
// `define AXGRMII_CLK_PERIOD          6400 // 312.5MHz/2
// `define ENET_GMAC_CLK_PERIOD        8000 // 125MHz


//
// JBus Bridge defines
// =================
//
// `define      SYS_UPA_CLK        `SYS.upa_clk
// `define      SYS_J_CLK          `SYS.j_clk
// `define      SYS_P_CLK          `SYS.p_clk
// `define      SYS_G_CLK          `SYS.g_clk
// `define      JP_TIMESCALE       `timescale 1 ps / 1 ps
// `define      PCI_CLK_PERIOD     15152                  //  66 MHz
// `define      UPA_RD_CLK_PERIOD  6666                   // 150 MHz
// `define      UPA_REF_CLK_PERIOD 7576                   // 132 MHz
// `define      ICHIP_CLK_PERIOD   30304                  //  33 MHz


//
// PCI Device Address Configuration
// ================================
//























// system level definition file which contains the
			// time scale definition

////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////
// Interface signal list declarations
////////////////////////////////////////////////////////////////////////
module ucb_bus_in (/*AUTOARG*/
   // Outputs
   stall, indata_buf_vld, indata_buf,
   // Inputs
   rst_l, clk, vld, data, stall_a1
   );

   // synopsys template

   parameter UCB_BUS_WIDTH = 32;
   parameter REG_WIDTH = 64;


////////////////////////////////////////////////////////////////////////
// Signal declarations
////////////////////////////////////////////////////////////////////////
   // Global interface
   input                     rst_l;
   input 		     clk;


   // UCB bus interface
   input 		     vld;
   input [UCB_BUS_WIDTH-1:0] data;
   output 		     stall;


   // Local interface
   output 		     indata_buf_vld;
   output [REG_WIDTH+63:0]   indata_buf;
   input 		     stall_a1; // would this prevent indata_buf to change?


   // Internal signals
   wire 		     vld_d1;
   wire 		     stall_d1;
   wire [UCB_BUS_WIDTH-1:0]  data_d1;
   wire 		     skid_buf0_en;
   wire 		     vld_buf0;
   wire [UCB_BUS_WIDTH-1:0]  data_buf0;
   wire 		     skid_buf1_en;
   wire 		     vld_buf1;
   wire [UCB_BUS_WIDTH-1:0]  data_buf1;
   wire 		     skid_buf0_sel;
   wire 		     skid_buf1_sel;
   wire 		     vld_mux;
   wire [UCB_BUS_WIDTH-1:0]  data_mux;
   wire [(REG_WIDTH+64)/UCB_BUS_WIDTH-1:0] indata_vec_next;
   wire [(REG_WIDTH+64)/UCB_BUS_WIDTH-1:0] indata_vec;
   wire [REG_WIDTH+63:0]     indata_buf_next;
   wire 		     indata_vec0_d1;


////////////////////////////////////////////////////////////////////////
// Code starts here
////////////////////////////////////////////////////////////////////////
   /************************************************************
    * UCB bus interface flops
    * This is to make signals going between IOB and UCB flop-to-flop
    * to improve timing.
    ************************************************************/
   dffrle_ns #(1) vld_d1_ff (.din(vld),
			     .rst_l(rst_l),
			     .en(~stall_d1),
			     .clk(clk),
			     .q(vld_d1));

   dffe_ns #(UCB_BUS_WIDTH) data_d1_ff (.din(data),
					.en(~stall_d1),
					.clk(clk),
					.q(data_d1));

   dffrl_ns #(1) stall_ff (.din(stall_a1),
			   .clk(clk),
			   .rst_l(rst_l),
			   .q(stall));

   dffrl_ns #(1) stall_d1_ff (.din(stall),
			      .clk(clk),
			      .rst_l(rst_l),
			      .q(stall_d1));


   /************************************************************
    * Skid buffer
    * We need a two deep skid buffer to handle stalling.
    ************************************************************/
   // Assertion: stall has to be deasserted for more than 1 cycle
   //            ie time between two separate stalls has to be
   //            at least two cycles.  Otherwise, contents from
   //            skid buffer will be lost.

   // Buffer 0
   assign 	 skid_buf0_en = stall_a1 & ~stall;

   dffrle_ns #(1) vld_buf0_ff (.din(vld_d1),
			       .rst_l(rst_l),
			       .en(skid_buf0_en),
			       .clk(clk),
			       .q(vld_buf0));

   dffe_ns #(UCB_BUS_WIDTH) data_buf0_ff (.din(data_d1),
					  .en(skid_buf0_en),
					  .clk(clk),
					  .q(data_buf0));

   // Buffer 1
   dffrl_ns #(1) skid_buf1_en_ff (.din(skid_buf0_en),
				  .clk(clk),
				  .rst_l(rst_l),
				  .q(skid_buf1_en));

   dffrle_ns #(1) vld_buf1_ff (.din(vld_d1),
			       .rst_l(rst_l),
			       .en(skid_buf1_en),
			       .clk(clk),
			       .q(vld_buf1));

   dffe_ns #(UCB_BUS_WIDTH) data_buf1_ff (.din(data_d1),
					  .en(skid_buf1_en),
					  .clk(clk),
					  .q(data_buf1));


   /************************************************************
    * Mux between skid buffer and interface flop
    ************************************************************/
   // Assertion: stall has to be deasserted for more than 1 cycle
   //            ie time between two separate stalls has to be
   //            at least two cycles.  Otherwise, contents from
   //            skid buffer will be lost.

   assign 	 skid_buf0_sel = ~stall_a1 & stall;

   dffrl_ns #(1) skid_buf1_sel_ff (.din(skid_buf0_sel),
				   .clk(clk),
				   .rst_l(rst_l),
				   .q(skid_buf1_sel));

   assign 	 vld_mux = skid_buf0_sel ? vld_buf0 :
		           skid_buf1_sel ? vld_buf1 :
		                           vld_d1;

   assign 	 data_mux = skid_buf0_sel ? data_buf0 :
		            skid_buf1_sel ? data_buf1 :
		                            data_d1;


   /************************************************************
    * Assemble inbound data
    ************************************************************/
   // valid vector
   assign 	 indata_vec_next = {vld_mux,
				    indata_vec[(REG_WIDTH+64)/UCB_BUS_WIDTH-1:1]};
   dffrle_ns #((REG_WIDTH+64)/UCB_BUS_WIDTH) indata_vec_ff (.din(indata_vec_next),
							    .en(~stall_a1),
							    .rst_l(rst_l),
							    .clk(clk),
							    .q(indata_vec));

   // data buffer
   assign 	 indata_buf_next = {data_mux,
				    indata_buf[REG_WIDTH+63:UCB_BUS_WIDTH]};
   dffe_ns #(REG_WIDTH+64) indata_buf_ff (.din(indata_buf_next),
					  .en(~stall_a1),
					  .clk(clk),
					  .q(indata_buf));

   // detect a new packet
   dffrle_ns #(1) indata_vec0_d1_ff (.din(indata_vec[0]),
				     .rst_l(rst_l),
				     .en(~stall_a1),
				     .clk(clk),
				     .q(indata_vec0_d1));

   assign        indata_buf_vld = indata_vec[0] & ~indata_vec0_d1;


endmodule // ucb_bus_in
// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: ucb_bus_out.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
//
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
//
// The above named program is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
//
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
//
// ========== Copyright Header End ============================================
////////////////////////////////////////////////////////////////////////
/*
//  Module Name:        ucb_bus_out (ucb bus outbound interface block)
//	Description:	This interface block is instantiated by the
//                      UCB modules and IO Bridge to transmit packets
//                      on the UCB bus.
*/
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: sys.h
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/
// -*- verilog -*-
////////////////////////////////////////////////////////////////////////
/*
//
// Description:		Global header file that contain definitions that 
//                      are common/shared at the systme level
*/
////////////////////////////////////////////////////////////////////////
//
// Setting the time scale
// If the timescale changes, JP_TIMESCALE may also have to change.
`timescale	1ps/1ps
`default_nettype wire

//
// Number of threads in a core
// ===========================
//

//`define CONFIG_NUM_THREADS // This must be defined for any of below to work
//`define THREADS_1
//`define THREADS_2
//`define THREADS_3


//
// JBUS clock
// =========
//
// `define SYSCLK_PERIOD   5000


// Afara Link Defines
// ==================

// Reliable Link




// Afara Link Objects


// Afara Link Object Format - Reliable Link










// Afara Link Object Format - Congestion



  







// Afara Link Object Format - Acknowledge











// Afara Link Object Format - Request

















// Afara Link Object Format - Message



// Acknowledge Types




// Request Types





// Afara Link Frame



//
// UCB Packet Type
// ===============
//

















//
// UCB Data Packet Format
// ======================
//






























// Size encoding for the UCB_SIZE_HI/LO field
// 000 - byte
// 001 - half-word
// 010 - word
// 011 - double-word
// 111 - quad-word







//
// UCB Interrupt Packet Format
// ===========================
//










//`define UCB_THR_HI             9      // (6) cpu/thread ID shared with
//`define UCB_THR_LO             4             data packet format
//`define UCB_PKT_HI             3      // (4) packet type shared with
//`define UCB_PKT_LO             0      //     data packet format







//
// FCRAM Bus Widths
// ================
//






//
// ENET clock periods
// ==================
//
// `define AXGRMII_CLK_PERIOD          6400 // 312.5MHz/2
// `define ENET_GMAC_CLK_PERIOD        8000 // 125MHz


//
// JBus Bridge defines
// =================
//
// `define      SYS_UPA_CLK        `SYS.upa_clk
// `define      SYS_J_CLK          `SYS.j_clk
// `define      SYS_P_CLK          `SYS.p_clk
// `define      SYS_G_CLK          `SYS.g_clk
// `define      JP_TIMESCALE       `timescale 1 ps / 1 ps
// `define      PCI_CLK_PERIOD     15152                  //  66 MHz
// `define      UPA_RD_CLK_PERIOD  6666                   // 150 MHz
// `define      UPA_REF_CLK_PERIOD 7576                   // 132 MHz
// `define      ICHIP_CLK_PERIOD   30304                  //  33 MHz


//
// PCI Device Address Configuration
// ================================
//























// system level definition file which
                        // contains the time scale definition

////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////

module ucb_bus_out (/*AUTOARG*/
   // Outputs
   vld, data, outdata_buf_busy,
   // Inputs
   clk, rst_l, stall, outdata_buf_in, outdata_vec_in, outdata_buf_wr
   );

   // synopsys template

   parameter UCB_BUS_WIDTH = 32;
   parameter REG_WIDTH = 64;            // maximum data bits that needs to
                                        // be sent.  Set to 64 or 128

   // Globals
   input                                clk;
   input 				rst_l;


   // UCB bus interface
   output 				vld;
   output [UCB_BUS_WIDTH-1:0] 		data;
   input 				stall;


   // Local interface
   output 				outdata_buf_busy;  // busy outputting, can't accept data into buffer
   input [REG_WIDTH+63:0] 		outdata_buf_in;
   input [(REG_WIDTH+64)/UCB_BUS_WIDTH-1:0] outdata_vec_in; // indicating how much data to send
   input 				outdata_buf_wr;


   // Local signals
   wire 				stall_d1;
   wire [(REG_WIDTH+64)/UCB_BUS_WIDTH-1:0] 	outdata_vec;
   wire [(REG_WIDTH+64)/UCB_BUS_WIDTH-1:0] 	outdata_vec_next;
   wire [REG_WIDTH+63:0] 		outdata_buf;
   reg [REG_WIDTH+63:0] 		outdata_buf_next;
   wire 				load_outdata;
   wire 				shift_outdata;


////////////////////////////////////////////////////////////////////////
// Code starts here
////////////////////////////////////////////////////////////////////////
   /************************************************************
    * UCB bus interface flops
    ************************************************************/
   assign 	 vld = outdata_vec[0];
   // assign 	 data = vld ? outdata_buf[UCB_BUS_WIDTH-1:0] : `UCB_BUS_WIDTH'b0;
   assign    data = outdata_buf[UCB_BUS_WIDTH-1:0];

   dffrl_ns #(1) stall_d1_ff (.din(stall),
                              .clk(clk),
                              .rst_l(rst_l),
                              .q(stall_d1));


   /************************************************************
    * Outbound Data
    ************************************************************/
   // accept new data only if there is none being processed
   assign 	 load_outdata = outdata_buf_wr & ~outdata_buf_busy;

   assign 	 outdata_buf_busy = outdata_vec[0] | stall_d1;

   // only shifts when then input vector is a straight valids
   assign 	 shift_outdata = outdata_vec[0] & ~stall_d1;

   assign 	 outdata_vec_next =
		 load_outdata  ? outdata_vec_in:
		 shift_outdata ? outdata_vec >> 1:
	                         outdata_vec;
   dffrl_ns #((REG_WIDTH+64)/UCB_BUS_WIDTH) outdata_vec_ff (.din(outdata_vec_next),
							    .clk(clk),
							    .rst_l(rst_l),
							    .q(outdata_vec));

   // assign 	 outdata_buf_next =
		 // load_outdata  ? outdata_buf_in:
		 // shift_outdata ? (outdata_buf >> UCB_BUS_WIDTH):
	  //                        outdata_buf;
   always @ *
   begin
      if (load_outdata)
         outdata_buf_next = outdata_buf_in;
      else if (shift_outdata)
      begin
         outdata_buf_next = outdata_buf >> UCB_BUS_WIDTH;
         if (outdata_vec[1] == 1'b0)
            outdata_buf_next[UCB_BUS_WIDTH-1:0] = 0;
      end
      else
         outdata_buf_next = outdata_buf; // no shifting
   end

   dff_ns #(REG_WIDTH+64) outdata_buf_ff (.din(outdata_buf_next),
					  .clk(clk),
					  .q(outdata_buf));


endmodule // ucb_bus_out






// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: ucb_flow_2buf.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
////////////////////////////////////////////////////////////////////////
/*
//  Module Name:        ucb_flow_2buf
//	Description:	Unit Control Block
//                      - supports 64-bit or 128-bit read with flow control
//                      - supports 64-bit write with flow control
//                      - automactically drops non-64-bit writes
//                      - supports interrupt return to IO Bridge
//                      - provides 1+2 deep buffer for incoming requests
//                        from the IO Bridge
//                      - provides single buffer for returns going back
//                        to the IO Bridge
//
//                      This module is intended for units that have
//                      64-bit (no 128-bit) registers.
//
//                      Data bus width to and from the IO Bridge is
//                      configured through parameters UCB_IOB_WIDTH and
//                      IOB_UCB_WIDTH.  Supported widths are:
//
//                      IOB_UCB_WIDTH  UCB_IOB_WIDTH
//                      ----------------------------
//                      32             8
//                      16             8
//                       8             8
//                       4             4             
 */ 
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: sys.h
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/
// -*- verilog -*-
////////////////////////////////////////////////////////////////////////
/*
//
// Description:		Global header file that contain definitions that 
//                      are common/shared at the systme level
*/
////////////////////////////////////////////////////////////////////////
//
// Setting the time scale
// If the timescale changes, JP_TIMESCALE may also have to change.
`timescale	1ps/1ps
`default_nettype wire

//
// Number of threads in a core
// ===========================
//

//`define CONFIG_NUM_THREADS // This must be defined for any of below to work
//`define THREADS_1
//`define THREADS_2
//`define THREADS_3


//
// JBUS clock
// =========
//
// `define SYSCLK_PERIOD   5000


// Afara Link Defines
// ==================

// Reliable Link




// Afara Link Objects


// Afara Link Object Format - Reliable Link










// Afara Link Object Format - Congestion



  







// Afara Link Object Format - Acknowledge











// Afara Link Object Format - Request

















// Afara Link Object Format - Message



// Acknowledge Types




// Request Types





// Afara Link Frame



//
// UCB Packet Type
// ===============
//

















//
// UCB Data Packet Format
// ======================
//






























// Size encoding for the UCB_SIZE_HI/LO field
// 000 - byte
// 001 - half-word
// 010 - word
// 011 - double-word
// 111 - quad-word







//
// UCB Interrupt Packet Format
// ===========================
//










//`define UCB_THR_HI             9      // (6) cpu/thread ID shared with
//`define UCB_THR_LO             4             data packet format
//`define UCB_PKT_HI             3      // (4) packet type shared with
//`define UCB_PKT_LO             0      //     data packet format







//
// FCRAM Bus Widths
// ================
//






//
// ENET clock periods
// ==================
//
// `define AXGRMII_CLK_PERIOD          6400 // 312.5MHz/2
// `define ENET_GMAC_CLK_PERIOD        8000 // 125MHz


//
// JBus Bridge defines
// =================
//
// `define      SYS_UPA_CLK        `SYS.upa_clk
// `define      SYS_J_CLK          `SYS.j_clk
// `define      SYS_P_CLK          `SYS.p_clk
// `define      SYS_G_CLK          `SYS.g_clk
// `define      JP_TIMESCALE       `timescale 1 ps / 1 ps
// `define      PCI_CLK_PERIOD     15152                  //  66 MHz
// `define      UPA_RD_CLK_PERIOD  6666                   // 150 MHz
// `define      UPA_REF_CLK_PERIOD 7576                   // 132 MHz
// `define      ICHIP_CLK_PERIOD   30304                  //  33 MHz


//
// PCI Device Address Configuration
// ================================
//























// system level definition file which 
                        // contains the time scale definition

// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iop.h
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/
//-*- verilog -*-
////////////////////////////////////////////////////////////////////////
/*
//
//  Description:	Global header file that contain definitions that 
//                      are common/shared at the IOP chip level
*/
////////////////////////////////////////////////////////////////////////


// Address Map Defines
// ===================




// CMP space



// IOP space




                               //`define ENET_ING_CSR     8'h84
                               //`define ENET_EGR_CMD_CSR 8'h85















// L2 space



// More IOP space





//Cache Crossbar Width and Field Defines
//======================================













































//bits 133:128 are shared by different fields
//for different packet types.
























//`define CPX_INV_PA_HI   116
//`define CPX_INV_PA_LO   112






// cache invalidation format
// `define CPX_INV_DCACHE_WORD0_VAL 0
// `define CPX_INV_ICACHE_WORD0_VAL 1
// `define CPX_INV_WORD0_WAY 5:2
// `define CPX_INV_DCACHE_WORD0_VAL 6
// `define CPX_INV_ICACHE_WORD0_VAL 7
// `define CPX_INV_WORD0_WAY 11:8
// `define CPX_INV_DCACHE_WORD0_VAL 12
// // `define CPX_INV_ICACHE_WORD0_VAL 13
// `define CPX_INV_WORD0_WAY 17:14
// `define CPX_INV_DCACHE_WORD0_VAL 18
// // `define CPX_INV_ICACHE_WORD0_VAL 19
// `define CPX_INV_WORD0_WAY 23:20




// 4 extra bits for bigger icache/dcache
// up to 512KB l1 icache, 256KB l1 dcache

































//Pico defines













//End cache crossbar defines


// Number of COS supported by EECU 



// 
// BSC bus sizes
// =============
//

// General




// CTags













// reinstated temporarily




// CoS






// L2$ Bank



// L2$ Req













// L2$ Ack








// Enet Egress Command Unit














// Enet Egress Packet Unit













// This is cleaved in between Egress Datapath Ack's








// Enet Egress Datapath
















// In-Order / Ordered Queue: EEPU
// Tag is: TLEN, SOF, EOF, QID = 15






// Nack + Tag Info + CTag




// ENET Ingress Queue Management Req












// ENET Ingress Queue Management Ack








// Enet Ingress Packet Unit












// ENET Ingress Packet Unit Ack







// In-Order / Ordered Queue: PCI
// Tag is: CTAG





// PCI-X Request











// PCI_X Acknowledge











//
// BSC array sizes
//================
//












// ECC syndrome bits per memory element




//
// BSC Port Definitions
// ====================
//
// Bits 7 to 4 of curr_port_id








// Number of ports of each type


// Bits needed to represent above


// How wide the linked list pointers are
// 60b for no payload (2CoS)
// 80b for payload (2CoS)

//`define BSC_OBJ_PTR   80
//`define BSC_HD1_HI    69
//`define BSC_HD1_LO    60
//`define BSC_TL1_HI    59
//`define BSC_TL1_LO    50
//`define BSC_CT1_HI    49
//`define BSC_CT1_LO    40
//`define BSC_HD0_HI    29
//`define BSC_HD0_LO    20
//`define BSC_TL0_HI    19
//`define BSC_TL0_LO    10
//`define BSC_CT0_HI     9
//`define BSC_CT0_LO     0


































// I2C STATES in DRAMctl







//
// IOB defines
// ===========
//



















//`define IOB_INT_STAT_WIDTH   32
//`define IOB_INT_STAT_HI      31
//`define IOB_INT_STAT_LO       0

















































// fixme - double check address mapping
// CREG in `IOB_INT_CSR space










// CREG in `IOB_MAN_CSR space





































// Address map for TAP access of SPARC ASI













//
// CIOP UCB Bus Width
// ==================
//
//`define IOB_EECU_WIDTH       16  // ethernet egress command
//`define EECU_IOB_WIDTH       16

//`define IOB_NRAM_WIDTH       16  // NRAM (RLDRAM previously)
//`define NRAM_IOB_WIDTH        4




//`define IOB_ENET_ING_WIDTH   32  // ethernet ingress
//`define ENET_ING_IOB_WIDTH    8

//`define IOB_ENET_EGR_WIDTH    4  // ethernet egress
//`define ENET_EGR_IOB_WIDTH    4

//`define IOB_ENET_MAC_WIDTH    4  // ethernet MAC
//`define ENET_MAC_IOB_WIDTH    4




//`define IOB_BSC_WIDTH         4  // BSC
//`define BSC_IOB_WIDTH         4







//`define IOB_CLSP_WIDTH        4  // clk spine unit
//`define CLSP_IOB_WIDTH        4





//
// CIOP UCB Buf ID Type
// ====================
//



//
// Interrupt Device ID
// ===================
//
// Caution: DUMMY_DEV_ID has to be 9 bit wide
//          for fields to line up properly in the IOB.



//
// Soft Error related definitions 
// ==============================
//



//
// CMP clock
// =========
//




//
// NRAM/IO Interface
// =================
//










//
// NRAM/ENET Interface
// ===================
//







//
// IO/FCRAM Interface
// ==================
//






//
// PCI Interface
// ==================
// Load/store size encodings
// -------------------------
// Size encoding
// 000 - byte
// 001 - half-word
// 010 - word
// 011 - double-word
// 100 - quad






//
// JBI<->SCTAG Interface
// =======================
// Outbound Header Format



























// Inbound Header Format




















//
// JBI->IOB Mondo Header Format
// ============================
//














// JBI->IOB Mondo Bus Width/Cycle
// ==============================
// Cycle  1 Header[15:8]
// Cycle  2 Header[ 7:0]
// Cycle  3 J_AD[127:120]
// Cycle  4 J_AD[119:112]
// .....
// Cycle 18 J_AD[  7:  0]



////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////



module ucb_flow_2buf (/*AUTOARG*/
   // Outputs
   ucb_iob_stall, rd_req_vld, wr_req_vld, thr_id_in, buf_id_in, 
   size_in, addr_in, data_in, ack_busy, int_busy, ucb_iob_vld, 
   ucb_iob_data, 
   // Inputs
   clk, rst_l, iob_ucb_vld, iob_ucb_data, req_acpted, rd_ack_vld, 
   rd_nack_vld, thr_id_out, buf_id_out, data128, data_out, int_vld, 
   int_typ, int_thr_id, dev_id, int_stat, int_vec, iob_ucb_stall
   );
   // synopsys template
   
   parameter IOB_UCB_WIDTH = 32;  // data bus width from IOB to UCB
   parameter UCB_IOB_WIDTH = 8;   // data bus width from UCB to IOB
   parameter REG_WIDTH     = 64;  // please do not change this parameter
   

   // Globals
   input                                clk;
   input 				rst_l;
   
   // Request from IO Bridge
   input 				iob_ucb_vld;
   input [IOB_UCB_WIDTH-1:0] 		iob_ucb_data;
   output 				ucb_iob_stall;

   // Request to local unit
   output 				rd_req_vld;
   output 				wr_req_vld;
   output [9-4:0]   thr_id_in;
   output [11-10:0]   buf_id_in;
   output [14-12:0] size_in;   // only pertinent to PCI
   output [54-15:0] addr_in;
   output [127-64:0] data_in;
   input 				req_acpted;
   
   // Ack/Nack from local unit
   input 				rd_ack_vld;
   input 				rd_nack_vld;
   input [9-4:0] 	thr_id_out;
   input [11-10:0] 	buf_id_out;
   input 				data128;   // set to 1 if data returned is 128 bit
   input [REG_WIDTH-1:0] 		data_out;
   output 				ack_busy;

   // Interrupt from local unit
   input 				int_vld;
   input [3-0:0] 	int_typ;          // interrupt type
   input [9-4:0] 	int_thr_id;       // interrupt thread ID
   input [18-10:0] dev_id;      // interrupt device ID
   input [50-19:0] int_stat;  // interrupt status
   input [56-51:0]   int_vec;   // interrupt vector
   output 				int_busy;
   
   // Output to IO Bridge
   output 				ucb_iob_vld;
   output [UCB_IOB_WIDTH-1:0] 		ucb_iob_data;
   input 				iob_ucb_stall;
   
   // Local signals
   wire                                 indata_buf_vld;
   wire [127:0]                         indata_buf;
   wire                                 ucb_iob_stall_a1;
   
   wire                                 read_pending;
   wire                                 write_pending;
   wire                                 illegal_write_size;

   wire 				rd_buf;
   wire [2-1:0] 		buf_head_next;
   wire [2-1:0] 		buf_head;
   wire 				wr_buf;
   wire [2-1:0] 		buf_tail_next;
   wire [2-1:0] 		buf_tail;
   wire 				buf_full_next;
   wire 				buf_full;
   wire 				buf_empty_next;
   wire 				buf_empty;
   wire [64+(54-15+1)+(14-12+1)+(11-10+1)+(9-4+1)+1+1-1:0] 		req_in;
   wire 				buf0_en;
   wire [64+(54-15+1)+(14-12+1)+(11-10+1)+(9-4+1)+1+1-1:0] 		buf0;
   wire 				buf1_en;
   wire [64+(54-15+1)+(14-12+1)+(11-10+1)+(9-4+1)+1+1-1:0] 		buf1;
   wire [64+(54-15+1)+(14-12+1)+(11-10+1)+(9-4+1)+1+1-1:0] 		req_out;
   wire 				rd_req_vld_nq;
   wire 				wr_req_vld_nq;

   wire                                 ack_buf_rd;
   wire                                 ack_buf_wr;
   wire                                 ack_buf_vld;
   wire                                 ack_buf_vld_next;
   wire                                 ack_buf_is_nack;
   wire                                 ack_buf_is_data128;
   wire [3-0:0]     ack_typ_out;
   wire [REG_WIDTH+11-0:0] ack_buf_in;
   wire [REG_WIDTH+11-0:0] ack_buf;
   wire [(REG_WIDTH+64)/UCB_IOB_WIDTH-1:0] ack_buf_vec;
   
   wire                                 int_buf_rd;
   wire                                 int_buf_wr;
   wire                                 int_buf_vld;
   wire                                 int_buf_vld_next;
   wire [56-0:0] int_buf_in;
   wire [56-0:0] int_buf;
   wire [(REG_WIDTH+64)/UCB_IOB_WIDTH-1:0] int_buf_vec;
   
   wire                                 int_last_rd;
   wire                                 outdata_buf_busy;
   wire                                 outdata_buf_wr;
   wire [REG_WIDTH+63:0]                outdata_buf_in;
   wire [(REG_WIDTH+64)/UCB_IOB_WIDTH-1:0] outdata_vec_in;
   
   
////////////////////////////////////////////////////////////////////////
// Code starts here
////////////////////////////////////////////////////////////////////////
   /************************************************************
    * Inbound Data
    ************************************************************/
   // Register size is hardcoded to 64 bits here because all
   // units using the UCB module will only write to 64 bit registers.
   ucb_bus_in #(IOB_UCB_WIDTH,64) ucb_bus_in (.rst_l(rst_l),
                                              .clk(clk),
                                              .vld(iob_ucb_vld),
                                              .data(iob_ucb_data),
                                              .stall(ucb_iob_stall),
                                              .indata_buf_vld(indata_buf_vld),
                                              .indata_buf(indata_buf),
                                              .stall_a1(ucb_iob_stall_a1));


   /************************************************************
    * Decode inbound packet type
    ************************************************************/
   assign 	 read_pending = (indata_buf[3:0] ==
				 4'b0100) &
			        indata_buf_vld;

   assign 	 write_pending = (indata_buf[3:0] == 
				  4'b0101) &
        	                  indata_buf_vld;

   // 3'b011 is the encoding for double word.  All writes have to be
   // 64 bits except writes going to PCI.  PCI will instantiate a
   // customized version of UCB.
   assign 	 illegal_write_size = (indata_buf[14:12] !=
				       3'b011);
   
   assign 	 ucb_iob_stall_a1 = (read_pending | write_pending) & buf_full;

   
   /************************************************************
    * Inbound buffer
    ************************************************************/
   // Head pointer
   assign 	 rd_buf = req_acpted;
   assign 	 buf_head_next = ~rst_l ? 2'b01 :
                                 rd_buf ? {buf_head[2-2:0],
				           buf_head[2-1]} :
	                                  buf_head;
   dff_ns #(2) buf_head_ff (.din(buf_head_next),
					 .clk(clk),
					 .q(buf_head));

   // Tail pointer
   assign 	 wr_buf = (read_pending |
		           (write_pending & ~illegal_write_size)) &
			  ~buf_full;
   assign 	 buf_tail_next = ~rst_l ? 2'b01 :
                                 wr_buf ? {buf_tail[2-2:0],
				           buf_tail[2-1]} :
	                                  buf_tail;
   dff_ns #(2) buf_tail_ff (.din(buf_tail_next),
					 .clk(clk),
					 .q(buf_tail));

   // Buffer full
   assign 	 buf_full_next = (buf_head_next == buf_tail_next) &
				 wr_buf;
   dffrle_ns #(1) buf_full_ff (.din(buf_full_next),
			       .rst_l(rst_l),
			       .en(rd_buf|wr_buf),
			       .clk(clk),
			       .q(buf_full));

   // Buffer empty
   assign 	 buf_empty_next = ((buf_head_next == buf_tail_next) &
				   rd_buf) | ~rst_l;
   dffe_ns #(1) buf_empty_ff (.din(buf_empty_next),
			      .en(rd_buf|wr_buf|~rst_l), 
			      .clk(clk),
			      .q(buf_empty));
   

   assign 	 req_in = {indata_buf[127:64],
			   indata_buf[54:15],
			   indata_buf[14:12],
			   indata_buf[11:10],
			   indata_buf[9:4],
			   write_pending & ~illegal_write_size,
			   read_pending};
	  
   // Buffer 0
   assign 	 buf0_en = buf_tail[0] & wr_buf;
   dffe_ns #(64+(54-15+1)+(14-12+1)+(11-10+1)+(9-4+1)+1+1) buf0_ff (.din(req_in),
				      .en(buf0_en),
				      .clk(clk),
				      .q(buf0));
   // Buffer 1
   assign 	 buf1_en = buf_tail[1] & wr_buf;
   dffe_ns #(64+(54-15+1)+(14-12+1)+(11-10+1)+(9-4+1)+1+1) buf1_ff (.din(req_in),
				      .en(buf1_en),
				      .clk(clk),
				      .q(buf1));

   assign 	 req_out = buf_head[0] ? buf0 :
	                   buf_head[1] ? buf1 :
	                                 {64+(54-15+1)+(14-12+1)+(11-10+1)+(9-4+1)+1+1{1'b0}};

   
   /************************************************************
    * Inbound interface to local unit
    ************************************************************/
   assign 	 {data_in,
		  addr_in,
		  size_in,
		  buf_id_in,
		  thr_id_in,
		  wr_req_vld_nq,
		  rd_req_vld_nq} = req_out;
   
   assign 	 rd_req_vld = rd_req_vld_nq & ~buf_empty;
   assign 	 wr_req_vld = wr_req_vld_nq & ~buf_empty;
   
	  
   /************************************************************
    * Outbound Ack/Nack
    ************************************************************/
   assign        ack_buf_wr = rd_ack_vld | rd_nack_vld;
   
   assign        ack_buf_vld_next = ack_buf_wr ? 1'b1 :
                                    ack_buf_rd ? 1'b0 :
                                                 ack_buf_vld;
   
   dffrl_ns #(1) ack_buf_vld_ff (.din(ack_buf_vld_next),
                                 .clk(clk),
                                 .rst_l(rst_l),
                                 .q(ack_buf_vld));
   
   dffe_ns #(1) ack_buf_is_nack_ff (.din(rd_nack_vld),
                                    .en(ack_buf_wr),
                                    .clk(clk),
                                    .q(ack_buf_is_nack));

   dffe_ns #(1) ack_buf_is_data128_ff (.din(data128),
                                       .en(ack_buf_wr),
                                       .clk(clk),
                                       .q(ack_buf_is_data128));

   assign        ack_typ_out = rd_ack_vld ? 4'b0001:
                                            4'b0000;

   assign        ack_buf_in = {data_out,
                               buf_id_out,
                               thr_id_out,
                               ack_typ_out};
   
   dffe_ns #(REG_WIDTH+11-0+1) ack_buf_ff (.din(ack_buf_in),
                                                              .en(ack_buf_wr),
                                                              .clk(clk),
                                                              .q(ack_buf));

   assign        ack_buf_vec = ack_buf_is_nack    ? {{REG_WIDTH/UCB_IOB_WIDTH{1'b0}},
                                                     {64/UCB_IOB_WIDTH{1'b1}}} :
                               ack_buf_is_data128 ? {(REG_WIDTH+64)/UCB_IOB_WIDTH{1'b1}} :
                                                    {(64+64)/UCB_IOB_WIDTH{1'b1}};
   
   assign        ack_busy = ack_buf_vld;
   

   /************************************************************
    * Outbound Interrupt
    ************************************************************/
   // Assertion: int_buf_wr shoudn't be asserted if int_buf_busy
   assign        int_buf_wr = int_vld;
   
   assign        int_buf_vld_next = int_buf_wr ? 1'b1 :
                                    int_buf_rd ? 1'b0 :
                                                 int_buf_vld;
   
   dffrl_ns #(1) int_buf_vld_ff (.din(int_buf_vld_next),
                                 .clk(clk),
                                 .rst_l(rst_l),
                                 .q(int_buf_vld));

   assign        int_buf_in = {int_vec,
                               int_stat,
                               dev_id,
                               int_thr_id,
                               int_typ};
   
   dffe_ns #(56-0+1) int_buf_ff (.din(int_buf_in),
                                                        .en(int_buf_wr),
                                                        .clk(clk),
                                                        .q(int_buf));

   assign        int_buf_vec = {{REG_WIDTH/UCB_IOB_WIDTH{1'b0}},
                                {64/UCB_IOB_WIDTH{1'b1}}};

   assign        int_busy = int_buf_vld;


   /************************************************************
    * Outbound ack/interrupt Arbitration
    ************************************************************/
   dffrle_ns #(1) int_last_rd_ff (.din(int_buf_rd),
                                  .en(ack_buf_rd|int_buf_rd),
                                  .rst_l(rst_l),
                                  .clk(clk),
                                  .q(int_last_rd));
                           
   assign        ack_buf_rd = ~outdata_buf_busy & ack_buf_vld &
                              (~int_buf_vld | int_last_rd);
   
   assign        int_buf_rd = ~outdata_buf_busy & int_buf_vld &
                              (~ack_buf_vld | ~int_last_rd);

   assign        outdata_buf_wr = ack_buf_rd | int_buf_rd;
   
   assign        outdata_buf_in = ack_buf_rd ? {ack_buf[REG_WIDTH+11:11+1],
                                                {(63-55+1){1'b0}},
                                                {(54-15+1){1'b0}},
                                                {(14-12+1){1'b0}},
                                                ack_buf[11:10],
                                                ack_buf[9:4],
                                                ack_buf[3:0]}:
                                               {{REG_WIDTH{1'b0}},
                                                {(63-57+1){1'b0}},
                                                int_buf[56:51],
                                                int_buf[50:19],
                                                int_buf[18:10],
                                                int_buf[9:4],
                                                int_buf[3:0]};
   
   assign        outdata_vec_in = ack_buf_rd ? ack_buf_vec :
                                               int_buf_vec;
   
   ucb_bus_out #(UCB_IOB_WIDTH, REG_WIDTH) ucb_bus_out (.rst_l(rst_l),
                                                        .clk(clk),
                                                        .outdata_buf_wr(outdata_buf_wr),
                                                        .outdata_buf_in(outdata_buf_in),
                                                        .outdata_vec_in(outdata_vec_in),
                                                        .outdata_buf_busy(outdata_buf_busy),
                                                        .vld(ucb_iob_vld),
                                                        .data(ucb_iob_data),
                                                        .stall(iob_ucb_stall));
   


	  
endmodule // ucb_flow_2buf


// Local Variables:
// verilog-library-directories:(".")
// End:







// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: ucb_flow_spi.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
////////////////////////////////////////////////////////////////////////
/*
//  Module Name:        ucb_flow_spi
//	Description:	Unit Control Block
//                      - supports 1B/2B/4B/8B read with flow control
//                      - supports 1B/2B/4B/8B write with flow control
//                      - supports 4B ifill request
//                      - supports interrupt return to IO Bridge
//                      - provides 1+2 deep buffer for incoming requests
//                        from the IO Bridge
//                      - provides single buffer for returns going back
//                        to the IO Bridge
//
//                      This module is customized for the SPI.
//
//                      Data bus width to and from the IO Bridge is
//                      configured through parameters UCB_IOB_WIDTH and
//                      IOB_UCB_WIDTH.  Supported widths are:
//
//                      IOB_UCB_WIDTH  UCB_IOB_WIDTH
//                      ----------------------------
//                      32             8
//                      16             8
//                       8             8
//                       4             4             
 */ 
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: sys.h
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/
// -*- verilog -*-
////////////////////////////////////////////////////////////////////////
/*
//
// Description:		Global header file that contain definitions that 
//                      are common/shared at the systme level
*/
////////////////////////////////////////////////////////////////////////
//
// Setting the time scale
// If the timescale changes, JP_TIMESCALE may also have to change.
`timescale	1ps/1ps
`default_nettype wire

//
// Number of threads in a core
// ===========================
//

//`define CONFIG_NUM_THREADS // This must be defined for any of below to work
//`define THREADS_1
//`define THREADS_2
//`define THREADS_3


//
// JBUS clock
// =========
//
// `define SYSCLK_PERIOD   5000


// Afara Link Defines
// ==================

// Reliable Link




// Afara Link Objects


// Afara Link Object Format - Reliable Link










// Afara Link Object Format - Congestion



  







// Afara Link Object Format - Acknowledge











// Afara Link Object Format - Request

















// Afara Link Object Format - Message



// Acknowledge Types




// Request Types





// Afara Link Frame



//
// UCB Packet Type
// ===============
//

















//
// UCB Data Packet Format
// ======================
//






























// Size encoding for the UCB_SIZE_HI/LO field
// 000 - byte
// 001 - half-word
// 010 - word
// 011 - double-word
// 111 - quad-word







//
// UCB Interrupt Packet Format
// ===========================
//










//`define UCB_THR_HI             9      // (6) cpu/thread ID shared with
//`define UCB_THR_LO             4             data packet format
//`define UCB_PKT_HI             3      // (4) packet type shared with
//`define UCB_PKT_LO             0      //     data packet format







//
// FCRAM Bus Widths
// ================
//






//
// ENET clock periods
// ==================
//
// `define AXGRMII_CLK_PERIOD          6400 // 312.5MHz/2
// `define ENET_GMAC_CLK_PERIOD        8000 // 125MHz


//
// JBus Bridge defines
// =================
//
// `define      SYS_UPA_CLK        `SYS.upa_clk
// `define      SYS_J_CLK          `SYS.j_clk
// `define      SYS_P_CLK          `SYS.p_clk
// `define      SYS_G_CLK          `SYS.g_clk
// `define      JP_TIMESCALE       `timescale 1 ps / 1 ps
// `define      PCI_CLK_PERIOD     15152                  //  66 MHz
// `define      UPA_RD_CLK_PERIOD  6666                   // 150 MHz
// `define      UPA_REF_CLK_PERIOD 7576                   // 132 MHz
// `define      ICHIP_CLK_PERIOD   30304                  //  33 MHz


//
// PCI Device Address Configuration
// ================================
//























// system level definition file which 
                        // contains the time scale definition

// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iop.h
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/
//-*- verilog -*-
////////////////////////////////////////////////////////////////////////
/*
//
//  Description:	Global header file that contain definitions that 
//                      are common/shared at the IOP chip level
*/
////////////////////////////////////////////////////////////////////////


// Address Map Defines
// ===================




// CMP space



// IOP space




                               //`define ENET_ING_CSR     8'h84
                               //`define ENET_EGR_CMD_CSR 8'h85















// L2 space



// More IOP space





//Cache Crossbar Width and Field Defines
//======================================













































//bits 133:128 are shared by different fields
//for different packet types.
























//`define CPX_INV_PA_HI   116
//`define CPX_INV_PA_LO   112






// cache invalidation format
// `define CPX_INV_DCACHE_WORD0_VAL 0
// `define CPX_INV_ICACHE_WORD0_VAL 1
// `define CPX_INV_WORD0_WAY 5:2
// `define CPX_INV_DCACHE_WORD0_VAL 6
// `define CPX_INV_ICACHE_WORD0_VAL 7
// `define CPX_INV_WORD0_WAY 11:8
// `define CPX_INV_DCACHE_WORD0_VAL 12
// // `define CPX_INV_ICACHE_WORD0_VAL 13
// `define CPX_INV_WORD0_WAY 17:14
// `define CPX_INV_DCACHE_WORD0_VAL 18
// // `define CPX_INV_ICACHE_WORD0_VAL 19
// `define CPX_INV_WORD0_WAY 23:20




// 4 extra bits for bigger icache/dcache
// up to 512KB l1 icache, 256KB l1 dcache

































//Pico defines













//End cache crossbar defines


// Number of COS supported by EECU 



// 
// BSC bus sizes
// =============
//

// General




// CTags













// reinstated temporarily




// CoS






// L2$ Bank



// L2$ Req













// L2$ Ack








// Enet Egress Command Unit














// Enet Egress Packet Unit













// This is cleaved in between Egress Datapath Ack's








// Enet Egress Datapath
















// In-Order / Ordered Queue: EEPU
// Tag is: TLEN, SOF, EOF, QID = 15






// Nack + Tag Info + CTag




// ENET Ingress Queue Management Req












// ENET Ingress Queue Management Ack








// Enet Ingress Packet Unit












// ENET Ingress Packet Unit Ack







// In-Order / Ordered Queue: PCI
// Tag is: CTAG





// PCI-X Request











// PCI_X Acknowledge











//
// BSC array sizes
//================
//












// ECC syndrome bits per memory element




//
// BSC Port Definitions
// ====================
//
// Bits 7 to 4 of curr_port_id








// Number of ports of each type


// Bits needed to represent above


// How wide the linked list pointers are
// 60b for no payload (2CoS)
// 80b for payload (2CoS)

//`define BSC_OBJ_PTR   80
//`define BSC_HD1_HI    69
//`define BSC_HD1_LO    60
//`define BSC_TL1_HI    59
//`define BSC_TL1_LO    50
//`define BSC_CT1_HI    49
//`define BSC_CT1_LO    40
//`define BSC_HD0_HI    29
//`define BSC_HD0_LO    20
//`define BSC_TL0_HI    19
//`define BSC_TL0_LO    10
//`define BSC_CT0_HI     9
//`define BSC_CT0_LO     0


































// I2C STATES in DRAMctl







//
// IOB defines
// ===========
//



















//`define IOB_INT_STAT_WIDTH   32
//`define IOB_INT_STAT_HI      31
//`define IOB_INT_STAT_LO       0

















































// fixme - double check address mapping
// CREG in `IOB_INT_CSR space










// CREG in `IOB_MAN_CSR space





































// Address map for TAP access of SPARC ASI













//
// CIOP UCB Bus Width
// ==================
//
//`define IOB_EECU_WIDTH       16  // ethernet egress command
//`define EECU_IOB_WIDTH       16

//`define IOB_NRAM_WIDTH       16  // NRAM (RLDRAM previously)
//`define NRAM_IOB_WIDTH        4




//`define IOB_ENET_ING_WIDTH   32  // ethernet ingress
//`define ENET_ING_IOB_WIDTH    8

//`define IOB_ENET_EGR_WIDTH    4  // ethernet egress
//`define ENET_EGR_IOB_WIDTH    4

//`define IOB_ENET_MAC_WIDTH    4  // ethernet MAC
//`define ENET_MAC_IOB_WIDTH    4




//`define IOB_BSC_WIDTH         4  // BSC
//`define BSC_IOB_WIDTH         4







//`define IOB_CLSP_WIDTH        4  // clk spine unit
//`define CLSP_IOB_WIDTH        4





//
// CIOP UCB Buf ID Type
// ====================
//



//
// Interrupt Device ID
// ===================
//
// Caution: DUMMY_DEV_ID has to be 9 bit wide
//          for fields to line up properly in the IOB.



//
// Soft Error related definitions 
// ==============================
//



//
// CMP clock
// =========
//




//
// NRAM/IO Interface
// =================
//










//
// NRAM/ENET Interface
// ===================
//







//
// IO/FCRAM Interface
// ==================
//






//
// PCI Interface
// ==================
// Load/store size encodings
// -------------------------
// Size encoding
// 000 - byte
// 001 - half-word
// 010 - word
// 011 - double-word
// 100 - quad






//
// JBI<->SCTAG Interface
// =======================
// Outbound Header Format



























// Inbound Header Format




















//
// JBI->IOB Mondo Header Format
// ============================
//














// JBI->IOB Mondo Bus Width/Cycle
// ==============================
// Cycle  1 Header[15:8]
// Cycle  2 Header[ 7:0]
// Cycle  3 J_AD[127:120]
// Cycle  4 J_AD[119:112]
// .....
// Cycle 18 J_AD[  7:  0]



////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////



module ucb_flow_spi (/*AUTOARG*/
   // Outputs
   ucb_iob_stall, rd_req_vld, wr_req_vld, ifill_req_vld, thr_id_in, 
   buf_id_in, size_in, addr_in, data_in, ack_busy, int_busy, 
   ucb_iob_vld, ucb_iob_data, 
   // Inputs
   clk, rst_l, iob_ucb_vld, iob_ucb_data, req_acpted, rd_ack_vld, 
   rd_nack_vld, ifill_ack_vld, ifill_nack_vld, thr_id_out, 
   buf_id_out, data128, data_out, int_vld, int_typ, int_thr_id, 
   dev_id, int_stat, int_vec, iob_ucb_stall
   );
   // synopsys template
   
   parameter IOB_UCB_WIDTH = 32;  // data bus width from IOB to UCB
   parameter UCB_IOB_WIDTH = 8;   // data bus width from UCB to IOB
   parameter REG_WIDTH     = 64;  // please do not change this parameter
   

   // Globals
   input                                clk;
   input 				rst_l;
   
   // Request from IO Bridge
   input 				iob_ucb_vld;
   input [IOB_UCB_WIDTH-1:0] 		iob_ucb_data;
   output 				ucb_iob_stall;

   // Request to local unit
   output 				rd_req_vld;
   output 				wr_req_vld;
   output 				ifill_req_vld;
   output [9-4:0]   thr_id_in;
   output [11-10:0]   buf_id_in;
   output [14-12:0] size_in;   // only pertinent to JBI and SPI
   output [54-15:0] addr_in;
   output [127-64:0] data_in;
   input 				req_acpted;
   
   // Ack/Nack from local unit
   input 				rd_ack_vld;
   input 				rd_nack_vld;
   input 				ifill_ack_vld;
   input 				ifill_nack_vld;
   input [9-4:0] 	thr_id_out;
   input [11-10:0] 	buf_id_out;
   input 				data128;   // set to 1 if data returned is 128 bit
   input [REG_WIDTH-1:0] 		data_out;
   output 				ack_busy;

   // Interrupt from local unit
   input 				int_vld;
   input [3-0:0] 	int_typ;          // interrupt type
   input [9-4:0] 	int_thr_id;       // interrupt thread ID
   input [18-10:0] dev_id;      // interrupt device ID
   input [50-19:0] int_stat;  // interrupt status
   input [56-51:0]   int_vec;   // interrupt vector
   output 				int_busy;
   
   // Output to IO Bridge
   output 				ucb_iob_vld;
   output [UCB_IOB_WIDTH-1:0] 		ucb_iob_data;
   input 				iob_ucb_stall;
   
   // Local signals
   wire                                 indata_buf_vld;
   wire [127:0]                         indata_buf;
   wire                                 ucb_iob_stall_a1;
   
   wire                                 read_pending;
   wire                                 write_pending;
   wire 				ifill_pending;
   
   wire 				rd_buf;
   wire [2-1:0] 		buf_head_next;
   wire [2-1:0] 		buf_head;
   wire 				wr_buf;
   wire [2-1:0] 		buf_tail_next;
   wire [2-1:0] 		buf_tail;
   wire 				buf_full_next;
   wire 				buf_full;
   wire 				buf_empty_next;
   wire 				buf_empty;
   wire [64+(54-15+1)+(14-12+1)+(11-10+1)+(9-4+1)+1+1+1-1:0] 		req_in;
   wire 				buf0_en;
   wire [64+(54-15+1)+(14-12+1)+(11-10+1)+(9-4+1)+1+1+1-1:0] 		buf0;
   wire 				buf1_en;
   wire [64+(54-15+1)+(14-12+1)+(11-10+1)+(9-4+1)+1+1+1-1:0] 		buf1;
   wire [64+(54-15+1)+(14-12+1)+(11-10+1)+(9-4+1)+1+1+1-1:0] 		req_out;
   wire 				rd_req_vld_nq;
   wire 				wr_req_vld_nq;
   wire 			        ifill_req_vld_nq;

   wire                                 ack_buf_rd;
   wire                                 ack_buf_wr;
   wire                                 ack_buf_vld;
   wire                                 ack_buf_vld_next;
   wire                                 ack_buf_is_nack;
   wire 				ack_buf_is_data128;
   wire [3-0:0]     ack_typ_out;
   wire [REG_WIDTH+11-0:0] ack_buf_in;
   wire [REG_WIDTH+11-0:0] ack_buf;
   wire [(REG_WIDTH+64)/UCB_IOB_WIDTH-1:0] ack_buf_vec;
   
   wire                                 int_buf_rd;
   wire                                 int_buf_wr;
   wire                                 int_buf_vld;
   wire                                 int_buf_vld_next;
   wire [56-0:0] int_buf_in;
   wire [56-0:0] int_buf;
   wire [(REG_WIDTH+64)/UCB_IOB_WIDTH-1:0] int_buf_vec;
   
   wire                                 int_last_rd;
   wire                                 outdata_buf_busy;
   wire                                 outdata_buf_wr;
   wire [REG_WIDTH+63:0]                outdata_buf_in;
   wire [(REG_WIDTH+64)/UCB_IOB_WIDTH-1:0] outdata_vec_in;
   
   
////////////////////////////////////////////////////////////////////////
// Code starts here
////////////////////////////////////////////////////////////////////////
   /************************************************************
    * Inbound Data
    ************************************************************/
   // Register size is hardcoded to 64 bits here
   ucb_bus_in #(IOB_UCB_WIDTH,64) ucb_bus_in (.rst_l(rst_l),
                                              .clk(clk),
                                              .vld(iob_ucb_vld),
                                              .data(iob_ucb_data),
                                              .stall(ucb_iob_stall),
                                              .indata_buf_vld(indata_buf_vld),
                                              .indata_buf(indata_buf),
                                              .stall_a1(ucb_iob_stall_a1));


   /************************************************************
    * Decode inbound packet type
    ************************************************************/
   assign 	 read_pending = (indata_buf[3:0] ==
				 4'b0100) &
			        indata_buf_vld;

   assign 	 write_pending = (indata_buf[3:0] == 
				  4'b0101) &
        	                  indata_buf_vld;

   assign 	 ifill_pending = (indata_buf[3:0] == 
				  4'b0110) &
        	                  indata_buf_vld;

   assign 	 ucb_iob_stall_a1 = (read_pending | write_pending | ifill_pending) & buf_full;

   
   /************************************************************
    * Inbound buffer
    ************************************************************/
   // Head pointer
   assign 	 rd_buf = req_acpted;
   assign 	 buf_head_next = ~rst_l ? 2'b01 :
                                 rd_buf ? {buf_head[2-2:0],
				           buf_head[2-1]} :
	                                  buf_head;
   dff_ns #(2) buf_head_ff (.din(buf_head_next),
					 .clk(clk),
					 .q(buf_head));

   // Tail pointer
   assign 	 wr_buf = (read_pending |
			   write_pending |
			   ifill_pending) &
			  ~buf_full;
   assign 	 buf_tail_next = ~rst_l ? 2'b01 :
                                 wr_buf ? {buf_tail[2-2:0],
				           buf_tail[2-1]} :
	                                  buf_tail;
   dff_ns #(2) buf_tail_ff (.din(buf_tail_next),
					 .clk(clk),
					 .q(buf_tail));

   // Buffer full
   assign 	 buf_full_next = (buf_head_next == buf_tail_next) &
				 wr_buf;
   dffrle_ns #(1) buf_full_ff (.din(buf_full_next),
			       .rst_l(rst_l),
			       .en(rd_buf|wr_buf),
			       .clk(clk),
			       .q(buf_full));

   // Buffer empty
   assign 	 buf_empty_next = ((buf_head_next == buf_tail_next) &
				   rd_buf) | ~rst_l;
   dffe_ns #(1) buf_empty_ff (.din(buf_empty_next),
			      .en(rd_buf|wr_buf|~rst_l), 
			      .clk(clk),
			      .q(buf_empty));
   

   assign 	 req_in = {indata_buf[127:64],
			   indata_buf[54:15],
			   indata_buf[14:12],
			   indata_buf[11:10],
			   indata_buf[9:4],
			   ifill_pending,
			   write_pending,
			   read_pending};
	  
   // Buffer 0
   assign 	 buf0_en = buf_tail[0] & wr_buf;
   dffe_ns #(64+(54-15+1)+(14-12+1)+(11-10+1)+(9-4+1)+1+1+1) buf0_ff (.din(req_in),
				      .en(buf0_en),
				      .clk(clk),
				      .q(buf0));
   // Buffer 1
   assign 	 buf1_en = buf_tail[1] & wr_buf;
   dffe_ns #(64+(54-15+1)+(14-12+1)+(11-10+1)+(9-4+1)+1+1+1) buf1_ff (.din(req_in),
				      .en(buf1_en),
				      .clk(clk),
				      .q(buf1));

   assign 	 req_out = buf_head[0] ? buf0 :
	                   buf_head[1] ? buf1 :
	                                 {64+(54-15+1)+(14-12+1)+(11-10+1)+(9-4+1)+1+1+1{1'b0}};

   
   /************************************************************
    * Inbound interface to local unit
    ************************************************************/
   assign 	 {data_in,
		  addr_in,
		  size_in,
		  buf_id_in,
		  thr_id_in,
		  ifill_req_vld_nq,
		  wr_req_vld_nq,
		  rd_req_vld_nq} = req_out;
   
   assign 	 rd_req_vld = rd_req_vld_nq & ~buf_empty;
   assign 	 wr_req_vld = wr_req_vld_nq & ~buf_empty;
   assign 	 ifill_req_vld = ifill_req_vld_nq & ~buf_empty;
   
	  
   /************************************************************
    * Outbound Ack/Nack
    ************************************************************/
   assign        ack_buf_wr = rd_ack_vld | rd_nack_vld | ifill_ack_vld | ifill_nack_vld;
   
   assign        ack_buf_vld_next = ack_buf_wr ? 1'b1 :
                                    ack_buf_rd ? 1'b0 :
                                                 ack_buf_vld;
   
   dffrl_ns #(1) ack_buf_vld_ff (.din(ack_buf_vld_next),
                                 .clk(clk),
                                 .rst_l(rst_l),
                                 .q(ack_buf_vld));
   
   dffe_ns #(1) ack_buf_is_nack_ff (.din(rd_nack_vld|ifill_nack_vld),
                                    .en(ack_buf_wr),
                                    .clk(clk),
                                    .q(ack_buf_is_nack));
   
   dffe_ns #(1) ack_buf_is_data128_ff (.din(data128),
                                       .en(ack_buf_wr),
                                       .clk(clk),
                                       .q(ack_buf_is_data128));

   assign        ack_typ_out = rd_ack_vld    ? 4'b0001:
                               rd_nack_vld   ? 4'b0000:
		               ifill_ack_vld ? 4'b0011:
		                               4'b0111;

   assign        ack_buf_in = {data_out,
                               buf_id_out,
                               thr_id_out,
                               ack_typ_out};
   
   dffe_ns #(REG_WIDTH+11-0+1) ack_buf_ff (.din(ack_buf_in),
                                                              .en(ack_buf_wr),
                                                              .clk(clk),
                                                              .q(ack_buf));

   assign        ack_buf_vec = ack_buf_is_nack    ? {{REG_WIDTH/UCB_IOB_WIDTH{1'b0}},
                                                     {64/UCB_IOB_WIDTH{1'b1}}} :
		               ack_buf_is_data128 ? {(REG_WIDTH+64)/UCB_IOB_WIDTH{1'b1}} :
                                                    {(64+64)/UCB_IOB_WIDTH{1'b1}};
   
   assign        ack_busy = ack_buf_vld;
   

   /************************************************************
    * Outbound Interrupt
    ************************************************************/
   // Assertion: int_buf_wr shoudn't be asserted if int_buf_busy
   assign        int_buf_wr = int_vld;
   
   assign        int_buf_vld_next = int_buf_wr ? 1'b1 :
                                    int_buf_rd ? 1'b0 :
                                                 int_buf_vld;
   
   dffrl_ns #(1) int_buf_vld_ff (.din(int_buf_vld_next),
                                 .clk(clk),
                                 .rst_l(rst_l),
                                 .q(int_buf_vld));

   assign        int_buf_in = {int_vec,
                               int_stat,
                               dev_id,
                               int_thr_id,
                               int_typ};
   
   dffe_ns #(56-0+1) int_buf_ff (.din(int_buf_in),
                                                        .en(int_buf_wr),
                                                        .clk(clk),
                                                        .q(int_buf));

   assign        int_buf_vec = {{REG_WIDTH/UCB_IOB_WIDTH{1'b0}},
                                {64/UCB_IOB_WIDTH{1'b1}}};

   assign        int_busy = int_buf_vld;


   /************************************************************
    * Outbound ack/interrupt Arbitration
    ************************************************************/
   dffrle_ns #(1) int_last_rd_ff (.din(int_buf_rd),
                                  .en(ack_buf_rd|int_buf_rd),
                                  .rst_l(rst_l),
                                  .clk(clk),
                                  .q(int_last_rd));
                           
   assign        ack_buf_rd = ~outdata_buf_busy & ack_buf_vld &
                              (~int_buf_vld | int_last_rd);
   
   assign        int_buf_rd = ~outdata_buf_busy & int_buf_vld &
                              (~ack_buf_vld | ~int_last_rd);

   assign        outdata_buf_wr = ack_buf_rd | int_buf_rd;
   
   assign        outdata_buf_in = ack_buf_rd ? {ack_buf[REG_WIDTH+11:11+1],
                                                {(63-55+1){1'b0}},
                                                {(54-15+1){1'b0}},
                                                {(14-12+1){1'b0}},
                                                ack_buf[11:10],
                                                ack_buf[9:4],
                                                ack_buf[3:0]}:
                                               {{REG_WIDTH{1'b0}},
                                                {(63-57+1){1'b0}},
                                                int_buf[56:51],
                                                int_buf[50:19],
                                                int_buf[18:10],
                                                int_buf[9:4],
                                                int_buf[3:0]};
   
   assign        outdata_vec_in = ack_buf_rd ? ack_buf_vec :
                                               int_buf_vec;
   
   ucb_bus_out #(UCB_IOB_WIDTH, REG_WIDTH) ucb_bus_out (.rst_l(rst_l),
                                                        .clk(clk),
                                                        .outdata_buf_wr(outdata_buf_wr),
                                                        .outdata_buf_in(outdata_buf_in),
                                                        .outdata_vec_in(outdata_vec_in),
                                                        .outdata_buf_busy(outdata_buf_busy),
                                                        .vld(ucb_iob_vld),
                                                        .data(ucb_iob_data),
                                                        .stall(iob_ucb_stall));
   


	  
endmodule // ucb_flow_spi


// Local Variables:
// verilog-library-directories:(".")
// End:







// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: ucb_noflow.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
////////////////////////////////////////////////////////////////////////
/*
//  Module Name:        ucb_noflow
//	Description:	Unit Control Block
//                      - supports 64 or 128-bit read with flow control
//                      - supports 64-bit write without flow control
//                      - automactically drops non-64-bit writes
//                      - supports interrupt return to IO Bridge
//                      - provides only single buffer at each interface 
//
//                      This module is intended for units that have
//                      both 64 and 128 bit registers.
//
//                      Data bus width to and from the IO Bridge is
//                      configured through parameters UCB_IOB_WIDTH and
//                      IOB_UCB_WIDTH.  Supported widths are:
//
//                      IOB_UCB_WIDTH  UCB_IOB_WIDTH
//                      ----------------------------
//                      32             8
//                      16             8
//                       8             8
//                       4             4             
 */ 
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: sys.h
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/
// -*- verilog -*-
////////////////////////////////////////////////////////////////////////
/*
//
// Description:		Global header file that contain definitions that 
//                      are common/shared at the systme level
*/
////////////////////////////////////////////////////////////////////////
//
// Setting the time scale
// If the timescale changes, JP_TIMESCALE may also have to change.
`timescale	1ps/1ps
`default_nettype wire

//
// Number of threads in a core
// ===========================
//

//`define CONFIG_NUM_THREADS // This must be defined for any of below to work
//`define THREADS_1
//`define THREADS_2
//`define THREADS_3


//
// JBUS clock
// =========
//
// `define SYSCLK_PERIOD   5000


// Afara Link Defines
// ==================

// Reliable Link




// Afara Link Objects


// Afara Link Object Format - Reliable Link










// Afara Link Object Format - Congestion



  







// Afara Link Object Format - Acknowledge











// Afara Link Object Format - Request

















// Afara Link Object Format - Message



// Acknowledge Types




// Request Types





// Afara Link Frame



//
// UCB Packet Type
// ===============
//

















//
// UCB Data Packet Format
// ======================
//






























// Size encoding for the UCB_SIZE_HI/LO field
// 000 - byte
// 001 - half-word
// 010 - word
// 011 - double-word
// 111 - quad-word







//
// UCB Interrupt Packet Format
// ===========================
//










//`define UCB_THR_HI             9      // (6) cpu/thread ID shared with
//`define UCB_THR_LO             4             data packet format
//`define UCB_PKT_HI             3      // (4) packet type shared with
//`define UCB_PKT_LO             0      //     data packet format







//
// FCRAM Bus Widths
// ================
//






//
// ENET clock periods
// ==================
//
// `define AXGRMII_CLK_PERIOD          6400 // 312.5MHz/2
// `define ENET_GMAC_CLK_PERIOD        8000 // 125MHz


//
// JBus Bridge defines
// =================
//
// `define      SYS_UPA_CLK        `SYS.upa_clk
// `define      SYS_J_CLK          `SYS.j_clk
// `define      SYS_P_CLK          `SYS.p_clk
// `define      SYS_G_CLK          `SYS.g_clk
// `define      JP_TIMESCALE       `timescale 1 ps / 1 ps
// `define      PCI_CLK_PERIOD     15152                  //  66 MHz
// `define      UPA_RD_CLK_PERIOD  6666                   // 150 MHz
// `define      UPA_REF_CLK_PERIOD 7576                   // 132 MHz
// `define      ICHIP_CLK_PERIOD   30304                  //  33 MHz


//
// PCI Device Address Configuration
// ================================
//























// system level definition file which 
                        // contains the time scale definition

// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iop.h
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/
//-*- verilog -*-
////////////////////////////////////////////////////////////////////////
/*
//
//  Description:	Global header file that contain definitions that 
//                      are common/shared at the IOP chip level
*/
////////////////////////////////////////////////////////////////////////


// Address Map Defines
// ===================




// CMP space



// IOP space




                               //`define ENET_ING_CSR     8'h84
                               //`define ENET_EGR_CMD_CSR 8'h85















// L2 space



// More IOP space





//Cache Crossbar Width and Field Defines
//======================================













































//bits 133:128 are shared by different fields
//for different packet types.
























//`define CPX_INV_PA_HI   116
//`define CPX_INV_PA_LO   112






// cache invalidation format
// `define CPX_INV_DCACHE_WORD0_VAL 0
// `define CPX_INV_ICACHE_WORD0_VAL 1
// `define CPX_INV_WORD0_WAY 5:2
// `define CPX_INV_DCACHE_WORD0_VAL 6
// `define CPX_INV_ICACHE_WORD0_VAL 7
// `define CPX_INV_WORD0_WAY 11:8
// `define CPX_INV_DCACHE_WORD0_VAL 12
// // `define CPX_INV_ICACHE_WORD0_VAL 13
// `define CPX_INV_WORD0_WAY 17:14
// `define CPX_INV_DCACHE_WORD0_VAL 18
// // `define CPX_INV_ICACHE_WORD0_VAL 19
// `define CPX_INV_WORD0_WAY 23:20




// 4 extra bits for bigger icache/dcache
// up to 512KB l1 icache, 256KB l1 dcache

































//Pico defines













//End cache crossbar defines


// Number of COS supported by EECU 



// 
// BSC bus sizes
// =============
//

// General




// CTags













// reinstated temporarily




// CoS






// L2$ Bank



// L2$ Req













// L2$ Ack








// Enet Egress Command Unit














// Enet Egress Packet Unit













// This is cleaved in between Egress Datapath Ack's








// Enet Egress Datapath
















// In-Order / Ordered Queue: EEPU
// Tag is: TLEN, SOF, EOF, QID = 15






// Nack + Tag Info + CTag




// ENET Ingress Queue Management Req












// ENET Ingress Queue Management Ack








// Enet Ingress Packet Unit












// ENET Ingress Packet Unit Ack







// In-Order / Ordered Queue: PCI
// Tag is: CTAG





// PCI-X Request











// PCI_X Acknowledge











//
// BSC array sizes
//================
//












// ECC syndrome bits per memory element




//
// BSC Port Definitions
// ====================
//
// Bits 7 to 4 of curr_port_id








// Number of ports of each type


// Bits needed to represent above


// How wide the linked list pointers are
// 60b for no payload (2CoS)
// 80b for payload (2CoS)

//`define BSC_OBJ_PTR   80
//`define BSC_HD1_HI    69
//`define BSC_HD1_LO    60
//`define BSC_TL1_HI    59
//`define BSC_TL1_LO    50
//`define BSC_CT1_HI    49
//`define BSC_CT1_LO    40
//`define BSC_HD0_HI    29
//`define BSC_HD0_LO    20
//`define BSC_TL0_HI    19
//`define BSC_TL0_LO    10
//`define BSC_CT0_HI     9
//`define BSC_CT0_LO     0


































// I2C STATES in DRAMctl







//
// IOB defines
// ===========
//



















//`define IOB_INT_STAT_WIDTH   32
//`define IOB_INT_STAT_HI      31
//`define IOB_INT_STAT_LO       0

















































// fixme - double check address mapping
// CREG in `IOB_INT_CSR space










// CREG in `IOB_MAN_CSR space





































// Address map for TAP access of SPARC ASI













//
// CIOP UCB Bus Width
// ==================
//
//`define IOB_EECU_WIDTH       16  // ethernet egress command
//`define EECU_IOB_WIDTH       16

//`define IOB_NRAM_WIDTH       16  // NRAM (RLDRAM previously)
//`define NRAM_IOB_WIDTH        4




//`define IOB_ENET_ING_WIDTH   32  // ethernet ingress
//`define ENET_ING_IOB_WIDTH    8

//`define IOB_ENET_EGR_WIDTH    4  // ethernet egress
//`define ENET_EGR_IOB_WIDTH    4

//`define IOB_ENET_MAC_WIDTH    4  // ethernet MAC
//`define ENET_MAC_IOB_WIDTH    4




//`define IOB_BSC_WIDTH         4  // BSC
//`define BSC_IOB_WIDTH         4







//`define IOB_CLSP_WIDTH        4  // clk spine unit
//`define CLSP_IOB_WIDTH        4





//
// CIOP UCB Buf ID Type
// ====================
//



//
// Interrupt Device ID
// ===================
//
// Caution: DUMMY_DEV_ID has to be 9 bit wide
//          for fields to line up properly in the IOB.



//
// Soft Error related definitions 
// ==============================
//



//
// CMP clock
// =========
//




//
// NRAM/IO Interface
// =================
//










//
// NRAM/ENET Interface
// ===================
//







//
// IO/FCRAM Interface
// ==================
//






//
// PCI Interface
// ==================
// Load/store size encodings
// -------------------------
// Size encoding
// 000 - byte
// 001 - half-word
// 010 - word
// 011 - double-word
// 100 - quad






//
// JBI<->SCTAG Interface
// =======================
// Outbound Header Format



























// Inbound Header Format




















//
// JBI->IOB Mondo Header Format
// ============================
//














// JBI->IOB Mondo Bus Width/Cycle
// ==============================
// Cycle  1 Header[15:8]
// Cycle  2 Header[ 7:0]
// Cycle  3 J_AD[127:120]
// Cycle  4 J_AD[119:112]
// .....
// Cycle 18 J_AD[  7:  0]



////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////

module ucb_noflow (/*AUTOARG*/
   // Outputs
   ucb_iob_stall, rd_req_vld, wr_req_vld, thr_id_in, buf_id_in, 
   size_in, addr_in, data_in, int_busy, ucb_iob_vld, ucb_iob_data, 
   // Inputs
   clk, rst_l, iob_ucb_vld, iob_ucb_data, rd_ack_vld, rd_nack_vld, 
   thr_id_out, buf_id_out, data128, data_out, int_vld, int_typ, 
   int_thr_id, dev_id, int_stat, int_vec, iob_ucb_stall
   );

   // synopsys template
   
   parameter IOB_UCB_WIDTH = 32;  // data bus width from IOB to UCB
   parameter UCB_IOB_WIDTH = 8;   // data bus width from UCB to IOB
   parameter REG_WIDTH = 64;      // set this to 128 if unit needs to
                                  // return 128-bit data
   

   // Globals
   input                                clk;
   input 				rst_l;
   
   // Request from IO Bridge
   input 				iob_ucb_vld;
   input [IOB_UCB_WIDTH-1:0] 		iob_ucb_data;
   output 				ucb_iob_stall;

   // Request to local unit
   output 				rd_req_vld;
   output 				wr_req_vld;
   output [9-4:0]   thr_id_in;
   output [11-10:0]   buf_id_in;
   output [14-12:0] size_in;   // only pertinent to PCI
   output [54-15:0] addr_in;
   output [127-64:0] data_in;

   // Ack/Nack from local unit
   input 				rd_ack_vld;
   input 				rd_nack_vld;
   input [9-4:0] 	thr_id_out;
   input [11-10:0] 	buf_id_out;
   input 				data128;   // set to 1 if data returned is 128 bit
   input [REG_WIDTH-1:0] 		data_out;

   // Interrupt from local unit
   input 				int_vld;
   input [3-0:0] 	int_typ;          // interrupt type
   input [9-4:0] 	int_thr_id;       // interrupt thread ID
   input [18-10:0] dev_id;      // interrupt device ID
   input [50-19:0] int_stat;  // interrupt status
   input [56-51:0]   int_vec;   // interrupt vector
   output 				int_busy;         // interrupt buffer busy
   
   // Output to IO Bridge
   output 				ucb_iob_vld;
   output [UCB_IOB_WIDTH-1:0] 		ucb_iob_data;
   input 				iob_ucb_stall;
   
   // Local signals
   wire 				indata_buf_vld;
   wire [127:0] 			indata_buf;
   wire 				ucb_iob_stall_a1;
   
   wire 				read_pending;
   wire 				read_outstanding;
   wire 				read_outstanding_next;
   wire 				write_pending;
   wire 				illegal_write_size;
   
   wire 				ack_buf_rd;
   wire 				ack_buf_wr;
   wire 				ack_buf_vld;
   wire 				ack_buf_vld_next;
   wire 				ack_buf_is_nack;
   wire 				ack_buf_is_data128;
   wire [3-0:0] 	ack_typ_out;
   wire [REG_WIDTH+11-0:0] ack_buf_in;
   wire [REG_WIDTH+11-0:0] ack_buf;
   wire [(REG_WIDTH+64)/UCB_IOB_WIDTH-1:0] ack_buf_vec;
   
   wire 				int_buf_rd;
   wire 				int_buf_wr;
   wire 				int_buf_vld;
   wire 				int_buf_vld_next;
   wire [56-0:0] int_buf_in;
   wire [56-0:0] int_buf;
   wire [(REG_WIDTH+64)/UCB_IOB_WIDTH-1:0] int_buf_vec;
   
   wire 				int_last_rd;
   wire 				outdata_buf_busy;
   wire 				outdata_buf_wr;
   wire [REG_WIDTH+63:0] 		outdata_buf_in;
   wire [(REG_WIDTH+64)/UCB_IOB_WIDTH-1:0] outdata_vec_in;


////////////////////////////////////////////////////////////////////////
// Code starts here
////////////////////////////////////////////////////////////////////////
   /************************************************************
    * Inbound Data
    ************************************************************/
   // Register size is hardcoded to 64 bits here because all
   // units using the UCB module will only write to 64 bit registers.
   ucb_bus_in #(IOB_UCB_WIDTH,64) ucb_bus_in (.rst_l(rst_l),
					      .clk(clk),
					      .vld(iob_ucb_vld),
					      .data(iob_ucb_data),
					      .stall(ucb_iob_stall),
					      .indata_buf_vld(indata_buf_vld),
					      .indata_buf(indata_buf),
					      .stall_a1(ucb_iob_stall_a1));

   
   /************************************************************
    * Decode inbound packet type
    ************************************************************/
   assign 	 read_pending = (indata_buf[3:0] ==
				 4'b0100) &
			        indata_buf_vld;

   // Assertion: rd_req_vld and ack_buf_rd must be
   //            mutually exclusive
   assign 	 read_outstanding_next = rd_req_vld ? 1'b1 :
	                                 ack_buf_rd ? 1'b0 :
	                                              read_outstanding;
   dffrl_ns #(1) read_outstanding_ff (.din(read_outstanding_next),
				      .clk(clk),
				      .rst_l(rst_l),
				      .q(read_outstanding));
   
   assign 	 ucb_iob_stall_a1 = read_pending & read_outstanding;

   assign 	 write_pending = (indata_buf[3:0] == 
				  4'b0101) &
        	                 indata_buf_vld;

   // 3'b011 is the encoding for double word.  All writes have to be
   // 64 bits except writes going to PCI.  PCI will instantiate a
   // customized version of UCB.
   assign 	 illegal_write_size = (indata_buf[14:12] !=
				       3'b011);
   
   
   /************************************************************
    * Inbound interface to local unit
    ************************************************************/
   assign 	 rd_req_vld = read_pending & ~read_outstanding;
   assign 	 wr_req_vld = write_pending & ~illegal_write_size;
   assign 	 thr_id_in = indata_buf[9:4];
   assign 	 buf_id_in = indata_buf[11:10];
   assign 	 size_in = indata_buf[14:12];
   assign 	 addr_in = indata_buf[54:15];
   assign 	 data_in = indata_buf[127:64];
   
   
   /************************************************************
    * Outbound Ack/Nack
    ************************************************************/
   assign 	 ack_buf_wr = rd_ack_vld | rd_nack_vld;
   
   assign 	 ack_buf_vld_next = ack_buf_wr ? 1'b1 :
		                    ack_buf_rd ? 1'b0 :
		                                 ack_buf_vld;
   
   dffrl_ns #(1) ack_buf_vld_ff (.din(ack_buf_vld_next),
				 .clk(clk),
				 .rst_l(rst_l),
				 .q(ack_buf_vld));
   
   dffe_ns #(1) ack_buf_is_nack_ff (.din(rd_nack_vld),
				    .en(ack_buf_wr),
				    .clk(clk),
				    .q(ack_buf_is_nack));

   dffe_ns #(1) ack_buf_is_data128_ff (.din(data128),
				       .en(ack_buf_wr),
				       .clk(clk),
				       .q(ack_buf_is_data128));

   assign 	 ack_typ_out = rd_ack_vld ? 4'b0001:
	                                    4'b0000;

   assign 	 ack_buf_in = {data_out,
			       buf_id_out,
			       thr_id_out,
			       ack_typ_out};
   
   dffe_ns #(REG_WIDTH+11-0+1) ack_buf_ff (.din(ack_buf_in),
							      .en(ack_buf_wr),
							      .clk(clk),
							      .q(ack_buf));

   assign        ack_buf_vec = ack_buf_is_nack    ? {{REG_WIDTH/UCB_IOB_WIDTH{1'b0}},
                                                     {64/UCB_IOB_WIDTH{1'b1}}} :
                               ack_buf_is_data128 ? {(REG_WIDTH+64)/UCB_IOB_WIDTH{1'b1}} :
                                                    {(64+64)/UCB_IOB_WIDTH{1'b1}};
   

   /************************************************************
    * Outbound Interrupt
    ************************************************************/
   // Assertion: int_buf_wr shoudn't be asserted if int_buf_busy
   assign 	 int_buf_wr = int_vld;
   
   assign 	 int_buf_vld_next = int_buf_wr ? 1'b1 :
		                    int_buf_rd ? 1'b0 :
		                                 int_buf_vld;
   
   dffrl_ns #(1) int_buf_vld_ff (.din(int_buf_vld_next),
				 .clk(clk),
				 .rst_l(rst_l),
				 .q(int_buf_vld));

   assign 	 int_buf_in = {int_vec,
			       int_stat,
			       dev_id,
			       int_thr_id,
			       int_typ};
   
   dffe_ns #(56-0+1) int_buf_ff (.din(int_buf_in),
							.en(int_buf_wr),
							.clk(clk),
							.q(int_buf));

   assign 	 int_buf_vec = {{REG_WIDTH/UCB_IOB_WIDTH{1'b0}},
                                {64/UCB_IOB_WIDTH{1'b1}}};

   assign 	 int_busy = int_buf_vld;


   /************************************************************
    * Outbound ack/interrupt Arbitration
    ************************************************************/
   dffrle_ns #(1) int_last_rd_ff (.din(int_buf_rd),
				  .en(ack_buf_rd|int_buf_rd),
				  .rst_l(rst_l),
				  .clk(clk),
				  .q(int_last_rd));
			   
   assign 	 ack_buf_rd = ~outdata_buf_busy & ack_buf_vld &
		              (~int_buf_vld | int_last_rd);
   
   assign 	 int_buf_rd = ~outdata_buf_busy & int_buf_vld &
		              (~ack_buf_vld | ~int_last_rd);

   assign 	 outdata_buf_wr = ack_buf_rd | int_buf_rd;
   
   assign 	 outdata_buf_in = ack_buf_rd ? {ack_buf[REG_WIDTH+11:11+1],
						{(63-55+1){1'b0}},
						{(54-15+1){1'b0}},
						{(14-12+1){1'b0}},
						ack_buf[11:10],
						ack_buf[9:4],
						ack_buf[3:0]}:
		                               {{REG_WIDTH{1'b0}},
						{(63-57+1){1'b0}},
						int_buf[56:51],
						int_buf[50:19],
						int_buf[18:10],
						int_buf[9:4],
						int_buf[3:0]};
   
   assign 	 outdata_vec_in = ack_buf_rd ? ack_buf_vec :
	                                       int_buf_vec;
   
   ucb_bus_out #(UCB_IOB_WIDTH, REG_WIDTH) ucb_bus_out (.rst_l(rst_l),
							.clk(clk),
							.outdata_buf_wr(outdata_buf_wr),
							.outdata_buf_in(outdata_buf_in),
							.outdata_vec_in(outdata_vec_in),
							.outdata_buf_busy(outdata_buf_busy),
							.vld(ucb_iob_vld),
							.data(ucb_iob_data),
							.stall(iob_ucb_stall));
   
   
endmodule // ucb_noflow


// Local Variables:
// verilog-library-directories:(".")
// End:







// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: cluster_header.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
//
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
//
// The above named program is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
//
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
//
// ========== Copyright Header End ============================================
// The cluster header is instatiated as a hard macro.
// This model is for simulation only.
// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: sys.h
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/
// -*- verilog -*-
////////////////////////////////////////////////////////////////////////
/*
//
// Description:		Global header file that contain definitions that 
//                      are common/shared at the systme level
*/
////////////////////////////////////////////////////////////////////////
//
// Setting the time scale
// If the timescale changes, JP_TIMESCALE may also have to change.
`timescale	1ps/1ps
`default_nettype wire

//
// Number of threads in a core
// ===========================
//

//`define CONFIG_NUM_THREADS // This must be defined for any of below to work
//`define THREADS_1
//`define THREADS_2
//`define THREADS_3


//
// JBUS clock
// =========
//
// `define SYSCLK_PERIOD   5000


// Afara Link Defines
// ==================

// Reliable Link




// Afara Link Objects


// Afara Link Object Format - Reliable Link










// Afara Link Object Format - Congestion



  







// Afara Link Object Format - Acknowledge











// Afara Link Object Format - Request

















// Afara Link Object Format - Message



// Acknowledge Types




// Request Types





// Afara Link Frame



//
// UCB Packet Type
// ===============
//

















//
// UCB Data Packet Format
// ======================
//






























// Size encoding for the UCB_SIZE_HI/LO field
// 000 - byte
// 001 - half-word
// 010 - word
// 011 - double-word
// 111 - quad-word







//
// UCB Interrupt Packet Format
// ===========================
//










//`define UCB_THR_HI             9      // (6) cpu/thread ID shared with
//`define UCB_THR_LO             4             data packet format
//`define UCB_PKT_HI             3      // (4) packet type shared with
//`define UCB_PKT_LO             0      //     data packet format







//
// FCRAM Bus Widths
// ================
//






//
// ENET clock periods
// ==================
//
// `define AXGRMII_CLK_PERIOD          6400 // 312.5MHz/2
// `define ENET_GMAC_CLK_PERIOD        8000 // 125MHz


//
// JBus Bridge defines
// =================
//
// `define      SYS_UPA_CLK        `SYS.upa_clk
// `define      SYS_J_CLK          `SYS.j_clk
// `define      SYS_P_CLK          `SYS.p_clk
// `define      SYS_G_CLK          `SYS.g_clk
// `define      JP_TIMESCALE       `timescale 1 ps / 1 ps
// `define      PCI_CLK_PERIOD     15152                  //  66 MHz
// `define      UPA_RD_CLK_PERIOD  6666                   // 150 MHz
// `define      UPA_REF_CLK_PERIOD 7576                   // 132 MHz
// `define      ICHIP_CLK_PERIOD   30304                  //  33 MHz


//
// PCI Device Address Configuration
// ================================
//
























module cluster_header (/*AUTOARG*/
   // Outputs
   dbginit_l, cluster_grst_l, rclk, so,
   // Inputs
   gclk, cluster_cken, arst_l, grst_l, adbginit_l, gdbginit_l, si,
   se
   );

   input       gclk;
   input       cluster_cken;
   input       arst_l;
   input       grst_l;
   input       adbginit_l;
   input       gdbginit_l;
   output      dbginit_l;
   output      cluster_grst_l;
   output      rclk;

   input       si; // scan ports for reset flop repeaters
   input       se;
   output      so;




















   wire        pre_sync_enable;
   wire        sync_enable;
   wire        cluster_grst_l;
   wire        dbginit_l;
   wire        rst_sync_so;

   bw_u1_syncff_4x sync_cluster_master ( // no scan hook-up
                                        .so(),
                                        .q (pre_sync_enable),
                                        .ck (gclk),
                                        .d (cluster_cken),
                                        .sd(1'b0),
                                        .se(1'b0)
				        );


   bw_u1_scanl_2x sync_cluster_slave ( // use scan lock-up latch
                                      .so (sync_enable),
                                      .ck (gclk),
                                      .sd (pre_sync_enable)
        			      );

// NOTE! Pound delay in the below statement is meant to provide 10 ps
// delay between gclk and rclk to allow the synchronizer for rst, dbginit,
// and sync pulses to be modelled accurately.  gclk and rclk need to have
// at least one simulator timestep separation to allow the flop->flop
// synchronizer to work correctly.
   assign rclk = gclk & sync_enable;
   // assign #10 rclk = gclk & sync_enable;

   synchronizer_asr rst_repeater (
				 .sync_out(cluster_grst_l),
				 .so(rst_sync_so),
				 .async_in(grst_l),
				 .gclk(gclk),
				 .rclk(rclk),
				 .arst_l(arst_l),
				 .si(si),
				 .se(se)
				 );

   synchronizer_asr dbginit_repeater (
				     .sync_out(dbginit_l),
				     .so(so),
				     .async_in(gdbginit_l),
				     .gclk(gclk),
				     .rclk(rclk),
				     .arst_l(adbginit_l),
				     .si(rst_sync_so),
				     .se(se)
				     );


endmodule // cluster_header
// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: cluster_header_sync.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
// The sync pulse cluster header is instatiated as a hard macro.
// This model is for simulation only.

module cluster_header_sync (/*AUTOARG*/
   // Outputs
   dram_rx_sync_local, dram_tx_sync_local, jbus_rx_sync_local, 
   jbus_tx_sync_local, so, 
   // Inputs
   dram_rx_sync_global, dram_tx_sync_global, jbus_rx_sync_global, 
   jbus_tx_sync_global, cmp_gclk, cmp_rclk, si, se
   );

   output dram_rx_sync_local;
   output dram_tx_sync_local;
   output jbus_rx_sync_local;
   output jbus_tx_sync_local;
   output so;

   input  dram_rx_sync_global;
   input  dram_tx_sync_global;
   input  jbus_rx_sync_global;
   input  jbus_tx_sync_global;
   input  cmp_gclk;
   input  cmp_rclk;
   input  si;
   input  se;

   wire   dram_rx_so;
   wire   dram_tx_so;
   wire   jbus_rx_so;

   bw_clk_cclk_sync sync_wrapper (
				  .dram_rx_sync_local(dram_rx_sync_local),
				  .dram_tx_sync_local(dram_tx_sync_local),
				  .jbus_rx_sync_local(jbus_rx_sync_local),
				  .jbus_tx_sync_local(jbus_tx_sync_local),
				  .so(so),
				  .dram_rx_sync_global(dram_rx_sync_global),
				  .dram_tx_sync_global(dram_tx_sync_global),
				  .jbus_rx_sync_global(jbus_rx_sync_global),
				  .jbus_tx_sync_global(jbus_tx_sync_global),
				  .cmp_gclk(cmp_gclk),
				  .cmp_rclk(cmp_rclk),
				  .si(si),
				  .se(se)
				  );			       

endmodule // cluster_header_sync
// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: cluster_header_dup.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
//
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
//
// The above named program is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
//
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
//
// ========== Copyright Header End ============================================
// The cluster header is instatiated as a hard macro.
// This model is for simulation only.
// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: sys.h
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/
// -*- verilog -*-
////////////////////////////////////////////////////////////////////////
/*
//
// Description:		Global header file that contain definitions that 
//                      are common/shared at the systme level
*/
////////////////////////////////////////////////////////////////////////
//
// Setting the time scale
// If the timescale changes, JP_TIMESCALE may also have to change.
`timescale	1ps/1ps
`default_nettype wire

//
// Number of threads in a core
// ===========================
//

//`define CONFIG_NUM_THREADS // This must be defined for any of below to work
//`define THREADS_1
//`define THREADS_2
//`define THREADS_3


//
// JBUS clock
// =========
//
// `define SYSCLK_PERIOD   5000


// Afara Link Defines
// ==================

// Reliable Link




// Afara Link Objects


// Afara Link Object Format - Reliable Link










// Afara Link Object Format - Congestion



  







// Afara Link Object Format - Acknowledge











// Afara Link Object Format - Request

















// Afara Link Object Format - Message



// Acknowledge Types




// Request Types





// Afara Link Frame



//
// UCB Packet Type
// ===============
//

















//
// UCB Data Packet Format
// ======================
//






























// Size encoding for the UCB_SIZE_HI/LO field
// 000 - byte
// 001 - half-word
// 010 - word
// 011 - double-word
// 111 - quad-word







//
// UCB Interrupt Packet Format
// ===========================
//










//`define UCB_THR_HI             9      // (6) cpu/thread ID shared with
//`define UCB_THR_LO             4             data packet format
//`define UCB_PKT_HI             3      // (4) packet type shared with
//`define UCB_PKT_LO             0      //     data packet format







//
// FCRAM Bus Widths
// ================
//






//
// ENET clock periods
// ==================
//
// `define AXGRMII_CLK_PERIOD          6400 // 312.5MHz/2
// `define ENET_GMAC_CLK_PERIOD        8000 // 125MHz


//
// JBus Bridge defines
// =================
//
// `define      SYS_UPA_CLK        `SYS.upa_clk
// `define      SYS_J_CLK          `SYS.j_clk
// `define      SYS_P_CLK          `SYS.p_clk
// `define      SYS_G_CLK          `SYS.g_clk
// `define      JP_TIMESCALE       `timescale 1 ps / 1 ps
// `define      PCI_CLK_PERIOD     15152                  //  66 MHz
// `define      UPA_RD_CLK_PERIOD  6666                   // 150 MHz
// `define      UPA_REF_CLK_PERIOD 7576                   // 132 MHz
// `define      ICHIP_CLK_PERIOD   30304                  //  33 MHz


//
// PCI Device Address Configuration
// ================================
//
























module cluster_header_dup (/*AUTOARG*/
   // Outputs
   dbginit_l, cluster_grst_l, rclk, so,
   // Inputs
   gclk, cluster_cken, arst_l, grst_l, adbginit_l, gdbginit_l, si,
   se
   );

   input       gclk;
   input       cluster_cken;
   input       arst_l;
   input       grst_l;
   input       adbginit_l;
   input       gdbginit_l;
   output      dbginit_l;
   output      cluster_grst_l;
   output      rclk;

   input       si; // scan ports for reset flop repeaters
   input       se;
   output      so;

   wire        pre_sync_enable;
   wire        sync_enable;
   wire        cluster_grst_l;
   wire        dbginit_l;
   wire        rst_sync_so;

   bw_u1_soffasr_2x sync_cluster_master ( // no scan hook-up
                                        .so(),
                                        .q (pre_sync_enable),
                                        .ck (gclk),
                                        .d (cluster_cken),
					.r_l (arst_l),
					.s_l (1'b1),
                                        .sd(1'b0),
                                        .se(1'b0)
				        );


   bw_clk_cclk_scanlasr_2x sync_cluster_slave ( // use scan lock-up latch
                                      .r_l (arst_l),
                                      .so (sync_enable),
                                      .ck (gclk),
                                      .sd (pre_sync_enable)
        			      );

// NOTE! Pound delay in the below statement is meant to provide 10 ps
// delay between gclk and rclk to allow the synchronizer for rst, dbginit,
// and sync pulses to be modelled accurately.  gclk and rclk need to have
// at least one simulator timestep separation to allow the flop->flop
// synchronizer to work correctly.
   // assign #10 rclk = gclk & sync_enable;
   assign rclk = gclk & sync_enable;

   synchronizer_asr rst_repeater (
				 .sync_out(cluster_grst_l),
				 .so(rst_sync_so),
				 .async_in(grst_l),
				 .gclk(gclk),
				 .rclk(rclk),
				 .arst_l(arst_l),
				 .si(si),
				 .se(se)
				 );

   synchronizer_asr_dup dbginit_repeater (
				     .sync_out(dbginit_l),
				     .so(so),
				     .async_in(gdbginit_l),
				     .gclk(gclk),
				     .rclk(rclk),
				     .arst_l(adbginit_l),
				     .si(rst_sync_so),
				     .se(se)
				     );

endmodule // cluster_header
// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: cluster_header_ctu.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
//
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
//
// The above named program is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
//
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
//
// ========== Copyright Header End ============================================
// The cluster header is instatiated as a hard macro.
// This model is for simulation only.
// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: sys.h
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/
// -*- verilog -*-
////////////////////////////////////////////////////////////////////////
/*
//
// Description:		Global header file that contain definitions that 
//                      are common/shared at the systme level
*/
////////////////////////////////////////////////////////////////////////
//
// Setting the time scale
// If the timescale changes, JP_TIMESCALE may also have to change.
`timescale	1ps/1ps
`default_nettype wire

//
// Number of threads in a core
// ===========================
//

//`define CONFIG_NUM_THREADS // This must be defined for any of below to work
//`define THREADS_1
//`define THREADS_2
//`define THREADS_3


//
// JBUS clock
// =========
//
// `define SYSCLK_PERIOD   5000


// Afara Link Defines
// ==================

// Reliable Link




// Afara Link Objects


// Afara Link Object Format - Reliable Link










// Afara Link Object Format - Congestion



  







// Afara Link Object Format - Acknowledge











// Afara Link Object Format - Request

















// Afara Link Object Format - Message



// Acknowledge Types




// Request Types





// Afara Link Frame



//
// UCB Packet Type
// ===============
//

















//
// UCB Data Packet Format
// ======================
//






























// Size encoding for the UCB_SIZE_HI/LO field
// 000 - byte
// 001 - half-word
// 010 - word
// 011 - double-word
// 111 - quad-word







//
// UCB Interrupt Packet Format
// ===========================
//










//`define UCB_THR_HI             9      // (6) cpu/thread ID shared with
//`define UCB_THR_LO             4             data packet format
//`define UCB_PKT_HI             3      // (4) packet type shared with
//`define UCB_PKT_LO             0      //     data packet format







//
// FCRAM Bus Widths
// ================
//






//
// ENET clock periods
// ==================
//
// `define AXGRMII_CLK_PERIOD          6400 // 312.5MHz/2
// `define ENET_GMAC_CLK_PERIOD        8000 // 125MHz


//
// JBus Bridge defines
// =================
//
// `define      SYS_UPA_CLK        `SYS.upa_clk
// `define      SYS_J_CLK          `SYS.j_clk
// `define      SYS_P_CLK          `SYS.p_clk
// `define      SYS_G_CLK          `SYS.g_clk
// `define      JP_TIMESCALE       `timescale 1 ps / 1 ps
// `define      PCI_CLK_PERIOD     15152                  //  66 MHz
// `define      UPA_RD_CLK_PERIOD  6666                   // 150 MHz
// `define      UPA_REF_CLK_PERIOD 7576                   // 132 MHz
// `define      ICHIP_CLK_PERIOD   30304                  //  33 MHz


//
// PCI Device Address Configuration
// ================================
//
























module cluster_header_ctu (/*AUTOARG*/
   // Outputs
   dbginit_l, cluster_grst_l, rclk, so,
   // Inputs
   gclk, cluster_cken, arst_l, grst_l, adbginit_l, gdbginit_l, si,
   se
   );

   input       gclk;
   input       cluster_cken;
   input       arst_l;
   input       grst_l;
   input       adbginit_l;
   input       gdbginit_l;
   output      dbginit_l;
   output      cluster_grst_l;
   output      rclk;

   input       si; // scan ports for reset flop repeaters
   input       se;
   output      so;

   wire        pre_sync_enable;
   wire        sync_enable;
   wire        cluster_grst_l;
   wire        dbginit_l;
   wire        rst_sync_so;

   bw_u1_syncff_4x sync_cluster_master ( // no scan hook-up
                                        .so(),
                                        .q (pre_sync_enable),
                                        .ck (gclk),
                                        .d (cluster_cken),
                                        .sd(1'b0),
                                        .se(1'b0)
				        );


   bw_u1_scanl_2x sync_cluster_slave ( // use scan lock-up latch
                                      .so (sync_enable),
                                      .ck (gclk),
                                      .sd (pre_sync_enable)
        			      );

// NOTE! Pound delay in the below statement is meant to provide 10 ps
// delay between gclk and rclk to allow the synchronizer for rst, dbginit,
// and sync pulses to be modelled accurately.  gclk and rclk need to have
// at least one simulator timestep separation to allow the flop->flop
// synchronizer to work correctly.
   reg      rclk_reg;
   // always @(gclk)  rclk_reg = #10 gclk;
   always @(gclk)  rclk_reg = gclk;
   assign rclk = rclk_reg;

   synchronizer_asr rst_repeater (
				 .sync_out(cluster_grst_l),
				 .so(rst_sync_so),
				 .async_in(grst_l),
				 .gclk(gclk),
				 .rclk(rclk),
				 .arst_l(arst_l),
				 .si(si),
				 .se(se)
				 );

   synchronizer_asr dbginit_repeater (
				     .sync_out(dbginit_l),
				     .so(so),
				     .async_in(gdbginit_l),
				     .gclk(gclk),
				     .rclk(rclk),
				     .arst_l(adbginit_l),
				     .si(rst_sync_so),
				     .se(se)
				     );

endmodule // cluster_header
// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: synchronizer_asr.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
module synchronizer_asr (/*AUTOARG*/
   // Outputs
   sync_out, so, 
   // Inputs
   async_in, gclk, rclk, arst_l, si, se
   );

   output sync_out;
   output so;
   
   input  async_in;
   input  gclk;
   input  rclk;
   input  arst_l;
   input  si;
   input  se;

   wire   pre_sync_out;
   wire   so_rptr;
   wire   so_lockup;
   
   bw_u1_soffasr_2x repeater (
                              .q (pre_sync_out),
                              .so (so_rptr),
                              .ck (gclk),
                              .d (async_in),	
                              .r_l (arst_l),	
                              .s_l (1'b1),	
                              .se (se),
                              .sd (si)
			      );
   bw_u1_scanl_2x lockup (
			   .so (so_lockup),
			   .sd (so_rptr),
			   .ck (gclk)
			   );

   bw_u1_soffasr_2x syncff (
                            .q (sync_out),
                            .so (so),
                            .ck (rclk),
                            .d (pre_sync_out),
                            .r_l (arst_l),	
                            .s_l (1'b1),	
                            .se (se),
                            .sd (so_lockup)
			    );

endmodule // synchronizer_asr
// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: synchronizer_asr_dup.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
module synchronizer_asr_dup (/*AUTOARG*/
   // Outputs
   sync_out, so, 
   // Inputs
   async_in, gclk, rclk, arst_l, si, se
   );

   output sync_out;
   output so;
   
   input  async_in;
   input  gclk;
   input  rclk;
   input  arst_l;
   input  si;
   input  se;

   wire   pre_sync_out;
   wire   so_rptr;
   wire   so_lockup;
   
   bw_u1_soff_8x repeater (
                              .q (pre_sync_out),
                              .so (so_rptr),
                              .ck (gclk),
                              .d (async_in),	
                              .se (se),
                              .sd (si)
			      );
   bw_u1_scanl_2x lockup (
			   .so (so_lockup),
			   .sd (so_rptr),
			   .ck (gclk)
			   );

   bw_u1_soffasr_2x syncff (
                            .q (sync_out),
                            .so (so),
                            .ck (rclk),
                            .d (pre_sync_out),
                            .r_l (arst_l),	
                            .s_l (1'b1),	
                            .se (se),
                            .sd (so_lockup)
			    );

endmodule // synchronizer_asr
// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sync_pulse_synchronizer.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
// Synchronizer without reset for use in cluster_header_sync.
// For simulation only.

module sync_pulse_synchronizer (/*AUTOARG*/
   // Outputs
   sync_out, so, 
   // Inputs
   async_in, gclk, rclk, si, se
   );

   output sync_out;
   output so;
   
   input  async_in;
   input  gclk;
   input  rclk;
   input  si;
   input  se;

   wire   pre_sync_out;
   wire   so_rptr;
   wire   so_lockup;

   // Flop drive strengths to be adjusted as necessary
   
   bw_u1_soff_8x repeater (
                           .q (pre_sync_out),
                           .so (so_rptr),
                           .ck (gclk),
                           .d (async_in),	
                           .se (se),
                           .sd (si)
			   );

   bw_u1_scanl_2x lockup (
			   .so (so_lockup),
			   .sd (so_rptr),
			   .ck (gclk)
			   );

   bw_u1_soff_8x syncff (
                         .q (sync_out),
                         .so (so),
                         .ck (rclk),
                         .d (pre_sync_out),
                         .se (se),
                         .sd (so_lockup)
			 );

endmodule // sync_pulse_synchronizer
/*
Copyright (c) 2015 Princeton University
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

//==================================================================================================
//  Filename      : clk_gating_latch.v
//  Created On    : 2015-01-26 14:10:43
//  Last Modified : 2015-01-26 15:13:40
//  Revision      :
//  Author        : Tri Nguyen
//  Company       : Princeton University
//  Email         : trin@princeton.edu
//
//  Description   : Latch for glitchless clock gating
//==================================================================================================

module clk_gating_latch (
    input wire clk,
    input wire clk_en,
    output wire clk_out
);

wire clk_en_sync;
reg clk_en_sync_latch;

assign clk_out = clk & clk_en_sync_latch;

synchronizer sync(
    .clk            (clk),
    .presyncdata    (clk_en),
    .syncdata       (clk_en_sync)
);

// clk_en_sync_latch changes only on the negative duty of the cycle
always @ (clk or clk_en_sync)
    if (~clk) clk_en_sync_latch = clk_en_sync;

endmodule // clk_gating_latch
// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: swrvr_dlib.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
// DP library

// 2:1 MUX WITH ENCODED SELECT
module dp_mux2es (dout, in0, in1, sel) ;
// synopsys template

parameter SIZE = 1;

output 	[SIZE-1:0] 	dout;
input	[SIZE-1:0]	in0;
input	[SIZE-1:0]	in1;
input			sel;

reg	[SIZE-1:0]	dout ;

always @ (sel or in0 or in1)

 begin
	   case (sel)
	     1'b1: dout = in1 ; 
	     1'b0: dout = in0;
	     default: 
         begin
            if (in0 == in1) begin
               dout = in0;
            end
            else
              dout = {SIZE{1'bx}};
         end
	   endcase // case(sel)
 end

endmodule // dp_mux2es

// ----------------------------------------------------------------------


// 4:1 MUX WITH DECODED SELECTS
module dp_mux4ds (dout, in0, in1, in2, in3, 
		     sel0_l, sel1_l, sel2_l, sel3_l) ;
// synopsys template

parameter SIZE = 1;

output 	[SIZE-1:0] 	dout;
input	[SIZE-1:0]	in0;
input	[SIZE-1:0]	in1;
input	[SIZE-1:0]	in2;
input	[SIZE-1:0]	in3;
input			sel0_l;
input			sel1_l;
input			sel2_l;
input			sel3_l;

// reg declaration does not imply state being maintained
// across cycles. Used to construct case statement and
// always updated by inputs every cycle.
reg	[SIZE-1:0]	dout ;





wire [3:0] sel = {sel3_l,sel2_l,sel1_l,sel0_l}; // 0in one_cold
   
always @ (sel0_l or sel1_l or sel2_l or sel3_l or in0 or in1 or in2 or in3)

	case ({sel3_l,sel2_l,sel1_l,sel0_l})
		4'b1110 : dout = in0 ;
		4'b1101 : dout = in1 ;
		4'b1011 : dout = in2 ;
		4'b0111 : dout = in3 ;
		4'b1111 : dout = {SIZE{1'bx}} ;
		default : dout = {SIZE{1'bx}} ;
	endcase

endmodule // dp_mux4ds

// ----------------------------------------------------------------------


// 5:1 MUX WITH DECODED SELECTS
module dp_mux5ds (dout, in0, in1, in2, in3,  in4,
		     sel0_l, sel1_l, sel2_l, sel3_l, sel4_l) ;
// synopsys template

parameter SIZE = 1;

output 	[SIZE-1:0] 	dout;
input	[SIZE-1:0]	in0;
input	[SIZE-1:0]	in1;
input	[SIZE-1:0]	in2;
input	[SIZE-1:0]	in3;
input	[SIZE-1:0]	in4;
input			sel0_l;
input			sel1_l;
input			sel2_l;
input			sel3_l;
input			sel4_l;

// reg declaration does not imply state being maintained
// across cycles. Used to construct case statement and
// always updated by inputs every cycle.
reg	[SIZE-1:0]	dout ;




   
wire [4:0] sel = {sel4_l,sel3_l,sel2_l,sel1_l,sel0_l}; // 0in one_cold

always @ (sel0_l or sel1_l or sel2_l or sel3_l or sel4_l or
		in0 or in1 or in2 or in3 or in4)

	case ({sel4_l,sel3_l,sel2_l,sel1_l,sel0_l})
		5'b11110 : dout = in0 ;
		5'b11101 : dout = in1 ;
		5'b11011 : dout = in2 ;
		5'b10111 : dout = in3 ;
		5'b01111 : dout = in4 ;
		5'b11111 : dout = {SIZE{1'bx}} ;
		default : dout = {SIZE{1'bx}} ;
	endcase

endmodule // dp_mux5ds

// --------------------------------------------------------------------

// 8:1 MUX WITH DECODED SELECTS
module dp_mux8ds (dout, in0, in1, in2, in3, 
			in4, in5, in6, in7,
		     sel0_l, sel1_l, sel2_l, sel3_l,
		     sel4_l, sel5_l, sel6_l, sel7_l) ;
// synopsys template

parameter SIZE = 1;

output 	[SIZE-1:0] 	dout;
input	[SIZE-1:0]	in0;
input	[SIZE-1:0]	in1;
input	[SIZE-1:0]	in2;
input	[SIZE-1:0]	in3;
input	[SIZE-1:0]	in4;
input	[SIZE-1:0]	in5;
input	[SIZE-1:0]	in6;
input	[SIZE-1:0]	in7;
input			sel0_l;
input			sel1_l;
input			sel2_l;
input			sel3_l;
input			sel4_l;
input			sel5_l;
input			sel6_l;
input			sel7_l;

// reg declaration does not imply state being maintained
// across cycles. Used to construct case statement and
// always updated by inputs every cycle.
reg	[SIZE-1:0]	dout ;






wire [7:0] sel = {sel7_l,sel6_l,sel5_l,sel4_l,
                  sel3_l,sel2_l,sel1_l,sel0_l}; // 0in one_cold

always @ (sel0_l or sel1_l or sel2_l or sel3_l or in0 or in1 or in2 or in3 or
	  sel4_l or sel5_l or sel6_l or sel7_l or in4 or in5 or in6 or in7)

	case ({sel7_l,sel6_l,sel5_l,sel4_l,sel3_l,sel2_l,sel1_l,sel0_l})
		8'b11111110 : dout = in0 ;
		8'b11111101 : dout = in1 ;
		8'b11111011 : dout = in2 ;
		8'b11110111 : dout = in3 ;
		8'b11101111 : dout = in4 ;
		8'b11011111 : dout = in5 ;
		8'b10111111 : dout = in6 ;
		8'b01111111 : dout = in7 ;
		8'b11111111 : dout = {SIZE{1'bx}} ;
		default : dout = {SIZE{1'bx}} ;
	endcase

endmodule // dp_mux8ds


// ----------------------------------------------------------------------


// 3:1 MUX WITH DECODED SELECTS
module dp_mux3ds (dout, in0, in1, in2, 
		     sel0_l, sel1_l, sel2_l);
// synopsys template

parameter SIZE = 1;

output 	[SIZE-1:0] 	dout;
input	[SIZE-1:0]	in0;
input	[SIZE-1:0]	in1;
input	[SIZE-1:0]	in2;
input			sel0_l;
input			sel1_l;
input			sel2_l;

// reg declaration does not imply state being maintained
// across cycles. Used to construct case statement and
// always updated by inputs every cycle.
reg	[SIZE-1:0]	dout ;





wire [2:0] sel = {sel2_l,sel1_l,sel0_l}; // 0in one_cold
   
always @ (sel0_l or sel1_l or sel2_l or in0 or in1 or in2)

	case ({sel2_l,sel1_l,sel0_l})
		3'b110 : dout = in0 ;
		3'b101 : dout = in1 ;
		3'b011 : dout = in2 ;
	        default : dout = {SIZE{1'bx}} ;
	endcase

endmodule // dp_mux3ds

// ----------------------------------------------------------------------


// 2:1 MUX WITH DECODED SELECTS
module dp_mux2ds (dout, in0, in1,
             sel0_l, sel1_l);
// synopsys template

parameter SIZE = 1;

output  [SIZE-1:0]  dout;
input   [SIZE-1:0]  in0;
input   [SIZE-1:0]  in1;
input           sel0_l;
input           sel1_l;

// reg declaration does not imply state being maintained
// across cycles. Used to construct case statement and
// always updated by inputs every cycle.
reg [SIZE-1:0]  dout ;





wire [1:0] sel = {sel1_l,sel0_l}; // 0in one_cold

always @ (sel0_l or sel1_l or in0 or in1)

    case ({sel1_l,sel0_l})
        3'b10 : dout = in0 ;
        3'b01 : dout = in1 ;
            default : dout = {SIZE{1'bx}} ;
    endcase

endmodule // dp_mux3ds

// ---------------------------------------------------------------------


module dp_buffer(dout, in);
// synopsys template

parameter SIZE = 1;

output 	[SIZE-1:0] 	dout;
input	[SIZE-1:0]	in;

assign dout = in;

endmodule // dp_buffer









// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: mul64.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
/*//////////////////////////////////////////////////////////////////////
//
//  Module Name: mul64
//  Description:        *This block implements the multiplier used in the modular multiplier
//                       unit (MUL) and be shared by sparc EXU and the streaming unit (SPU).
//                       It is also used as the 54x54 multiplier in the FPU.
//                      *It takes two 64-bit unsign data and accumulated operand and do the
//                       64x64 MAC operation at two cycle thruput and 5 cycle latency.
//                      *The mul_valid signal indicate the beginning of a new operation.
//                       It MUST be dis-asserted at the next cycle to have the proper 2-cycle
//                       latency operation in the csa array. If there are two back-to-back
//                       cycle operation, the first operation result will be incorrect.
//                      *Results are avaliable on the 5th cycle of the mul_valid as shows
//
//			*Following inputs should tie to "0" when used as a 64x64 multiplier
//			 - areg 
//			 - accreg 
//			 - x2
//
//                         Cycle-0  | Cycle-1 | Cycle-2 | Cycle-3 | Cycle-4 | Cycle-5
//                       1st        *         |         |         |         |
//                       rs1, rs2   ^         |         |         |         | 1st results
//                       valid=1    | valid=0 |         *         |         | avaliable
//                                1st         | 2nd OP  ^         |         |
//                                setup       | valid=1 |         |         |
//                                            |        2nd        |         |
//                                            |       setup       |         |
//
*/

//PITON_PROTO enables all FPGA related modifications



























































module mul64 (rs1_l, rs2, valid, areg, accreg, x2, out, rclk, si, so, se, mul_rst_l, mul_step);

input  [63:0]  	rs1_l;			// op1
input  [63:0]  	rs2;			// op2
input	       	valid;			// begin of the MUL operation
input  [96:0]  	areg;			// accumulated input for ACCUM
input  [135:129] accreg;		// direct input from ACCUM [135:129]
input	       	x2;			// for op1*op2*2
input	       	rclk, si, se, mul_rst_l, mul_step;
output  	so;
output [135:0] 	out;

wire	       	cyc1, cyc2, cyc3;	// cycle stage of MUL
wire [2:0]	b0, b1, b2,  b3,  b4,  b5,  b6,  b7;
wire [2:0]	b8, b9, b10, b11, b12, b13, b14, b15;
wire	    	b16;
wire [63:0]	op1_l, op1;
wire [81:0]	a0sum, a1sum, a0s, a1s; 
wire [81:4]	a0cout, a1cout, a0c, a1c;
wire		pcoutx2, psumx2;
wire 		x2_c1, x2_c2, x2_c3, x2_c2c3;

wire [98:0]	psum, pcout;
wire [98:30]	pcout_in, pc;
wire [98:31]	psum_in, ps;
wire [96:0]	ary2_cout, addin_cout;
wire [97:0]	ary2_sum,  addin_sum ;
wire		add_cin, addin_cin, add_co31, add_co96;
wire [103:0]	addout;
wire		clk_enb0, clk_enb1;
wire 		rst;
wire		clk;
wire		tm_l;

  assign clk = rclk;
  assign rst = ~mul_rst_l; 
  assign tm_l = ~se;

  clken_buf	ckbuf_0(.clk(clk_enb0), .rclk(clk), .enb_l(~mul_step), .tmb_l(tm_l));

  /////////////////////////////////////////////////////////////////////
  // 	States count
  /////////////////////////////////////////////////////////////////////
  dffr_s  cyc1_dff(.din(valid), .clk(clk_enb0), .q(cyc1), .rst(rst), .se(se), .si(), .so());
  dffr_s  cyc2_dff(.din(cyc1),  .clk(clk_enb0), .q(cyc2), .rst(rst), .se(se), .si(), .so());
  dffr_s  cyc3_dff(.din(cyc2),  .clk(clk_enb0), .q(cyc3), .rst(rst), .se(se), .si(), .so());
  dffr_s  x2c1_dff(.din(x2),    .clk(clk_enb0), .q(x2_c1), .rst(rst), .se(se), .si(), .so());
  dffr_s  x2c2_dff(.din(x2_c1), .clk(clk_enb0), .q(x2_c2), .rst(rst), .se(se), .si(), .so());
  dffr_s  x2c3_dff(.din(x2_c2), .clk(clk_enb0), .q(x2_c3), .rst(rst), .se(se), .si(), .so());

  assign x2_c2c3 =  x2_c2 | x2_c3 ;
	
  /////////////////////////////////////////////////////////////////////
  // 	Enable flops for op1
  /////////////////////////////////////////////////////////////////////
  clken_buf	ckbuf_1(.clk(clk_enb1), .rclk(clk), .enb_l(~(valid & mul_step)), .tmb_l(tm_l));
  dff_s #(64)  	ffrs1  (.din(rs1_l[63:0]), .clk(clk_enb1), .q(op1_l[63:0]),
			.se(se), .si(), .so());




  assign op1[63:0] = ~op1_l[63:0];

  mul_booth	 booth (.head (valid),
			.b_in (rs2),
			.b0   (b0),
			.b1   (b1),
			.b2   (b2),
			.b3   (b3),
			.b4   (b4),
			.b5   (b5),
			.b6   (b6),
			.b7   (b7),
			.b8   (b8),
			.b9   (b9),
			.b10  (b10),
			.b11  (b11),
			.b12  (b12),
			.b13  (b13),
			.b14  (b14),
			.b15  (b15),
			.b16  (b16),
			.clk  (clk), .se(se), .si(), .so(), .mul_step(mul_step), .tm_l(tm_l));
			
  /////////////////////////////////////////////////////////////////////
  // 	Two Array1 inst ary1_a0 & ary1_a1 with the ouput flops 
  /////////////////////////////////////////////////////////////////////
  mul_array1	ary1_a0(.cout (a0cout[81:4]),
			.sum  (a0sum[81:0]),
			.a    (op1),
			.b0   (b0),
			.b1   (b1),
			.b2   (b2),
			.b3   (b3),
			.b4   (b4),
			.b5   (b5),
			.b6   (b6),
			.b7   (b7),
			.b8   (3'b000),
			.head (cyc1),
			.bot  (1'b0)); //array a is never at the bottom of 33-pp rows
 
  dff_s #(78)  a0cot_dff (.din(a0cout[81:4]), .clk(clk_enb0), .q(a0c[81:4]),
			.se(se), .si(), .so());
  dff_s #(82)  a0sum_dff (.din(a0sum[81:0]), .clk(clk_enb0), .q(a0s[81:0]),
			.se(se), .si(), .so());

  mul_array1	ary1_a1(.cout (a1cout[81:4]),
			.sum  (a1sum[81:0]),
			.a    (op1),
			.b0   (b8),
			.b1   (b9),
			.b2   (b10),
			.b3   (b11),
			.b4   (b12),
			.b5   (b13),
			.b6   (b14),
			.b7   (b15),
			.b8   ({1'b0,b16,1'b0}),
			.head (1'b0),	//array b is never at the head of 33-pp rows
			.bot  (cyc2)); 

  dff_s #(78)  a1cot_dff (.din(a1cout[81:4]), .clk(clk_enb0), .q(a1c[81:4]),
			.se(se), .si(), .so());
  dff_s #(82)  a1sum_dff (.din(a1sum[81:0]), .clk(clk_enb0), .q(a1s[81:0]),
			.se(se), .si(), .so());

  /////////////////////////////////////////////////////////////////////
  // 	Array2 with the reorder output mux-flops
  /////////////////////////////////////////////////////////////////////
  mul_array2 	 array2(.pcoutx2 (pcoutx2),
			.psumx2  (psumx2),
			.pcout 	 (pcout[98:0]),
			.psum    (psum[98:0]), 
			.a0c     (a0c[81:4]),
			.a0s     (a0s[81:0]),
			.a1c     (a1c[81:4]),
			.a1s     (a1s[81:0]),
			.pc	 (pc[98:30]),
			.ps	 (ps[98:31]),
			.areg    (areg[96:0]),
			.bot     (cyc3),
			.x2      (x2_c2c3));
 
  //// Outpput re-order muxes and flops	////
  dp_mux2es #(97)  ary2_cmux (.dout(ary2_cout[96:0]),
                              .in0(pcout[96:0]),
                              .in1({pcout[95:0],pcoutx2}),
                              .sel(x2_c2c3));
  dff_s #(97)  a2cot_dff (.din(ary2_cout[96:0]), .clk(clk_enb0), .q(addin_cout[96:0]), 
              		.se(se), .si(), .so());

  dp_mux2es #(98) ary2_smux (.dout(ary2_sum[97:0]),
                             .in0(psum[97:0]),
                             .in1({psum[96:0],psumx2}),
                             .sel(x2_c2c3));
  dff_s #(98)  a2sum_dff (.din(ary2_sum[97:0]), .clk(clk_enb0), .q(addin_sum[97:0]), 
			.se(se), .si(), .so());

  //// Pseudo sum & cout logic and flops ////
  assign psum_in[98:32]  = psum[98:32] & {67{cyc2}} ;
  assign psum_in[31]     = psum[31] & x2_c2 ;

  assign pcout_in[98:31] = pcout[98:31] & {68{cyc2}} ;
  assign pcout_in[30]    = pcout[30] & x2_c2 ;
  
  dff_s #(68)  psum_dff  (.din(psum_in[98:31]), .clk(clk_enb0), .q(ps[98:31]),
                	.se(se), .si(), .so());
  dff_s #(69)  pcout_dff (.din(pcout_in[98:30]), .clk(clk_enb0), .q(pc[98:30]),
            		.se(se), .si(), .so());

  /////////////////////////////////////////////////////////////////////
  // 	Adder (104-bit) 
  /////////////////////////////////////////////////////////////////////

  assign 	add_cin = add_co31 & cyc3 ;

  assign {add_co31,addout[31:0]} =   {{1'b0},addin_sum[31:0]} 
		     		   + {{1'b0},addin_cout[30:0],addin_cin} ;


  assign {add_co96,addout[96:32]} =  addin_sum[97:32]	
				  + addin_cout[96:31]
				  + {{65'b0},add_co31} ;

  assign 	addout[103:97] =  accreg[135:129] + {{6'b0},add_co96} ;

  /////////////////////////////////////////////////////////////////////
  // 	Pipe adder outputs  
  /////////////////////////////////////////////////////////////////////

  dff_s  	      co31_dff (.din(add_cin), .clk(clk_enb0), .q(addin_cin),
       			.se(se), .si(), .so());

  dff_s #(104)   out_dff (.din(addout[103:0]), .clk(clk_enb0), .q(out[135:32]),
              		.se(se), .si(), .so());

  dff_s #(32)    pip_dff (.din(out[63:32]), .clk(clk_enb0), .q(out[31:0]),
               		.se(se), .si(), .so());

endmodule // mul64




////////////////////////////////////////////////////////////////////////
//	Sub-moudle for mul64
////////////////////////////////////////////////////////////////////////

module mul_array1 ( cout, sum, a, b0, b1, b2, b3, b4, b5, b6, b7, b8,
     bot, head );

input  bot, head;
output [81:4]  cout;
output [81:0]  sum;
input [2:0]  b6;
input [2:0]  b3;
input [2:0]  b8;
input [2:0]  b2;
input [2:0]  b1;
input [2:0]  b7;
input [63:0]  a;
input [2:0]  b0;
input [2:0]  b4;
input [2:0]  b5;

// Buses in the design

wire  [1:0]  b5n;
wire  [1:0]  b2n;
wire  [68:1]  c0;
wire  [69:0]  s1;
wire  [68:1]  c1;
wire  [69:0]  s2;
wire  [68:1]  c2;
wire  [70:4]  s_1;
wire  [69:2]  s0;
wire  [76:10]  s_2;
wire  [70:2]  c_1;
wire  [76:10]  c_2;
wire  [75:11]  co;

mul_negen p1n ( .b(b5[2:0]), .n1(b5n[1]), .n0(b5n[0]));
mul_negen p0n ( .b(b2[2:0]), .n1(b2n[1]), .n0(b2n[0]));
mul_csa42  sc3_71_ ( .c(s_2[71]), .cin(co[70]), .a(c_1[70]),
     .b(c_2[70]), .cout(co[71]), .sum(sum[71]), .d(s1[65]),
     .carry(cout[71]));
mul_csa42  sc3_75_ ( .c(s_2[75]), .cin(co[74]), .a(1'b0),
     .b(c_2[74]), .cout(co[75]), .sum(sum[75]), .d(s1[69]),
     .carry(cout[75]));
mul_csa42  sc3_74_ ( .c(s_2[74]), .cin(co[73]), .a(1'b0),
     .b(c_2[73]), .cout(co[74]), .sum(sum[74]), .d(s1[68]),
     .carry(cout[74]));
mul_csa42  sc3_73_ ( .c(s_2[73]), .cin(co[72]), .a(1'b0),
     .b(c_2[72]), .cout(co[73]), .sum(sum[73]), .d(s1[67]),
     .carry(cout[73]));
mul_csa42  sc3_72_ ( .c(s_2[72]), .cin(co[71]), .a(1'b0),
     .b(c_2[71]), .cout(co[72]), .sum(sum[72]), .d(s1[66]),
     .carry(cout[72]));
mul_csa42  sc3_76_ ( .c(s_2[76]), .cin(co[75]), .a(1'b0),
     .b(c_2[75]), .cout(), .sum(sum[76]), .d(1'b0),
     .carry(cout[76]));
mul_csa42  sc3_70_ ( .c(s_2[70]), .cin(co[69]), .a(c_1[69]),
     .b(c_2[69]), .cout(co[70]), .sum(sum[70]), .d(s_1[70]),
     .carry(cout[70]));
mul_csa42  sc3_69_ ( .c(s_2[69]), .cin(co[68]), .a(c_1[68]),
     .b(c_2[68]), .cout(co[69]), .sum(sum[69]), .d(s_1[69]),
     .carry(cout[69]));
mul_csa42  sc3_68_ ( .c(s_2[68]), .cin(co[67]), .a(c_1[67]),
     .b(c_2[67]), .cout(co[68]), .sum(sum[68]), .d(s_1[68]),
     .carry(cout[68]));
mul_csa42  sc3_67_ ( .c(s_2[67]), .cin(co[66]), .a(c_1[66]),
     .b(c_2[66]), .cout(co[67]), .sum(sum[67]), .d(s_1[67]),
     .carry(cout[67]));
mul_csa42  sc3_66_ ( .c(s_2[66]), .cin(co[65]), .a(c_1[65]),
     .b(c_2[65]), .cout(co[66]), .sum(sum[66]), .d(s_1[66]),
     .carry(cout[66]));
mul_csa42  sc3_65_ ( .c(s_2[65]), .cin(co[64]), .a(c_1[64]),
     .b(c_2[64]), .cout(co[65]), .sum(sum[65]), .d(s_1[65]),
     .carry(cout[65]));
mul_csa42  sc3_64_ ( .c(s_2[64]), .cin(co[63]), .a(c_1[63]),
     .b(c_2[63]), .cout(co[64]), .sum(sum[64]), .d(s_1[64]),
     .carry(cout[64]));
mul_csa42  sc3_63_ ( .c(s_2[63]), .cin(co[62]), .a(c_1[62]),
     .b(c_2[62]), .cout(co[63]), .sum(sum[63]), .d(s_1[63]),
     .carry(cout[63]));
mul_csa42  sc3_62_ ( .c(s_2[62]), .cin(co[61]), .a(c_1[61]),
     .b(c_2[61]), .cout(co[62]), .sum(sum[62]), .d(s_1[62]),
     .carry(cout[62]));
mul_csa42  sc3_61_ ( .c(s_2[61]), .cin(co[60]), .a(c_1[60]),
     .b(c_2[60]), .cout(co[61]), .sum(sum[61]), .d(s_1[61]),
     .carry(cout[61]));
mul_csa42  sc3_60_ ( .c(s_2[60]), .cin(co[59]), .a(c_1[59]),
     .b(c_2[59]), .cout(co[60]), .sum(sum[60]), .d(s_1[60]),
     .carry(cout[60]));
mul_csa42  sc3_59_ ( .c(s_2[59]), .cin(co[58]), .a(c_1[58]),
     .b(c_2[58]), .cout(co[59]), .sum(sum[59]), .d(s_1[59]),
     .carry(cout[59]));
mul_csa42  sc3_58_ ( .c(s_2[58]), .cin(co[57]), .a(c_1[57]),
     .b(c_2[57]), .cout(co[58]), .sum(sum[58]), .d(s_1[58]),
     .carry(cout[58]));
mul_csa42  sc3_57_ ( .c(s_2[57]), .cin(co[56]), .a(c_1[56]),
     .b(c_2[56]), .cout(co[57]), .sum(sum[57]), .d(s_1[57]),
     .carry(cout[57]));
mul_csa42  sc3_56_ ( .c(s_2[56]), .cin(co[55]), .a(c_1[55]),
     .b(c_2[55]), .cout(co[56]), .sum(sum[56]), .d(s_1[56]),
     .carry(cout[56]));
mul_csa42  sc3_55_ ( .c(s_2[55]), .cin(co[54]), .a(c_1[54]),
     .b(c_2[54]), .cout(co[55]), .sum(sum[55]), .d(s_1[55]),
     .carry(cout[55]));
mul_csa42  sc3_54_ ( .c(s_2[54]), .cin(co[53]), .a(c_1[53]),
     .b(c_2[53]), .cout(co[54]), .sum(sum[54]), .d(s_1[54]),
     .carry(cout[54]));
mul_csa42  sc3_53_ ( .c(s_2[53]), .cin(co[52]), .a(c_1[52]),
     .b(c_2[52]), .cout(co[53]), .sum(sum[53]), .d(s_1[53]),
     .carry(cout[53]));
mul_csa42  sc3_52_ ( .c(s_2[52]), .cin(co[51]), .a(c_1[51]),
     .b(c_2[51]), .cout(co[52]), .sum(sum[52]), .d(s_1[52]),
     .carry(cout[52]));
mul_csa42  sc3_51_ ( .c(s_2[51]), .cin(co[50]), .a(c_1[50]),
     .b(c_2[50]), .cout(co[51]), .sum(sum[51]), .d(s_1[51]),
     .carry(cout[51]));
mul_csa42  sc3_50_ ( .c(s_2[50]), .cin(co[49]), .a(c_1[49]),
     .b(c_2[49]), .cout(co[50]), .sum(sum[50]), .d(s_1[50]),
     .carry(cout[50]));
mul_csa42  sc3_49_ ( .c(s_2[49]), .cin(co[48]), .a(c_1[48]),
     .b(c_2[48]), .cout(co[49]), .sum(sum[49]), .d(s_1[49]),
     .carry(cout[49]));
mul_csa42  sc3_48_ ( .c(s_2[48]), .cin(co[47]), .a(c_1[47]),
     .b(c_2[47]), .cout(co[48]), .sum(sum[48]), .d(s_1[48]),
     .carry(cout[48]));
mul_csa42  sc3_47_ ( .c(s_2[47]), .cin(co[46]), .a(c_1[46]),
     .b(c_2[46]), .cout(co[47]), .sum(sum[47]), .d(s_1[47]),
     .carry(cout[47]));
mul_csa42  sc3_46_ ( .c(s_2[46]), .cin(co[45]), .a(c_1[45]),
     .b(c_2[45]), .cout(co[46]), .sum(sum[46]), .d(s_1[46]),
     .carry(cout[46]));
mul_csa42  sc3_45_ ( .c(s_2[45]), .cin(co[44]), .a(c_1[44]),
     .b(c_2[44]), .cout(co[45]), .sum(sum[45]), .d(s_1[45]),
     .carry(cout[45]));
mul_csa42  sc3_44_ ( .c(s_2[44]), .cin(co[43]), .a(c_1[43]),
     .b(c_2[43]), .cout(co[44]), .sum(sum[44]), .d(s_1[44]),
     .carry(cout[44]));
mul_csa42  sc3_43_ ( .c(s_2[43]), .cin(co[42]), .a(c_1[42]),
     .b(c_2[42]), .cout(co[43]), .sum(sum[43]), .d(s_1[43]),
     .carry(cout[43]));
mul_csa42  sc3_42_ ( .c(s_2[42]), .cin(co[41]), .a(c_1[41]),
     .b(c_2[41]), .cout(co[42]), .sum(sum[42]), .d(s_1[42]),
     .carry(cout[42]));
mul_csa42  sc3_41_ ( .c(s_2[41]), .cin(co[40]), .a(c_1[40]),
     .b(c_2[40]), .cout(co[41]), .sum(sum[41]), .d(s_1[41]),
     .carry(cout[41]));
mul_csa42  sc3_40_ ( .c(s_2[40]), .cin(co[39]), .a(c_1[39]),
     .b(c_2[39]), .cout(co[40]), .sum(sum[40]), .d(s_1[40]),
     .carry(cout[40]));
mul_csa42  sc3_39_ ( .c(s_2[39]), .cin(co[38]), .a(c_1[38]),
     .b(c_2[38]), .cout(co[39]), .sum(sum[39]), .d(s_1[39]),
     .carry(cout[39]));
mul_csa42  sc3_38_ ( .c(s_2[38]), .cin(co[37]), .a(c_1[37]),
     .b(c_2[37]), .cout(co[38]), .sum(sum[38]), .d(s_1[38]),
     .carry(cout[38]));
mul_csa42  sc3_37_ ( .c(s_2[37]), .cin(co[36]), .a(c_1[36]),
     .b(c_2[36]), .cout(co[37]), .sum(sum[37]), .d(s_1[37]),
     .carry(cout[37]));
mul_csa42  sc3_36_ ( .c(s_2[36]), .cin(co[35]), .a(c_1[35]),
     .b(c_2[35]), .cout(co[36]), .sum(sum[36]), .d(s_1[36]),
     .carry(cout[36]));
mul_csa42  sc3_35_ ( .c(s_2[35]), .cin(co[34]), .a(c_1[34]),
     .b(c_2[34]), .cout(co[35]), .sum(sum[35]), .d(s_1[35]),
     .carry(cout[35]));
mul_csa42  sc3_34_ ( .c(s_2[34]), .cin(co[33]), .a(c_1[33]),
     .b(c_2[33]), .cout(co[34]), .sum(sum[34]), .d(s_1[34]),
     .carry(cout[34]));
mul_csa42  sc3_33_ ( .c(s_2[33]), .cin(co[32]), .a(c_1[32]),
     .b(c_2[32]), .cout(co[33]), .sum(sum[33]), .d(s_1[33]),
     .carry(cout[33]));
mul_csa42  sc3_32_ ( .c(s_2[32]), .cin(co[31]), .a(c_1[31]),
     .b(c_2[31]), .cout(co[32]), .sum(sum[32]), .d(s_1[32]),
     .carry(cout[32]));
mul_csa42  sc3_31_ ( .c(s_2[31]), .cin(co[30]), .a(c_1[30]),
     .b(c_2[30]), .cout(co[31]), .sum(sum[31]), .d(s_1[31]),
     .carry(cout[31]));
mul_csa42  sc3_30_ ( .c(s_2[30]), .cin(co[29]), .a(c_1[29]),
     .b(c_2[29]), .cout(co[30]), .sum(sum[30]), .d(s_1[30]),
     .carry(cout[30]));
mul_csa42  sc3_29_ ( .c(s_2[29]), .cin(co[28]), .a(c_1[28]),
     .b(c_2[28]), .cout(co[29]), .sum(sum[29]), .d(s_1[29]),
     .carry(cout[29]));
mul_csa42  sc3_28_ ( .c(s_2[28]), .cin(co[27]), .a(c_1[27]),
     .b(c_2[27]), .cout(co[28]), .sum(sum[28]), .d(s_1[28]),
     .carry(cout[28]));
mul_csa42  sc3_27_ ( .c(s_2[27]), .cin(co[26]), .a(c_1[26]),
     .b(c_2[26]), .cout(co[27]), .sum(sum[27]), .d(s_1[27]),
     .carry(cout[27]));
mul_csa42  sc3_26_ ( .c(s_2[26]), .cin(co[25]), .a(c_1[25]),
     .b(c_2[25]), .cout(co[26]), .sum(sum[26]), .d(s_1[26]),
     .carry(cout[26]));
mul_csa42  sc3_25_ ( .c(s_2[25]), .cin(co[24]), .a(c_1[24]),
     .b(c_2[24]), .cout(co[25]), .sum(sum[25]), .d(s_1[25]),
     .carry(cout[25]));
mul_csa42  sc3_24_ ( .c(s_2[24]), .cin(co[23]), .a(c_1[23]),
     .b(c_2[23]), .cout(co[24]), .sum(sum[24]), .d(s_1[24]),
     .carry(cout[24]));
mul_csa42  sc3_23_ ( .c(s_2[23]), .cin(co[22]), .a(c_1[22]),
     .b(c_2[22]), .cout(co[23]), .sum(sum[23]), .d(s_1[23]),
     .carry(cout[23]));
mul_csa42  sc3_22_ ( .c(s_2[22]), .cin(co[21]), .a(c_1[21]),
     .b(c_2[21]), .cout(co[22]), .sum(sum[22]), .d(s_1[22]),
     .carry(cout[22]));
mul_csa42  sc3_21_ ( .c(s_2[21]), .cin(co[20]), .a(c_1[20]),
     .b(c_2[20]), .cout(co[21]), .sum(sum[21]), .d(s_1[21]),
     .carry(cout[21]));
mul_csa42  sc3_20_ ( .c(s_2[20]), .cin(co[19]), .a(c_1[19]),
     .b(c_2[19]), .cout(co[20]), .sum(sum[20]), .d(s_1[20]),
     .carry(cout[20]));
mul_csa42  sc3_19_ ( .c(s_2[19]), .cin(co[18]), .a(c_1[18]),
     .b(c_2[18]), .cout(co[19]), .sum(sum[19]), .d(s_1[19]),
     .carry(cout[19]));
mul_csa42  sc3_18_ ( .c(s_2[18]), .cin(co[17]), .a(c_1[17]),
     .b(c_2[17]), .cout(co[18]), .sum(sum[18]), .d(s_1[18]),
     .carry(cout[18]));
mul_csa42  sc3_17_ ( .c(s_2[17]), .cin(co[16]), .a(c_1[16]),
     .b(c_2[16]), .cout(co[17]), .sum(sum[17]), .d(s_1[17]),
     .carry(cout[17]));
mul_csa42  sc3_16_ ( .c(s_2[16]), .cin(co[15]), .a(c_1[15]),
     .b(c_2[15]), .cout(co[16]), .sum(sum[16]), .d(s_1[16]),
     .carry(cout[16]));
mul_csa42  sc3_15_ ( .c(s_2[15]), .cin(co[14]), .a(c_1[14]),
     .b(c_2[14]), .cout(co[15]), .sum(sum[15]), .d(s_1[15]),
     .carry(cout[15]));
mul_csa42  sc3_14_ ( .c(s_2[14]), .cin(co[13]), .a(c_1[13]),
     .b(c_2[13]), .cout(co[14]), .sum(sum[14]), .d(s_1[14]),
     .carry(cout[14]));
mul_csa42  sc3_13_ ( .c(s_2[13]), .cin(co[12]), .a(c_1[12]),
     .b(c_2[12]), .cout(co[13]), .sum(sum[13]), .d(s_1[13]),
     .carry(cout[13]));
mul_csa42  sc3_12_ ( .c(s_2[12]), .cin(co[11]), .a(c_1[11]),
     .b(c_2[11]), .cout(co[12]), .sum(sum[12]), .d(s_1[12]),
     .carry(cout[12]));
mul_csa42  sc3_11_ ( .c(s_2[11]), .cin(1'b0),
     .a(c_1[10]), .b(c_2[10]), .cout(co[11]), .sum(sum[11]),
     .d(s_1[11]), .carry(cout[11]));
mul_csa32  sc2_2_70_ ( .c(c1[63]), .b(c2[57]), .a(s2[58]),
     .cout(c_2[70]), .sum(s_2[70]));
mul_csa32  sc2_2_69_ ( .c(c1[62]), .b(c2[56]), .a(s2[57]),
     .cout(c_2[69]), .sum(s_2[69]));
mul_csa32  sc2_2_68_ ( .c(c1[61]), .b(c2[55]), .a(s2[56]),
     .cout(c_2[68]), .sum(s_2[68]));
mul_csa32  sc2_2_67_ ( .c(c1[60]), .b(c2[54]), .a(s2[55]),
     .cout(c_2[67]), .sum(s_2[67]));
mul_csa32  sc2_2_66_ ( .c(c1[59]), .b(c2[53]), .a(s2[54]),
     .cout(c_2[66]), .sum(s_2[66]));
mul_csa32  sc2_2_65_ ( .c(c1[58]), .b(c2[52]), .a(s2[53]),
     .cout(c_2[65]), .sum(s_2[65]));
mul_csa32  sc2_2_64_ ( .c(c1[57]), .b(c2[51]), .a(s2[52]),
     .cout(c_2[64]), .sum(s_2[64]));
mul_csa32  sc2_2_63_ ( .c(c1[56]), .b(c2[50]), .a(s2[51]),
     .cout(c_2[63]), .sum(s_2[63]));
mul_csa32  sc2_2_62_ ( .c(c1[55]), .b(c2[49]), .a(s2[50]),
     .cout(c_2[62]), .sum(s_2[62]));
mul_csa32  sc2_2_61_ ( .c(c1[54]), .b(c2[48]), .a(s2[49]),
     .cout(c_2[61]), .sum(s_2[61]));
mul_csa32  sc2_2_60_ ( .c(c1[53]), .b(c2[47]), .a(s2[48]),
     .cout(c_2[60]), .sum(s_2[60]));
mul_csa32  sc2_2_59_ ( .c(c1[52]), .b(c2[46]), .a(s2[47]),
     .cout(c_2[59]), .sum(s_2[59]));
mul_csa32  sc2_2_58_ ( .c(c1[51]), .b(c2[45]), .a(s2[46]),
     .cout(c_2[58]), .sum(s_2[58]));
mul_csa32  sc2_2_57_ ( .c(c1[50]), .b(c2[44]), .a(s2[45]),
     .cout(c_2[57]), .sum(s_2[57]));
mul_csa32  sc2_2_56_ ( .c(c1[49]), .b(c2[43]), .a(s2[44]),
     .cout(c_2[56]), .sum(s_2[56]));
mul_csa32  sc2_2_55_ ( .c(c1[48]), .b(c2[42]), .a(s2[43]),
     .cout(c_2[55]), .sum(s_2[55]));
mul_csa32  sc2_2_54_ ( .c(c1[47]), .b(c2[41]), .a(s2[42]),
     .cout(c_2[54]), .sum(s_2[54]));
mul_csa32  sc2_2_53_ ( .c(c1[46]), .b(c2[40]), .a(s2[41]),
     .cout(c_2[53]), .sum(s_2[53]));
mul_csa32  sc2_2_52_ ( .c(c1[45]), .b(c2[39]), .a(s2[40]),
     .cout(c_2[52]), .sum(s_2[52]));
mul_csa32  sc2_2_51_ ( .c(c1[44]), .b(c2[38]), .a(s2[39]),
     .cout(c_2[51]), .sum(s_2[51]));
mul_csa32  sc2_2_50_ ( .c(c1[43]), .b(c2[37]), .a(s2[38]),
     .cout(c_2[50]), .sum(s_2[50]));
mul_csa32  sc2_2_49_ ( .c(c1[42]), .b(c2[36]), .a(s2[37]),
     .cout(c_2[49]), .sum(s_2[49]));
mul_csa32  sc2_2_48_ ( .c(c1[41]), .b(c2[35]), .a(s2[36]),
     .cout(c_2[48]), .sum(s_2[48]));
mul_csa32  sc2_2_47_ ( .c(c1[40]), .b(c2[34]), .a(s2[35]),
     .cout(c_2[47]), .sum(s_2[47]));
mul_csa32  sc2_2_46_ ( .c(c1[39]), .b(c2[33]), .a(s2[34]),
     .cout(c_2[46]), .sum(s_2[46]));
mul_csa32  sc2_2_45_ ( .c(c1[38]), .b(c2[32]), .a(s2[33]),
     .cout(c_2[45]), .sum(s_2[45]));
mul_csa32  sc2_2_44_ ( .c(c1[37]), .b(c2[31]), .a(s2[32]),
     .cout(c_2[44]), .sum(s_2[44]));
mul_csa32  sc2_2_43_ ( .c(c1[36]), .b(c2[30]), .a(s2[31]),
     .cout(c_2[43]), .sum(s_2[43]));
mul_csa32  sc2_2_42_ ( .c(c1[35]), .b(c2[29]), .a(s2[30]),
     .cout(c_2[42]), .sum(s_2[42]));
mul_csa32  sc2_2_41_ ( .c(c1[34]), .b(c2[28]), .a(s2[29]),
     .cout(c_2[41]), .sum(s_2[41]));
mul_csa32  sc2_2_40_ ( .c(c1[33]), .b(c2[27]), .a(s2[28]),
     .cout(c_2[40]), .sum(s_2[40]));
mul_csa32  sc2_2_39_ ( .c(c1[32]), .b(c2[26]), .a(s2[27]),
     .cout(c_2[39]), .sum(s_2[39]));
mul_csa32  sc2_2_38_ ( .c(c1[31]), .b(c2[25]), .a(s2[26]),
     .cout(c_2[38]), .sum(s_2[38]));
mul_csa32  sc2_2_37_ ( .c(c1[30]), .b(c2[24]), .a(s2[25]),
     .cout(c_2[37]), .sum(s_2[37]));
mul_csa32  sc2_2_36_ ( .c(c1[29]), .b(c2[23]), .a(s2[24]),
     .cout(c_2[36]), .sum(s_2[36]));
mul_csa32  sc2_2_35_ ( .c(c1[28]), .b(c2[22]), .a(s2[23]),
     .cout(c_2[35]), .sum(s_2[35]));
mul_csa32  sc2_2_34_ ( .c(c1[27]), .b(c2[21]), .a(s2[22]),
     .cout(c_2[34]), .sum(s_2[34]));
mul_csa32  sc2_2_33_ ( .c(c1[26]), .b(c2[20]), .a(s2[21]),
     .cout(c_2[33]), .sum(s_2[33]));
mul_csa32  sc2_2_32_ ( .c(c1[25]), .b(c2[19]), .a(s2[20]),
     .cout(c_2[32]), .sum(s_2[32]));
mul_csa32  sc2_2_31_ ( .c(c1[24]), .b(c2[18]), .a(s2[19]),
     .cout(c_2[31]), .sum(s_2[31]));
mul_csa32  sc2_2_30_ ( .c(c1[23]), .b(c2[17]), .a(s2[18]),
     .cout(c_2[30]), .sum(s_2[30]));
mul_csa32  sc2_2_29_ ( .c(c1[22]), .b(c2[16]), .a(s2[17]),
     .cout(c_2[29]), .sum(s_2[29]));
mul_csa32  sc2_2_28_ ( .c(c1[21]), .b(c2[15]), .a(s2[16]),
     .cout(c_2[28]), .sum(s_2[28]));
mul_csa32  sc2_2_27_ ( .c(c1[20]), .b(c2[14]), .a(s2[15]),
     .cout(c_2[27]), .sum(s_2[27]));
mul_csa32  sc2_2_26_ ( .c(c1[19]), .b(c2[13]), .a(s2[14]),
     .cout(c_2[26]), .sum(s_2[26]));
mul_csa32  sc2_2_25_ ( .c(c1[18]), .b(c2[12]), .a(s2[13]),
     .cout(c_2[25]), .sum(s_2[25]));
mul_csa32  sc2_2_24_ ( .c(c1[17]), .b(c2[11]), .a(s2[12]),
     .cout(c_2[24]), .sum(s_2[24]));
mul_csa32  sc2_2_23_ ( .c(c1[16]), .b(c2[10]), .a(s2[11]),
     .cout(c_2[23]), .sum(s_2[23]));
mul_csa32  sc2_2_22_ ( .c(c1[15]), .b(c2[9]), .a(s2[10]),
     .cout(c_2[22]), .sum(s_2[22]));
mul_csa32  sc2_2_21_ ( .c(c1[14]), .b(c2[8]), .a(s2[9]),
     .cout(c_2[21]), .sum(s_2[21]));
mul_csa32  sc2_2_20_ ( .c(c1[13]), .b(c2[7]), .a(s2[8]),
     .cout(c_2[20]), .sum(s_2[20]));
mul_csa32  sc2_2_19_ ( .c(c1[12]), .b(c2[6]), .a(s2[7]),
     .cout(c_2[19]), .sum(s_2[19]));
mul_csa32  sc2_2_18_ ( .c(c1[11]), .b(c2[5]), .a(s2[6]),
     .cout(c_2[18]), .sum(s_2[18]));
mul_csa32  sc2_2_17_ ( .c(c1[10]), .b(c2[4]), .a(s2[5]),
     .cout(c_2[17]), .sum(s_2[17]));
mul_csa32  sc2_2_16_ ( .c(c1[9]), .b(c2[3]), .a(s2[4]),
     .cout(c_2[16]), .sum(s_2[16]));
mul_csa32  sc2_2_15_ ( .c(c1[8]), .b(c2[2]), .a(s2[3]),
     .cout(c_2[15]), .sum(s_2[15]));
mul_csa32  sc2_2_14_ ( .c(c1[7]), .b(c2[1]), .a(s2[2]),
     .cout(c_2[14]), .sum(s_2[14]));
mul_csa32  sc2_2_13_ ( .c(c1[6]), .b(s1[7]), .a(s2[1]),
     .cout(c_2[13]), .sum(s_2[13]));
mul_csa32  sc2_2_12_ ( .c(c1[5]), .b(s1[6]), .a(s2[0]),
     .cout(c_2[12]), .sum(s_2[12]));
mul_csa32  sc2_2_11_ ( .c(c1[4]), .b(s1[5]), .a(b5n[1]),
     .cout(c_2[11]), .sum(s_2[11]));
mul_csa32  sc2_2_10_ ( .c(c1[3]), .b(s1[4]), .a(b5n[0]),
     .cout(c_2[10]), .sum(s_2[10]));
mul_csa32  sc2_2_76_ ( .c(1'b1), .b(c2[63]), .a(s2[64]),
     .cout(c_2[76]), .sum(s_2[76]));
mul_csa32  sc2_2_77_ ( .c(c_2[76]), .b(c2[64]), .a(s2[65]),
     .cout(cout[77]), .sum(sum[77]));
mul_csa32  sc2_1_9_ ( .c(s1[3]), .b(c0[8]), .a(s0[9]), .cout(c_1[9]),
     .sum(s_1[9]));
mul_csa32  sc2_1_8_ ( .c(s1[2]), .b(c0[7]), .a(s0[8]), .cout(c_1[8]),
     .sum(s_1[8]));
mul_csa32  sc2_1_3_ ( .c(c_1[2]), .b(c0[2]), .a(s0[3]),
     .cout(c_1[3]), .sum(sum[3]));
mul_csa32  sc3_10_ ( .c(s_2[10]), .b(s_1[10]), .a(c_1[9]),
     .cout(cout[10]), .sum(sum[10]));
mul_csa32  sc3_9_ ( .c(c1[2]), .sum(sum[9]), .cout(cout[9]),
     .a(c_1[8]), .b(s_1[9]));
mul_csa32  sc3_8_ ( .c(c1[1]), .sum(sum[8]), .cout(cout[8]),
     .a(c_1[7]), .b(s_1[8]));
mul_csa32  sc2_2_71_ ( .c(c1[64]), .b(c2[58]), .a(s2[59]),
     .cout(c_2[71]), .sum(s_2[71]));
mul_csa32  sc2_2_75_ ( .c(c1[68]), .b(c2[62]), .a(s2[63]),
     .cout(c_2[75]), .sum(s_2[75]));
mul_csa32  sc2_2_74_ ( .c(c1[67]), .b(c2[61]), .a(s2[62]),
     .cout(c_2[74]), .sum(s_2[74]));
mul_csa32  sc2_2_73_ ( .c(c1[66]), .b(c2[60]), .a(s2[61]),
     .cout(c_2[73]), .sum(s_2[73]));
mul_csa32  sc2_2_72_ ( .c(c1[65]), .b(c2[59]), .a(s2[60]),
     .cout(c_2[72]), .sum(s_2[72]));
mul_csa32  sc2_1_69_ ( .c(s1[63]), .sum(s_1[69]), .cout(c_1[69]),
     .a(s0[69]), .b(c0[68]));
mul_csa32  sc2_1_68_ ( .c(s1[62]), .sum(s_1[68]), .cout(c_1[68]),
     .a(s0[68]), .b(c0[67]));
mul_csa32  sc2_1_67_ ( .c(s1[61]), .sum(s_1[67]), .cout(c_1[67]),
     .a(s0[67]), .b(c0[66]));
mul_csa32  sc2_1_66_ ( .c(s1[60]), .sum(s_1[66]), .cout(c_1[66]),
     .a(s0[66]), .b(c0[65]));
mul_csa32  sc2_1_65_ ( .c(s1[59]), .sum(s_1[65]), .cout(c_1[65]),
     .a(s0[65]), .b(c0[64]));
mul_csa32  sc2_1_64_ ( .c(s1[58]), .sum(s_1[64]), .cout(c_1[64]),
     .a(s0[64]), .b(c0[63]));
mul_csa32  sc2_1_63_ ( .c(s1[57]), .sum(s_1[63]), .cout(c_1[63]),
     .a(s0[63]), .b(c0[62]));
mul_csa32  sc2_1_62_ ( .c(s1[56]), .sum(s_1[62]), .cout(c_1[62]),
     .a(s0[62]), .b(c0[61]));
mul_csa32  sc2_1_61_ ( .c(s1[55]), .sum(s_1[61]), .cout(c_1[61]),
     .a(s0[61]), .b(c0[60]));
mul_csa32  sc2_1_60_ ( .c(s1[54]), .sum(s_1[60]), .cout(c_1[60]),
     .a(s0[60]), .b(c0[59]));
mul_csa32  sc2_1_59_ ( .c(s1[53]), .sum(s_1[59]), .cout(c_1[59]),
     .a(s0[59]), .b(c0[58]));
mul_csa32  sc2_1_58_ ( .c(s1[52]), .sum(s_1[58]), .cout(c_1[58]),
     .a(s0[58]), .b(c0[57]));
mul_csa32  sc2_1_57_ ( .c(s1[51]), .sum(s_1[57]), .cout(c_1[57]),
     .a(s0[57]), .b(c0[56]));
mul_csa32  sc2_1_56_ ( .c(s1[50]), .sum(s_1[56]), .cout(c_1[56]),
     .a(s0[56]), .b(c0[55]));
mul_csa32  sc2_1_55_ ( .c(s1[49]), .sum(s_1[55]), .cout(c_1[55]),
     .a(s0[55]), .b(c0[54]));
mul_csa32  sc2_1_54_ ( .c(s1[48]), .sum(s_1[54]), .cout(c_1[54]),
     .a(s0[54]), .b(c0[53]));
mul_csa32  sc2_1_53_ ( .c(s1[47]), .sum(s_1[53]), .cout(c_1[53]),
     .a(s0[53]), .b(c0[52]));
mul_csa32  sc2_1_52_ ( .c(s1[46]), .sum(s_1[52]), .cout(c_1[52]),
     .a(s0[52]), .b(c0[51]));
mul_csa32  sc2_1_51_ ( .c(s1[45]), .sum(s_1[51]), .cout(c_1[51]),
     .a(s0[51]), .b(c0[50]));
mul_csa32  sc2_1_50_ ( .c(s1[44]), .sum(s_1[50]), .cout(c_1[50]),
     .a(s0[50]), .b(c0[49]));
mul_csa32  sc2_1_49_ ( .c(s1[43]), .sum(s_1[49]), .cout(c_1[49]),
     .a(s0[49]), .b(c0[48]));
mul_csa32  sc2_1_48_ ( .c(s1[42]), .sum(s_1[48]), .cout(c_1[48]),
     .a(s0[48]), .b(c0[47]));
mul_csa32  sc2_1_47_ ( .c(s1[41]), .sum(s_1[47]), .cout(c_1[47]),
     .a(s0[47]), .b(c0[46]));
mul_csa32  sc2_1_46_ ( .c(s1[40]), .sum(s_1[46]), .cout(c_1[46]),
     .a(s0[46]), .b(c0[45]));
mul_csa32  sc2_1_45_ ( .c(s1[39]), .sum(s_1[45]), .cout(c_1[45]),
     .a(s0[45]), .b(c0[44]));
mul_csa32  sc2_1_44_ ( .c(s1[38]), .sum(s_1[44]), .cout(c_1[44]),
     .a(s0[44]), .b(c0[43]));
mul_csa32  sc2_1_43_ ( .c(s1[37]), .sum(s_1[43]), .cout(c_1[43]),
     .a(s0[43]), .b(c0[42]));
mul_csa32  sc2_1_42_ ( .c(s1[36]), .sum(s_1[42]), .cout(c_1[42]),
     .a(s0[42]), .b(c0[41]));
mul_csa32  sc2_1_41_ ( .c(s1[35]), .sum(s_1[41]), .cout(c_1[41]),
     .a(s0[41]), .b(c0[40]));
mul_csa32  sc2_1_40_ ( .c(s1[34]), .sum(s_1[40]), .cout(c_1[40]),
     .a(s0[40]), .b(c0[39]));
mul_csa32  sc2_1_39_ ( .c(s1[33]), .sum(s_1[39]), .cout(c_1[39]),
     .a(s0[39]), .b(c0[38]));
mul_csa32  sc2_1_38_ ( .c(s1[32]), .sum(s_1[38]), .cout(c_1[38]),
     .a(s0[38]), .b(c0[37]));
mul_csa32  sc2_1_37_ ( .c(s1[31]), .sum(s_1[37]), .cout(c_1[37]),
     .a(s0[37]), .b(c0[36]));
mul_csa32  sc2_1_36_ ( .c(s1[30]), .sum(s_1[36]), .cout(c_1[36]),
     .a(s0[36]), .b(c0[35]));
mul_csa32  sc2_1_35_ ( .c(s1[29]), .sum(s_1[35]), .cout(c_1[35]),
     .a(s0[35]), .b(c0[34]));
mul_csa32  sc2_1_34_ ( .c(s1[28]), .sum(s_1[34]), .cout(c_1[34]),
     .a(s0[34]), .b(c0[33]));
mul_csa32  sc2_1_33_ ( .c(s1[27]), .sum(s_1[33]), .cout(c_1[33]),
     .a(s0[33]), .b(c0[32]));
mul_csa32  sc2_1_32_ ( .c(s1[26]), .sum(s_1[32]), .cout(c_1[32]),
     .a(s0[32]), .b(c0[31]));
mul_csa32  sc2_1_31_ ( .c(s1[25]), .sum(s_1[31]), .cout(c_1[31]),
     .a(s0[31]), .b(c0[30]));
mul_csa32  sc2_1_30_ ( .c(s1[24]), .sum(s_1[30]), .cout(c_1[30]),
     .a(s0[30]), .b(c0[29]));
mul_csa32  sc2_1_29_ ( .c(s1[23]), .sum(s_1[29]), .cout(c_1[29]),
     .a(s0[29]), .b(c0[28]));
mul_csa32  sc2_1_28_ ( .c(s1[22]), .sum(s_1[28]), .cout(c_1[28]),
     .a(s0[28]), .b(c0[27]));
mul_csa32  sc2_1_27_ ( .c(s1[21]), .sum(s_1[27]), .cout(c_1[27]),
     .a(s0[27]), .b(c0[26]));
mul_csa32  sc2_1_26_ ( .c(s1[20]), .sum(s_1[26]), .cout(c_1[26]),
     .a(s0[26]), .b(c0[25]));
mul_csa32  sc2_1_25_ ( .c(s1[19]), .sum(s_1[25]), .cout(c_1[25]),
     .a(s0[25]), .b(c0[24]));
mul_csa32  sc2_1_24_ ( .c(s1[18]), .sum(s_1[24]), .cout(c_1[24]),
     .a(s0[24]), .b(c0[23]));
mul_csa32  sc2_1_23_ ( .c(s1[17]), .sum(s_1[23]), .cout(c_1[23]),
     .a(s0[23]), .b(c0[22]));
mul_csa32  sc2_1_22_ ( .c(s1[16]), .sum(s_1[22]), .cout(c_1[22]),
     .a(s0[22]), .b(c0[21]));
mul_csa32  sc2_1_21_ ( .c(s1[15]), .sum(s_1[21]), .cout(c_1[21]),
     .a(s0[21]), .b(c0[20]));
mul_csa32  sc2_1_20_ ( .c(s1[14]), .sum(s_1[20]), .cout(c_1[20]),
     .a(s0[20]), .b(c0[19]));
mul_csa32  sc2_1_19_ ( .c(s1[13]), .sum(s_1[19]), .cout(c_1[19]),
     .a(s0[19]), .b(c0[18]));
mul_csa32  sc2_1_18_ ( .c(s1[12]), .sum(s_1[18]), .cout(c_1[18]),
     .a(s0[18]), .b(c0[17]));
mul_csa32  sc2_1_17_ ( .c(s1[11]), .sum(s_1[17]), .cout(c_1[17]),
     .a(s0[17]), .b(c0[16]));
mul_csa32  sc2_1_16_ ( .c(s1[10]), .sum(s_1[16]), .cout(c_1[16]),
     .a(s0[16]), .b(c0[15]));
mul_csa32  sc2_1_15_ ( .c(s1[9]), .sum(s_1[15]), .cout(c_1[15]),
     .a(s0[15]), .b(c0[14]));
mul_csa32  sc2_1_14_ ( .c(s1[8]), .sum(s_1[14]), .cout(c_1[14]),
     .a(s0[14]), .b(c0[13]));
mul_csa32  sc2_1_7_ ( .c(s1[1]), .b(c0[6]), .a(s0[7]), .cout(c_1[7]),
     .sum(s_1[7]));
mul_csa32  sc2_1_6_ ( .c(s1[0]), .b(c0[5]), .a(s0[6]), .cout(c_1[6]),
     .sum(s_1[6]));
mul_csa32  sc2_1_5_ ( .c(b2n[1]), .b(c0[4]), .a(s0[5]),
     .cout(c_1[5]), .sum(s_1[5]));
mul_csa32  sc2_1_4_ ( .c(b2n[0]), .b(c0[3]), .a(s0[4]),
     .cout(c_1[4]), .sum(s_1[4]));
mul_ha sc2_1_10_ ( .sum(s_1[10]), .cout(c_1[10]), .a(s0[10]),
     .b(c0[9]));
mul_ha sc3_7_ ( .sum(sum[7]), .cout(cout[7]), .a(c_1[6]),
     .b(s_1[7]));
mul_ha sc3_6_ ( .sum(sum[6]), .cout(cout[6]), .a(c_1[5]),
     .b(s_1[6]));
mul_ha sc3_5_ ( .sum(sum[5]), .cout(cout[5]), .a(c_1[4]),
     .b(s_1[5]));
mul_ha sc3_4_ ( .sum(sum[4]), .cout(cout[4]), .a(c_1[3]),
     .b(s_1[4]));
mul_ha sc2_2_81_ ( .sum(sum[81]), .cout(cout[81]), .a(s2[69]),
     .b(c2[68]));
mul_ha sc2_2_80_ ( .sum(sum[80]), .cout(cout[80]), .a(s2[68]),
     .b(c2[67]));
mul_ha sc2_2_79_ ( .sum(sum[79]), .cout(cout[79]), .a(s2[67]),
     .b(c2[66]));
mul_ha sc2_2_78_ ( .sum(sum[78]), .cout(cout[78]), .a(s2[66]),
     .b(c2[65]));
mul_ha sc2_1_70_ ( .sum(s_1[70]), .cout(c_1[70]),
     .a(1'b1), .b(s1[64]));
mul_ha sc2_1_2_ ( .sum(sum[2]), .cout(c_1[2]), .a(s0[2]), .b(c0[1]));
mul_ha sc2_1_13_ ( .sum(s_1[13]), .cout(c_1[13]), .a(s0[13]),
     .b(c0[12]));
mul_ha sc2_1_12_ ( .sum(s_1[12]), .cout(c_1[12]), .a(s0[12]),
     .b(c0[11]));
mul_ha sc2_1_11_ ( .sum(s_1[11]), .cout(c_1[11]), .a(s0[11]),
     .b(c0[10]));
mul_ppgenrow3 I2 ( .head(1'b0), .bot(bot), .b2(b8[2:0]),
     .b1(b7[2:0]), .b0(b6[2:0]), .a(a[63:0]), .sum(s2[69:0]),
     .cout(c2[68:1]));
mul_ppgenrow3 I1 ( .head(1'b0), .bot(1'b1),
     .b2(b5[2:0]), .b1(b4[2:0]), .b0(b3[2:0]), .a(a[63:0]),
     .sum(s1[69:0]), .cout(c1[68:1]));
mul_ppgenrow3 I0 ( .head(head), .bot(1'b1), .b2(b2[2:0]),
     .b1(b1[2:0]), .b0(b0[2:0]), .a(a[63:0]), .sum({s0[69:2],
     sum[1:0]}), .cout(c0[68:1]));

endmodule // mul_array1

module mul_array2 ( pcout, pcoutx2, psum, psumx2, a0c, a0s, a1c, a1s,
     areg, bot, pc, ps, x2 );

output  pcoutx2, psumx2;
input  bot, x2;
output [98:0]  psum;
output [98:0]  pcout;
input [81:4]  a1c;
input [98:30]  pc;
input [98:31]  ps;
input [81:0]  a0s;
input [96:0]  areg;
input [81:0]  a1s;
input [81:4]  a0c;

// Buses in the design
wire  [81:15]  s3;
wire  [81:15]  c3;
wire  [96:0]  ain;
wire  [67:20]  co;
wire  [82:0]  s1;
wire  [96:0]  c2;
wire  [82:0]  c1;
wire  [96:0]  s2;
wire	      ainx2, s1x2, c1x2;

mul_mux2 sh_82_ ( .d1(areg[83]), .z(ain[82]), .d0(areg[82]), .s(x2));
mul_mux2 sh_68_ ( .d1(areg[69]), .z(ain[68]), .d0(areg[68]), .s(x2));
mul_mux2 sh_67_ ( .d1(areg[68]), .z(ain[67]), .d0(areg[67]), .s(x2));
mul_mux2 sh_66_ ( .d1(areg[67]), .z(ain[66]), .d0(areg[66]), .s(x2));
mul_mux2 sh_65_ ( .d1(areg[66]), .z(ain[65]), .d0(areg[65]), .s(x2));
mul_mux2 sh_64_ ( .d1(areg[65]), .z(ain[64]), .d0(areg[64]), .s(x2));
mul_mux2 sh_63_ ( .d1(areg[64]), .z(ain[63]), .d0(areg[63]), .s(x2));
mul_mux2 sh_62_ ( .d1(areg[63]), .z(ain[62]), .d0(areg[62]), .s(x2));
mul_mux2 sh_61_ ( .d1(areg[62]), .z(ain[61]), .d0(areg[61]), .s(x2));
mul_mux2 sh_60_ ( .d1(areg[61]), .z(ain[60]), .d0(areg[60]), .s(x2));
mul_mux2 sh_59_ ( .d1(areg[60]), .z(ain[59]), .d0(areg[59]), .s(x2));
mul_mux2 sh_58_ ( .d1(areg[59]), .z(ain[58]), .d0(areg[58]), .s(x2));
mul_mux2 sh_57_ ( .d1(areg[58]), .z(ain[57]), .d0(areg[57]), .s(x2));
mul_mux2 sh_56_ ( .d1(areg[57]), .z(ain[56]), .d0(areg[56]), .s(x2));
mul_mux2 sh_55_ ( .d1(areg[56]), .z(ain[55]), .d0(areg[55]), .s(x2));
mul_mux2 sh_54_ ( .d1(areg[55]), .z(ain[54]), .d0(areg[54]), .s(x2));
mul_mux2 sh_53_ ( .d1(areg[54]), .z(ain[53]), .d0(areg[53]), .s(x2));
mul_mux2 sh_52_ ( .d1(areg[53]), .z(ain[52]), .d0(areg[52]), .s(x2));
mul_mux2 sh_51_ ( .d1(areg[52]), .z(ain[51]), .d0(areg[51]), .s(x2));
mul_mux2 sh_50_ ( .d1(areg[51]), .z(ain[50]), .d0(areg[50]), .s(x2));
mul_mux2 sh_49_ ( .d1(areg[50]), .z(ain[49]), .d0(areg[49]), .s(x2));
mul_mux2 sh_48_ ( .d1(areg[49]), .z(ain[48]), .d0(areg[48]), .s(x2));
mul_mux2 sh_47_ ( .d1(areg[48]), .z(ain[47]), .d0(areg[47]), .s(x2));
mul_mux2 sh_46_ ( .d1(areg[47]), .z(ain[46]), .d0(areg[46]), .s(x2));
mul_mux2 sh_45_ ( .d1(areg[46]), .z(ain[45]), .d0(areg[45]), .s(x2));
mul_mux2 sh_44_ ( .d1(areg[45]), .z(ain[44]), .d0(areg[44]), .s(x2));
mul_mux2 sh_43_ ( .d1(areg[44]), .z(ain[43]), .d0(areg[43]), .s(x2));
mul_mux2 sh_42_ ( .d1(areg[43]), .z(ain[42]), .d0(areg[42]), .s(x2));
mul_mux2 sh_41_ ( .d1(areg[42]), .z(ain[41]), .d0(areg[41]), .s(x2));
mul_mux2 sh_40_ ( .d1(areg[41]), .z(ain[40]), .d0(areg[40]), .s(x2));
mul_mux2 sh_39_ ( .d1(areg[40]), .z(ain[39]), .d0(areg[39]), .s(x2));
mul_mux2 sh_38_ ( .d1(areg[39]), .z(ain[38]), .d0(areg[38]), .s(x2));
mul_mux2 sh_37_ ( .d1(areg[38]), .z(ain[37]), .d0(areg[37]), .s(x2));
mul_mux2 sh_36_ ( .d1(areg[37]), .z(ain[36]), .d0(areg[36]), .s(x2));
mul_mux2 sh_35_ ( .d1(areg[36]), .z(ain[35]), .d0(areg[35]), .s(x2));
mul_mux2 sh_34_ ( .d1(areg[35]), .z(ain[34]), .d0(areg[34]), .s(x2));
mul_mux2 sh_33_ ( .d1(areg[34]), .z(ain[33]), .d0(areg[33]), .s(x2));
mul_mux2 sh_32_ ( .d1(areg[33]), .z(ain[32]), .d0(areg[32]), .s(x2));
mul_mux2 sh_31_ ( .d1(areg[32]), .z(ain[31]), .d0(areg[31]), .s(x2));
mul_mux2 sh_30_ ( .d1(areg[31]), .z(ain[30]), .d0(areg[30]), .s(x2));
mul_mux2 sh_29_ ( .d1(areg[30]), .z(ain[29]), .d0(areg[29]), .s(x2));
mul_mux2 sh_28_ ( .d1(areg[29]), .z(ain[28]), .d0(areg[28]), .s(x2));
mul_mux2 sh_27_ ( .d1(areg[28]), .z(ain[27]), .d0(areg[27]), .s(x2));
mul_mux2 sh_26_ ( .d1(areg[27]), .z(ain[26]), .d0(areg[26]), .s(x2));
mul_mux2 sh_25_ ( .d1(areg[26]), .z(ain[25]), .d0(areg[25]), .s(x2));
mul_mux2 sh_24_ ( .d1(areg[25]), .z(ain[24]), .d0(areg[24]), .s(x2));
mul_mux2 sh_23_ ( .d1(areg[24]), .z(ain[23]), .d0(areg[23]), .s(x2));
mul_mux2 sh_22_ ( .d1(areg[23]), .z(ain[22]), .d0(areg[22]), .s(x2));
mul_mux2 sh_21_ ( .d1(areg[22]), .z(ain[21]), .d0(areg[21]), .s(x2));
mul_mux2 sh_20_ ( .d1(areg[21]), .z(ain[20]), .d0(areg[20]), .s(x2));
mul_mux2 sh_96_ ( .d1(1'b0), .z(ain[96]), .d0(areg[96]),
     .s(x2));
mul_mux2 sh_95_ ( .d1(areg[96]), .z(ain[95]), .d0(areg[95]), .s(x2));
mul_mux2 sh_94_ ( .d1(areg[95]), .z(ain[94]), .d0(areg[94]), .s(x2));
mul_mux2 sh_93_ ( .d1(areg[94]), .z(ain[93]), .d0(areg[93]), .s(x2));
mul_mux2 sh_92_ ( .d1(areg[93]), .z(ain[92]), .d0(areg[92]), .s(x2));
mul_mux2 sh_91_ ( .d1(areg[92]), .z(ain[91]), .d0(areg[91]), .s(x2));
mul_mux2 sh_90_ ( .d1(areg[91]), .z(ain[90]), .d0(areg[90]), .s(x2));
mul_mux2 sh_89_ ( .d1(areg[90]), .z(ain[89]), .d0(areg[89]), .s(x2));
mul_mux2 sh_88_ ( .d1(areg[89]), .z(ain[88]), .d0(areg[88]), .s(x2));
mul_mux2 sh_87_ ( .d1(areg[88]), .z(ain[87]), .d0(areg[87]), .s(x2));
mul_mux2 sh_86_ ( .d1(areg[87]), .z(ain[86]), .d0(areg[86]), .s(x2));
mul_mux2 sh_85_ ( .d1(areg[86]), .z(ain[85]), .d0(areg[85]), .s(x2));
mul_mux2 sh_84_ ( .d1(areg[85]), .z(ain[84]), .d0(areg[84]), .s(x2));
mul_mux2 sh_0_ ( .d1(areg[1]), .z(ain[0]), .d0(areg[0]), .s(x2));
mul_mux2 sh_81_ ( .d1(areg[82]), .z(ain[81]), .d0(areg[81]), .s(x2));
mul_mux2 sh_80_ ( .d1(areg[81]), .z(ain[80]), .d0(areg[80]), .s(x2));
mul_mux2 sh_79_ ( .d1(areg[80]), .z(ain[79]), .d0(areg[79]), .s(x2));
mul_mux2 sh_78_ ( .d1(areg[79]), .z(ain[78]), .d0(areg[78]), .s(x2));
mul_mux2 sh_77_ ( .d1(areg[78]), .z(ain[77]), .d0(areg[77]), .s(x2));
mul_mux2 sh_76_ ( .d1(areg[77]), .z(ain[76]), .d0(areg[76]), .s(x2));
mul_mux2 sh_75_ ( .d1(areg[76]), .z(ain[75]), .d0(areg[75]), .s(x2));
mul_mux2 sh_74_ ( .d1(areg[75]), .z(ain[74]), .d0(areg[74]), .s(x2));
mul_mux2 sh_73_ ( .d1(areg[74]), .z(ain[73]), .d0(areg[73]), .s(x2));
mul_mux2 sh_72_ ( .d1(areg[73]), .z(ain[72]), .d0(areg[72]), .s(x2));
mul_mux2 sh_71_ ( .d1(areg[72]), .z(ain[71]), .d0(areg[71]), .s(x2));
mul_mux2 sh_70_ ( .d1(areg[71]), .z(ain[70]), .d0(areg[70]), .s(x2));
mul_mux2 sh_69_ ( .d1(areg[70]), .z(ain[69]), .d0(areg[69]), .s(x2));
mul_mux2 sh_19_ ( .d1(areg[20]), .z(ain[19]), .d0(areg[19]), .s(x2));
mul_mux2 sh_18_ ( .d1(areg[19]), .z(ain[18]), .d0(areg[18]), .s(x2));
mul_mux2 sh_17_ ( .d1(areg[18]), .z(ain[17]), .d0(areg[17]), .s(x2));
mul_mux2 sh_16_ ( .d1(areg[17]), .z(ain[16]), .d0(areg[16]), .s(x2));
mul_mux2 sh_15_ ( .d1(areg[16]), .z(ain[15]), .d0(areg[15]), .s(x2));
mul_mux2 sh_4_ ( .d1(areg[5]), .z(ain[4]), .d0(areg[4]), .s(x2));
mul_mux2 sh_3_ ( .d1(areg[4]), .z(ain[3]), .d0(areg[3]), .s(x2));
mul_mux2 sh_2_ ( .d1(areg[3]), .z(ain[2]), .d0(areg[2]), .s(x2));
mul_mux2 sh_1_ ( .d1(areg[2]), .z(ain[1]), .d0(areg[1]), .s(x2));
mul_mux2 shx2 ( .d1(areg[0]), .z(ainx2), .d0(1'b0),
     .s(x2));
mul_mux2 sh_83_ ( .d1(areg[84]), .z(ain[83]), .d0(areg[83]), .s(x2));
mul_mux2 sh_14_ ( .d1(areg[15]), .z(ain[14]), .d0(areg[14]), .s(x2));
mul_mux2 sh_13_ ( .d1(areg[14]), .z(ain[13]), .d0(areg[13]), .s(x2));
mul_mux2 sh_12_ ( .d1(areg[13]), .z(ain[12]), .d0(areg[12]), .s(x2));
mul_mux2 sh_11_ ( .d1(areg[12]), .z(ain[11]), .d0(areg[11]), .s(x2));
mul_mux2 sh_10_ ( .d1(areg[11]), .z(ain[10]), .d0(areg[10]), .s(x2));
mul_mux2 sh_9_ ( .d1(areg[10]), .z(ain[9]), .d0(areg[9]), .s(x2));
mul_mux2 sh_8_ ( .d1(areg[9]), .z(ain[8]), .d0(areg[8]), .s(x2));
mul_mux2 sh_7_ ( .d1(areg[8]), .z(ain[7]), .d0(areg[7]), .s(x2));
mul_mux2 sh_6_ ( .d1(areg[7]), .z(ain[6]), .d0(areg[6]), .s(x2));
mul_mux2 sh_5_ ( .d1(areg[6]), .z(ain[5]), .d0(areg[5]), .s(x2));
mul_csa42  sc3_68_ ( .cin(co[67]), .d(1'b0),
     .carry(c3[68]), .c(c2[67]), .b(s2[68]), .a(1'b0),
     .cout(), .sum(s3[68]));
mul_csa42  sc3_67_ ( .cin(co[66]), .d(1'b0),
     .carry(c3[67]), .c(c2[66]), .b(s2[67]), .a(s1[67]), .cout(co[67]),
     .sum(s3[67]));
mul_csa42  sc3_66_ ( .cin(co[65]), .d(c1[65]), .carry(c3[66]),
     .c(c2[65]), .b(s2[66]), .a(s1[66]), .cout(co[66]), .sum(s3[66]));
mul_csa42  sc3_65_ ( .cin(co[64]), .d(c1[64]), .carry(c3[65]),
     .c(c2[64]), .b(s2[65]), .a(s1[65]), .cout(co[65]), .sum(s3[65]));
mul_csa42  sc3_64_ ( .cin(co[63]), .d(c1[63]), .carry(c3[64]),
     .c(c2[63]), .b(s2[64]), .a(s1[64]), .cout(co[64]), .sum(s3[64]));
mul_csa42  sc3_63_ ( .cin(co[62]), .d(c1[62]), .carry(c3[63]),
     .c(c2[62]), .b(s2[63]), .a(s1[63]), .cout(co[63]), .sum(s3[63]));
mul_csa42  sc3_62_ ( .cin(co[61]), .d(c1[61]), .carry(c3[62]),
     .c(c2[61]), .b(s2[62]), .a(s1[62]), .cout(co[62]), .sum(s3[62]));
mul_csa42  sc3_61_ ( .cin(co[60]), .d(c1[60]), .carry(c3[61]),
     .c(c2[60]), .b(s2[61]), .a(s1[61]), .cout(co[61]), .sum(s3[61]));
mul_csa42  sc3_60_ ( .cin(co[59]), .d(c1[59]), .carry(c3[60]),
     .c(c2[59]), .b(s2[60]), .a(s1[60]), .cout(co[60]), .sum(s3[60]));
mul_csa42  sc3_59_ ( .cin(co[58]), .d(c1[58]), .carry(c3[59]),
     .c(c2[58]), .b(s2[59]), .a(s1[59]), .cout(co[59]), .sum(s3[59]));
mul_csa42  sc3_58_ ( .cin(co[57]), .d(c1[57]), .carry(c3[58]),
     .c(c2[57]), .b(s2[58]), .a(s1[58]), .cout(co[58]), .sum(s3[58]));
mul_csa42  sc3_57_ ( .cin(co[56]), .d(c1[56]), .carry(c3[57]),
     .c(c2[56]), .b(s2[57]), .a(s1[57]), .cout(co[57]), .sum(s3[57]));
mul_csa42  sc3_56_ ( .cin(co[55]), .d(c1[55]), .carry(c3[56]),
     .c(c2[55]), .b(s2[56]), .a(s1[56]), .cout(co[56]), .sum(s3[56]));
mul_csa42  sc3_55_ ( .cin(co[54]), .d(c1[54]), .carry(c3[55]),
     .c(c2[54]), .b(s2[55]), .a(s1[55]), .cout(co[55]), .sum(s3[55]));
mul_csa42  sc3_54_ ( .cin(co[53]), .d(c1[53]), .carry(c3[54]),
     .c(c2[53]), .b(s2[54]), .a(s1[54]), .cout(co[54]), .sum(s3[54]));
mul_csa42  sc3_53_ ( .cin(co[52]), .d(c1[52]), .carry(c3[53]),
     .c(c2[52]), .b(s2[53]), .a(s1[53]), .cout(co[53]), .sum(s3[53]));
mul_csa42  sc3_52_ ( .cin(co[51]), .d(c1[51]), .carry(c3[52]),
     .c(c2[51]), .b(s2[52]), .a(s1[52]), .cout(co[52]), .sum(s3[52]));
mul_csa42  sc3_51_ ( .cin(co[50]), .d(c1[50]), .carry(c3[51]),
     .c(c2[50]), .b(s2[51]), .a(s1[51]), .cout(co[51]), .sum(s3[51]));
mul_csa42  sc3_50_ ( .cin(co[49]), .d(c1[49]), .carry(c3[50]),
     .c(c2[49]), .b(s2[50]), .a(s1[50]), .cout(co[50]), .sum(s3[50]));
mul_csa42  sc3_49_ ( .cin(co[48]), .d(c1[48]), .carry(c3[49]),
     .c(c2[48]), .b(s2[49]), .a(s1[49]), .cout(co[49]), .sum(s3[49]));
mul_csa42  sc3_48_ ( .cin(co[47]), .d(c1[47]), .carry(c3[48]),
     .c(c2[47]), .b(s2[48]), .a(s1[48]), .cout(co[48]), .sum(s3[48]));
mul_csa42  sc3_47_ ( .cin(co[46]), .d(c1[46]), .carry(c3[47]),
     .c(c2[46]), .b(s2[47]), .a(s1[47]), .cout(co[47]), .sum(s3[47]));
mul_csa42  sc3_46_ ( .cin(co[45]), .d(c1[45]), .carry(c3[46]),
     .c(c2[45]), .b(s2[46]), .a(s1[46]), .cout(co[46]), .sum(s3[46]));
mul_csa42  sc3_45_ ( .cin(co[44]), .d(c1[44]), .carry(c3[45]),
     .c(c2[44]), .b(s2[45]), .a(s1[45]), .cout(co[45]), .sum(s3[45]));
mul_csa42  sc3_44_ ( .cin(co[43]), .d(c1[43]), .carry(c3[44]),
     .c(c2[43]), .b(s2[44]), .a(s1[44]), .cout(co[44]), .sum(s3[44]));
mul_csa42  sc3_43_ ( .cin(co[42]), .d(c1[42]), .carry(c3[43]),
     .c(c2[42]), .b(s2[43]), .a(s1[43]), .cout(co[43]), .sum(s3[43]));
mul_csa42  sc3_42_ ( .cin(co[41]), .d(c1[41]), .carry(c3[42]),
     .c(c2[41]), .b(s2[42]), .a(s1[42]), .cout(co[42]), .sum(s3[42]));
mul_csa42  sc3_41_ ( .cin(co[40]), .d(c1[40]), .carry(c3[41]),
     .c(c2[40]), .b(s2[41]), .a(s1[41]), .cout(co[41]), .sum(s3[41]));
mul_csa42  sc3_40_ ( .cin(co[39]), .d(c1[39]), .carry(c3[40]),
     .c(c2[39]), .b(s2[40]), .a(s1[40]), .cout(co[40]), .sum(s3[40]));
mul_csa42  sc3_39_ ( .cin(co[38]), .d(c1[38]), .carry(c3[39]),
     .c(c2[38]), .b(s2[39]), .a(s1[39]), .cout(co[39]), .sum(s3[39]));
mul_csa42  sc3_38_ ( .cin(co[37]), .d(c1[37]), .carry(c3[38]),
     .c(c2[37]), .b(s2[38]), .a(s1[38]), .cout(co[38]), .sum(s3[38]));
mul_csa42  sc3_37_ ( .cin(co[36]), .d(c1[36]), .carry(c3[37]),
     .c(c2[36]), .b(s2[37]), .a(s1[37]), .cout(co[37]), .sum(s3[37]));
mul_csa42  sc3_36_ ( .cin(co[35]), .d(c1[35]), .carry(c3[36]),
     .c(c2[35]), .b(s2[36]), .a(s1[36]), .cout(co[36]), .sum(s3[36]));
mul_csa42  sc3_35_ ( .cin(co[34]), .d(c1[34]), .carry(c3[35]),
     .c(c2[34]), .b(s2[35]), .a(s1[35]), .cout(co[35]), .sum(s3[35]));
mul_csa42  sc3_34_ ( .cin(co[33]), .d(c1[33]), .carry(c3[34]),
     .c(c2[33]), .b(s2[34]), .a(s1[34]), .cout(co[34]), .sum(s3[34]));
mul_csa42  sc3_33_ ( .cin(co[32]), .d(c1[32]), .carry(c3[33]),
     .c(c2[32]), .b(s2[33]), .a(s1[33]), .cout(co[33]), .sum(s3[33]));
mul_csa42  sc3_32_ ( .cin(co[31]), .d(c1[31]), .carry(c3[32]),
     .c(c2[31]), .b(s2[32]), .a(s1[32]), .cout(co[32]), .sum(s3[32]));
mul_csa42  sc3_31_ ( .cin(co[30]), .d(c1[30]), .carry(c3[31]),
     .c(c2[30]), .b(s2[31]), .a(s1[31]), .cout(co[31]), .sum(s3[31]));
mul_csa42  sc3_30_ ( .cin(co[29]), .d(c1[29]), .carry(c3[30]),
     .c(c2[29]), .b(s2[30]), .a(s1[30]), .cout(co[30]), .sum(s3[30]));
mul_csa42  sc3_29_ ( .cin(co[28]), .d(c1[28]), .carry(c3[29]),
     .c(c2[28]), .b(s2[29]), .a(s1[29]), .cout(co[29]), .sum(s3[29]));
mul_csa42  sc3_28_ ( .cin(co[27]), .d(c1[27]), .carry(c3[28]),
     .c(c2[27]), .b(s2[28]), .a(s1[28]), .cout(co[28]), .sum(s3[28]));
mul_csa42  sc3_27_ ( .cin(co[26]), .d(c1[26]), .carry(c3[27]),
     .c(c2[26]), .b(s2[27]), .a(s1[27]), .cout(co[27]), .sum(s3[27]));
mul_csa42  sc3_26_ ( .cin(co[25]), .d(c1[25]), .carry(c3[26]),
     .c(c2[25]), .b(s2[26]), .a(s1[26]), .cout(co[26]), .sum(s3[26]));
mul_csa42  sc3_25_ ( .cin(co[24]), .d(c1[24]), .carry(c3[25]),
     .c(c2[24]), .b(s2[25]), .a(s1[25]), .cout(co[25]), .sum(s3[25]));
mul_csa42  sc3_24_ ( .cin(co[23]), .d(c1[23]), .carry(c3[24]),
     .c(c2[23]), .b(s2[24]), .a(s1[24]), .cout(co[24]), .sum(s3[24]));
mul_csa42  sc3_23_ ( .cin(co[22]), .d(c1[22]), .carry(c3[23]),
     .c(c2[22]), .b(s2[23]), .a(s1[23]), .cout(co[23]), .sum(s3[23]));
mul_csa42  sc3_22_ ( .cin(co[21]), .d(c1[21]), .carry(c3[22]),
     .c(c2[21]), .b(s2[22]), .a(s1[22]), .cout(co[22]), .sum(s3[22]));
mul_csa42  sc3_21_ ( .cin(co[20]), .d(c1[20]), .carry(c3[21]),
     .c(c2[20]), .b(s2[21]), .a(s1[21]), .cout(co[21]), .sum(s3[21]));
mul_csa42  sc3_20_ ( .cin(1'b0), .d(c1[19]),
     .carry(c3[20]), .c(c2[19]), .b(s2[20]), .a(s1[20]), .cout(co[20]),
     .sum(s3[20]));
mul_csa32  sc4_82_ ( .c(c3[81]), .b(s2[82]), .a(ain[82]),
     .cout(pcout[82]), .sum(psum[82]));
mul_csa32  sc4_68_ ( .c(c3[67]), .b(s3[68]), .a(ain[68]),
     .cout(pcout[68]), .sum(psum[68]));
mul_csa32  sc4_67_ ( .c(c3[66]), .b(s3[67]), .a(ain[67]),
     .cout(pcout[67]), .sum(psum[67]));
mul_csa32  sc4_66_ ( .c(c3[65]), .b(s3[66]), .a(ain[66]),
     .cout(pcout[66]), .sum(psum[66]));
mul_csa32  sc4_65_ ( .c(c3[64]), .b(s3[65]), .a(ain[65]),
     .cout(pcout[65]), .sum(psum[65]));
mul_csa32  sc4_64_ ( .c(c3[63]), .b(s3[64]), .a(ain[64]),
     .cout(pcout[64]), .sum(psum[64]));
mul_csa32  sc4_63_ ( .c(c3[62]), .b(s3[63]), .a(ain[63]),
     .cout(pcout[63]), .sum(psum[63]));
mul_csa32  sc4_62_ ( .c(c3[61]), .b(s3[62]), .a(ain[62]),
     .cout(pcout[62]), .sum(psum[62]));
mul_csa32  sc4_61_ ( .c(c3[60]), .b(s3[61]), .a(ain[61]),
     .cout(pcout[61]), .sum(psum[61]));
mul_csa32  sc4_60_ ( .c(c3[59]), .b(s3[60]), .a(ain[60]),
     .cout(pcout[60]), .sum(psum[60]));
mul_csa32  sc4_59_ ( .c(c3[58]), .b(s3[59]), .a(ain[59]),
     .cout(pcout[59]), .sum(psum[59]));
mul_csa32  sc4_58_ ( .c(c3[57]), .b(s3[58]), .a(ain[58]),
     .cout(pcout[58]), .sum(psum[58]));
mul_csa32  sc4_57_ ( .c(c3[56]), .b(s3[57]), .a(ain[57]),
     .cout(pcout[57]), .sum(psum[57]));
mul_csa32  sc4_56_ ( .c(c3[55]), .b(s3[56]), .a(ain[56]),
     .cout(pcout[56]), .sum(psum[56]));
mul_csa32  sc4_55_ ( .c(c3[54]), .b(s3[55]), .a(ain[55]),
     .cout(pcout[55]), .sum(psum[55]));
mul_csa32  sc4_54_ ( .c(c3[53]), .b(s3[54]), .a(ain[54]),
     .cout(pcout[54]), .sum(psum[54]));
mul_csa32  sc4_53_ ( .c(c3[52]), .b(s3[53]), .a(ain[53]),
     .cout(pcout[53]), .sum(psum[53]));
mul_csa32  sc4_52_ ( .c(c3[51]), .b(s3[52]), .a(ain[52]),
     .cout(pcout[52]), .sum(psum[52]));
mul_csa32  sc4_51_ ( .c(c3[50]), .b(s3[51]), .a(ain[51]),
     .cout(pcout[51]), .sum(psum[51]));
mul_csa32  sc4_50_ ( .c(c3[49]), .b(s3[50]), .a(ain[50]),
     .cout(pcout[50]), .sum(psum[50]));
mul_csa32  sc4_49_ ( .c(c3[48]), .b(s3[49]), .a(ain[49]),
     .cout(pcout[49]), .sum(psum[49]));
mul_csa32  sc4_48_ ( .c(c3[47]), .b(s3[48]), .a(ain[48]),
     .cout(pcout[48]), .sum(psum[48]));
mul_csa32  sc4_47_ ( .c(c3[46]), .b(s3[47]), .a(ain[47]),
     .cout(pcout[47]), .sum(psum[47]));
mul_csa32  sc4_46_ ( .c(c3[45]), .b(s3[46]), .a(ain[46]),
     .cout(pcout[46]), .sum(psum[46]));
mul_csa32  sc4_45_ ( .c(c3[44]), .b(s3[45]), .a(ain[45]),
     .cout(pcout[45]), .sum(psum[45]));
mul_csa32  sc4_44_ ( .c(c3[43]), .b(s3[44]), .a(ain[44]),
     .cout(pcout[44]), .sum(psum[44]));
mul_csa32  sc4_43_ ( .c(c3[42]), .b(s3[43]), .a(ain[43]),
     .cout(pcout[43]), .sum(psum[43]));
mul_csa32  sc4_42_ ( .c(c3[41]), .b(s3[42]), .a(ain[42]),
     .cout(pcout[42]), .sum(psum[42]));
mul_csa32  sc4_41_ ( .c(c3[40]), .b(s3[41]), .a(ain[41]),
     .cout(pcout[41]), .sum(psum[41]));
mul_csa32  sc4_40_ ( .c(c3[39]), .b(s3[40]), .a(ain[40]),
     .cout(pcout[40]), .sum(psum[40]));
mul_csa32  sc4_39_ ( .c(c3[38]), .b(s3[39]), .a(ain[39]),
     .cout(pcout[39]), .sum(psum[39]));
mul_csa32  sc4_38_ ( .c(c3[37]), .b(s3[38]), .a(ain[38]),
     .cout(pcout[38]), .sum(psum[38]));
mul_csa32  sc4_37_ ( .c(c3[36]), .b(s3[37]), .a(ain[37]),
     .cout(pcout[37]), .sum(psum[37]));
mul_csa32  sc4_36_ ( .c(c3[35]), .b(s3[36]), .a(ain[36]),
     .cout(pcout[36]), .sum(psum[36]));
mul_csa32  sc4_35_ ( .c(c3[34]), .b(s3[35]), .a(ain[35]),
     .cout(pcout[35]), .sum(psum[35]));
mul_csa32  sc4_34_ ( .c(c3[33]), .b(s3[34]), .a(ain[34]),
     .cout(pcout[34]), .sum(psum[34]));
mul_csa32  sc4_33_ ( .c(c3[32]), .b(s3[33]), .a(ain[33]),
     .cout(pcout[33]), .sum(psum[33]));
mul_csa32  sc4_32_ ( .c(c3[31]), .b(s3[32]), .a(ain[32]),
     .cout(pcout[32]), .sum(psum[32]));
mul_csa32  sc4_31_ ( .c(c3[30]), .b(s3[31]), .a(ain[31]),
     .cout(pcout[31]), .sum(psum[31]));
mul_csa32  sc4_30_ ( .c(c3[29]), .b(s3[30]), .a(ain[30]),
     .cout(pcout[30]), .sum(psum[30]));
mul_csa32  sc4_29_ ( .c(c3[28]), .b(s3[29]), .a(ain[29]),
     .cout(pcout[29]), .sum(psum[29]));
mul_csa32  sc4_28_ ( .c(c3[27]), .b(s3[28]), .a(ain[28]),
     .cout(pcout[28]), .sum(psum[28]));
mul_csa32  sc4_27_ ( .c(c3[26]), .b(s3[27]), .a(ain[27]),
     .cout(pcout[27]), .sum(psum[27]));
mul_csa32  sc4_26_ ( .c(c3[25]), .b(s3[26]), .a(ain[26]),
     .cout(pcout[26]), .sum(psum[26]));
mul_csa32  sc4_25_ ( .c(c3[24]), .b(s3[25]), .a(ain[25]),
     .cout(pcout[25]), .sum(psum[25]));
mul_csa32  sc4_24_ ( .c(c3[23]), .b(s3[24]), .a(ain[24]),
     .cout(pcout[24]), .sum(psum[24]));
mul_csa32  sc4_23_ ( .c(c3[22]), .b(s3[23]), .a(ain[23]),
     .cout(pcout[23]), .sum(psum[23]));
mul_csa32  sc4_22_ ( .c(c3[21]), .b(s3[22]), .a(ain[22]),
     .cout(pcout[22]), .sum(psum[22]));
mul_csa32  sc4_21_ ( .c(c3[20]), .b(s3[21]), .a(ain[21]),
     .cout(pcout[21]), .sum(psum[21]));
mul_csa32  sc4_20_ ( .c(c3[19]), .b(s3[20]), .a(ain[20]),
     .cout(pcout[20]), .sum(psum[20]));
mul_csa32  sc4_96_ ( .c(c2[95]), .b(s2[96]), .a(ain[96]),
     .cout(pcout[96]), .sum(psum[96]));
mul_csa32  sc4_95_ ( .c(c2[94]), .b(s2[95]), .a(ain[95]),
     .cout(pcout[95]), .sum(psum[95]));
mul_csa32  sc4_94_ ( .c(c2[93]), .b(s2[94]), .a(ain[94]),
     .cout(pcout[94]), .sum(psum[94]));
mul_csa32  sc4_93_ ( .c(c2[92]), .b(s2[93]), .a(ain[93]),
     .cout(pcout[93]), .sum(psum[93]));
mul_csa32  sc4_92_ ( .c(c2[91]), .b(s2[92]), .a(ain[92]),
     .cout(pcout[92]), .sum(psum[92]));
mul_csa32  sc4_91_ ( .c(c2[90]), .b(s2[91]), .a(ain[91]),
     .cout(pcout[91]), .sum(psum[91]));
mul_csa32  sc4_90_ ( .c(c2[89]), .b(s2[90]), .a(ain[90]),
     .cout(pcout[90]), .sum(psum[90]));
mul_csa32  sc4_89_ ( .c(c2[88]), .b(s2[89]), .a(ain[89]),
     .cout(pcout[89]), .sum(psum[89]));
mul_csa32  sc4_88_ ( .c(c2[87]), .b(s2[88]), .a(ain[88]),
     .cout(pcout[88]), .sum(psum[88]));
mul_csa32  sc4_87_ ( .c(c2[86]), .b(s2[87]), .a(ain[87]),
     .cout(pcout[87]), .sum(psum[87]));
mul_csa32  sc4_86_ ( .c(c2[85]), .b(s2[86]), .a(ain[86]),
     .cout(pcout[86]), .sum(psum[86]));
mul_csa32  sc4_85_ ( .c(c2[84]), .b(s2[85]), .a(ain[85]),
     .cout(pcout[85]), .sum(psum[85]));
mul_csa32  sc4_84_ ( .c(c2[83]), .b(s2[84]), .a(ain[84]),
     .cout(pcout[84]), .sum(psum[84]));
mul_csa32  sc4_81_ ( .c(c3[80]), .b(s3[81]), .a(ain[81]),
     .cout(pcout[81]), .sum(psum[81]));
mul_csa32  sc4_80_ ( .c(c3[79]), .b(s3[80]), .a(ain[80]),
     .cout(pcout[80]), .sum(psum[80]));
mul_csa32  sc4_79_ ( .c(c3[78]), .b(s3[79]), .a(ain[79]),
     .cout(pcout[79]), .sum(psum[79]));
mul_csa32  sc4_78_ ( .c(c3[77]), .b(s3[78]), .a(ain[78]),
     .cout(pcout[78]), .sum(psum[78]));
mul_csa32  sc4_77_ ( .c(c3[76]), .b(s3[77]), .a(ain[77]),
     .cout(pcout[77]), .sum(psum[77]));
mul_csa32  sc4_76_ ( .c(c3[75]), .b(s3[76]), .a(ain[76]),
     .cout(pcout[76]), .sum(psum[76]));
mul_csa32  sc4_75_ ( .c(c3[74]), .b(s3[75]), .a(ain[75]),
     .cout(pcout[75]), .sum(psum[75]));
mul_csa32  sc4_74_ ( .c(c3[73]), .b(s3[74]), .a(ain[74]),
     .cout(pcout[74]), .sum(psum[74]));
mul_csa32  sc4_73_ ( .c(c3[72]), .b(s3[73]), .a(ain[73]),
     .cout(pcout[73]), .sum(psum[73]));
mul_csa32  sc4_72_ ( .c(c3[71]), .b(s3[72]), .a(ain[72]),
     .cout(pcout[72]), .sum(psum[72]));
mul_csa32  sc4_71_ ( .c(c3[70]), .b(s3[71]), .a(ain[71]),
     .cout(pcout[71]), .sum(psum[71]));
mul_csa32  sc4_70_ ( .c(c3[69]), .b(s3[70]), .a(ain[70]),
     .cout(pcout[70]), .sum(psum[70]));
mul_csa32  sc4_69_ ( .c(c3[68]), .b(s3[69]), .a(ain[69]),
     .cout(pcout[69]), .sum(psum[69]));
mul_csa32  acc_4_ ( .c(c2[3]), .sum(psum[4]), .cout(pcout[4]),
     .a(ain[4]), .b(s2[4]));
mul_csa32  acc_3_ ( .c(c2[2]), .sum(psum[3]), .cout(pcout[3]),
     .a(ain[3]), .b(s2[3]));
mul_csa32  acc_2_ ( .c(c2[1]), .sum(psum[2]), .cout(pcout[2]),
     .a(ain[2]), .b(s2[2]));
mul_csa32  acc_1_ ( .c(c2[0]), .sum(psum[1]), .cout(pcout[1]),
     .a(ain[1]), .b(s2[1]));
mul_csa32  sc3_97_ ( .c(c2[96]), .sum(psum[97]), .cout(pcout[97]),
     .a(a1s[81]), .b(a1c[80]));
mul_csa32  sc1_19_ ( .c(a1s[3]), .b(pc[50]), .a(ps[51]),
     .cout(c1[19]), .sum(s1[19]));
mul_csa32  sc1_18_ ( .c(a1s[2]), .b(pc[49]), .a(ps[50]),
     .cout(c1[18]), .sum(s1[18]));
mul_csa32  sc1_17_ ( .c(a1s[1]), .b(pc[48]), .a(ps[49]),
     .cout(c1[17]), .sum(s1[17]));
mul_csa32  sc1_16_ ( .c(a1s[0]), .b(pc[47]), .a(ps[48]),
     .cout(c1[16]), .sum(s1[16]));
mul_csa32  sc1_15_ ( .c(1'b0), .b(pc[46]), .a(ps[47]),
     .cout(c1[15]), .sum(s1[15]));
mul_csa32  sc4_83_ ( .c(c2[82]), .b(s2[83]), .a(ain[83]),
     .cout(pcout[83]), .sum(psum[83]));
mul_csa32  sc2_83_ ( .c(c1[82]), .b(a1c[66]), .a(a1s[67]),
     .cout(c2[83]), .sum(s2[83]));
mul_csa32  sc2_19_ ( .c(a0c[18]), .b(a0s[19]), .a(s1[19]),
     .cout(c2[19]), .sum(s2[19]));
mul_csa32  sc2_18_ ( .c(a0c[17]), .b(a0s[18]), .a(s1[18]),
     .cout(c2[18]), .sum(s2[18]));
mul_csa32  sc2_17_ ( .c(a0c[16]), .b(a0s[17]), .a(s1[17]),
     .cout(c2[17]), .sum(s2[17]));
mul_csa32  sc2_16_ ( .c(a0c[15]), .b(a0s[16]), .a(s1[16]),
     .cout(c2[16]), .sum(s2[16]));
mul_csa32  sc2_15_ ( .c(a0c[14]), .b(a0s[15]), .a(s1[15]),
     .cout(c2[15]), .sum(s2[15]));
mul_csa32  sc1_81_ ( .c(a0s[81]), .b(a1c[64]), .a(a1s[65]),
     .cout(c1[81]), .sum(s1[81]));
mul_csa32  sc1_80_ ( .c(a0s[80]), .b(a1c[63]), .a(a1s[64]),
     .cout(c1[80]), .sum(s1[80]));
mul_csa32  sc1_79_ ( .c(a0s[79]), .b(a1c[62]), .a(a1s[63]),
     .cout(c1[79]), .sum(s1[79]));
mul_csa32  sc1_78_ ( .c(a0s[78]), .b(a1c[61]), .a(a1s[62]),
     .cout(c1[78]), .sum(s1[78]));
mul_csa32  sc1_77_ ( .c(a0s[77]), .b(a1c[60]), .a(a1s[61]),
     .cout(c1[77]), .sum(s1[77]));
mul_csa32  sc1_76_ ( .c(a0s[76]), .b(a1c[59]), .a(a1s[60]),
     .cout(c1[76]), .sum(s1[76]));
mul_csa32  sc1_75_ ( .c(a0s[75]), .b(a1c[58]), .a(a1s[59]),
     .cout(c1[75]), .sum(s1[75]));
mul_csa32  sc1_74_ ( .c(a0s[74]), .b(a1c[57]), .a(a1s[58]),
     .cout(c1[74]), .sum(s1[74]));
mul_csa32  sc1_73_ ( .c(a0s[73]), .b(a1c[56]), .a(a1s[57]),
     .cout(c1[73]), .sum(s1[73]));
mul_csa32  sc1_72_ ( .c(a0s[72]), .b(a1c[55]), .a(a1s[56]),
     .cout(c1[72]), .sum(s1[72]));
mul_csa32  sc1_71_ ( .c(a0s[71]), .b(a1c[54]), .a(a1s[55]),
     .cout(c1[71]), .sum(s1[71]));
mul_csa32  sc1_70_ ( .c(a0s[70]), .b(a1c[53]), .a(a1s[54]),
     .cout(c1[70]), .sum(s1[70]));
mul_csa32  sc1_69_ ( .c(a0s[69]), .b(a1c[52]), .a(a1s[53]),
     .cout(c1[69]), .sum(s1[69]));
mul_csa32  sc1_68_ ( .c(a0s[68]), .b(a1c[51]), .a(a1s[52]),
     .cout(c1[68]), .sum(s1[68]));
mul_csa32  sc3_19_ ( .c(c2[18]), .b(c1[18]), .a(s2[19]),
     .cout(c3[19]), .sum(s3[19]));
mul_csa32  sc3_18_ ( .c(c2[17]), .b(c1[17]), .a(s2[18]),
     .cout(c3[18]), .sum(s3[18]));
mul_csa32  sc3_17_ ( .c(c2[16]), .b(c1[16]), .a(s2[17]),
     .cout(c3[17]), .sum(s3[17]));
mul_csa32  sc3_16_ ( .c(c2[15]), .b(c1[15]), .a(s2[16]),
     .cout(c3[16]), .sum(s3[16]));
mul_csa32  sc3_15_ ( .c(c2[14]), .b(c1[14]), .a(s2[15]),
     .cout(c3[15]), .sum(s3[15]));
mul_csa32  sc1_82_ ( .c(a0c[81]), .b(a1c[65]), .a(a1s[66]),
     .cout(c1[82]), .sum(s1[82]));
mul_csa32  acc_14_ ( .c(c2[13]), .sum(psum[14]), .cout(pcout[14]),
     .a(ain[14]), .b(s2[14]));
mul_csa32  acc_13_ ( .c(c2[12]), .sum(psum[13]), .cout(pcout[13]),
     .a(ain[13]), .b(s2[13]));
mul_csa32  acc_12_ ( .c(c2[11]), .sum(psum[12]), .cout(pcout[12]),
     .a(ain[12]), .b(s2[12]));
mul_csa32  acc_11_ ( .c(c2[10]), .sum(psum[11]), .cout(pcout[11]),
     .a(ain[11]), .b(s2[11]));
mul_csa32  acc_10_ ( .c(c2[9]), .sum(psum[10]), .cout(pcout[10]),
     .a(ain[10]), .b(s2[10]));
mul_csa32  acc_9_ ( .c(c2[8]), .sum(psum[9]), .cout(pcout[9]),
     .a(ain[9]), .b(s2[9]));
mul_csa32  acc_8_ ( .c(c2[7]), .sum(psum[8]), .cout(pcout[8]),
     .a(ain[8]), .b(s2[8]));
mul_csa32  acc_7_ ( .c(c2[6]), .sum(psum[7]), .cout(pcout[7]),
     .a(ain[7]), .b(s2[7]));
mul_csa32  acc_6_ ( .c(c2[5]), .sum(psum[6]), .cout(pcout[6]),
     .a(ain[6]), .b(s2[6]));
mul_csa32  acc_5_ ( .c(c2[4]), .sum(psum[5]), .cout(pcout[5]),
     .a(ain[5]), .b(s2[5]));
mul_csa32  sc2_67_ ( .c(a0c[66]), .b(c1[66]), .a(a0s[67]),
     .cout(c2[67]), .sum(s2[67]));
mul_csa32  sc1_14_ ( .c(a0s[14]), .b(pc[45]), .a(ps[46]),
     .cout(c1[14]), .sum(s1[14]));
mul_csa32  sc1_13_ ( .c(a0s[13]), .b(pc[44]), .a(ps[45]),
     .cout(c1[13]), .sum(s1[13]));
mul_csa32  sc1_12_ ( .c(a0s[12]), .b(pc[43]), .a(ps[44]),
     .cout(c1[12]), .sum(s1[12]));
mul_csa32  sc1_11_ ( .c(a0s[11]), .b(pc[42]), .a(ps[43]),
     .cout(c1[11]), .sum(s1[11]));
mul_csa32  sc1_10_ ( .c(a0s[10]), .b(pc[41]), .a(ps[42]),
     .cout(c1[10]), .sum(s1[10]));
mul_csa32  sc1_9_ ( .c(a0s[9]), .b(pc[40]), .a(ps[41]), .cout(c1[9]),
     .sum(s1[9]));
mul_csa32  sc1_8_ ( .c(a0s[8]), .b(pc[39]), .a(ps[40]), .cout(c1[8]),
     .sum(s1[8]));
mul_csa32  sc1_7_ ( .c(a0s[7]), .b(pc[38]), .a(ps[39]), .cout(c1[7]),
     .sum(s1[7]));
mul_csa32  sc1_6_ ( .c(a0s[6]), .b(pc[37]), .a(ps[38]), .cout(c1[6]),
     .sum(s1[6]));
mul_csa32  sc1_5_ ( .c(a0s[5]), .b(pc[36]), .a(ps[37]), .cout(c1[5]),
     .sum(s1[5]));
mul_csa32  sc2_14_ ( .c(a0c[13]), .b(c1[13]), .a(s1[14]),
     .cout(c2[14]), .sum(s2[14]));
mul_csa32  sc2_13_ ( .c(a0c[12]), .b(c1[12]), .a(s1[13]),
     .cout(c2[13]), .sum(s2[13]));
mul_csa32  sc2_12_ ( .c(a0c[11]), .b(c1[11]), .a(s1[12]),
     .cout(c2[12]), .sum(s2[12]));
mul_csa32  sc2_11_ ( .c(a0c[10]), .b(c1[10]), .a(s1[11]),
     .cout(c2[11]), .sum(s2[11]));
mul_csa32  sc2_10_ ( .c(a0c[9]), .b(c1[9]), .a(s1[10]),
     .cout(c2[10]), .sum(s2[10]));
mul_csa32  sc2_9_ ( .c(a0c[8]), .b(c1[8]), .a(s1[9]), .cout(c2[9]),
     .sum(s2[9]));
mul_csa32  sc2_8_ ( .c(a0c[7]), .b(c1[7]), .a(s1[8]), .cout(c2[8]),
     .sum(s2[8]));
mul_csa32  sc2_7_ ( .c(a0c[6]), .b(c1[6]), .a(s1[7]), .cout(c2[7]),
     .sum(s2[7]));
mul_csa32  sc2_6_ ( .c(a0c[5]), .b(c1[5]), .a(s1[6]), .cout(c2[6]),
     .sum(s2[6]));
mul_csa32  sc2_5_ ( .c(a0c[4]), .b(c1[4]), .a(s1[5]), .cout(c2[5]),
     .sum(s2[5]));
mul_csa32  sc2_82_ ( .c(c2[81]), .b(c1[81]), .a(s1[82]),
     .cout(c2[82]), .sum(s2[82]));
mul_csa32  sc1_4_ ( .c(a0s[4]), .b(pc[35]), .a(ps[36]), .cout(c1[4]),
     .sum(s1[4]));
mul_csa32  sc1_3_ ( .c(a0s[3]), .b(pc[34]), .a(ps[35]), .cout(c1[3]),
     .sum(s1[3]));
mul_csa32  sc1_2_ ( .c(a0s[2]), .b(pc[33]), .a(ps[34]), .cout(c1[2]),
     .sum(s1[2]));
mul_csa32  sc1_1_ ( .c(a0s[1]), .b(pc[32]), .a(ps[33]), .cout(c1[1]),
     .sum(s1[1]));
mul_csa32  sc2_66_ ( .c(a0c[65]), .b(a0s[66]), .a(a1c[49]),
     .cout(c2[66]), .sum(s2[66]));
mul_csa32  sc2_65_ ( .c(a0c[64]), .b(a0s[65]), .a(a1c[48]),
     .cout(c2[65]), .sum(s2[65]));
mul_csa32  sc2_64_ ( .c(a0c[63]), .b(a0s[64]), .a(a1c[47]),
     .cout(c2[64]), .sum(s2[64]));
mul_csa32  sc2_63_ ( .c(a0c[62]), .b(a0s[63]), .a(a1c[46]),
     .cout(c2[63]), .sum(s2[63]));
mul_csa32  sc2_62_ ( .c(a0c[61]), .b(a0s[62]), .a(a1c[45]),
     .cout(c2[62]), .sum(s2[62]));
mul_csa32  sc2_61_ ( .c(a0c[60]), .b(a0s[61]), .a(a1c[44]),
     .cout(c2[61]), .sum(s2[61]));
mul_csa32  sc2_60_ ( .c(a0c[59]), .b(a0s[60]), .a(a1c[43]),
     .cout(c2[60]), .sum(s2[60]));
mul_csa32  sc2_59_ ( .c(a0c[58]), .b(a0s[59]), .a(a1c[42]),
     .cout(c2[59]), .sum(s2[59]));
mul_csa32  sc2_58_ ( .c(a0c[57]), .b(a0s[58]), .a(a1c[41]),
     .cout(c2[58]), .sum(s2[58]));
mul_csa32  sc2_57_ ( .c(a0c[56]), .b(a0s[57]), .a(a1c[40]),
     .cout(c2[57]), .sum(s2[57]));
mul_csa32  sc2_56_ ( .c(a0c[55]), .b(a0s[56]), .a(a1c[39]),
     .cout(c2[56]), .sum(s2[56]));
mul_csa32  sc2_55_ ( .c(a0c[54]), .b(a0s[55]), .a(a1c[38]),
     .cout(c2[55]), .sum(s2[55]));
mul_csa32  sc2_54_ ( .c(a0c[53]), .b(a0s[54]), .a(a1c[37]),
     .cout(c2[54]), .sum(s2[54]));
mul_csa32  sc2_53_ ( .c(a0c[52]), .b(a0s[53]), .a(a1c[36]),
     .cout(c2[53]), .sum(s2[53]));
mul_csa32  sc2_52_ ( .c(a0c[51]), .b(a0s[52]), .a(a1c[35]),
     .cout(c2[52]), .sum(s2[52]));
mul_csa32  sc2_51_ ( .c(a0c[50]), .b(a0s[51]), .a(a1c[34]),
     .cout(c2[51]), .sum(s2[51]));
mul_csa32  sc2_50_ ( .c(a0c[49]), .b(a0s[50]), .a(a1c[33]),
     .cout(c2[50]), .sum(s2[50]));
mul_csa32  sc2_49_ ( .c(a0c[48]), .b(a0s[49]), .a(a1c[32]),
     .cout(c2[49]), .sum(s2[49]));
mul_csa32  sc2_48_ ( .c(a0c[47]), .b(a0s[48]), .a(a1c[31]),
     .cout(c2[48]), .sum(s2[48]));
mul_csa32  sc2_47_ ( .c(a0c[46]), .b(a0s[47]), .a(a1c[30]),
     .cout(c2[47]), .sum(s2[47]));
mul_csa32  sc2_46_ ( .c(a0c[45]), .b(a0s[46]), .a(a1c[29]),
     .cout(c2[46]), .sum(s2[46]));
mul_csa32  sc2_45_ ( .c(a0c[44]), .b(a0s[45]), .a(a1c[28]),
     .cout(c2[45]), .sum(s2[45]));
mul_csa32  sc2_44_ ( .c(a0c[43]), .b(a0s[44]), .a(a1c[27]),
     .cout(c2[44]), .sum(s2[44]));
mul_csa32  sc2_43_ ( .c(a0c[42]), .b(a0s[43]), .a(a1c[26]),
     .cout(c2[43]), .sum(s2[43]));
mul_csa32  sc2_42_ ( .c(a0c[41]), .b(a0s[42]), .a(a1c[25]),
     .cout(c2[42]), .sum(s2[42]));
mul_csa32  sc2_41_ ( .c(a0c[40]), .b(a0s[41]), .a(a1c[24]),
     .cout(c2[41]), .sum(s2[41]));
mul_csa32  sc2_40_ ( .c(a0c[39]), .b(a0s[40]), .a(a1c[23]),
     .cout(c2[40]), .sum(s2[40]));
mul_csa32  sc2_39_ ( .c(a0c[38]), .b(a0s[39]), .a(a1c[22]),
     .cout(c2[39]), .sum(s2[39]));
mul_csa32  sc2_38_ ( .c(a0c[37]), .b(a0s[38]), .a(a1c[21]),
     .cout(c2[38]), .sum(s2[38]));
mul_csa32  sc2_37_ ( .c(a0c[36]), .b(a0s[37]), .a(a1c[20]),
     .cout(c2[37]), .sum(s2[37]));
mul_csa32  sc2_36_ ( .c(a0c[35]), .b(a0s[36]), .a(a1c[19]),
     .cout(c2[36]), .sum(s2[36]));
mul_csa32  sc2_35_ ( .c(a0c[34]), .b(a0s[35]), .a(a1c[18]),
     .cout(c2[35]), .sum(s2[35]));
mul_csa32  sc2_34_ ( .c(a0c[33]), .b(a0s[34]), .a(a1c[17]),
     .cout(c2[34]), .sum(s2[34]));
mul_csa32  sc2_33_ ( .c(a0c[32]), .b(a0s[33]), .a(a1c[16]),
     .cout(c2[33]), .sum(s2[33]));
mul_csa32  sc2_32_ ( .c(a0c[31]), .b(a0s[32]), .a(a1c[15]),
     .cout(c2[32]), .sum(s2[32]));
mul_csa32  sc2_31_ ( .c(a0c[30]), .b(a0s[31]), .a(a1c[14]),
     .cout(c2[31]), .sum(s2[31]));
mul_csa32  sc2_30_ ( .c(a0c[29]), .b(a0s[30]), .a(a1c[13]),
     .cout(c2[30]), .sum(s2[30]));
mul_csa32  sc2_29_ ( .c(a0c[28]), .b(a0s[29]), .a(a1c[12]),
     .cout(c2[29]), .sum(s2[29]));
mul_csa32  sc2_28_ ( .c(a0c[27]), .b(a0s[28]), .a(a1c[11]),
     .cout(c2[28]), .sum(s2[28]));
mul_csa32  sc2_27_ ( .c(a0c[26]), .b(a0s[27]), .a(a1c[10]),
     .cout(c2[27]), .sum(s2[27]));
mul_csa32  sc2_26_ ( .c(a0c[25]), .b(a0s[26]), .a(a1c[9]),
     .cout(c2[26]), .sum(s2[26]));
mul_csa32  sc2_25_ ( .c(a0c[24]), .b(a0s[25]), .a(a1c[8]),
     .cout(c2[25]), .sum(s2[25]));
mul_csa32  sc2_24_ ( .c(a0c[23]), .b(a0s[24]), .a(a1c[7]),
     .cout(c2[24]), .sum(s2[24]));
mul_csa32  sc2_23_ ( .c(a0c[22]), .b(a0s[23]), .a(a1c[6]),
     .cout(c2[23]), .sum(s2[23]));
mul_csa32  sc2_22_ ( .c(a0c[21]), .b(a0s[22]), .a(a1c[5]),
     .cout(c2[22]), .sum(s2[22]));
mul_csa32  sc2_21_ ( .c(a0c[20]), .b(a0s[21]), .a(a1c[4]),
     .cout(c2[21]), .sum(s2[21]));
mul_csa32  sc2_20_ ( .c(a0c[19]), .b(a0s[20]), .a(1'b0),
     .cout(c2[20]), .sum(s2[20]));
mul_csa32  sc1_66_ ( .c(a1s[50]), .b(pc[97]), .a(ps[98]),
     .cout(c1[66]), .sum(s1[66]));
mul_csa32  sc1_65_ ( .c(a1s[49]), .b(pc[96]), .a(ps[97]),
     .cout(c1[65]), .sum(s1[65]));
mul_csa32  sc1_64_ ( .c(a1s[48]), .b(pc[95]), .a(ps[96]),
     .cout(c1[64]), .sum(s1[64]));
mul_csa32  sc1_63_ ( .c(a1s[47]), .b(pc[94]), .a(ps[95]),
     .cout(c1[63]), .sum(s1[63]));
mul_csa32  sc1_62_ ( .c(a1s[46]), .b(pc[93]), .a(ps[94]),
     .cout(c1[62]), .sum(s1[62]));
mul_csa32  sc1_61_ ( .c(a1s[45]), .b(pc[92]), .a(ps[93]),
     .cout(c1[61]), .sum(s1[61]));
mul_csa32  sc1_60_ ( .c(a1s[44]), .b(pc[91]), .a(ps[92]),
     .cout(c1[60]), .sum(s1[60]));
mul_csa32  sc1_59_ ( .c(a1s[43]), .b(pc[90]), .a(ps[91]),
     .cout(c1[59]), .sum(s1[59]));
mul_csa32  sc1_58_ ( .c(a1s[42]), .b(pc[89]), .a(ps[90]),
     .cout(c1[58]), .sum(s1[58]));
mul_csa32  sc1_57_ ( .c(a1s[41]), .b(pc[88]), .a(ps[89]),
     .cout(c1[57]), .sum(s1[57]));
mul_csa32  sc1_56_ ( .c(a1s[40]), .b(pc[87]), .a(ps[88]),
     .cout(c1[56]), .sum(s1[56]));
mul_csa32  sc1_55_ ( .c(a1s[39]), .b(pc[86]), .a(ps[87]),
     .cout(c1[55]), .sum(s1[55]));
mul_csa32  sc1_54_ ( .c(a1s[38]), .b(pc[85]), .a(ps[86]),
     .cout(c1[54]), .sum(s1[54]));
mul_csa32  sc1_53_ ( .c(a1s[37]), .b(pc[84]), .a(ps[85]),
     .cout(c1[53]), .sum(s1[53]));
mul_csa32  sc1_52_ ( .c(a1s[36]), .b(pc[83]), .a(ps[84]),
     .cout(c1[52]), .sum(s1[52]));
mul_csa32  sc1_51_ ( .c(a1s[35]), .b(pc[82]), .a(ps[83]),
     .cout(c1[51]), .sum(s1[51]));
mul_csa32  sc1_50_ ( .c(a1s[34]), .b(pc[81]), .a(ps[82]),
     .cout(c1[50]), .sum(s1[50]));
mul_csa32  sc1_49_ ( .c(a1s[33]), .b(pc[80]), .a(ps[81]),
     .cout(c1[49]), .sum(s1[49]));
mul_csa32  sc1_48_ ( .c(a1s[32]), .b(pc[79]), .a(ps[80]),
     .cout(c1[48]), .sum(s1[48]));
mul_csa32  sc1_47_ ( .c(a1s[31]), .b(pc[78]), .a(ps[79]),
     .cout(c1[47]), .sum(s1[47]));
mul_csa32  sc1_46_ ( .c(a1s[30]), .b(pc[77]), .a(ps[78]),
     .cout(c1[46]), .sum(s1[46]));
mul_csa32  sc1_45_ ( .c(a1s[29]), .b(pc[76]), .a(ps[77]),
     .cout(c1[45]), .sum(s1[45]));
mul_csa32  sc1_44_ ( .c(a1s[28]), .b(pc[75]), .a(ps[76]),
     .cout(c1[44]), .sum(s1[44]));
mul_csa32  sc1_43_ ( .c(a1s[27]), .b(pc[74]), .a(ps[75]),
     .cout(c1[43]), .sum(s1[43]));
mul_csa32  sc1_42_ ( .c(a1s[26]), .b(pc[73]), .a(ps[74]),
     .cout(c1[42]), .sum(s1[42]));
mul_csa32  sc1_41_ ( .c(a1s[25]), .b(pc[72]), .a(ps[73]),
     .cout(c1[41]), .sum(s1[41]));
mul_csa32  sc1_40_ ( .c(a1s[24]), .b(pc[71]), .a(ps[72]),
     .cout(c1[40]), .sum(s1[40]));
mul_csa32  sc1_39_ ( .c(a1s[23]), .b(pc[70]), .a(ps[71]),
     .cout(c1[39]), .sum(s1[39]));
mul_csa32  sc1_38_ ( .c(a1s[22]), .b(pc[69]), .a(ps[70]),
     .cout(c1[38]), .sum(s1[38]));
mul_csa32  sc1_37_ ( .c(a1s[21]), .b(pc[68]), .a(ps[69]),
     .cout(c1[37]), .sum(s1[37]));
mul_csa32  sc1_36_ ( .c(a1s[20]), .b(pc[67]), .a(ps[68]),
     .cout(c1[36]), .sum(s1[36]));
mul_csa32  sc1_35_ ( .c(a1s[19]), .b(pc[66]), .a(ps[67]),
     .cout(c1[35]), .sum(s1[35]));
mul_csa32  sc1_34_ ( .c(a1s[18]), .b(pc[65]), .a(ps[66]),
     .cout(c1[34]), .sum(s1[34]));
mul_csa32  sc1_33_ ( .c(a1s[17]), .b(pc[64]), .a(ps[65]),
     .cout(c1[33]), .sum(s1[33]));
mul_csa32  sc1_32_ ( .c(a1s[16]), .b(pc[63]), .a(ps[64]),
     .cout(c1[32]), .sum(s1[32]));
mul_csa32  sc1_31_ ( .c(a1s[15]), .b(pc[62]), .a(ps[63]),
     .cout(c1[31]), .sum(s1[31]));
mul_csa32  sc1_30_ ( .c(a1s[14]), .b(pc[61]), .a(ps[62]),
     .cout(c1[30]), .sum(s1[30]));
mul_csa32  sc1_29_ ( .c(a1s[13]), .b(pc[60]), .a(ps[61]),
     .cout(c1[29]), .sum(s1[29]));
mul_csa32  sc1_28_ ( .c(a1s[12]), .b(pc[59]), .a(ps[60]),
     .cout(c1[28]), .sum(s1[28]));
mul_csa32  sc1_27_ ( .c(a1s[11]), .b(pc[58]), .a(ps[59]),
     .cout(c1[27]), .sum(s1[27]));
mul_csa32  sc1_26_ ( .c(a1s[10]), .b(pc[57]), .a(ps[58]),
     .cout(c1[26]), .sum(s1[26]));
mul_csa32  sc1_25_ ( .c(a1s[9]), .b(pc[56]), .a(ps[57]),
     .cout(c1[25]), .sum(s1[25]));
mul_csa32  sc1_24_ ( .c(a1s[8]), .b(pc[55]), .a(ps[56]),
     .cout(c1[24]), .sum(s1[24]));
mul_csa32  sc1_23_ ( .c(a1s[7]), .b(pc[54]), .a(ps[55]),
     .cout(c1[23]), .sum(s1[23]));
mul_csa32  sc1_22_ ( .c(a1s[6]), .b(pc[53]), .a(ps[54]),
     .cout(c1[22]), .sum(s1[22]));
mul_csa32  sc1_21_ ( .c(a1s[5]), .b(pc[52]), .a(ps[53]),
     .cout(c1[21]), .sum(s1[21]));
mul_csa32  sc1_20_ ( .c(a1s[4]), .b(pc[51]), .a(ps[52]),
     .cout(c1[20]), .sum(s1[20]));
mul_csa32  sc2_81_ ( .c(a0c[80]), .b(c1[80]), .a(s1[81]),
     .cout(c2[81]), .sum(s2[81]));
mul_csa32  sc2_80_ ( .c(a0c[79]), .b(c1[79]), .a(s1[80]),
     .cout(c2[80]), .sum(s2[80]));
mul_csa32  sc2_79_ ( .c(a0c[78]), .b(c1[78]), .a(s1[79]),
     .cout(c2[79]), .sum(s2[79]));
mul_csa32  sc2_78_ ( .c(a0c[77]), .b(c1[77]), .a(s1[78]),
     .cout(c2[78]), .sum(s2[78]));
mul_csa32  sc2_77_ ( .c(a0c[76]), .b(c1[76]), .a(s1[77]),
     .cout(c2[77]), .sum(s2[77]));
mul_csa32  sc2_76_ ( .c(a0c[75]), .b(c1[75]), .a(s1[76]),
     .cout(c2[76]), .sum(s2[76]));
mul_csa32  sc2_75_ ( .c(a0c[74]), .b(c1[74]), .a(s1[75]),
     .cout(c2[75]), .sum(s2[75]));
mul_csa32  sc2_74_ ( .c(a0c[73]), .b(c1[73]), .a(s1[74]),
     .cout(c2[74]), .sum(s2[74]));
mul_csa32  sc2_73_ ( .c(a0c[72]), .b(c1[72]), .a(s1[73]),
     .cout(c2[73]), .sum(s2[73]));
mul_csa32  sc2_72_ ( .c(a0c[71]), .b(c1[71]), .a(s1[72]),
     .cout(c2[72]), .sum(s2[72]));
mul_csa32  sc2_71_ ( .c(a0c[70]), .b(c1[70]), .a(s1[71]),
     .cout(c2[71]), .sum(s2[71]));
mul_csa32  sc2_70_ ( .c(a0c[69]), .b(c1[69]), .a(s1[70]),
     .cout(c2[70]), .sum(s2[70]));
mul_csa32  sc2_69_ ( .c(a0c[68]), .b(c1[68]), .a(s1[69]),
     .cout(c2[69]), .sum(s2[69]));
mul_csa32  sc2_68_ ( .c(a0c[67]), .b(c1[67]), .a(s1[68]),
     .cout(c2[68]), .sum(s2[68]));
mul_csa32  acc_19_ ( .c(c3[18]), .b(s3[19]), .a(ain[19]),
     .cout(pcout[19]), .sum(psum[19]));
mul_csa32  acc_18_ ( .c(c3[17]), .b(s3[18]), .a(ain[18]),
     .cout(pcout[18]), .sum(psum[18]));
mul_csa32  acc_17_ ( .c(c3[16]), .b(s3[17]), .a(ain[17]),
     .cout(pcout[17]), .sum(psum[17]));
mul_csa32  acc_16_ ( .c(c3[15]), .b(s3[16]), .a(ain[16]),
     .cout(pcout[16]), .sum(psum[16]));
mul_csa32  acc_15_ ( .c(1'b0), .b(s3[15]), .a(ain[15]),
     .cout(pcout[15]), .sum(psum[15]));
mul_csa32  sc1_0_ ( .c(a0s[0]), .sum(s1[0]), .cout(c1[0]),
     .a(ps[32]), .b(pc[31]));
mul_csa32  sc1_67_ ( .c(a1c[50]), .b(pc[98]), .a(a1s[51]),
     .cout(c1[67]), .sum(s1[67]));
mul_ha acc_0_ ( .sum(psum[0]), .cout(pcout[0]), .a(ain[0]),
     .b(s2[0]));
mul_ha sc3_98_ ( .sum(psum[98]), .cout(pcout[98]), .a(bot),
     .b(a1c[81]));
mul_ha sc2_96_ ( .b(a1c[79]), .a(a1s[80]), .cout(c2[96]),
     .sum(s2[96]));
mul_ha sc2_95_ ( .b(a1c[78]), .a(a1s[79]), .cout(c2[95]),
     .sum(s2[95]));
mul_ha sc2_94_ ( .b(a1c[77]), .a(a1s[78]), .cout(c2[94]),
     .sum(s2[94]));
mul_ha sc2_93_ ( .b(a1c[76]), .a(a1s[77]), .cout(c2[93]),
     .sum(s2[93]));
mul_ha sc2_92_ ( .b(a1c[75]), .a(a1s[76]), .cout(c2[92]),
     .sum(s2[92]));
mul_ha sc2_91_ ( .b(a1c[74]), .a(a1s[75]), .cout(c2[91]),
     .sum(s2[91]));
mul_ha sc2_90_ ( .b(a1c[73]), .a(a1s[74]), .cout(c2[90]),
     .sum(s2[90]));
mul_ha sc2_89_ ( .b(a1c[72]), .a(a1s[73]), .cout(c2[89]),
     .sum(s2[89]));
mul_ha sc2_88_ ( .b(a1c[71]), .a(a1s[72]), .cout(c2[88]),
     .sum(s2[88]));
mul_ha sc2_87_ ( .b(a1c[70]), .a(a1s[71]), .cout(c2[87]),
     .sum(s2[87]));
mul_ha sc2_86_ ( .b(a1c[69]), .a(a1s[70]), .cout(c2[86]),
     .sum(s2[86]));
mul_ha sc2_85_ ( .b(a1c[68]), .a(a1s[69]), .cout(c2[85]),
     .sum(s2[85]));
mul_ha sc2_84_ ( .b(a1c[67]), .a(a1s[68]), .cout(c2[84]),
     .sum(s2[84]));
mul_ha sc3_81_ ( .b(c2[80]), .a(s2[81]), .cout(c3[81]),
     .sum(s3[81]));
mul_ha sc3_80_ ( .b(c2[79]), .a(s2[80]), .cout(c3[80]),
     .sum(s3[80]));
mul_ha sc3_79_ ( .b(c2[78]), .a(s2[79]), .cout(c3[79]),
     .sum(s3[79]));
mul_ha sc3_78_ ( .b(c2[77]), .a(s2[78]), .cout(c3[78]),
     .sum(s3[78]));
mul_ha sc3_77_ ( .b(c2[76]), .a(s2[77]), .cout(c3[77]),
     .sum(s3[77]));
mul_ha sc3_76_ ( .b(c2[75]), .a(s2[76]), .cout(c3[76]),
     .sum(s3[76]));
mul_ha sc3_75_ ( .b(c2[74]), .a(s2[75]), .cout(c3[75]),
     .sum(s3[75]));
mul_ha sc3_74_ ( .b(c2[73]), .a(s2[74]), .cout(c3[74]),
     .sum(s3[74]));
mul_ha sc3_73_ ( .b(c2[72]), .a(s2[73]), .cout(c3[73]),
     .sum(s3[73]));
mul_ha sc3_72_ ( .b(c2[71]), .a(s2[72]), .cout(c3[72]),
     .sum(s3[72]));
mul_ha sc3_71_ ( .b(c2[70]), .a(s2[71]), .cout(c3[71]),
     .sum(s3[71]));
mul_ha sc3_70_ ( .b(c2[69]), .a(s2[70]), .cout(c3[70]),
     .sum(s3[70]));
mul_ha sc3_69_ ( .b(c2[68]), .a(s2[69]), .cout(c3[69]),
     .sum(s3[69]));
mul_ha accx2 ( .sum(psumx2), .cout(pcoutx2), .a(ainx2), .b(s1x2));
mul_ha sc2_4_ ( .sum(s2[4]), .cout(c2[4]), .a(s1[4]), .b(c1[3]));
mul_ha sc2_3_ ( .sum(s2[3]), .cout(c2[3]), .a(s1[3]), .b(c1[2]));
mul_ha sc2_2_ ( .sum(s2[2]), .cout(c2[2]), .a(s1[2]), .b(c1[1]));
mul_ha sc2_1_ ( .sum(s2[1]), .cout(c2[1]), .a(s1[1]), .b(c1[0]));
mul_ha sc2_0_ ( .sum(s2[0]), .cout(c2[0]), .a(s1[0]), .b(c1x2));
mul_ha sc1x2 ( .sum(s1x2), .cout(c1x2), .a(ps[31]), .b(pc[30]));

endmodule //mul_array2

module mul_csa32 (sum, cout, a, b, c);

output sum, cout;
input a, b, c;

wire x, y0, y1, y2;

assign x = a ^ b;
assign sum = c ^ x;

assign y0 = a & b ;
assign y1 = a & c ;
assign y2 = b & c ;

assign cout = y0 | y1 | y2 ;

endmodule //mul_csa32

module mul_csa42 (sum, carry, cout, a, b, c, d, cin);

output sum, carry, cout;
input a, b, c, d, cin;

wire x, y, z;

assign x = a ^ b;
assign y = c ^ d;
assign z = x ^ y;

assign sum = z ^ cin ;

assign carry = (b & ~z) | (cin & z);

assign cout = (d & ~y) | (a & y);

endmodule // mul_csa42

module mul_ha ( cout, sum, a, b );
output  cout, sum;
input  a, b;

assign sum = a ^ b;
assign cout = a & b ;

endmodule //mul_ha

module mul_negen ( n0, n1, b );
output  n0, n1;
input [2:0]  b;

assign n0 = b[2] & b[1] & ~b[0] ;
assign n1 = b[2] & b[1] & b[0] ;

endmodule //mul_negen

module mul_ppgen3lsb4 (cout, p0_l, p1_l, sum, a, b0, b1 );

output  p0_l, p1_l;
output [3:0]  sum;
output [3:1]  cout;
input [3:0]  a;
input [2:0]  b0;
input [2:0]  b1;

wire b0n, b0n_0, b0n_1, b1n_0, b1n_1;
wire p0_0, p0_1, p0_2, p0_3, p1_2, p1_3;
wire p0_l_0, p0_l_1, p0_l_2, p1_l_2;

assign b0n = b0n_1 | (b0n_0 & p0_0) ;
assign sum[0] = b0n_0 ^ p0_0 ;

mul_negen p0n ( .b(b0[2:0]), .n1(b0n_1), .n0(b0n_0));
mul_negen p1n ( .b(b1[2:0]), .n1(b1n_1), .n0(b1n_0));
mul_csa32  sc1_2_ ( .c(b1n_0), .sum(sum[2]), .cout(cout[2]),
     .a(p0_2), .b(p1_2));
mul_csa32  sc1_3_ ( .c(b1n_1), .sum(sum[3]), .cout(cout[3]),
     .a(p0_3), .b(p1_3));
mul_ha sc1_1_ ( .sum(sum[1]), .cout(cout[1]), .a(p0_1),
     .b(b0n));
mul_ppgen p0_3_ ( .pm1_l(p0_l_2), .p_l(p0_l), .b(b0[2:0]), .a(a[3]),
     .z(p0_3));
mul_ppgen p1_3_ ( .pm1_l(p1_l_2), .p_l(p1_l), .b(b1[2:0]), .a(a[1]),
     .z(p1_3));
mul_ppgen p0_2_ ( .pm1_l(p0_l_1), .p_l(p0_l_2), .b(b0[2:0]),
     .a(a[2]), .z(p0_2));
mul_ppgen p0_1_ ( .pm1_l(p0_l_0), .p_l(p0_l_1), .b(b0[2:0]),
     .a(a[1]), .z(p0_1));
mul_ppgen p0_0_ ( .pm1_l(1'b1), .p_l(p0_l_0),
     .b(b0[2:0]), .a(a[0]), .z(p0_0));
mul_ppgen p1_2_ ( .pm1_l(1'b1), .p_l(p1_l_2),
     .b(b1[2:0]), .a(a[0]), .z(p1_2));

endmodule // mul_ppgen3lsb4

module mul_ppgen3sign ( cout, sum, am1, am2, am3, am4, b0, b1, b2,
     bot, head, p0m1_l, p1m1_l, p2m1_l );
input  am1, am2, am3, am4;
input  bot, head, p0m1_l, p1m1_l, p2m1_l;
output [5:0]  sum;
output [4:0]  cout;
input [2:0]  b0;
input [2:0]  b2;
input [2:0]  b1;

wire net37, net42, net075, net088, net0117; 
wire net47, net073, net38, net0118, net078, net8, net15, net43, net48, net35;
wire p2_l_67, p2_l_66, p2_l_65, p2_l_64; 
wire p1_l_65, p1_l_64; 

assign sum[5] = bot & net075 ;
assign net0117 = head & net088 ; 
assign net37 = ~net0117 ;
assign net42 = head ^ net088 ;

mul_ppgensign p0_64_ ( .b(b0[2:0]), .z(net47), .p_l(net088),
     .pm1_l(p0m1_l));
mul_ppgensign p2_68_ ( .pm1_l(p2_l_67), .b(b2[2:0]), .z(net073),
     .p_l(net075));
mul_ppgensign p1_66_ ( .pm1_l(p1_l_65), .b(b1[2:0]), .z(net38),
     .p_l(net0118));
mul_ha sc1_68_ ( .b(net073), .a(1'b1), .cout(cout[4]),
     .sum(sum[4]));
mul_ppgen p2_67_ ( .pm1_l(p2_l_66), .b(b2[2:0]), .a(am1), .z(net078),
     .p_l(p2_l_67));
mul_ppgen p2_66_ ( .pm1_l(p2_l_65), .b(b2[2:0]), .a(am2), .z(net8),
     .p_l(p2_l_66));
mul_ppgen p2_65_ ( .pm1_l(p2_l_64), .p_l(p2_l_65), .b(b2[2:0]),
     .a(am3), .z(net15));
mul_ppgen p1_65_ ( .pm1_l(p1_l_64), .p_l(p1_l_65), .b(b1[2:0]),
     .a(am1), .z(net43));
mul_ppgen p1_64_ ( .pm1_l(p1m1_l), .p_l(p1_l_64), .b(b1[2:0]),
     .a(am2), .z(net48));
mul_ppgen p2_64_ ( .pm1_l(p2m1_l), .p_l(p2_l_64), .b(b2[2:0]),
     .a(am4), .z(net35));
mul_csa32  sc1_67_ ( .c(net078), .b(net0117), .a(net0118),
     .cout(cout[3]), .sum(sum[3]));
mul_csa32  sc1_66_ ( .c(net8), .b(net37), .a(net38), .cout(cout[2]),
     .sum(sum[2]));
mul_csa32  sc1_65_ ( .c(net15), .b(net42), .a(net43), .cout(cout[1]),
     .sum(sum[1]));
mul_csa32  sc1_64_ ( .c(net35), .b(net47), .a(net48), .cout(cout[0]),
     .sum(sum[0]));

endmodule //mul_ppgen3sign

module mul_ppgen3 ( cout, p0_l, p1_l, p2_l, sum, am2, am4,
     a, b0, b1, b2, p0m1_l, p1m1_l, p2m1_l );
output  cout, p0_l, p1_l, p2_l, sum;
input  am2, am4;
input  a, p0m1_l, p1m1_l, p2m1_l;
input [2:0]  b0;
input [2:0]  b2;
input [2:0]  b1;

wire net046, net32, net043;

mul_csa32  sc1 ( .a(net046), .b(net32), .cout(cout), .sum(sum),
     .c(net043));
mul_ppgen p2 ( .pm1_l(p2m1_l), .p_l(p2_l), .b(b2[2:0]), .a(am4),
     .z(net043));
mul_ppgen p1 ( .pm1_l(p1m1_l), .p_l(p1_l), .b(b1[2:0]), .a(am2),
     .z(net046));
mul_ppgen p0 ( .pm1_l(p0m1_l), .p_l(p0_l), .b(b0[2:0]), .a(a),
     .z(net32));

endmodule // mul_ppgen3

module mul_ppgenrow3 ( cout, sum, a, b0, b1, b2, bot, head );

output [68:1]  cout;
output [69:0]  sum;
input [63:0]  a;
input [2:0]  b2;
input [2:0]  b0;
input [2:0]  b1;
input  bot, head;

// Buses in the design
wire  [63:4]  p2_l;
wire  [63:3]  p1_l;
wire  [63:3]  p0_l;

mul_ppgen3sign I2 ( .am4(a[60]), .am3(a[61]), .am2(a[62]),
     .am1(a[63]), .p2m1_l(p2_l[63]), .p1m1_l(p1_l[63]),
     .p0m1_l(p0_l[63]), .b2(b2[2:0]), .head(head), .bot(bot),
     .sum(sum[69:64]), .cout(cout[68:64]), .b1(b1[2:0]), .b0(b0[2:0]));
mul_ppgen3 I1_63_ ( .p2_l(p2_l[63]), .b2(b2[2:0]),
     .am2(a[61]), .a(a[63]), .p2m1_l(p2_l[62]),
     .p1m1_l(p1_l[62]), .p0m1_l(p0_l[62]), .am4(a[59]), .sum(sum[63]),
     .cout(cout[63]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[63]),
     .p0_l(p0_l[63]));
mul_ppgen3 I1_62_ ( .p2_l(p2_l[62]), .b2(b2[2:0]), 
     .am2(a[60]), .a(a[62]), .p2m1_l(p2_l[61]),
     .p1m1_l(p1_l[61]), .p0m1_l(p0_l[61]), .am4(a[58]), .sum(sum[62]),
     .cout(cout[62]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[62]),
     .p0_l(p0_l[62]));
mul_ppgen3 I1_61_ ( .p2_l(p2_l[61]), .b2(b2[2:0]), 
     .am2(a[59]), .a(a[61]), .p2m1_l(p2_l[60]),
     .p1m1_l(p1_l[60]), .p0m1_l(p0_l[60]), .am4(a[57]), .sum(sum[61]),
     .cout(cout[61]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[61]),
     .p0_l(p0_l[61]));
mul_ppgen3 I1_60_ ( .p2_l(p2_l[60]), .b2(b2[2:0]), 
     .am2(a[58]), .a(a[60]), .p2m1_l(p2_l[59]),
     .p1m1_l(p1_l[59]), .p0m1_l(p0_l[59]), .am4(a[56]), .sum(sum[60]),
     .cout(cout[60]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[60]),
     .p0_l(p0_l[60]));
mul_ppgen3 I1_59_ ( .p2_l(p2_l[59]), .b2(b2[2:0]), 
     .am2(a[57]), .a(a[59]), .p2m1_l(p2_l[58]),
     .p1m1_l(p1_l[58]), .p0m1_l(p0_l[58]), .am4(a[55]), .sum(sum[59]),
     .cout(cout[59]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[59]),
     .p0_l(p0_l[59]));
mul_ppgen3 I1_58_ ( .p2_l(p2_l[58]), .b2(b2[2:0]), 
     .am2(a[56]), .a(a[58]), .p2m1_l(p2_l[57]),
     .p1m1_l(p1_l[57]), .p0m1_l(p0_l[57]), .am4(a[54]), .sum(sum[58]),
     .cout(cout[58]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[58]),
     .p0_l(p0_l[58]));
mul_ppgen3 I1_57_ ( .p2_l(p2_l[57]), .b2(b2[2:0]), 
     .am2(a[55]), .a(a[57]), .p2m1_l(p2_l[56]),
     .p1m1_l(p1_l[56]), .p0m1_l(p0_l[56]), .am4(a[53]), .sum(sum[57]),
     .cout(cout[57]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[57]),
     .p0_l(p0_l[57]));
mul_ppgen3 I1_56_ ( .p2_l(p2_l[56]), .b2(b2[2:0]), 
     .am2(a[54]), .a(a[56]), .p2m1_l(p2_l[55]),
     .p1m1_l(p1_l[55]), .p0m1_l(p0_l[55]), .am4(a[52]), .sum(sum[56]),
     .cout(cout[56]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[56]),
     .p0_l(p0_l[56]));
mul_ppgen3 I1_55_ ( .p2_l(p2_l[55]), .b2(b2[2:0]), 
     .am2(a[53]), .a(a[55]), .p2m1_l(p2_l[54]),
     .p1m1_l(p1_l[54]), .p0m1_l(p0_l[54]), .am4(a[51]), .sum(sum[55]),
     .cout(cout[55]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[55]),
     .p0_l(p0_l[55]));
mul_ppgen3 I1_54_ ( .p2_l(p2_l[54]), .b2(b2[2:0]), 
     .am2(a[52]), .a(a[54]), .p2m1_l(p2_l[53]),
     .p1m1_l(p1_l[53]), .p0m1_l(p0_l[53]), .am4(a[50]), .sum(sum[54]),
     .cout(cout[54]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[54]),
     .p0_l(p0_l[54]));
mul_ppgen3 I1_53_ ( .p2_l(p2_l[53]), .b2(b2[2:0]), 
     .am2(a[51]), .a(a[53]), .p2m1_l(p2_l[52]),
     .p1m1_l(p1_l[52]), .p0m1_l(p0_l[52]), .am4(a[49]), .sum(sum[53]),
     .cout(cout[53]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[53]),
     .p0_l(p0_l[53]));
mul_ppgen3 I1_52_ ( .p2_l(p2_l[52]), .b2(b2[2:0]), 
     .am2(a[50]), .a(a[52]), .p2m1_l(p2_l[51]),
     .p1m1_l(p1_l[51]), .p0m1_l(p0_l[51]), .am4(a[48]), .sum(sum[52]),
     .cout(cout[52]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[52]),
     .p0_l(p0_l[52]));
mul_ppgen3 I1_51_ ( .p2_l(p2_l[51]), .b2(b2[2:0]), 
     .am2(a[49]), .a(a[51]), .p2m1_l(p2_l[50]),
     .p1m1_l(p1_l[50]), .p0m1_l(p0_l[50]), .am4(a[47]), .sum(sum[51]),
     .cout(cout[51]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[51]),
     .p0_l(p0_l[51]));
mul_ppgen3 I1_50_ ( .p2_l(p2_l[50]), .b2(b2[2:0]), 
     .am2(a[48]), .a(a[50]), .p2m1_l(p2_l[49]),
     .p1m1_l(p1_l[49]), .p0m1_l(p0_l[49]), .am4(a[46]), .sum(sum[50]),
     .cout(cout[50]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[50]),
     .p0_l(p0_l[50]));
mul_ppgen3 I1_49_ ( .p2_l(p2_l[49]), .b2(b2[2:0]), 
     .am2(a[47]), .a(a[49]), .p2m1_l(p2_l[48]),
     .p1m1_l(p1_l[48]), .p0m1_l(p0_l[48]), .am4(a[45]), .sum(sum[49]),
     .cout(cout[49]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[49]),
     .p0_l(p0_l[49]));
mul_ppgen3 I1_48_ ( .p2_l(p2_l[48]), .b2(b2[2:0]), 
     .am2(a[46]), .a(a[48]), .p2m1_l(p2_l[47]),
     .p1m1_l(p1_l[47]), .p0m1_l(p0_l[47]), .am4(a[44]), .sum(sum[48]),
     .cout(cout[48]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[48]),
     .p0_l(p0_l[48]));
mul_ppgen3 I1_47_ ( .p2_l(p2_l[47]), .b2(b2[2:0]), 
     .am2(a[45]), .a(a[47]), .p2m1_l(p2_l[46]),
     .p1m1_l(p1_l[46]), .p0m1_l(p0_l[46]), .am4(a[43]), .sum(sum[47]),
     .cout(cout[47]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[47]),
     .p0_l(p0_l[47]));
mul_ppgen3 I1_46_ ( .p2_l(p2_l[46]), .b2(b2[2:0]), 
     .am2(a[44]), .a(a[46]), .p2m1_l(p2_l[45]),
     .p1m1_l(p1_l[45]), .p0m1_l(p0_l[45]), .am4(a[42]), .sum(sum[46]),
     .cout(cout[46]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[46]),
     .p0_l(p0_l[46]));
mul_ppgen3 I1_45_ ( .p2_l(p2_l[45]), .b2(b2[2:0]), 
     .am2(a[43]), .a(a[45]), .p2m1_l(p2_l[44]),
     .p1m1_l(p1_l[44]), .p0m1_l(p0_l[44]), .am4(a[41]), .sum(sum[45]),
     .cout(cout[45]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[45]),
     .p0_l(p0_l[45]));
mul_ppgen3 I1_44_ ( .p2_l(p2_l[44]), .b2(b2[2:0]), 
     .am2(a[42]), .a(a[44]), .p2m1_l(p2_l[43]),
     .p1m1_l(p1_l[43]), .p0m1_l(p0_l[43]), .am4(a[40]), .sum(sum[44]),
     .cout(cout[44]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[44]),
     .p0_l(p0_l[44]));
mul_ppgen3 I1_43_ ( .p2_l(p2_l[43]), .b2(b2[2:0]), 
     .am2(a[41]), .a(a[43]), .p2m1_l(p2_l[42]),
     .p1m1_l(p1_l[42]), .p0m1_l(p0_l[42]), .am4(a[39]), .sum(sum[43]),
     .cout(cout[43]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[43]),
     .p0_l(p0_l[43]));
mul_ppgen3 I1_42_ ( .p2_l(p2_l[42]), .b2(b2[2:0]), 
     .am2(a[40]), .a(a[42]), .p2m1_l(p2_l[41]),
     .p1m1_l(p1_l[41]), .p0m1_l(p0_l[41]), .am4(a[38]), .sum(sum[42]),
     .cout(cout[42]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[42]),
     .p0_l(p0_l[42]));
mul_ppgen3 I1_41_ ( .p2_l(p2_l[41]), .b2(b2[2:0]), 
     .am2(a[39]), .a(a[41]), .p2m1_l(p2_l[40]),
     .p1m1_l(p1_l[40]), .p0m1_l(p0_l[40]), .am4(a[37]), .sum(sum[41]),
     .cout(cout[41]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[41]),
     .p0_l(p0_l[41]));
mul_ppgen3 I1_40_ ( .p2_l(p2_l[40]), .b2(b2[2:0]), 
     .am2(a[38]), .a(a[40]), .p2m1_l(p2_l[39]),
     .p1m1_l(p1_l[39]), .p0m1_l(p0_l[39]), .am4(a[36]), .sum(sum[40]),
     .cout(cout[40]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[40]),
     .p0_l(p0_l[40]));
mul_ppgen3 I1_39_ ( .p2_l(p2_l[39]), .b2(b2[2:0]), 
     .am2(a[37]), .a(a[39]), .p2m1_l(p2_l[38]),
     .p1m1_l(p1_l[38]), .p0m1_l(p0_l[38]), .am4(a[35]), .sum(sum[39]),
     .cout(cout[39]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[39]),
     .p0_l(p0_l[39]));
mul_ppgen3 I1_38_ ( .p2_l(p2_l[38]), .b2(b2[2:0]), 
     .am2(a[36]), .a(a[38]), .p2m1_l(p2_l[37]),
     .p1m1_l(p1_l[37]), .p0m1_l(p0_l[37]), .am4(a[34]), .sum(sum[38]),
     .cout(cout[38]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[38]),
     .p0_l(p0_l[38]));
mul_ppgen3 I1_37_ ( .p2_l(p2_l[37]), .b2(b2[2:0]), 
     .am2(a[35]), .a(a[37]), .p2m1_l(p2_l[36]),
     .p1m1_l(p1_l[36]), .p0m1_l(p0_l[36]), .am4(a[33]), .sum(sum[37]),
     .cout(cout[37]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[37]),
     .p0_l(p0_l[37]));
mul_ppgen3 I1_36_ ( .p2_l(p2_l[36]), .b2(b2[2:0]), 
     .am2(a[34]), .a(a[36]), .p2m1_l(p2_l[35]),
     .p1m1_l(p1_l[35]), .p0m1_l(p0_l[35]), .am4(a[32]), .sum(sum[36]),
     .cout(cout[36]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[36]),
     .p0_l(p0_l[36]));
mul_ppgen3 I1_35_ ( .p2_l(p2_l[35]), .b2(b2[2:0]), 
     .am2(a[33]), .a(a[35]), .p2m1_l(p2_l[34]),
     .p1m1_l(p1_l[34]), .p0m1_l(p0_l[34]), .am4(a[31]), .sum(sum[35]),
     .cout(cout[35]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[35]),
     .p0_l(p0_l[35]));
mul_ppgen3 I1_34_ ( .p2_l(p2_l[34]), .b2(b2[2:0]), 
     .am2(a[32]), .a(a[34]), .p2m1_l(p2_l[33]),
     .p1m1_l(p1_l[33]), .p0m1_l(p0_l[33]), .am4(a[30]), .sum(sum[34]),
     .cout(cout[34]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[34]),
     .p0_l(p0_l[34]));
mul_ppgen3 I1_33_ ( .p2_l(p2_l[33]), .b2(b2[2:0]), 
     .am2(a[31]), .a(a[33]), .p2m1_l(p2_l[32]),
     .p1m1_l(p1_l[32]), .p0m1_l(p0_l[32]), .am4(a[29]), .sum(sum[33]),
     .cout(cout[33]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[33]),
     .p0_l(p0_l[33]));
mul_ppgen3 I1_32_ ( .p2_l(p2_l[32]), .b2(b2[2:0]), 
     .am2(a[30]), .a(a[32]), .p2m1_l(p2_l[31]),
     .p1m1_l(p1_l[31]), .p0m1_l(p0_l[31]), .am4(a[28]), .sum(sum[32]),
     .cout(cout[32]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[32]),
     .p0_l(p0_l[32]));
mul_ppgen3 I1_31_ ( .p2_l(p2_l[31]), .b2(b2[2:0]), 
     .am2(a[29]), .a(a[31]), .p2m1_l(p2_l[30]),
     .p1m1_l(p1_l[30]), .p0m1_l(p0_l[30]), .am4(a[27]), .sum(sum[31]),
     .cout(cout[31]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[31]),
     .p0_l(p0_l[31]));
mul_ppgen3 I1_30_ ( .p2_l(p2_l[30]), .b2(b2[2:0]), 
     .am2(a[28]), .a(a[30]), .p2m1_l(p2_l[29]),
     .p1m1_l(p1_l[29]), .p0m1_l(p0_l[29]), .am4(a[26]), .sum(sum[30]),
     .cout(cout[30]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[30]),
     .p0_l(p0_l[30]));
mul_ppgen3 I1_29_ ( .p2_l(p2_l[29]), .b2(b2[2:0]), 
     .am2(a[27]), .a(a[29]), .p2m1_l(p2_l[28]),
     .p1m1_l(p1_l[28]), .p0m1_l(p0_l[28]), .am4(a[25]), .sum(sum[29]),
     .cout(cout[29]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[29]),
     .p0_l(p0_l[29]));
mul_ppgen3 I1_28_ ( .p2_l(p2_l[28]), .b2(b2[2:0]), 
     .am2(a[26]), .a(a[28]), .p2m1_l(p2_l[27]),
     .p1m1_l(p1_l[27]), .p0m1_l(p0_l[27]), .am4(a[24]), .sum(sum[28]),
     .cout(cout[28]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[28]),
     .p0_l(p0_l[28]));
mul_ppgen3 I1_27_ ( .p2_l(p2_l[27]), .b2(b2[2:0]), 
     .am2(a[25]), .a(a[27]), .p2m1_l(p2_l[26]),
     .p1m1_l(p1_l[26]), .p0m1_l(p0_l[26]), .am4(a[23]), .sum(sum[27]),
     .cout(cout[27]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[27]),
     .p0_l(p0_l[27]));
mul_ppgen3 I1_26_ ( .p2_l(p2_l[26]), .b2(b2[2:0]), 
     .am2(a[24]), .a(a[26]), .p2m1_l(p2_l[25]),
     .p1m1_l(p1_l[25]), .p0m1_l(p0_l[25]), .am4(a[22]), .sum(sum[26]),
     .cout(cout[26]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[26]),
     .p0_l(p0_l[26]));
mul_ppgen3 I1_25_ ( .p2_l(p2_l[25]), .b2(b2[2:0]), 
     .am2(a[23]), .a(a[25]), .p2m1_l(p2_l[24]),
     .p1m1_l(p1_l[24]), .p0m1_l(p0_l[24]), .am4(a[21]), .sum(sum[25]),
     .cout(cout[25]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[25]),
     .p0_l(p0_l[25]));
mul_ppgen3 I1_24_ ( .p2_l(p2_l[24]), .b2(b2[2:0]), 
     .am2(a[22]), .a(a[24]), .p2m1_l(p2_l[23]),
     .p1m1_l(p1_l[23]), .p0m1_l(p0_l[23]), .am4(a[20]), .sum(sum[24]),
     .cout(cout[24]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[24]),
     .p0_l(p0_l[24]));
mul_ppgen3 I1_23_ ( .p2_l(p2_l[23]), .b2(b2[2:0]), 
     .am2(a[21]), .a(a[23]), .p2m1_l(p2_l[22]),
     .p1m1_l(p1_l[22]), .p0m1_l(p0_l[22]), .am4(a[19]), .sum(sum[23]),
     .cout(cout[23]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[23]),
     .p0_l(p0_l[23]));
mul_ppgen3 I1_22_ ( .p2_l(p2_l[22]), .b2(b2[2:0]), 
     .am2(a[20]), .a(a[22]), .p2m1_l(p2_l[21]),
     .p1m1_l(p1_l[21]), .p0m1_l(p0_l[21]), .am4(a[18]), .sum(sum[22]),
     .cout(cout[22]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[22]),
     .p0_l(p0_l[22]));
mul_ppgen3 I1_21_ ( .p2_l(p2_l[21]), .b2(b2[2:0]), 
     .am2(a[19]), .a(a[21]), .p2m1_l(p2_l[20]),
     .p1m1_l(p1_l[20]), .p0m1_l(p0_l[20]), .am4(a[17]), .sum(sum[21]),
     .cout(cout[21]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[21]),
     .p0_l(p0_l[21]));
mul_ppgen3 I1_20_ ( .p2_l(p2_l[20]), .b2(b2[2:0]), 
     .am2(a[18]), .a(a[20]), .p2m1_l(p2_l[19]),
     .p1m1_l(p1_l[19]), .p0m1_l(p0_l[19]), .am4(a[16]), .sum(sum[20]),
     .cout(cout[20]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[20]),
     .p0_l(p0_l[20]));
mul_ppgen3 I1_19_ ( .p2_l(p2_l[19]), .b2(b2[2:0]), 
     .am2(a[17]), .a(a[19]), .p2m1_l(p2_l[18]),
     .p1m1_l(p1_l[18]), .p0m1_l(p0_l[18]), .am4(a[15]), .sum(sum[19]),
     .cout(cout[19]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[19]),
     .p0_l(p0_l[19]));
mul_ppgen3 I1_18_ ( .p2_l(p2_l[18]), .b2(b2[2:0]), 
     .am2(a[16]), .a(a[18]), .p2m1_l(p2_l[17]),
     .p1m1_l(p1_l[17]), .p0m1_l(p0_l[17]), .am4(a[14]), .sum(sum[18]),
     .cout(cout[18]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[18]),
     .p0_l(p0_l[18]));
mul_ppgen3 I1_17_ ( .p2_l(p2_l[17]), .b2(b2[2:0]), 
     .am2(a[15]), .a(a[17]), .p2m1_l(p2_l[16]),
     .p1m1_l(p1_l[16]), .p0m1_l(p0_l[16]), .am4(a[13]), .sum(sum[17]),
     .cout(cout[17]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[17]),
     .p0_l(p0_l[17]));
mul_ppgen3 I1_16_ ( .p2_l(p2_l[16]), .b2(b2[2:0]), 
     .am2(a[14]), .a(a[16]), .p2m1_l(p2_l[15]),
     .p1m1_l(p1_l[15]), .p0m1_l(p0_l[15]), .am4(a[12]), .sum(sum[16]),
     .cout(cout[16]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[16]),
     .p0_l(p0_l[16]));
mul_ppgen3 I1_15_ ( .p2_l(p2_l[15]), .b2(b2[2:0]), 
     .am2(a[13]), .a(a[15]), .p2m1_l(p2_l[14]),
     .p1m1_l(p1_l[14]), .p0m1_l(p0_l[14]), .am4(a[11]), .sum(sum[15]),
     .cout(cout[15]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[15]),
     .p0_l(p0_l[15]));
mul_ppgen3 I1_14_ ( .p2_l(p2_l[14]), .b2(b2[2:0]), 
     .am2(a[12]), .a(a[14]), .p2m1_l(p2_l[13]),
     .p1m1_l(p1_l[13]), .p0m1_l(p0_l[13]), .am4(a[10]), .sum(sum[14]),
     .cout(cout[14]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[14]),
     .p0_l(p0_l[14]));
mul_ppgen3 I1_13_ ( .p2_l(p2_l[13]), .b2(b2[2:0]), 
     .am2(a[11]), .a(a[13]), .p2m1_l(p2_l[12]),
     .p1m1_l(p1_l[12]), .p0m1_l(p0_l[12]), .am4(a[9]), .sum(sum[13]),
     .cout(cout[13]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[13]),
     .p0_l(p0_l[13]));
mul_ppgen3 I1_12_ ( .p2_l(p2_l[12]), .b2(b2[2:0]), 
     .am2(a[10]), .a(a[12]), .p2m1_l(p2_l[11]),
     .p1m1_l(p1_l[11]), .p0m1_l(p0_l[11]), .am4(a[8]), .sum(sum[12]),
     .cout(cout[12]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[12]),
     .p0_l(p0_l[12]));
mul_ppgen3 I1_11_ ( .p2_l(p2_l[11]), .b2(b2[2:0]), 
     .am2(a[9]), .a(a[11]), .p2m1_l(p2_l[10]),
     .p1m1_l(p1_l[10]), .p0m1_l(p0_l[10]), .am4(a[7]), .sum(sum[11]),
     .cout(cout[11]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[11]),
     .p0_l(p0_l[11]));
mul_ppgen3 I1_10_ ( .p2_l(p2_l[10]), .b2(b2[2:0]), 
     .am2(a[8]), .a(a[10]), .p2m1_l(p2_l[9]),
     .p1m1_l(p1_l[9]), .p0m1_l(p0_l[9]), .am4(a[6]), .sum(sum[10]),
     .cout(cout[10]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[10]),
     .p0_l(p0_l[10]));
mul_ppgen3 I1_9_ ( .p2_l(p2_l[9]), .b2(b2[2:0]), 
     .am2(a[7]), .a(a[9]), .p2m1_l(p2_l[8]),
     .p1m1_l(p1_l[8]), .p0m1_l(p0_l[8]), .am4(a[5]), .sum(sum[9]),
     .cout(cout[9]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[9]),
     .p0_l(p0_l[9]));
mul_ppgen3 I1_8_ ( .p2_l(p2_l[8]), .b2(b2[2:0]), 
     .am2(a[6]), .a(a[8]), .p2m1_l(p2_l[7]),
     .p1m1_l(p1_l[7]), .p0m1_l(p0_l[7]), .am4(a[4]), .sum(sum[8]),
     .cout(cout[8]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[8]),
     .p0_l(p0_l[8]));
mul_ppgen3 I1_7_ ( .p2_l(p2_l[7]), .b2(b2[2:0]), 
     .am2(a[5]), .a(a[7]), .p2m1_l(p2_l[6]),
     .p1m1_l(p1_l[6]), .p0m1_l(p0_l[6]), .am4(a[3]), .sum(sum[7]),
     .cout(cout[7]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[7]),
     .p0_l(p0_l[7]));
mul_ppgen3 I1_6_ ( .p2_l(p2_l[6]), .b2(b2[2:0]), 
     .am2(a[4]), .a(a[6]), .p2m1_l(p2_l[5]),
     .p1m1_l(p1_l[5]), .p0m1_l(p0_l[5]), .am4(a[2]), .sum(sum[6]),
     .cout(cout[6]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[6]),
     .p0_l(p0_l[6]));
mul_ppgen3 I1_5_ ( .p2_l(p2_l[5]), .b2(b2[2:0]), 
     .am2(a[3]), .a(a[5]), .p2m1_l(p2_l[4]),
     .p1m1_l(p1_l[4]), .p0m1_l(p0_l[4]), .am4(a[1]), .sum(sum[5]),
     .cout(cout[5]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[5]),
     .p0_l(p0_l[5]));
mul_ppgen3 I1_4_ ( .p2_l(p2_l[4]), .b2(b2[2:0]), 
     .am2(a[2]), .a(a[4]), .p2m1_l(1'b1),
     .p1m1_l(p1_l[3]), .p0m1_l(p0_l[3]), .am4(a[0]), .sum(sum[4]),
     .cout(cout[4]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[4]),
     .p0_l(p0_l[4]));
mul_ppgen3lsb4 I0 ( .cout(cout[3:1]), .a(a[3:0]), .sum(sum[3:0]),
     .p1_l(p1_l[3]), .p0_l(p0_l[3]), .b1(b1[2:0]), .b0(b0[2:0]));

endmodule //mul_ppgenrow3

module mul_ppgensign ( p_l, z, b, pm1_l );
output  p_l, z;
input  pm1_l;
input [2:0]  b;

assign p_l = ~(b[1] & b[2]);
assign z = b[0] ? ~pm1_l : ~p_l ;

endmodule //mul_ppgensign

module mul_ppgen ( p_l, z, a, b, pm1_l );
output  p_l, z;
input  a, pm1_l;
input [2:0]  b;

assign p_l = ~((a ^ b[2]) & b[1]) ;
assign z = b[0] ? ~pm1_l : ~p_l ;

endmodule //mul_ppgen

module mul_mux2 ( z, d0, d1, s );
output  z;
input  d0, d1, s;

assign z = s ? d1 : d0 ;

endmodule // mul_mux2 

module mul_booth(
	head,
        b_in,
        b0, b1, b2, b3, b4, b5, b6, b7,
	b8, b9, b10, b11, b12, b13, b14, b15, b16,
	clk, se, si, so, mul_step, tm_l
	);
input		head;		// begin of the MUL operation
input   [63:0] 	b_in;
input		clk, se, si, mul_step, tm_l;
output  [2:0]  	b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15;
output 		b16;
output 		so;

wire  [63:31] 	b;
wire [2:0] 	b0_in0, b1_in0,  b2_in0,  b3_in0,  b4_in0,  b5_in0,  b6_in0,  b7_in0 ;
wire [2:0] 	b8_in0, b9_in0, b10_in0, b11_in0, b12_in0, b13_in0, b14_in0, b15_in0 ;
wire [2:0] 	b0_in1, b1_in1,  b2_in1,  b3_in1,  b4_in1,  b5_in1,  b6_in1,  b7_in1 ;
wire [2:0] 	b8_in1, b9_in1, b10_in1, b11_in1, b12_in1, b13_in1, b14_in1, b15_in1 ;
wire 	   	b16_in1;

wire [2:0] 	b0_outmx, b1_outmx, b2_outmx, b3_outmx, b4_outmx, b5_outmx, b6_outmx;
wire [2:0] 	b7_outmx, b8_outmx, b9_outmx, b10_outmx, b11_outmx, b12_outmx, b13_outmx;
wire [2:0] 	b14_outmx, b15_outmx;
wire 	   	b16_outmx;
wire		clk_enb0, clk_enb1;


  mul_bodec 		encode0_a(
				.x  (1'b0),
				.b  (b_in[15:0]),
				.b0 (b0_in0),
				.b1 (b1_in0),
				.b2 (b2_in0),
				.b3 (b3_in0),
				.b4 (b4_in0),
				.b5 (b5_in0),
				.b6 (b6_in0),
				.b7 (b7_in0)
				);
				//remove 16th row since it's never the last row
				//b8_in0 = 3'b010; 
  mul_bodec		encode0_b(
				.x  (b_in[15]),
				.b  (b_in[31:16]),
				.b0 (b8_in0),
				.b1 (b9_in0),
				.b2 (b10_in0),
				.b3 (b11_in0),
				.b4 (b12_in0),
				.b5 (b13_in0),
				.b6 (b14_in0),
				.b7 (b15_in0)
				);
				// remove 32th row since it's never the last row 
				// b16_in0 = 3'b010 ;

  // Pipe picked address [63:31] and hold flop

  clken_buf     ckbuf_0(.clk(clk_enb0), .rclk(clk), .enb_l(~mul_step), .tmb_l(tm_l));
  clken_buf     ckbuf_1(.clk(clk_enb1), .rclk(clk), .enb_l(~(head & mul_step)), .tmb_l(tm_l));

  dff_s 			hld_dff0(.din(b_in[31]), .clk(clk_enb1), .q(b[31]),
                        	.se(se), .si(), .so());
  dff_s #(32) 		hld_dff(.din(b_in[63:32]), .clk(clk_enb1), .q(b[63:32]),
				.se(se), .si(), .so());

  mul_bodec     	encode1_a(
                        	.x  (b[31]),
                        	.b  (b[47:32]),
                        	.b0 (b0_in1),
                        	.b1 (b1_in1),
                        	.b2 (b2_in1),
                        	.b3 (b3_in1),
                        	.b4 (b4_in1),
                        	.b5 (b5_in1),
                        	.b6 (b6_in1),
                        	.b7 (b7_in1)
                        	);
                        	//remove 16th row since it's never the last row
                        	//b8_in1 = 3'b010;
  mul_bodec     	encode1_b(
                        	.x  (b[47]),
                        	.b  (b[63:48]),
                        	.b0 (b8_in1),
                        	.b1 (b9_in1),
                        	.b2 (b10_in1),
                        	.b3 (b11_in1),
                        	.b4 (b12_in1),
                        	.b5 (b13_in1),
                        	.b6 (b14_in1),
                        	.b7 (b15_in1)
                        	);
				assign b16_in1 = b[63] ;

// Select booth encoded b outputs and flop based on the cycle0 and cycle1 

  dp_mux2es #(3)    out_mux0(.dout(b0_outmx[2:0]),
                        .in0(b0_in0[2:0]),
                        .in1(b0_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux1(.dout(b1_outmx[2:0]),
                        .in0(b1_in0[2:0]),
                        .in1(b1_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux2(.dout(b2_outmx[2:0]),
                        .in0(b2_in0[2:0]),
                        .in1(b2_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux3(.dout(b3_outmx[2:0]),
                        .in0(b3_in0[2:0]),
                        .in1(b3_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux4(.dout(b4_outmx[2:0]),
                        .in0(b4_in0[2:0]),
                        .in1(b4_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux5(.dout(b5_outmx[2:0]),
                        .in0(b5_in0[2:0]),
                        .in1(b5_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux6(.dout(b6_outmx[2:0]),
                        .in0(b6_in0[2:0]),
                        .in1(b6_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux7(.dout(b7_outmx[2:0]),
                        .in0(b7_in0[2:0]),
                        .in1(b7_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux8(.dout(b8_outmx[2:0]),
                        .in0(b8_in0[2:0]),
                        .in1(b8_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux9(.dout(b9_outmx[2:0]),
                        .in0(b9_in0[2:0]),
                        .in1(b9_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux10(.dout(b10_outmx[2:0]),
                        .in0(b10_in0[2:0]),
                        .in1(b10_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux11(.dout(b11_outmx[2:0]),
                        .in0(b11_in0[2:0]),
                        .in1(b11_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux12(.dout(b12_outmx[2:0]),
                        .in0(b12_in0[2:0]),
                        .in1(b12_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux13(.dout(b13_outmx[2:0]),
                        .in0(b13_in0[2:0]),
                        .in1(b13_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux14(.dout(b14_outmx[2:0]),
                        .in0(b14_in0[2:0]),
                        .in1(b14_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux15(.dout(b15_outmx[2:0]),
                        .in0(b15_in0[2:0]),
                        .in1(b15_in1[2:0]),
                        .sel(~head));
  dp_mux2es         out_mux16(.dout(b16_outmx),
                        .in0(1'b0),
                        .in1(b16_in1),
                        .sel(~head));

  dff_s #(3)    out_dff0 (.din(b0_outmx[2:0]), .clk(clk_enb0), .q(b0[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff1 (.din(b1_outmx[2:0]), .clk(clk_enb0), .q(b1[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff2 (.din(b2_outmx[2:0]), .clk(clk_enb0), .q(b2[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff3 (.din(b3_outmx[2:0]), .clk(clk_enb0), .q(b3[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff4 (.din(b4_outmx[2:0]), .clk(clk_enb0), .q(b4[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff5 (.din(b5_outmx[2:0]), .clk(clk_enb0), .q(b5[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff6 (.din(b6_outmx[2:0]), .clk(clk_enb0), .q(b6[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff7 (.din(b7_outmx[2:0]), .clk(clk_enb0), .q(b7[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff8 (.din(b8_outmx[2:0]), .clk(clk_enb0), .q(b8[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff9 (.din(b9_outmx[2:0]), .clk(clk_enb0), .q(b9[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff10 (.din(b10_outmx[2:0]), .clk(clk_enb0), .q(b10[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff11 (.din(b11_outmx[2:0]), .clk(clk_enb0), .q(b11[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff12 (.din(b12_outmx[2:0]), .clk(clk_enb0), .q(b12[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff13 (.din(b13_outmx[2:0]), .clk(clk_enb0), .q(b13[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff14 (.din(b14_outmx[2:0]), .clk(clk_enb0), .q(b14[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff15 (.din(b15_outmx[2:0]), .clk(clk_enb0), .q(b15[2:0]),
			.se(se), .si(), .so());
  dff_s 	      out_dff16 (.din(b16_outmx), .clk(clk_enb0), .q(b16),
			.se(se), .si(), .so());
endmodule //mul_booth

module mul_bodec (x, b,  
        b0, b1, b2, b3, b4, b5, b6, b7);

input	x;
input   [15:0] 	b;
output  [2:0] 	b0, b1, b2, b3, b4, b5, b6, b7; 

assign b0[2] = b[1];
assign b0[1] = ~((b[1] & b[0] & x) | (~b[1] & ~b[0] & ~x)) ;
assign b0[0] = (~b[1] & b[0] & x) | (b[1] & ~b[0] & ~x) ;

assign b1[2] = b[3]; 
assign b1[1] = ~((b[3] & b[2] & b[1]) | (~b[3] & ~b[2] & ~b[1])) ;
assign b1[0] = (~b[3] & b[2] & b[1]) | (b[3] & ~b[2] & ~b[1]) ;

assign b2[2] = b[5]; 
assign b2[1] = ~((b[5] & b[4] & b[3]) | (~b[5] & ~b[4] & ~b[3])) ;
assign b2[0] = (~b[5] & b[4] & b[3]) | (b[5] & ~b[4] & ~b[3]) ;

assign b3[2] = b[7] ;
assign b3[1] = ~((b[7] & b[6] & b[5]) | (~b[7] & ~b[6] & ~b[5])) ;
assign b3[0] = (~b[7] & b[6] & b[5]) | (b[7] & ~b[6] & ~b[5]) ;

assign b4[2] = b[9] ;
assign b4[1] = ~((b[9] & b[8] & b[7]) | (~b[9] & ~b[8] & ~b[7])) ;
assign b4[0] = (~b[9] & b[8] & b[7]) | (b[9] & ~b[8] & ~b[7]) ;

assign b5[2] = b[11] ;
assign b5[1] = ~((b[11] & b[10] & b[9]) | (~b[11] & ~b[10] & ~b[9])) ;
assign b5[0] = (~b[11] & b[10] & b[9]) | (b[11] & ~b[10] & ~b[9]) ;

assign b6[2] = b[13] ;
assign b6[1] = ~((b[13] & b[12] & b[11]) | (~b[13] & ~b[12] & ~b[11])) ;
assign b6[0] = (~b[13] & b[12] & b[11]) | (b[13] & ~b[12] & ~b[11]) ;

assign b7[2] = b[15] ;
assign b7[1] = ~((b[15] & b[14] & b[13]) | (~b[15] & ~b[14] & ~b[13])) ;
assign b7[0] = (~b[15] & b[14] & b[13]) | (b[15] & ~b[14] & ~b[13]) ;

endmodule // mul_bodec

// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: swrvr_clib.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////
/*
//
//  Module Name: swrvr_clib.v
//      Description: Design control behavioural library
*/                 





// POSITVE-EDGE TRIGGERED FLOP with SCAN
module dff_s (din, clk, q, se, si, so);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			clk ;	// clk or scan clk

output	[SIZE-1:0]	q ;	// output

input			se ;	// scan-enable
input	[SIZE-1:0]	si ;	// scan-input
output	[SIZE-1:0]	so ;	// scan-output

reg 	[SIZE-1:0]	q ;


always @ (posedge clk)
  q[SIZE-1:0]  <= din[SIZE-1:0] ;










endmodule // dff_s

// POSITVE-EDGE TRIGGERED FLOP with SCAN for Shadow-scan
module dff_sscan (din, clk, q, se, si, so);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			clk ;	// clk or scan clk

output	[SIZE-1:0]	q ;	// output

input			se ;	// scan-enable
input	[SIZE-1:0]	si ;	// scan-input
output	[SIZE-1:0]	so ;	// scan-output

reg 	[SIZE-1:0]	q ;










always @ (posedge clk)
  q[SIZE-1:0]  <= din[SIZE-1:0] ;

assign so={SIZE{1'b0}};


endmodule // dff_sscan

// POSITVE-EDGE TRIGGERED FLOP without SCAN
module dff_ns (din, clk, q);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			clk ;	// clk

output	[SIZE-1:0]	q ;	// output

reg 	[SIZE-1:0]	q ;

always @ (posedge clk)

	q[SIZE-1:0]  <= din[SIZE-1:0] ;

endmodule // dff_ns

// POSITIVE-EDGE TRIGGERED FLOP with SCAN, RESET
module dffr_s (din, clk, rst, q, se, si, so);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			clk ;	// clk or scan clk
input			rst ;	// reset

output	[SIZE-1:0]	q ;	// output

input			se ;	// scan-enable
input	[SIZE-1:0]	si ;	// scan-input
output	[SIZE-1:0]	so ;	// scan-output

reg 	[SIZE-1:0]	q ;


always @ (posedge clk)
	q[SIZE-1:0]  <= ((rst) ? {SIZE{1'b0}}  : din[SIZE-1:0] );










endmodule // dffr_s

// POSITIVE-EDGE TRIGGERED FLOP with SCAN, RESET_L
module dffrl_s (din, clk, rst_l, q, se, si, so);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			clk ;	// clk or scan clk
input			rst_l ;	// reset

output	[SIZE-1:0]	q ;	// output

input			se ;	// scan-enable
input	[SIZE-1:0]	si ;	// scan-input
output	[SIZE-1:0]	so ;	// scan-output

reg 	[SIZE-1:0]	q ;


always @ (posedge clk)
	q[SIZE-1:0]  <= rst_l ? din[SIZE-1:0] : {SIZE{1'b0}};










endmodule // dffrl_s

// POSITIVE-EDGE TRIGGERED FLOP with RESET, without SCAN
module dffr_ns (din, clk, rst, q);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			clk ;	// clk
input			rst ;	// reset

output	[SIZE-1:0]	q ;	// output

reg 	[SIZE-1:0]	q ;

// synopsys sync_set_reset "rst"
always @ (posedge clk)
  q[SIZE-1:0] <= rst ? {SIZE{1'b0}} : din[SIZE-1:0];
   
endmodule // dffr_ns

// POSITIVE-EDGE TRIGGERED FLOP with RESET_L, without SCAN
module dffrl_ns (din, clk, rst_l, q);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			clk ;	// clk
input			rst_l ;	// reset

output	[SIZE-1:0]	q ;	// output

reg 	[SIZE-1:0]	q ;

// synopsys sync_set_reset "rst_l"
always @ (posedge clk)
  q[SIZE-1:0] <= rst_l ? din[SIZE-1:0] : {SIZE{1'b0}};

endmodule // dffrl_ns

// POSITIVE-EDGE TRIGGERED FLOP with SCAN and FUNCTIONAL ENABLE
module dffe_s (din, en, clk, q, se, si, so);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			en ;	// functional enable
input			clk ;	// clk or scan clk

output	[SIZE-1:0]	q ;	// output

input			se ;	// scan-enable
input	[SIZE-1:0]	si ;	// scan-input
output	[SIZE-1:0]	so ;	// scan-output

reg 	[SIZE-1:0]	q ;

// Enable Interpretation. Ultimate interpretation depends on design
// 
// en	se	out
//------------------
// x	1	sin ; scan dominates
// 1  	0	din
// 0 	0	q
//


always @ (posedge clk)
	q[SIZE-1:0]  <= ((en) ? din[SIZE-1:0] : q[SIZE-1:0]) ;









endmodule // dffe_s

// POSITIVE-EDGE TRIGGERED FLOP with enable, without SCAN
module dffe_ns (din, en, clk, q);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			en ;	// functional enable
input			clk ;	// clk

output	[SIZE-1:0]	q ;	// output

reg 	[SIZE-1:0]	q ;

always @ (posedge clk)
  q[SIZE-1:0] <= en ? din[SIZE-1:0] : q[SIZE-1:0];

endmodule // dffe_ns

// POSITIVE-EDGE TRIGGERED FLOP with RESET, FUNCTIONAL ENABLE, SCAN.
module dffre_s (din, rst, en, clk, q, se, si, so);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			en ;	// functional enable
input			rst ;	// reset
input			clk ;	// clk or scan clk

output	[SIZE-1:0]	q ;	// output

input			se ;	// scan-enable
input	[SIZE-1:0]	si ;	// scan-input
output	[SIZE-1:0]	so ;	// scan-output

reg 	[SIZE-1:0]	q ;

// Enable Interpretation. Ultimate interpretation depends on design
// 
// rst	en	se	out
//------------------
// 1	x	x	0   ; reset dominates
// 0	x	1	sin ; scan dominates
// 0	1  	0	din
// 0 	0 	0	q
//


always @ (posedge clk)
	q[SIZE-1:0]  <= (rst ? {SIZE{1'b0}} : ((en) ? din[SIZE-1:0] : q[SIZE-1:0])) ;











endmodule // dffre_s

// POSITIVE-EDGE TRIGGERED FLOP with RESET_L, FUNCTIONAL ENABLE, SCAN.
module dffrle_s (din, rst_l, en, clk, q, se, si, so);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			en ;	// functional enable
input			rst_l ;	// reset
input			clk ;	// clk or scan clk

output	[SIZE-1:0]	q ;	// output

input			se ;	// scan-enable
input	[SIZE-1:0]	si ;	// scan-input
output	[SIZE-1:0]	so ;	// scan-output

reg 	[SIZE-1:0]	q ;

// Enable Interpretation. Ultimate interpretation depends on design
// 
// rst	en	se	out
//------------------
// 0	x	x	0   ; reset dominates
// 1	x	1	sin ; scan dominates
// 1	1  	0	din
// 1 	0 	0	q
//


always @ (posedge clk)
	 q[SIZE-1:0]  <= (rst_l ? ((en) ? din[SIZE-1:0] : q[SIZE-1:0]) : {SIZE{1'b0}}) ;










endmodule // dffrle_s

// POSITIVE-EDGE TRIGGERED FLOP with RESET, ENABLE, without SCAN.
module dffre_ns (din, rst, en, clk, q);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			en ;	// functional enable
input			rst ;	// reset
input			clk ;	// clk

output	[SIZE-1:0]	q ;	// output

reg 	[SIZE-1:0]	q ;

// Enable Interpretation. Ultimate interpretation depends on design
// 
// rst	en	out
//------------------
// 1	x	0   ; reset dominates
// 0	1  	din
// 0 	0 	q
//

// synopsys sync_set_reset "rst"
always @ (posedge clk)
  q[SIZE-1:0] <= rst ? {SIZE{1'b0}} : ((en) ? din[SIZE-1:0] : q[SIZE-1:0]);

endmodule // dffre_ns

// POSITIVE-EDGE TRIGGERED FLOP with RESET_L, ENABLE, without SCAN.
module dffrle_ns (din, rst_l, en, clk, q);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			en ;	// functional enable
input			rst_l ;	// reset
input			clk ;	// clk

output	[SIZE-1:0]	q ;	// output

reg 	[SIZE-1:0]	q ;

// Enable Interpretation. Ultimate interpretation depends on design
// 
// rst	en	out
//------------------
// 0	x	0   ; reset dominates
// 1	1  	din
// 1 	0 	q
//

// synopsys sync_set_reset "rst_l"
always @ (posedge clk)
  q[SIZE-1:0] <= rst_l ? ((en) ? din[SIZE-1:0] : q[SIZE-1:0]) : {SIZE{1'b0}} ;

endmodule // dffrle_ns

// POSITIVE-EDGE TRIGGERED FLOP with SCAN, and ASYNC RESET
module dffr_async (din, clk, rst, q, se, si, so);
// synopsys template

parameter SIZE = 1;

input   [SIZE-1:0]      din ;   // data in
input                   clk ;   // clk or scan clk
input                   rst ;   // reset

output  [SIZE-1:0]      q ;     // output

input                   se ;    // scan-enable
input   [SIZE-1:0]      si ;    // scan-input
output  [SIZE-1:0]      so ;    // scan-output

reg     [SIZE-1:0]      q ;


always @ (posedge clk or posedge rst)
	q[SIZE-1:0]  <= rst ? {SIZE{1'b0}} : din[SIZE-1:0];










endmodule // dffr_async

// POSITIVE-EDGE TRIGGERED FLOP with SCAN, and ASYNC RESET_L
module dffrl_async (din, clk, rst_l, q, se, si, so);
// synopsys template

parameter SIZE = 1;

input   [SIZE-1:0]      din ;   // data in
input                   clk ;   // clk or scan clk
input                   rst_l ;   // reset

output  [SIZE-1:0]      q ;     // output

input                   se ;    // scan-enable
input   [SIZE-1:0]      si ;    // scan-input
output  [SIZE-1:0]      so ;    // scan-output

reg     [SIZE-1:0]      q ;


always @ (posedge clk or negedge rst_l)
	q[SIZE-1:0]  <= (!rst_l) ? {SIZE{1'b0}} : din[SIZE-1:0];










endmodule // dffrl_async

// POSITIVE-EDGE TRIGGERED FLOP with ASYNC RESET, without SCAN
//module dffr_async_ns (din, clk, rst, q);
//// synopsys template
//parameter SIZE = 1;
//input   [SIZE-1:0]      din ;   // data in
//input                   clk ;   // clk or scan clk
//input                   rst ;   // reset
//output  [SIZE-1:0]      q ;     // output
//reg     [SIZE-1:0]      q ;
// Reset dominates
//// synopsys async_set_reset "rst"
//always @ (posedge clk or posedge rst)
//        if(rst) q[SIZE-1:0]  <= {SIZE{1'b0}};
//        else if(clk) q[SIZE-1:0]  <= din[SIZE-1:0];
//endmodule // dffr_async_ns

// POSITIVE-EDGE TRIGGERED FLOP with ASYNC RESET_L, without SCAN
module dffrl_async_ns (din, clk, rst_l, q);
// synopsys template

parameter SIZE = 1;

input   [SIZE-1:0]      din ;   // data in
input                   clk ;   // clk or scan clk
input                   rst_l ;   // reset

output  [SIZE-1:0]      q ;     // output

// Reset dominates
// synopsys async_set_reset "rst_l"
 reg [SIZE-1:0] q;   
always @ (posedge clk or negedge rst_l)
  q[SIZE-1:0] <= ~rst_l ?  {SIZE{1'b0}} : ({SIZE{rst_l}} & din[SIZE-1:0]);

//   reg  [SIZE-1:0]   qm, qs, qm_l, qs_l, qm_f, qs_f;
//   wire              s_l;
//   assign            s_l = 1'b1;
//
//   always @ (rst_l or qm)   qm_l = ~(qm & {SIZE{rst_l}});
//   always @ (s_l or qs)   qs_l = ~(qs & {SIZE{s_l}});
//   always @ (s_l or qm_l) qm_f = ~(qm_l & {SIZE{s_l}});
//   always @ (rst_l or qs_l) qs_f = ~(qs_l & {SIZE{rst_l}});
//
//   always @ (clk or din or qm_f)
//      qm <= clk ? qm_f : din;
//
//   always @ (clk or qm_l or qs_f)
//      qs <= clk ? qm_l : qs_f;
//
//   assign q  = ~qs;

endmodule // dffrl_async_ns

// 2:1 MUX WITH DECODED SELECTS
module mux2ds (dout, in0, in1, sel0, sel1) ;
// synopsys template

parameter SIZE = 1;

output 	[SIZE-1:0] 	dout;
input	[SIZE-1:0]	in0;
input	[SIZE-1:0]	in1;
input			sel0;
input			sel1;

// reg declaration does not imply state being maintained
// across cycles. Used to construct case statement and
// always updated by inputs every cycle.
reg	[SIZE-1:0]	dout ;

// priority encoding takes care of mutex'ing selects.




wire [1:0] sel = {sel1, sel0}; // 0in one_hot
   
always @ (sel0 or sel1 or in0 or in1)

	case ({sel1,sel0}) // synopsys infer_mux
		2'b01 :	dout = in0 ;
		2'b10 : dout = in1 ;
		2'b11 : dout = {SIZE{1'bx}} ;
		2'b00 : dout = {SIZE{1'bx}} ;
			// 2'b00 : // E.g. 4state vs. 2state modelling.
			// begin
			//	`ifdef FOUR_STATE
			//		dout = {SIZE{1'bx}};
			//	`else
			//		begin
			//		dout = {SIZE{1'b0}};
			//		$error();
			//		end
			//	`endif
			// end
		default : dout = {SIZE{1'bx}};
	endcase

endmodule // mux2ds

// 3:1 MUX WITH DECODED SELECTS
module mux3ds (dout, in0, in1, in2, sel0, sel1, sel2) ;
// synopsys template

parameter SIZE = 1;

output 	[SIZE-1:0] 	dout;
input	[SIZE-1:0]	in0;
input	[SIZE-1:0]	in1;
input	[SIZE-1:0]	in2;
input			sel0;
input			sel1;
input			sel2;

// reg declaration does not imply state being maintained
// across cycles. Used to construct case statement and
// always updated by inputs every cycle.
reg	[SIZE-1:0]	dout ;





wire [2:0] sel = {sel2,sel1,sel0}; // 0in one_hot
   
// priority encoding takes care of mutex'ing selects.
always @ (sel0 or sel1 or sel2 or in0 or in1 or in2)

	case ({sel2,sel1,sel0}) 
		3'b001 : dout = in0 ;
		3'b010 : dout = in1 ;
		3'b100 : dout = in2 ;
		3'b000 : dout = {SIZE{1'bx}} ;
		3'b011 : dout = {SIZE{1'bx}} ;
		3'b101 : dout = {SIZE{1'bx}} ;
		3'b110 : dout = {SIZE{1'bx}} ;
		3'b111 : dout = {SIZE{1'bx}} ;
		default : dout = {SIZE{1'bx}};
			// two state vs four state modelling will be added.
	endcase

endmodule // mux3ds

// 4:1 MUX WITH DECODED SELECTS
module mux4ds (dout, in0, in1, in2, in3, sel0, sel1, sel2, sel3) ;
// synopsys template

parameter SIZE = 1;

output 	[SIZE-1:0] 	dout;
input	[SIZE-1:0]	in0;
input	[SIZE-1:0]	in1;
input	[SIZE-1:0]	in2;
input	[SIZE-1:0]	in3;
input			sel0;
input			sel1;
input			sel2;
input			sel3;

// reg declaration does not imply state being maintained
// across cycles. Used to construct case statement and
// always updated by inputs every cycle.
reg	[SIZE-1:0]	dout ;




   
wire [3:0] sel = {sel3,sel2,sel1,sel0}; // 0in one_hot
   
// priority encoding takes care of mutex'ing selects.
always @ (sel0 or sel1 or sel2 or sel3 or in0 or in1 or in2 or in3)

	case ({sel3,sel2,sel1,sel0}) 
		4'b0001 : dout = in0 ;
		4'b0010 : dout = in1 ;
		4'b0100 : dout = in2 ;
		4'b1000 : dout = in3 ;
		4'b0000 : dout = {SIZE{1'bx}} ;
		4'b0011 : dout = {SIZE{1'bx}} ;
		4'b0101 : dout = {SIZE{1'bx}} ;
		4'b0110 : dout = {SIZE{1'bx}} ;
		4'b0111 : dout = {SIZE{1'bx}} ;
		4'b1001 : dout = {SIZE{1'bx}} ;
		4'b1010 : dout = {SIZE{1'bx}} ;
		4'b1011 : dout = {SIZE{1'bx}} ;
		4'b1100 : dout = {SIZE{1'bx}} ;
		4'b1101 : dout = {SIZE{1'bx}} ;
		4'b1110 : dout = {SIZE{1'bx}} ;
		4'b1111 : dout = {SIZE{1'bx}} ;
		default : dout = {SIZE{1'bx}};
			// two state vs four state modelling will be added.
	endcase

endmodule // mux4ds

// SINK FOR UNLOADED INPUT PORTS
module sink (in);
// synopsys template

parameter SIZE = 1;

input [SIZE-1:0] in;

// Alexey
// `ifdef PITON_PROTO
   // As of version 8.2 XST does not remove this module without the
   // following additional dead code

   wire    a;

   assign		a = | in;

// `endif

endmodule //sink

// SOURCE FOR UNDRIVEN OUTPUT PORTS
module source (out) ;
// synopsys template

parameter SIZE = 1;

output  [SIZE-1:0] out;
// 
// Once 4state/2state model established
// then enable check.
// `ifdef FOUR_STATE
// leda check for x_or_z_in rhs_of assign turned off
// assign  out = {SIZE{1'bx}};
//`else
assign  out = {SIZE{1'b0}};
//`endif

endmodule //source

// 2:1 MUX WITH PRIORITY ENCODED SELECTS
//module mux2es (dout, in0, in1, sel0, sel1) ;
//
//parameter SIZE = 1;
//
//output 	[SIZE-1:0] 	dout;
//input	[SIZE-1:0]	in0;
//input	[SIZE-1:0]	in1;
//input			sel0;
//input			sel1;
//
//// reg declaration does not imply state being maintained
//// across cycles. Used to construct case statement and
//// always updated by inputs every cycle.
//reg	[SIZE-1:0]	dout ;
//
//// must take into account lack of mutex selects.
//// there is no reason for handling of x and z conditions.
//// This will be dictated by design.
//always @ (sel0 or sel1 or in0 or in1)
//
//	case ({sel1,sel0})
//		2'b1x : dout = in1 ; // 10(in1),11(z) 
//		2'b0x :	dout = in0 ; // 01(in0),00(x)
//	endcase
//
//endmodule // mux2es

// CLK Header for gating off the clock of
// a FF.
// clk - output of the clk header
// rclk - input clk
// enb_l - Active low clock enable
// tmb_l  - Active low clock enable ( in scan mode, this input is !se )

module clken_buf (clk, rclk, enb_l, tmb_l);
output clk;
input  rclk, enb_l, tmb_l;
reg    clken;

  always @ (rclk or enb_l or tmb_l)
    if (!rclk)  //latch opens on rclk low phase
      clken = !enb_l | !tmb_l;
  assign clk = clken & rclk;

endmodule



// The following flops are maintained and used in ENET , MAC IP  ONLY
// -- Mimi X61467

// POSITIVE-EDGE TRIGGERED FLOP with SET_L, without SCAN.

module dffsl_ns (din, clk, set_l, q);
// synopsys template
parameter SIZE = 1;

input   [SIZE-1:0]      din ;   // data in
input                   clk ;   // clk or scan clk
input                   set_l ; // set

output  [SIZE-1:0]      q ;     // output

reg     [SIZE-1:0]      q ;

// synopsys sync_set_reset "set_l"
always @ (posedge clk)
  q[SIZE-1:0] <= set_l ? din[SIZE-1:0] : {SIZE{1'b1}};

endmodule // dffsl_ns

// POSITIVE-EDGE TRIGGERED FLOP with SET_L, without SCAN.

module dffsl_async_ns (din, clk, set_l, q);
// synopsys template
parameter SIZE = 1;

input   [SIZE-1:0]      din ;   // data in
input                   clk ;   // clk or scan clk
input                   set_l ; // set

output  [SIZE-1:0]      q ;     // output

reg     [SIZE-1:0]      q ;

// synopsys async_set_reset "set_l"
always @ (posedge clk or negedge set_l)
  q[SIZE-1:0] <= ~set_l ? {SIZE{1'b1}} : ({SIZE{~set_l}} | din[SIZE-1:0]);

endmodule // dffsl_async_ns

// POSITIVE-EDGE TRIGGERED FLOP WITH SET_H , without SCAN.

module dffr_ns_r1 (din, clk, rst, q);
// synopsys template
parameter SIZE = 1;

input   [SIZE-1:0]      din ;   // data in
input                   clk ;   // clk or scan clk
input                   rst ;   // reset

output  [SIZE-1:0]      q ;     // output

reg     [SIZE-1:0]      q ;

// Set to 1
// synopsys sync_set_reset "rst"
always @ (posedge clk)
  q[SIZE-1:0] <= rst ? {SIZE{1'b1}} : din[SIZE-1:0];

endmodule // dffr_ns_r1

// POSITIVE-EDGE TRIGGERED ASYNC RESET_H FLOP , without SCAN.

module dffr_async_ns (din, clk, rst, q);
// synopsys template

parameter SIZE = 1;

input   [SIZE-1:0]      din ;   // data in
input                   clk ;   // clk or scan clk
input                   rst;   // reset

output  [SIZE-1:0]      q ;     // output

reg     [SIZE-1:0]      q ;

// Reset dominates
// synopsys async_set_reset "rst"
always @ (posedge clk or posedge rst)
  q[SIZE-1:0] <= rst ? {SIZE{1'b0}} : din[SIZE-1:0];

endmodule // dffr_async_ns

// POSITIVE-EDGE TRIGGERED ASYNC SET_H FLOP , without SCAN.

module dffr_async_ns_r1 (din, clk, rst, q);
// synopsys template

parameter SIZE = 1;

input   [SIZE-1:0]      din ;   // data in
input                   clk ;   // clk or scan clk
input                   rst;   // reset

output  [SIZE-1:0]      q ;     // output

reg     [SIZE-1:0]      q ;

// Reset to 1
// synopsys async_set_reset "rst"
always @ (posedge clk or posedge rst)
  q[SIZE-1:0] <= rst ? {SIZE{1'b1}} : din[SIZE-1:0];

endmodule // dffr_async_ns_r1


// NEGATIVE-EDGE TRIGGERED ASYNC SET_H FLOP , without SCAN.

module dffr_async_ns_cl_r1 (din, clkl, rst, q);
// synopsys template
parameter SIZE = 1;

input   [SIZE-1:0]      din ;   // data in
input                   clkl ;  // clk or scan clk
input                   rst ;   // reset

output  [SIZE-1:0]      q ;     // output

reg     [SIZE-1:0]      q ;

// Set to 1
// synopsys sync_set_reset "rst"
always @ (negedge clkl or posedge rst)
  q[SIZE-1:0] <= rst ? {SIZE{1'b1}} : din[SIZE-1:0];

endmodule // dffr_async_ns_cl_r1

// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: u1.behV
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
////////////////////////////////////////////////////////////////////////
//
// basic gates {
//
////////////////////////////////////////////////////////////////////////


//bw_u1_inv_0p6x
//
//

module bw_u1_inv_0p6x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule


//bw_u1_inv_1x
//
//

module bw_u1_inv_1x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule


//bw_u1_inv_1p4x
//
//

module bw_u1_inv_1p4x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule


//bw_u1_inv_2x
//
//

module bw_u1_inv_2x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule


//bw_u1_inv_3x
//
//

module bw_u1_inv_3x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule


//bw_u1_inv_4x
//
//

module bw_u1_inv_4x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule



//bw_u1_inv_5x
//
//

module bw_u1_inv_5x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule


//bw_u1_inv_8x
//
//

module bw_u1_inv_8x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule


//bw_u1_inv_10x
//
//

module bw_u1_inv_10x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule


//bw_u1_inv_15x
//
//

module bw_u1_inv_15x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule


//bw_u1_inv_20x
//
//

module bw_u1_inv_20x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule


//bw_u1_inv_30x
//
//

module bw_u1_inv_30x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule


//bw_u1_inv_40x
//
//

module bw_u1_inv_40x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule

//bw_u1_invh_15x
//
//

module bw_u1_invh_15x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule

//bw_u1_invh_25x
//
//

module bw_u1_invh_25x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule


//bw_u1_invh_30x
//
//

module bw_u1_invh_30x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule


//bw_u1_invh_50x
//
//

module bw_u1_invh_50x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule


//bw_u1_invh_60x
//
//

module bw_u1_invh_60x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule




//bw_u1_nand2_0p4x
//
//
module bw_u1_nand2_0p4x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a & b );

endmodule


//bw_u1_nand2_0p6x
//
//
module bw_u1_nand2_0p6x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a & b );

endmodule


//bw_u1_nand2_1x
//
//
module bw_u1_nand2_1x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a & b );

endmodule


//bw_u1_nand2_1p4x
//
//
module bw_u1_nand2_1p4x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a & b );

endmodule


//bw_u1_nand2_2x
//
//
module bw_u1_nand2_2x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a & b );

endmodule


//bw_u1_nand2_3x
//
//
module bw_u1_nand2_3x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a & b );

endmodule


//bw_u1_nand2_4x
//
//
module bw_u1_nand2_4x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a & b );

endmodule


//bw_u1_nand2_5x
//
//
module bw_u1_nand2_5x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a & b );

endmodule


//bw_u1_nand2_7x
//
//
module bw_u1_nand2_7x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a & b );

endmodule


//bw_u1_nand2_10x
//
//
module bw_u1_nand2_10x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a & b );

endmodule


//bw_u1_nand2_15x
//
//
module bw_u1_nand2_15x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a & b );

endmodule


//bw_u1_nand3_0p4x
//
//
module bw_u1_nand3_0p4x (
    z,
    a,
    b,
    c );

    output z;
    input  a;
    input  b;
    input  c;

    assign z = ~( a & b & c );

endmodule




//bw_u1_nand3_0p6x
//
//
module bw_u1_nand3_0p6x (
    z,
    a,
    b,
    c );

    output z;
    input  a;
    input  b;
    input  c;

    assign z = ~( a & b & c );

endmodule



//bw_u1_nand3_1x

//
//
module bw_u1_nand3_1x (
    z,
    a,  
    b,  
    c );
    
    output z;
    input  a;
    input  b;
    input  c;
    
    assign z = ~( a & b & c );

endmodule


//bw_u1_nand3_1p4x

//
//
module bw_u1_nand3_1p4x (
    z,
    a,  
    b,  
    c );
    
    output z;
    input  a;
    input  b;
    input  c;
    
    assign z = ~( a & b & c );

endmodule


//bw_u1_nand3_2x

//
//
module bw_u1_nand3_2x (
    z,
    a,  
    b,  
    c );
    
    output z;
    input  a;
    input  b;
    input  c;
    
    assign z = ~( a & b & c );

endmodule


//bw_u1_nand3_3x

//
//
module bw_u1_nand3_3x (
    z,
    a,  
    b,  
    c );
    
    output z;
    input  a;
    input  b;
    input  c;
    
    assign z = ~( a & b & c );

endmodule


//bw_u1_nand3_4x

//
//
module bw_u1_nand3_4x (
    z,
    a,  
    b,  
    c );
    
    output z;
    input  a;
    input  b;
    input  c;
    
    assign z = ~( a & b & c );

endmodule


//bw_u1_nand3_5x

//
//
module bw_u1_nand3_5x (
    z,
    a,  
    b,  
    c );
    
    output z;
    input  a;
    input  b;
    input  c;
    
    assign z = ~( a & b & c );

endmodule


//bw_u1_nand3_7x

//
//
module bw_u1_nand3_7x (
    z,
    a,  
    b,  
    c );
    
    output z;
    input  a;
    input  b;
    input  c;
    
    assign z = ~( a & b & c );

endmodule


//bw_u1_nand3_10x

//
//
module bw_u1_nand3_10x (
    z,
    a,  
    b,  
    c );
    
    output z;
    input  a;
    input  b;
    input  c;
    
    assign z = ~( a & b & c );

endmodule


//bw_u1_nand4_0p6x

//
//
module bw_u1_nand4_0p6x (
    z,
    a,  
    b,  
    c,  
    d );
    
    output z;
    input  a;
    input  b;
    input  c;
    input  d;
    
    assign z = ~( a & b & c & d );

endmodule


//bw_u1_nand4_1x
//
//
module bw_u1_nand4_1x (
    z,
    a,
    b,
    c,
    d );

    output z;
    input  a;
    input  b;
    input  c;
    input  d;

    assign z = ~( a & b & c & d );

endmodule


//bw_u1_nand4_1p4x
//
//
module bw_u1_nand4_1p4x (
    z,
    a,
    b,
    c,
    d );

    output z;
    input  a;
    input  b;
    input  c;
    input  d;

    assign z = ~( a & b & c & d );

endmodule


//bw_u1_nand4_2x
//
//
module bw_u1_nand4_2x (
    z,
    a,
    b,
    c,
    d );

    output z;
    input  a;
    input  b;
    input  c;
    input  d;

    assign z = ~( a & b & c & d );

endmodule


//bw_u1_nand4_3x
//
//
module bw_u1_nand4_3x (
    z,
    a,
    b,
    c,
    d );

    output z;
    input  a;
    input  b;
    input  c;
    input  d;

    assign z = ~( a & b & c & d );

endmodule


//bw_u1_nand4_4x
//
//
module bw_u1_nand4_4x (
    z,
    a,
    b,
    c,
    d );

    output z;
    input  a;
    input  b;
    input  c;
    input  d;

    assign z = ~( a & b & c & d );

endmodule


//bw_u1_nand4_6x
//
//

module bw_u1_nand4_6x (
    z,
    a,
    b,
    c,
    d );

    output z;
    input  a;
    input  b;
    input  c;
    input  d;


    nand( z, a, b,c,d);

endmodule

//bw_u1_nand4_8x
//
//

module bw_u1_nand4_8x (
    z,
    a,
    b,
    c,
    d );

    output z;
    input  a;
    input  b;
    input  c;
    input  d;


    nand( z, a, b,c,d);

endmodule

//bw_u1_nor2_0p6x
//
//

module bw_u1_nor2_0p6x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a | b );

endmodule


//bw_u1_nor2_1x
//
//

module bw_u1_nor2_1x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a | b );

endmodule


//bw_u1_nor2_1p4x
//
//

module bw_u1_nor2_1p4x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a | b );

endmodule


//bw_u1_nor2_2x
//
//

module bw_u1_nor2_2x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a | b );

endmodule


//bw_u1_nor2_3x
//
//

module bw_u1_nor2_3x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a | b );

endmodule


//bw_u1_nor2_4x
//
//

module bw_u1_nor2_4x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a | b );

endmodule


//bw_u1_nor2_6x
//
//

module bw_u1_nor2_6x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a | b );

endmodule


//bw_u1_nor2_8x
//
//

module bw_u1_nor2_8x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a | b );

endmodule


//bw_u1_nor2_12x
//
//

module bw_u1_nor2_12x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a | b );

endmodule




//bw_u1_nor3_0p6x
//
//

module bw_u1_nor3_0p6x (
    z,
    a,
    b,
    c );

    output z;
    input  a;
    input  b;
    input  c;

    assign z = ~( a | b | c );

endmodule


//bw_u1_nor3_1x
//
//

module bw_u1_nor3_1x (
    z,
    a,
    b,
    c );

    output z;
    input  a;
    input  b;
    input  c;

    assign z = ~( a | b | c );

endmodule


//bw_u1_nor3_1p4x
//
//

module bw_u1_nor3_1p4x (
    z,
    a,
    b,
    c );

    output z;
    input  a;
    input  b;
    input  c;

    assign z = ~( a | b | c );

endmodule


//bw_u1_nor3_2x
//
//

module bw_u1_nor3_2x (
    z,
    a,
    b,
    c );

    output z;
    input  a;
    input  b;
    input  c;

    assign z = ~( a | b | c );

endmodule


//bw_u1_nor3_3x
//
//

module bw_u1_nor3_3x (
    z,
    a,
    b,
    c );

    output z;
    input  a;
    input  b;
    input  c;

    assign z = ~( a | b | c );

endmodule


//bw_u1_nor3_4x
//
//

module bw_u1_nor3_4x (
    z,
    a,
    b,
    c );

    output z;
    input  a;
    input  b;
    input  c;

    assign z = ~( a | b | c );

endmodule


//bw_u1_nor3_6x
//
//

module bw_u1_nor3_6x (
    z,
    a,
    b,
    c );

    output z;
    input  a;
    input  b;
    input  c;

    assign z = ~( a | b | c );

endmodule


//bw_u1_nor3_8x
//
//

module bw_u1_nor3_8x (
    z,
    a,
    b,
    c );

    output z;
    input  a;
    input  b;
    input  c;

    assign z = ~( a | b | c );

endmodule


//bw_u1_aoi21_0p4x
//
// 
module bw_u1_aoi21_0p4x (
    z,
    b1,
    b2,
    a );

    output z;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( b1 & b2 ) | ( a ));

endmodule
//bw_u1_aoi21_1x
//
// 
module bw_u1_aoi21_1x (

    z,
    b1,
    b2,
    a );

    output z;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( b1 & b2 ) | ( a  ));

endmodule
//bw_u1_aoi21_2x
//
// 
module bw_u1_aoi21_2x (
    z,
    b1,
    b2,
    a );

    output z;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( b1 & b2 ) | ( a ));

endmodule
//bw_u1_aoi21_4x
//
// 
module bw_u1_aoi21_4x (
    z,
    b1,
    b2,
    a );

    output z;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( b1 & b2 ) | ( a ));

endmodule
//bw_u1_aoi21_8x
//
// 
module bw_u1_aoi21_8x (
    z,
    b1,
    b2,
    a );

    output z;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( b1 & b2 ) | ( a ));

endmodule
//bw_u1_aoi21_12x
//
// 
module bw_u1_aoi21_12x (
    z,
    b1,
    b2,
    a );

    output z;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( b1 & b2 ) | ( a ));

endmodule
//bw_u1_aoi22_0p4x
//
// 
module bw_u1_aoi22_0p4x (
    z,
    a1,
    a2,
    b1,
    b2 );

    output z;
    input  a1;
    input  a2;
    input  b1;
    input  b2;

    assign z = ~(( a1 & a2 ) | ( b1 & b2 ));

endmodule
//bw_u1_aoi22_1x
//
// 
module bw_u1_aoi22_1x (
    z,
    b1,
    b2,
    a1,
    a2 );

    output z;
    input  b1;
    input  b2;
    input  a1;
    input  a2;


    assign z = ~(( a1 & a2 ) | ( b1 & b2 ));

endmodule
//bw_u1_aoi22_2x
//
// 
module bw_u1_aoi22_2x (


    z,
    b1,
    b2,
    a1,
    a2 );

    output z;
    input  b1;
    input  b2;
    input  a1;
    input  a2;
 
    assign z = ~(( a1 & a2 ) | ( b1 & b2 ));

endmodule
//bw_u1_aoi22_4x
//
// 
module bw_u1_aoi22_4x (

    z,
    b1,
    b2,
    a1,
    a2 );

    output z;
    input  b1;
    input  b2;
    input  a1;
    input  a2;

    assign z = ~(( a1 & a2 ) | ( b1 & b2 ));

endmodule
//bw_u1_aoi22_8x
//
// 
module bw_u1_aoi22_8x (

    z,
    b1,
    b2,
    a1,
    a2 );

    output z;
    input  b1;
    input  b2;
    input  a1;
    input  a2;

    assign z = ~(( a1 & a2 ) | ( b1 & b2 ));

endmodule
//bw_u1_aoi211_0p3x
//
// 
module bw_u1_aoi211_0p3x (

    z,
    c1,
    c2,
    b,
    a );

    output z;
    input  c1;
    input  c2;
    input  b;
    input  a;

    assign z = ~(( c1 & c2 ) | (a)| (b));

endmodule

//bw_u1_aoi211_1x
//
// 
module bw_u1_aoi211_1x (

    z,
    c1,
    c2,
    b,
    a );

    output z;
    input  c1;
    input  c2;
    input  b;
    input  a;

    assign z = ~(( c1 & c2 ) | (a)| (b));

endmodule

//bw_u1_aoi211_2x
//
// 
module bw_u1_aoi211_2x (



    z,
    c1,
    c2,
    b, 
    a );

    output z;
    input  c1;
    input  c2;
    input  b;
    input  a;
 

    assign z = ~(( c1 & c2 ) | (a)| (b));

endmodule

//bw_u1_aoi211_4x
//
// 
module bw_u1_aoi211_4x (


    z,
    c1,
    c2,
    b, 
    a );

    output z;
    input  c1;
    input  c2;
    input  b;
    input  a;
 


    assign z = ~(( c1 & c2 ) | (a)| (b));

endmodule

//bw_u1_aoi211_8x
//
// 
module bw_u1_aoi211_8x (


    z,
    c1,
    c2,
    b, 
    a );

    output z;
    input  c1;
    input  c2;
    input  b;
    input  a;
 


    assign z = ~(( c1 & c2 ) | (a)| (b));

endmodule

//bw_u1_oai21_0p4x
//
//
module bw_u1_oai21_0p4x (
    z,
    b1,
    b2,
    a );

    output z;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( b1 | b2 ) & ( a ));

endmodule



//bw_u1_oai21_1x
//
//
module bw_u1_oai21_1x (
    z,
    b1,
    b2,
    a );

    output z;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( b1 | b2 ) & ( a ));

endmodule



//bw_u1_oai21_2x
//
//
module bw_u1_oai21_2x (
    z,
    b1,
    b2,
    a );

    output z;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( b1 | b2 ) & ( a ));

endmodule



//bw_u1_oai21_4x
//
//
module bw_u1_oai21_4x (
    z,
    b1,
    b2,
    a );

    output z;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( b1 | b2 ) & ( a ));

endmodule



//bw_u1_oai21_8x
//
//
module bw_u1_oai21_8x (
    z,
    b1,
    b2,
    a );

    output z;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( b1 | b2 ) & ( a ));

endmodule



//bw_u1_oai21_12x
//
//
module bw_u1_oai21_12x (
    z,
    b1,
    b2,
    a );

    output z;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( b1 | b2 ) & ( a ));

endmodule



//bw_u1_oai22_0p4x
// 
module bw_u1_oai22_0p4x (
    z,
    a1,
    a2,
    b1,
    b2 );

    output z;
    input  a1;
    input  a2;
    input  b1;
    input  b2;

    assign z = ~(( a1 | a2 ) & ( b1 | b2 ));

endmodule

//bw_u1_oai22_1x
// 
module bw_u1_oai22_1x (
    z,
    a1,
    a2,
    b1,
    b2 );

    output z;
    input  a1;
    input  a2;
    input  b1;
    input  b2;

    assign z = ~(( a1 | a2 ) & ( b1 | b2 ));

endmodule

//bw_u1_oai22_2x
// 
module bw_u1_oai22_2x (
    z,
    a1,
    a2,
    b1,
    b2 );

    output z;
    input  a1;
    input  a2;
    input  b1;
    input  b2;

    assign z = ~(( a1 | a2 ) & ( b1 | b2 ));

endmodule

//bw_u1_oai22_4x
// 
module bw_u1_oai22_4x (
    z,
    a1,
    a2,
    b1,
    b2 );

    output z;
    input  a1;
    input  a2;
    input  b1;
    input  b2;

    assign z = ~(( a1 | a2 ) & ( b1 | b2 ));

endmodule

//bw_u1_oai22_8x
// 
module bw_u1_oai22_8x (
    z,
    a1,
    a2,
    b1,
    b2 );

    output z;
    input  a1;
    input  a2;
    input  b1;
    input  b2;

    assign z = ~(( a1 | a2 ) & ( b1 | b2 ));

endmodule

//bw_u1_oai211_0p3x
//
//
module bw_u1_oai211_0p3x (
    z,
    c1,
    c2,
    b,
    a );

    output z;
    input  c1;
    input  c2;
    input  b;
    input  a;

    assign z = ~(( c1 | c2 ) & ( a ) & (b));

endmodule

//bw_u1_oai211_1x
//
//
module bw_u1_oai211_1x (
    z,
    c1,
    c2,
    b,
    a );

    output z;
    input  c1;
    input  c2;
    input  b;
    input  a;

    assign z = ~(( c1 | c2 ) & ( a ) & (b));

endmodule

//bw_u1_oai211_2x
//
//
module bw_u1_oai211_2x (
    z,
    c1,
    c2,
    b,
    a );

    output z;
    input  c1;
    input  c2;
    input  b;
    input  a;

    assign z = ~(( c1 | c2 ) & ( a ) & (b));

endmodule

//bw_u1_oai211_4x
//
//
module bw_u1_oai211_4x (
    z,
    c1,
    c2,
    b,
    a );

    output z;
    input  c1;
    input  c2;
    input  b;
    input  a;

    assign z = ~(( c1 | c2 ) & ( a ) & (b));

endmodule

//bw_u1_oai211_8x
//
//
module bw_u1_oai211_8x (
    z,
    c1,
    c2,
    b,
    a );

    output z;
    input  c1;
    input  c2;
    input  b;
    input  a;

    assign z = ~(( c1 | c2 ) & ( a ) & (b));

endmodule

//bw_u1_aoi31_1x
//
// 
module bw_u1_aoi31_1x (


    z,
    b1,
    b2,
    b3,
    a );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a;

    assign z = ~(( b1 & b2&b3 ) | ( a ));

endmodule
//bw_u1_aoi31_2x
//
// 
module bw_u1_aoi31_2x (

    z, 
    b1,
    b2, 
    b3, 
    a );
    
    output z; 
    input  b1;
    input  b2;
    input  b3;
    input  a;

    assign z = ~(( b1 & b2&b3 ) | ( a ));

endmodule
//bw_u1_aoi31_4x
//
// 
module bw_u1_aoi31_4x (
    z, 
    b1,
    b2, 
    b3, 
    a );
    
    output z; 
    input  b1;
    input  b2;
    input  b3;
    input  a;

    assign z = ~(( b1 & b2&b3 ) | ( a ));

endmodule
//bw_u1_aoi31_8x
//
// 
module bw_u1_aoi31_8x (

    z, 
    b1,
    b2, 
    b3, 
    a );
    
    output z; 
    input  b1;
    input  b2;
    input  b3;
    input  a;

    assign z = ~(( b1 & b2&b3 ) | ( a ));

endmodule
//bw_u1_aoi32_1x
//
// 
module bw_u1_aoi32_1x (
    z,
    b1,
    b2,
    b3,
    a1,
    a2 );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a1;
    input  a2;

    assign z = ~(( b1 & b2&b3 ) | ( a1 & a2 ));

endmodule

//bw_u1_aoi32_2x
//
// 
module bw_u1_aoi32_2x (
    z,
    b1, 
    b2,
    b3,
    a1,
    a2 );

    output z;
    input  b1; 
    input  b2; 
    input  b3; 
    input  a1;
    input  a2;

 

    assign z = ~(( b1 & b2&b3 ) | ( a1 & a2 ));

endmodule

//bw_u1_aoi32_4x
//
// 
module bw_u1_aoi32_4x (

    z,
    b1, 
    b2,
    b3,
    a1,
    a2 );

    output z;
    input  b1; 
    input  b2; 
    input  b3; 
    input  a1;
    input  a2;

 

    assign z = ~(( b1 & b2&b3 ) | ( a1 & a2 ));

endmodule

//bw_u1_aoi32_8x
//
// 
module bw_u1_aoi32_8x (

    z,
    b1, 
    b2,
    b3,
    a1,
    a2 );

    output z;
    input  b1; 
    input  b2; 
    input  b3; 
    input  a1;
    input  a2;

 
    assign z = ~(( b1 & b2&b3 ) | ( a1 & a2 ));

endmodule

//bw_u1_aoi33_1x
//
//
module bw_u1_aoi33_1x (




    z,
    b1,
    b2,
    b3,
    a1,
    a2,
    a3 );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a1;
    input  a2;
    input  a3;

    assign z = ~(( b1 & b2&b3 ) | ( a1&a2&a3 ));

endmodule


//bw_u1_aoi33_2x
//
//
module bw_u1_aoi33_2x (

       
    z, 
    b1, 
    b2,  
    b3,  
    a1,  
    a2,  
    a3 );
    
    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a1;
    input  a2;
    input  a3;
    

    assign z = ~(( b1 & b2&b3 ) | ( a1&a2&a3 ));

endmodule


//bw_u1_aoi33_4x
//
//
module bw_u1_aoi33_4x (

       
    z, 
    b1, 
    b2,  
    b3,  
    a1,  
    a2,  
    a3 );
    
    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a1;
    input  a2;
    input  a3;
    


    assign z = ~(( b1 & b2&b3 ) | ( a1&a2&a3 ));

endmodule


//bw_u1_aoi33_8x
//
//
module bw_u1_aoi33_8x (
       
    z, 
    b1, 
    b2,  
    b3,  
    a1,  
    a2,  
    a3 );
    
    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a1;
    input  a2;
    input  a3;
    


    assign z = ~(( b1 & b2&b3 ) | ( a1&a2&a3 ));

endmodule


//bw_u1_aoi221_1x
//
// 
module bw_u1_aoi221_1x (

    z,
    c1,
    c2,
    b1,
    b2,
    a );

    output z;
    input  c1;
    input  c2;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( c1 & c2 ) | (b1&b2)| (a));

endmodule


//bw_u1_aoi221_2x
//
// 
module bw_u1_aoi221_2x (

    z,
    c1,
    c2,
    b1,
    b2,
    a );

    output z;
    input  c1;
    input  c2;
    input  b1;
    input  b2;
    input  a; 


    assign z = ~(( c1 & c2 ) | (b1&b2)| (a));

endmodule


//bw_u1_aoi221_4x
//
// 
module bw_u1_aoi221_4x (



    z,
    c1,
    c2,
    b1,
    b2,
    a );

    output z;
    input  c1;
    input  c2;
    input  b1;
    input  b2;
    input  a; 


    assign z = ~(( c1 & c2 ) | (b1&b2)| (a));

endmodule


//bw_u1_aoi221_8x
//
// 
module bw_u1_aoi221_8x (
    z,
    c1,
    c2,
    b1,
    b2,
    a );

    output z;
    input  c1;
    input  c2;
    input  b1;
    input  b2;
    input  a; 


    assign z = ~(( c1 & c2 ) | (b1&b2)| (a));

endmodule


//bw_u1_aoi222_1x
//
//
module bw_u1_aoi222_1x (

    z,
    a1,
    a2,
    b1,
    b2,
    c1,
    c2 );

    output z;
    input  a1;
    input  a2;
    input  b1;
    input  b2;
    input  c1;
    input  c2;

    assign z = ~(( c1 & c2 ) | (b1&b2)| (a1& a2));

endmodule

//bw_u1_aoi222_2x
//
//
module bw_u1_aoi222_2x (

    z,
    a1,
    a2,
    b1,
    b2,
    c1,
    c2 );

    output z;
    input  a1;
    input  a2;
    input  b1;
    input  b2;
    input  c1;
    input  c2;

    assign z = ~(( c1 & c2 ) | (b1&b2)| (a1& a2));

endmodule


//bw_u1_aoi222_4x
//
//
module bw_u1_aoi222_4x (

    z,
    a1,
    a2,
    b1,
    b2,
    c1,
    c2 );

    output z;
    input  a1;
    input  a2;
    input  b1;
    input  b2;
    input  c1;
    input  c2;

    assign z = ~(( c1 & c2 ) | (b1&b2)| (a1& a2));

endmodule


//bw_u1_aoi311_1x
//
//
module bw_u1_aoi311_1x (

    z,
    c1,
    c2,
    c3,
    b, 
    a );

    output z;
    input  c1;
    input  c2;
    input  c3;
    input  b;
    input  a;

    assign z = ~(( c1 & c2& c3 ) | (a)| (b));

endmodule




//bw_u1_aoi311_2x
//
//
module bw_u1_aoi311_2x (
    z,
    c1,
    c2,
    c3,
    b, 
    a );

    output z;
    input  c1;
    input  c2;
    input  c3;
    input  b;
    input  a;

    assign z = ~(( c1 & c2& c3 ) | (a)| (b));

endmodule




//bw_u1_aoi311_4x
//
//
module bw_u1_aoi311_4x (
    z,
    c1,
    c2,
    c3,
    b, 
    a );

    output z;
    input  c1;
    input  c2;
    input  c3;
    input  b;
    input  a;


    assign z = ~(( c1 & c2& c3 ) | (a)| (b));

endmodule




//bw_u1_aoi311_8x
//
//
module bw_u1_aoi311_8x (
    z,
    c1,
    c2,
    c3,
    b, 
    a );

    output z;
    input  c1;
    input  c2;
    input  c3;
    input  b;
    input  a;

    assign z = ~(( c1 & c2& c3 ) | (a)| (b));

endmodule




//bw_u1_oai31_1x
//
//
module bw_u1_oai31_1x (
    z,
    b1,
    b2,
    b3,
    a );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a;

    assign z = ~(( b1 | b2|b3 ) & ( a ));

endmodule




//bw_u1_oai31_2x
//
//
module bw_u1_oai31_2x (
    z,
    b1,
    b2,
    b3,
    a );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a;

    assign z = ~(( b1 | b2|b3 ) & ( a ));

endmodule




//bw_u1_oai31_4x
//
//
module bw_u1_oai31_4x (
    z,
    b1,
    b2,
    b3,
    a );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a;

    assign z = ~(( b1 | b2|b3 ) & ( a ));

endmodule




//bw_u1_oai31_8x
//
//
module bw_u1_oai31_8x (
    z,
    b1,
    b2,
    b3,
    a );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a;

    assign z = ~(( b1 | b2|b3 ) & ( a ));

endmodule




//bw_u1_oai32_1x
//
//
module bw_u1_oai32_1x (
    z,
    b1,
    b2,
    b3,
    a1,
    a2 );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a1;
    input  a2;

    assign z = ~(( b1 | b2 | b3 ) & ( a1 | a2 ));

endmodule



//bw_u1_oai32_2x
//
//
module bw_u1_oai32_2x (
    z,
    b1,
    b2,
    b3,
    a1,
    a2 );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a1;
    input  a2;

    assign z = ~(( b1 | b2 | b3 ) & ( a1 | a2 ));

endmodule



//bw_u1_oai32_4x
//
//
module bw_u1_oai32_4x (
    z,
    b1,
    b2,
    b3,
    a1,
    a2 );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a1;
    input  a2;

    assign z = ~(( b1 | b2 | b3 ) & ( a1 | a2 ));

endmodule



//bw_u1_oai32_8x
//
//
module bw_u1_oai32_8x (
    z,
    b1,
    b2,
    b3,
    a1,
    a2 );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a1;
    input  a2;

    assign z = ~(( b1 | b2 | b3 ) & ( a1 | a2 ));

endmodule



//bw_u1_oai33_1x
//
//
module bw_u1_oai33_1x (
    z,
    b1,
    b2,
    b3,
    a1,
    a2,
    a3 );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a1;
    input  a2;
    input  a3;

    assign z = ~(( b1 | b2|b3 ) & ( a1|a2|a3 ));

endmodule


//bw_u1_oai33_2x
//
//
module bw_u1_oai33_2x (
    z,
    b1,
    b2,
    b3,
    a1,
    a2,
    a3 );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a1;
    input  a2;
    input  a3;

    assign z = ~(( b1 | b2|b3 ) & ( a1|a2|a3 ));

endmodule


//bw_u1_oai33_4x
//
//
module bw_u1_oai33_4x (
    z,
    b1,
    b2,
    b3,
    a1,
    a2,
    a3 );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a1;
    input  a2;
    input  a3;

    assign z = ~(( b1 | b2|b3 ) & ( a1|a2|a3 ));

endmodule


//bw_u1_oai33_8x
//
//
module bw_u1_oai33_8x (
    z,
    b1,
    b2,
    b3,
    a1,
    a2,
    a3 );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a1;
    input  a2;
    input  a3;

    assign z = ~(( b1 | b2|b3 ) & ( a1|a2|a3 ));

endmodule


//bw_u1_oai221_1x
//
//
module bw_u1_oai221_1x (
    z,
    c1,
    c2,
    b1,
    b2,
    a );

    output z;
    input  c1;
    input  c2;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( c1 | c2 ) & ( a ) & (b1|b2));

endmodule

//bw_u1_oai221_2x
//
//
module bw_u1_oai221_2x (
    z,
    c1,
    c2,
    b1,
    b2,
    a );

    output z;
    input  c1;
    input  c2;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( c1 | c2 ) & ( a ) & (b1|b2));

endmodule

//bw_u1_oai221_4x
//
//
module bw_u1_oai221_4x (
    z,
    c1,
    c2,
    b1,
    b2,
    a );

    output z;
    input  c1;
    input  c2;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( c1 | c2 ) & ( a ) & (b1|b2));

endmodule

//bw_u1_oai221_8x
//
//
module bw_u1_oai221_8x (
    z,
    c1,
    c2,
    b1,
    b2,
    a );

    output z;
    input  c1;
    input  c2;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( c1 | c2 ) & ( a ) & (b1|b2));

endmodule

//bw_u1_oai222_1x
//
//
module bw_u1_oai222_1x (
    z,
    c1,
    c2,
    b1,
    b2,
    a1,
    a2 );

    output z;
    input  c1;
    input  c2;
    input  b1;
    input  b2;
    input  a1;
    input  a2;

    assign z = ~(( c1 | c2 ) & ( a1|a2 ) & (b1|b2));

endmodule


//bw_u1_oai222_2x
//
//
module bw_u1_oai222_2x (
    z,
    c1,
    c2,
    b1,
    b2,
    a1,
    a2 );

    output z;
    input  c1;
    input  c2;
    input  b1;
    input  b2;
    input  a1;
    input  a2;

    assign z = ~(( c1 | c2 ) & ( a1|a2 ) & (b1|b2));

endmodule


//bw_u1_oai222_4x
//
//
module bw_u1_oai222_4x (
    z,
    c1,
    c2,
    b1,
    b2,
    a1,
    a2 );

    output z;
    input  c1;
    input  c2;
    input  b1;
    input  b2;
    input  a1;
    input  a2;

    assign z = ~(( c1 | c2 ) & ( a1|a2 ) & (b1|b2));

endmodule


//bw_u1_oai311_1x
//
//
module bw_u1_oai311_1x (
    z,
    c1,
    c2,
    c3,
    b,
    a );

    output z;
    input  c1;
    input  c2;
    input  c3;
    input  b;
    input  a;

    assign z = ~(( c1 | c2|c3 ) & ( a ) & (b));

endmodule


//bw_u1_oai311_2x
//
//
module bw_u1_oai311_2x (
    z,
    c1,
    c2,
    c3,
    b,
    a );

    output z;
    input  c1;
    input  c2;
    input  c3;
    input  b;
    input  a;

    assign z = ~(( c1 | c2|c3 ) & ( a ) & (b));

endmodule


//bw_u1_oai311_4x
//
//
module bw_u1_oai311_4x (
    z,
    c1,
    c2,
    c3,
    b,
    a );

    output z;
    input  c1;
    input  c2;
    input  c3;
    input  b;
    input  a;

    assign z = ~(( c1 | c2 | c3 ) & ( a ) & (b));

endmodule


//bw_u1_oai311_8x
//
//
module bw_u1_oai311_8x (
    z,
    c1,
    c2,
    c3,
    b,
    a );

    output z;
    input  c1;
    input  c2;
    input  c3;
    input  b;
    input  a;

    assign z = ~(( c1 | c2|c3 ) & ( a ) & (b));

endmodule


//bw_u1_muxi21_0p6x



module bw_u1_muxi21_0p6x (z, d0, d1, s);
output z;
input  d0, d1, s;

    assign z = s ? ~d1 : ~d0;
endmodule


//bw_u1_muxi21_1x



module bw_u1_muxi21_1x (z, d0, d1, s);
output z;
input  d0, d1, s;

    assign z = s ? ~d1 : ~d0;
endmodule







//bw_u1_muxi21_2x



module bw_u1_muxi21_2x (z, d0, d1, s);
output z;
input  d0, d1, s;

    assign z = s ? ~d1 : ~d0;
endmodule


//bw_u1_muxi21_4x



module bw_u1_muxi21_4x (z, d0, d1, s);
output z;
input  d0, d1, s;

    assign z = s ? ~d1 : ~d0;
endmodule




//bw_u1_muxi21_6x


module bw_u1_muxi21_6x (z, d0, d1, s);
output z;
input  d0, d1, s;

    assign z = s ? ~d1 : ~d0;
endmodule

//bw_u1_muxi31d_4x
//

module bw_u1_muxi31d_4x (z, d0, d1, d2, s0, s1, s2);
output z;
input  d0, d1, d2, s0, s1, s2;
        zmuxi31d_prim i0 ( z, d0, d1, d2, s0, s1, s2 );
endmodule

//bw_u1_muxi41d_4x
//

module bw_u1_muxi41d_4x (z, d0, d1, d2, d3, s0, s1, s2, s3);
output z;
input  d0, d1, d2, d3, s0, s1, s2, s3;
        zmuxi41d_prim i0 ( z, d0, d1, d2, d3, s0, s1, s2, s3 );
endmodule

//bw_u1_muxi41d_6x
//

module bw_u1_muxi41d_6x (z, d0, d1, d2, d3, s0, s1, s2, s3);
output z;
input  d0, d1, d2, d3, s0, s1, s2, s3;
        zmuxi41d_prim i0 ( z, d0, d1, d2, d3, s0, s1, s2, s3 );
endmodule
 

//bw_u1_xor2_0p6x
//
// 
module bw_u1_xor2_0p6x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ( a ^ b );

endmodule
//bw_u1_xor2_1x
//
// 
module bw_u1_xor2_1x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ( a ^ b );

endmodule
//bw_u1_xor2_2x
//
// 
module bw_u1_xor2_2x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ( a ^ b );

endmodule
//bw_u1_xor2_4x
//
// 
module bw_u1_xor2_4x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ( a ^ b );

endmodule
//bw_u1_xnor2_0p6x
//
// 
module bw_u1_xnor2_0p6x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a ^ b );

endmodule
//bw_u1_xnor2_1x
//
// 
module bw_u1_xnor2_1x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a ^ b );

endmodule
//bw_u1_xnor2_2x
//
// 
module bw_u1_xnor2_2x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a ^ b );

endmodule
//bw_u1_xnor2_4x
//
// 
module bw_u1_xnor2_4x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a ^ b );

endmodule

//bw_u1_buf_1x
//

module bw_u1_buf_1x (
    z,
    a );

    output z;
    input  a;

    assign z = ( a );

endmodule

//bw_u1_buf_5x
//

module bw_u1_buf_5x (
    z,
    a );

    output z;
    input  a;

    assign z = ( a );

endmodule


//bw_u1_buf_10x
//

module bw_u1_buf_10x (
    z,
    a );

    output z;
    input  a;

    assign z = ( a );

endmodule


//bw_u1_buf_15x
//

module bw_u1_buf_15x (
    z,
    a );

    output z;
    input  a;

    assign z = ( a );

endmodule


//bw_u1_buf_20x
//

module bw_u1_buf_20x (
    z,
    a );

    output z;
    input  a;

    assign z = ( a );

endmodule


//bw_u1_buf_30x
//

module bw_u1_buf_30x (
    z,
    a );

    output z;
    input  a;

    assign z = ( a );

endmodule


//bw_u1_buf_40x
//

module bw_u1_buf_40x (
    z,
    a );

    output z;
    input  a;

    assign z = ( a );

endmodule


//bw_u1_ao2222_1x
//
//
module bw_u1_ao2222_1x (

    z,
    a1,
    a2,
    b1,
    b2,
    c1,
    c2,
    d1,
    d2 );

    output z;
    input  a1;
    input  a2;
    input  b1;
    input  b2;
    input  c1;
    input  c2;
    input  d1;
    input  d2;

    assign z = ((d1&d2) | ( c1 & c2 ) | (b1&b2)| (a1& a2));

endmodule


//bw_u1_ao2222_2x
//
//
module bw_u1_ao2222_2x (

    z,
    a1,
    a2,
    b1,
    b2,
    c1,
    c2,
    d1,
    d2 );

    output z;
    input  a1;
    input  a2;
    input  b1;
    input  b2;
    input  c1;
    input  c2;
    input  d1;
    input  d2;

    assign z = ((d1&d2) | ( c1 & c2 ) | (b1&b2)| (a1& a2));

endmodule

//bw_u1_ao2222_4x
//
//
module bw_u1_ao2222_4x (

    z,
    a1,
    a2,
    b1,
    b2,
    c1,
    c2,
    d1,
    d2 );

    output z;
    input  a1;
    input  a2;
    input  b1;
    input  b2;
    input  c1;
    input  c2;
    input  d1;
    input  d2;

    assign z = ((d1&d2) | ( c1 & c2 ) | (b1&b2)| (a1& a2));

endmodule

////////////////////////////////////////////////////////////////////////
//
// flipflops {
//
////////////////////////////////////////////////////////////////////////

//      scanable D-flipflop with scanout

module bw_u1_soff_1x (q, so, ck, d, se, sd);
output q, so;
input  ck, d, se, sd;
        zsoff_prim i0 ( q, so, ck, d, se, sd );
endmodule

module bw_u1_soff_2x (q, so, ck, d, se, sd);
output q, so;
input  ck, d, se, sd;
        zsoff_prim i0 ( q, so, ck, d, se, sd );
endmodule

module bw_u1_soff_4x (q, so, ck, d, se, sd);
output q, so;
input  ck, d, se, sd;
        zsoff_prim i0 ( q, so, ck, d, se, sd );
endmodule

module bw_u1_soff_8x (q, so, ck, d, se, sd);
output q, so;
input  ck, d, se, sd;
        zsoff_prim i0 ( q, so, ck, d, se, sd );
endmodule

//      fast scanable D-flipflop with scanout with inverted Q output

module bw_u1_soffi_4x (q_l, so, ck, d, se, sd);
output q_l, so;
input  ck, d, se, sd;
        zsoffi_prim i0 ( q_l, so, ck, d, se, sd );
endmodule
  
module bw_u1_soffi_8x (q_l, so, ck, d, se, sd);
output q_l, so;
input  ck, d, se, sd;
        zsoffi_prim i0 ( q_l, so, ck, d, se, sd );
endmodule

//      scanable D-flipflop with scanout with 2-to-1 input mux

module bw_u1_soffm2_4x (q, so, ck, d0, d1, s, se, sd);
output q, so;
input  ck, d0, d1, s, se, sd;
        zsoffm2_prim i0 ( q, so, ck, d0, d1, s, se, sd );
endmodule

module bw_u1_soffm2_8x (q, so, ck, d0, d1, s, se, sd);
output q, so;
input  ck, d0, d1, s, se, sd;
        zsoffm2_prim i0 ( q, so, ck, d0, d1, s, se, sd );
endmodule

//      scanable D-flipflop with scanout with sync reset-bar

module bw_u1_soffr_2x (q, so, ck, d, se, sd, r_l);
output q, so;
input  ck, d, se, sd, r_l;
        zsoffr_prim i0 ( q, so, ck, d, se, sd, r_l );
endmodule
  
module bw_u1_soffr_4x (q, so, ck, d, se, sd, r_l);
output q, so;
input  ck, d, se, sd, r_l;
        zsoffr_prim i0 ( q, so, ck, d, se, sd, r_l );
endmodule

module bw_u1_soffr_8x (q, so, ck, d, se, sd, r_l);
output q, so;
input  ck, d, se, sd, r_l;
        zsoffr_prim i0 ( q, so, ck, d, se, sd, r_l );
endmodule

//bw_u1_soffasr_2x

module bw_u1_soffasr_2x (q, so, ck, d, r_l, s_l, se, sd);
output q, so;
input  ck, d, r_l, s_l, se, sd;
        zsoffasr_prim i0 (q, so, ck, d, r_l, s_l, se, sd);
endmodule


//bw_u1_ckbuf_1p5x


module bw_u1_ckbuf_1p5x  (clk, rclk);
output clk;
input  rclk;
        buf (clk, rclk);
endmodule


//bw_u1_ckbuf_3x


module bw_u1_ckbuf_3x  (clk, rclk);
output clk;
input  rclk;
        buf (clk, rclk);
endmodule

//bw_u1_ckbuf_4p5x


module bw_u1_ckbuf_4p5x  (clk, rclk);
output clk;
input  rclk;
        buf (clk, rclk);
endmodule


//bw_u1_ckbuf_6x


module bw_u1_ckbuf_6x  (clk, rclk);
output clk;
input  rclk;
        buf (clk, rclk);
endmodule

//bw_u1_ckbuf_7x
//

module bw_u1_ckbuf_7x  (clk, rclk);
output clk;
input  rclk;
        buf (clk, rclk);
endmodule

//bw_u1_ckbuf_8x
//
module bw_u1_ckbuf_8x  (clk, rclk);
output clk;
input  rclk;
        buf (clk, rclk);
endmodule


//bw_u1_ckbuf_11x
//

module bw_u1_ckbuf_11x (clk, rclk);
output clk;
input  rclk;

    assign clk = ( rclk );

endmodule

//bw_u1_ckbuf_14x
//

module bw_u1_ckbuf_14x (clk, rclk);
output clk;
input  rclk;

    assign clk = ( rclk );

endmodule

//bw_u1_ckbuf_17x
//

module bw_u1_ckbuf_17x (clk, rclk);
output clk;
input  rclk;

    assign clk = ( rclk );

endmodule




//bw_u1_ckbuf_19x
//

module bw_u1_ckbuf_19x (clk, rclk);
output clk;
input  rclk;

    assign clk = ( rclk );

endmodule




//bw_u1_ckbuf_22x
//

module bw_u1_ckbuf_22x (clk, rclk);
output clk;
input  rclk;

    assign clk = ( rclk );

endmodule

//bw_u1_ckbuf_25x
//

module bw_u1_ckbuf_25x (clk, rclk);
output clk;
input  rclk;

    assign clk = ( rclk );

endmodule


//bw_u1_ckbuf_28x
//

module bw_u1_ckbuf_28x (clk, rclk);
output clk;
input  rclk;

    assign clk = ( rclk );

endmodule


//bw_u1_ckbuf_30x
//

module bw_u1_ckbuf_30x (clk, rclk);
output clk;
input  rclk;

    assign clk = ( rclk );

endmodule

//bw_u1_ckbuf_33x
//

module bw_u1_ckbuf_33x (clk, rclk);
output clk;
input  rclk;

    assign clk = ( rclk );

endmodule

//bw_u1_ckbuf_40x
//

module bw_u1_ckbuf_40x (clk, rclk);
output clk;
input  rclk;

    assign clk = ( rclk );

endmodule


// gated clock buffers


module bw_u1_ckenbuf_6x  (clk, rclk, en_l, tm_l);
output clk;
input  rclk, en_l, tm_l;
        zckenbuf_prim i0 ( clk, rclk, en_l, tm_l );
endmodule 

module bw_u1_ckenbuf_14x (clk, rclk, en_l, tm_l);
output clk;
input  rclk, en_l, tm_l;
        zckenbuf_prim i0 ( clk, rclk, en_l, tm_l );
endmodule   

////////////////////////////////////////////////////////////////////////
//
// half cells
//
////////////////////////////////////////////////////////////////////////



module bw_u1_zhinv_0p6x (z, a);
output z;
input  a;
        not (z, a);
endmodule


module bw_u1_zhinv_1x (z, a);
output z;
input  a;
        not (z, a);
endmodule



module bw_u1_zhinv_1p4x (z, a);
output z;
input  a;
        not (z, a);
endmodule


module bw_u1_zhinv_2x (z, a);
output z;
input  a;
        not (z, a);
endmodule



module bw_u1_zhinv_3x (z, a);
output z;
input  a;
        not (z, a);
endmodule



module bw_u1_zhinv_4x (z, a);
output z;
input  a;
        not (z, a);
endmodule



module bw_u1_zhnand2_0p4x (z, a, b);
output z;
input  a, b;
        nand (z, a, b);
endmodule


module bw_u1_zhnand2_0p6x (z, a, b);
output z;   
input  a, b;
        nand (z, a, b);
endmodule   


module bw_u1_zhnand2_1x (z, a, b);
output z;   
input  a, b;
        nand (z, a, b);
endmodule   


module bw_u1_zhnand2_1p4x (z, a, b);
output z;   
input  a, b;
        nand (z, a, b);
endmodule   


module bw_u1_zhnand2_2x (z, a, b);
output z;   
input  a, b;
        nand (z, a, b);
endmodule   


module bw_u1_zhnand2_3x (z, a, b);
output z;   
input  a, b;
        nand (z, a, b);
endmodule   


module bw_u1_zhnand3_0p6x (z, a, b, c);
output z;
input  a, b, c;
        nand (z, a, b, c);
endmodule

module bw_u1_zhnand3_1x (z, a, b, c);
output z;
input  a, b, c;
        nand (z, a, b, c);
endmodule

module bw_u1_zhnand3_2x (z, a, b, c);
output z;
input  a, b, c;
        nand (z, a, b, c);
endmodule


module bw_u1_zhnand4_0p6x (z, a, b, c, d);
output z;
input  a, b, c, d;
        nand (z, a, b, c, d);
endmodule

module bw_u1_zhnand4_1x (z, a, b, c, d);
output z;
input  a, b, c, d;
        nand (z, a, b, c, d);
endmodule

module bw_u1_zhnand4_2x (z, a, b, c, d);
output z;
input  a, b, c, d;
        nand (z, a, b, c, d);
endmodule


        
module bw_u1_zhnor2_0p6x (z, a, b);
output z;
input  a, b;
        nor (z, a, b);
endmodule

module bw_u1_zhnor2_1x (z, a, b);
output z;   
input  a, b;
        nor (z, a, b);
endmodule

module bw_u1_zhnor2_2x (z, a, b);
output z;   
input  a, b;
        nor (z, a, b);
endmodule



module bw_u1_zhnor3_0p6x (z, a, b, c);
output z;
input  a, b, c;
        nor (z, a, b, c);
endmodule


module bw_u1_zhaoi21_0p4x (z,b1,b2,a);

    output z;   
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( b1 & b2 ) | ( a ));
    
endmodule



module bw_u1_zhaoi21_1x (z, a, b1, b2);

    output z;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( b1 & b2 ) | ( a ));

endmodule



module bw_u1_zhoai21_1x (z,b1,b2,a );
    
    output z;
    input  b1;
    input  b2;  
    input  a;
  
    assign z = ~(( b1 | b2 ) & ( a ));
      
endmodule




module bw_u1_zhoai211_0p3x (z, a, b, c1, c2);
    output z; 
    input  c1;  
    input  c2;
    input  b;
    input  a;
      
    assign z = ~(( c1 | c2 ) & ( a ) & (b));
       
endmodule





module bw_u1_zhoai211_1x (z, a, b, c1, c2);
output z;
input  a, b, c1, c2;
    assign z = ~(( c1 | c2 ) & ( a ) & (b));
       
endmodule





/////////////// Scan data lock up latch ///////////////

module bw_u1_scanlg_2x (so, sd, ck, se);
output so;
input sd, ck, se;

reg so_l;

    assign so = ~so_l;
    always @ ( ck or sd or se )
       if (~ck) so_l <= ~(sd & se) ;

endmodule

module bw_u1_scanl_2x (so, sd, ck);
output so;
input sd, ck;

reg so_l;

    assign so = ~so_l;
    always @ ( ck or sd )
       if (~ck) so_l <= ~sd ;

endmodule



////////////////// Synchronizer ////////////////

module bw_u1_syncff_4x (q, so, ck, d, se, sd);
output q, so;
input  ck, d, se, sd;

reg    q_r;
  always @ (posedge ck)
      q_r <= se ? sd : d;
  assign q  = q_r;
  assign so = q_r;

endmodule




////////////////////////////////////////////////////////////////////////
//
// non library cells
// 
////////////////////////////////////////////////////////////////////////

// These cells are used only in custom DP macros
// Do not use in any block design without prior permission


module bw_u1_zzeccxor2_5x (z, a, b); 
 output z; 
 input a, b;
    assign z = ( a ^ b );

endmodule



module bw_u1_zzmulcsa42_5x (sum, carry, cout, a, b, c, d, cin);
output sum, carry, cout;
input  a, b, c, d, cin;
wire and_cin_b, or_cin_b, xor_a_c_d, and_or_cin_b_xor_a_c_d;
wire and_a_c, and_a_d, and_c_d;
        assign sum   = cin ^ a ^ b ^ c ^ d;
        assign carry = cin & b | (cin | b) & (a ^ c ^ d);
        assign cout  = a & c | a & d | c & d;
endmodule



module bw_u1_zzmulcsa32_5x (sum, cout, a, b, c);
output sum, cout;
input  a, b, c;
wire and_a_b, and_a_c, and_b_c;
        assign sum  = a ^ b ^ c ;
        assign cout = a & b | a & c | b & c ;
endmodule



module bw_u1_zzmulppmuxi21_2x ( z, d0, d1, s );
output  z;
input  d0, d1, s;
    assign z = s ? ~d1 : ~d0;
endmodule



module bw_u1_zzmulnand2_2x ( z, a, b );
output z;
input  a;
input  b;
    assign z = ~( a & b );
endmodule



// Primitives




module zmuxi31d_prim (z, d0, d1, d2, s0, s1, s2);
output z;
input  d0, d1, d2, s0, s1, s2;
// for Blacktie



wire [2:0] sel = {s0,s1,s2}; // 0in one_hot
reg z;
    always @ (s2 or d2 or s1 or d1 or s0 or d0)
        casez ({s2,d2,s1,d1,s0,d0})
            6'b0?0?10: z = 1'b1;  
            6'b0?0?11: z = 1'b0;  
            6'b0?100?: z = 1'b1;  
            6'b0?110?: z = 1'b0;  
            6'b0?1010: z = 1'b1;  
            6'b0?1111: z = 1'b0;  
            6'b100?0?: z = 1'b1;  
            6'b110?0?: z = 1'b0;  
            6'b100?10: z = 1'b1;  
            6'b110?11: z = 1'b0;  
            6'b10100?: z = 1'b1;  
            6'b11110?: z = 1'b0;  
            6'b101010: z = 1'b1;  
            6'b111111: z = 1'b0;  
            default: z = 1'bx;
        endcase
endmodule







module zmuxi41d_prim (z, d0, d1, d2, d3, s0, s1, s2, s3);
output z;
input  d0, d1, d2, d3, s0, s1, s2, s3;
// for Blacktie



wire [3:0] sel = {s0,s1,s2,s3}; // 0in one_hot
reg z;
    always @ (s3 or d3 or s2 or d2 or s1 or d1 or s0 or d0)
        casez ({s3,d3,s2,d2,s1,d1,s0,d0})
            8'b0?0?0?10: z = 1'b1;
            8'b0?0?0?11: z = 1'b0;
            8'b0?0?100?: z = 1'b1;
            8'b0?0?110?: z = 1'b0;
            8'b0?0?1010: z = 1'b1;
            8'b0?0?1111: z = 1'b0;
            8'b0?100?0?: z = 1'b1;
            8'b0?110?0?: z = 1'b0;
            8'b0?100?10: z = 1'b1;
            8'b0?110?11: z = 1'b0;
            8'b0?10100?: z = 1'b1;
            8'b0?11110?: z = 1'b0;
            8'b0?101010: z = 1'b1;
            8'b0?111111: z = 1'b0;
            8'b100?0?0?: z = 1'b1;
            8'b110?0?0?: z = 1'b0;
            8'b100?0?10: z = 1'b1;
            8'b110?0?11: z = 1'b0;
            8'b100?100?: z = 1'b1;
            8'b110?110?: z = 1'b0;
            8'b100?1010: z = 1'b1;
            8'b110?1111: z = 1'b0;
            8'b10100?0?: z = 1'b1;
            8'b11110?0?: z = 1'b0;
            8'b10100?10: z = 1'b1;
            8'b11110?11: z = 1'b0;
            8'b1010100?: z = 1'b1;
            8'b1111110?: z = 1'b0;
            8'b10101010: z = 1'b1;
            8'b11111111: z = 1'b0;
            default: z = 1'bx;
        endcase   
endmodule



module zsoff_prim (q, so, ck, d, se, sd);
output q, so;
input  ck, d, se, sd;
reg    q_r;
  always @ (posedge ck)
      q_r <= se ? sd : d;
  assign q  = q_r;
  assign so = q_r ;
endmodule


module zsoffr_prim (q, so, ck, d, se, sd, r_l);
output q, so;
input  ck, d, se, sd, r_l;
reg    q_r;
  always @ (posedge ck)
      q_r <= se ? sd : (d & r_l) ;
  assign q  = q_r;
  assign so = q_r;
endmodule


module zsoffi_prim (q_l, so, ck, d, se, sd);
output q_l, so;
input  ck, d, se, sd;
reg    q_r;
  always @ (posedge ck)
      q_r <= se ? sd : d;
  assign q_l = ~q_r;
  assign so  = q_r;
endmodule



module zsoffm2_prim (q, so, ck, d0, d1, s, se, sd);
output q, so;
input  ck, d0, d1, s, se, sd;
reg    q_r;
  always @ (posedge ck)
      q_r <= se ? sd : (s ? d1 : d0) ;
  assign q  = q_r;
  assign so = q_r;
endmodule

module zsoffasr_prim (q, so, ck, d, r_l, s_l, se, sd);
  output q, so;
  input ck, d, r_l, s_l, se, sd;

  // asynchronous reset and asynchronous set
  // (priority: r_l > s_l > se > d)
  reg q;
  wire so;

  always @ (posedge ck or negedge r_l or negedge s_l) begin
		if(~r_l) q <= 1'b0;
		else if (~s_l) q <= r_l;
		else if (se) q <= r_l & s_l & sd;
		else q <= r_l & s_l & (~se) & d;
  end

  assign so = q | ~se;

endmodule



module zckenbuf_prim (clk, rclk, en_l, tm_l);
output clk;
input  rclk, en_l, tm_l;
reg    clken;

  always @ (rclk or en_l or tm_l)
    if (!rclk)  //latch opens on rclk low phase
      clken <= ~en_l | ~tm_l;
  assign clk = clken & rclk;

endmodule

module bw_mckbuf_40x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_33x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_30x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_28x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_25x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_22x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_19x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_17x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_14x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_11x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_8x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_7x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_6x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_4p5x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_3x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_1p5x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

//bw_u1_minbuf_1x
//

module bw_u1_minbuf_1x (
    z,
    a );

    output z;
    input  a;

    assign z = ( a );

endmodule

//bw_u1_minbuf_4x
//

module bw_u1_minbuf_4x (
    z,
    a );

    output z;
    input  a;

    assign z = ( a );

endmodule

//bw_u1_minbuf_5x
//

module bw_u1_minbuf_5x (
    z,
    a );

    output z;
    input  a;

    assign z = ( a );

endmodule

module bw_u1_ckenbuf_4p5x  (clk, rclk, en_l, tm_l);
output clk;
input  rclk, en_l, tm_l;
        zckenbuf_prim i0 ( clk, rclk, en_l, tm_l );
endmodule 

// dummy fill modules to get rid of DFT "CAP" property errors (bug 5487)

module bw_u1_fill_1x(\vdd! );
input \vdd! ;
endmodule

module bw_u1_fill_2x(\vdd! );
input \vdd! ;
endmodule

module bw_u1_fill_3x(\vdd! );
input \vdd! ;
endmodule

module bw_u1_fill_4x(\vdd! );
input \vdd! ;
endmodule
// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: m1.behV
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
////////////////////////////////////////////////////////////////////////
// 64 bit nor gate with first 32 bits out

module zznor64_32 ( znor64, znor32, a );
  input  [63:0] a;
  output        znor64;
  output        znor32;

  assign znor32 =  ~(a[0]  | a[1]  | a[2]  | a[3]  | a[4]  | a[5]  | a[6]  | a[7]
		   | a[8]  | a[9]  | a[10] | a[11] | a[12] | a[13] | a[14] | a[15]
		   | a[16] | a[17] | a[18] | a[19] | a[20] | a[21] | a[22] | a[23]
		   | a[24] | a[25] | a[26] | a[27] | a[28] | a[29] | a[30] | a[31]); 

  assign znor64 =  ~(a[0]  | a[1]  | a[2]  | a[3]  | a[4]  | a[5]  | a[6]  | a[7]
		   | a[8]  | a[9]  | a[10] | a[11] | a[12] | a[13] | a[14] | a[15]
		   | a[16] | a[17] | a[18] | a[19] | a[20] | a[21] | a[22] | a[23]
		   | a[24] | a[25] | a[26] | a[27] | a[28] | a[29] | a[30] | a[31] 
		   | a[32] | a[33] | a[34] | a[35] | a[36] | a[37] | a[38] | a[39] 
		   | a[40] | a[41] | a[42] | a[43] | a[44] | a[45] | a[46] | a[47] 
		   | a[48] | a[49] | a[50] | a[51] | a[52] | a[53] | a[54] | a[55] 
		   | a[56] | a[57] | a[58] | a[59] | a[60] | a[61] | a[62] | a[63]);

endmodule // zznor64_32



////////////////////////////////////////////////////////////////////////////////
// 36 bit or gate

module zzor36 ( z, a );
  input  [35:0] a;
  output        z;

  assign z =  (a[0]  | a[1]  | a[2]  | a[3]  | a[4]  | a[5]  | a[6]  | a[7]
	     | a[8]  | a[9]  | a[10] | a[11] | a[12] | a[13] | a[14] | a[15]
	     | a[16] | a[17] | a[18] | a[19] | a[20] | a[21] | a[22] | a[23]
	     | a[24] | a[25] | a[26] | a[27] | a[28] | a[29] | a[30] | a[31]
	     | a[32] | a[33] | a[34] | a[35]); 
   
endmodule // zzor36



////////////////////////////////////////////////////////////////////////////////
// 32 bit or gate

module zzor32 ( z, a );
  input  [31:0] a;
  output        z;

  assign z =  (a[0]  | a[1]  | a[2]  | a[3]  | a[4]  | a[5]  | a[6]  | a[7]
	     | a[8]  | a[9]  | a[10] | a[11] | a[12] | a[13] | a[14] | a[15]
	     | a[16] | a[17] | a[18] | a[19] | a[20] | a[21] | a[22] | a[23]
	     | a[24] | a[25] | a[26] | a[27] | a[28] | a[29] | a[30] | a[31]); 

endmodule // zzor32



////////////////////////////////////////////////////////////////////////////////
// 24 bit nor gate

module zznor24 ( z, a );
  input  [23:0] a;
  output        z;

  assign z =  ~(a[0]  | a[1]  | a[2]  | a[3]  | a[4]  | a[5]  | a[6]  | a[7]
	      | a[8]  | a[9]  | a[10] | a[11] | a[12] | a[13] | a[14] | a[15]
	      | a[16] | a[17] | a[18] | a[19] | a[20] | a[21] | a[22] | a[23]); 

endmodule // zznor24



////////////////////////////////////////////////////////////////////////////////
// 16 bit nor gate

module zznor16 ( z, a );
  input  [15:0] a;
  output        z;

  assign z =  ~(a[0] | a[1] | a[2]  | a[3]  | a[4]  | a[5]  | a[6]  | a[7]
	      | a[8] | a[9] | a[10] | a[11] | a[12] | a[13] | a[14] | a[15]); 

endmodule // zznor16



////////////////////////////////////////////////////////////////////////////////
// 8 bit or gate

module zzor8 ( z, a );
  input  [7:0] a;
  output       z;

  assign z =  (a[0] | a[1] | a[2] | a[3] | a[4] | a[5] | a[6] | a[7]); 
   
endmodule // zzor8




////////////////////////////////////////////////////////////////////////////////
//  Description:	This block implements the adder for the sparc FPU.
//  			It takes two operands and a carry bit.  It adds them together
//			and sends the output to adder_out. 

module zzadd13 ( rs1_data, rs2_data, cin, adder_out );

  input  [12:0] rs1_data;   // 1st input operand
  input  [12:0] rs2_data;   // 2nd input operand
  input         cin;        // carry in

  output [12:0] adder_out;  // result of adder

  assign adder_out = rs1_data + rs2_data + cin;

endmodule // zzadd13



////////////////////////////////////////////////////////////////////////////////
//  Description:	This block implements the adder for the sparc FPU.
//  			It takes two operands and a carry bit.  It adds them together
//			and sends the output to adder_out. 

module zzadd56 ( rs1_data, rs2_data, cin, adder_out );

  input  [55:0] rs1_data;   // 1st input operand
  input  [55:0] rs2_data;   // 2nd input operand
  input         cin;        // carry in

  output [55:0] adder_out;  // result of adder

  assign adder_out = rs1_data + rs2_data + cin;

endmodule // zzadd56



////////////////////////////////////////////////////////////////////////////////

module zzadd48 ( rs1_data, rs2_data, cin, adder_out );

  input  [47:0] rs1_data;   // 1st input operand
  input  [47:0] rs2_data;   // 2nd input operand
  input         cin;        // carry in

  output [47:0] adder_out;  // result of adder

  assign adder_out = rs1_data + rs2_data + cin;

endmodule // zzadd48



////////////////////////////////////////////////////////////////////////////////
//  This adder is primarily used in the multiplier.
//  The cin to out path is optimized.

module zzadd34c ( rs1_data, rs2_data, cin, adder_out );

  input  [33:0] rs1_data;
  input  [33:0] rs2_data;
  input         cin;

  output [33:0] adder_out;

  assign adder_out = rs1_data + rs2_data + cin;


endmodule // zzadd34c



////////////////////////////////////////////////////////////////////////////////

module zzadd32 ( rs1_data, rs2_data, cin, adder_out, cout );

  input  [31:0] rs1_data;   // 1st input operand
  input  [31:0] rs2_data;   // 2nd input operand
  input         cin;        // carry in

  output [31:0] adder_out;  // result of adder
  output 	cout;       // carry out

  assign {cout, adder_out} = rs1_data + rs2_data + cin;

endmodule // zzadd32



////////////////////////////////////////////////////////////////////////////////

module zzadd18 ( rs1_data, rs2_data, cin, adder_out, cout );

  input  [17:0] rs1_data;   // 1st input operand
  input  [17:0] rs2_data;   // 2nd input operand
  input         cin;        // carry in

  output [17:0] adder_out;  // result of adder
  output 	cout;       // carry out

  assign {cout, adder_out} = rs1_data + rs2_data + cin;

endmodule // zzadd18



////////////////////////////////////////////////////////////////////////////////

module zzadd8 ( rs1_data, rs2_data, cin, adder_out, cout );

  input  [7:0] rs1_data;   // 1st input operand
  input  [7:0] rs2_data;   // 2nd input operand
  input        cin;        // carry in

  output [7:0] adder_out;  // result of add & decrement
  output       cout;       // carry out

  assign {cout, adder_out} = rs1_data + rs2_data + cin;

endmodule // zzadd8



////////////////////////////////////////////////////////////////////////////////
// Special 4-operand 32b adder used in spu_shamd5
//  Description:        This block implements the 4-operand 32-bit adder for SPU
//			It takes four 32-bit operands. It add them together and
//			output the 32-bit results to adder_out. The overflow of
//			32th bit and higher will be ignored.

module zzadd32op4 ( rs1_data, rs2_data, rs3_data, rs4_data, adder_out );

  input  [31:0] rs1_data;   // 1st input operand
  input  [31:0] rs2_data;   // 2nd input operand
  input  [31:0] rs3_data;   // 3rd input operand
  input  [31:0] rs4_data;   // 4th input operand

  output [31:0] adder_out;  // result of add

  assign adder_out = rs1_data + rs2_data + rs3_data + rs4_data;

endmodule // zzadd32op4


////////////////////////////////////////////////////////////////////////////////
//  Description:	This block implements the adder for the sparc alu.
//  			It takes two operands and a carry bit.  It adds them together
//			and sends the output to adder_out.  It outputs the overflow
//			and carry condition codes for both 64 bit and 32 bit operations.

module zzadd64 ( rs1_data, rs2_data, cin, adder_out, cout32, cout64 );

   input [63:0]  rs1_data;   // 1st input operand
   input [63:0]  rs2_data;   // 2nd input operand
   input         cin;        // carry in

   output [63:0] adder_out;  // result of adder
   output        cout32;     // carry out from lower 32 bit add
   output        cout64;     // carry out from 64 bit add

   assign {cout32, adder_out[31:0]}  = rs1_data[31:0]  + rs2_data[31:0]  + cin;
   assign {cout64, adder_out[63:32]} = rs1_data[63:32] + rs2_data[63:32] + cout32;

endmodule // zzadd64



///////////////////////////////////////////////////////////////////////
/*
//      Description: This is the ffu VIS adder.  It can do either
//                              2 16 bit adds or 1 32 bit add.
*/

module zzadd32v (/*AUTOARG*/
   // Outputs
   z,
   // Inputs
   a, b, cin, add32
   ) ;
   input [31:0] a;
   input [31:0] b;
   input        cin;
   input        add32;

   output [31:0] z;

   wire          cout15; // carry out from lower 16 bit add
   wire          cin16; // carry in to the upper 16 bit add
   wire          cout31; // carry out from the upper 16 bit add

   assign        cin16 = (add32)? cout15: cin;

   assign      {cout15, z[15:0]} = a[15:0]+b[15:0]+ cin;
   assign      {cout31, z[31:16]} = a[31:16]+b[31:16]+ cin16;

endmodule // zzadd32v




////////////////////////////////////////////////////////////////////////////////
// 64-bit incrementer

module zzinc64 ( in, out );

  input  [63:0] in;

  output [63:0] out;   // result of increment

  assign out = in + 1'b1;

endmodule // zzinc64


////////////////////////////////////////////////////////////////////////////////
// 48-bit incrementer

module zzinc48 ( in, out, overflow );

  input  [47:0] in;

  output [47:0] out;      // result of increment
  output        overflow; // overflow

  assign out      = in + 1'b1;
  assign overflow = ~in[47] & out[47];

endmodule // zzinc48


////////////////////////////////////////////////////////////////////////////////
// 32-bit incrementer

module zzinc32 ( in, out );

  input  [31:0] in;

  output [31:0] out;   // result of increment

  assign out = in + 1'b1;

endmodule // zzinc32


////////////////////////////////////////////////////////////////////////////////

module zzecc_exu_chkecc2 ( q,ce, ue, ne, d, p, vld );
   input [63:0] d;
   input [7:0]  p;
   input        vld;
   output [6:0] q;
   output       ce,
                ue,
                ne;

   wire       parity;

   assign     ce = vld & parity;

   assign ue = vld & ~parity & (q[6] | q[5] | q[4] | q[3] | q[2] | q[1] | q[0]);

   assign ne = ~vld | ~(parity | q[6] | q[5] | q[4] | q[3] | q[2] | q[1] | q[0]);


   assign q[0] = d[0]  ^ d[1]  ^ d[3]  ^ d[4]  ^ d[6]  ^ d[8]  ^ d[10]
               ^ d[11] ^ d[13] ^ d[15] ^ d[17] ^ d[19] ^ d[21] ^ d[23]
               ^ d[25] ^ d[26] ^ d[28] ^ d[30] ^ d[32] ^ d[34] ^ d[36]
               ^ d[38] ^ d[40] ^ d[42] ^ d[44] ^ d[46] ^ d[48] ^ d[50]
               ^ d[52] ^ d[54] ^ d[56] ^ d[57] ^ d[59] ^ d[61] ^ d[63]
               ^ p[0]  ;

   assign q[1] = d[0]  ^ d[2]  ^ d[3]  ^ d[5]  ^ d[6]  ^ d[9]  ^ d[10]
               ^ d[12] ^ d[13] ^ d[16] ^ d[17] ^ d[20] ^ d[21] ^ d[24]
               ^ d[25] ^ d[27] ^ d[28] ^ d[31] ^ d[32] ^ d[35] ^ d[36]
               ^ d[39] ^ d[40] ^ d[43] ^ d[44] ^ d[47] ^ d[48] ^ d[51]
               ^ d[52] ^ d[55] ^ d[56] ^ d[58] ^ d[59] ^ d[62] ^ d[63]
               ^ p[1]  ;

   assign q[2] = d[1]  ^ d[2]  ^ d[3]  ^ d[7]  ^ d[8]  ^ d[9]  ^ d[10]
               ^ d[14] ^ d[15] ^ d[16] ^ d[17] ^ d[22] ^ d[23] ^ d[24]
               ^ d[25] ^ d[29] ^ d[30] ^ d[31] ^ d[32] ^ d[37] ^ d[38]
               ^ d[39] ^ d[40] ^ d[45] ^ d[46] ^ d[47] ^ d[48] ^ d[53]
               ^ d[54] ^ d[55] ^ d[56] ^ d[60] ^ d[61] ^ d[62] ^ d[63]
               ^ p[2]  ;

   assign q[3] = d[4]  ^ d[5]  ^ d[6]  ^ d[7]  ^ d[8]  ^ d[9]  ^ d[10]
               ^ d[18] ^ d[19] ^ d[20] ^ d[21] ^ d[22] ^ d[23] ^ d[24]
               ^ d[25] ^ d[33] ^ d[34] ^ d[35] ^ d[36] ^ d[37] ^ d[38]
               ^ d[39] ^ d[40] ^ d[49] ^ d[50] ^ d[51] ^ d[52] ^ d[53]
               ^ d[54] ^ d[55] ^ d[56] ^ p[3]  ;

   assign q[4] = d[11] ^ d[12] ^ d[13] ^ d[14] ^ d[15] ^ d[16] ^ d[17]
               ^ d[18] ^ d[19] ^ d[20] ^ d[21] ^ d[22] ^ d[23] ^ d[24]
               ^ d[25] ^ d[41] ^ d[42] ^ d[43] ^ d[44] ^ d[45] ^ d[46]
               ^ d[47] ^ d[48] ^ d[49] ^ d[50] ^ d[51] ^ d[52] ^ d[53]
               ^ d[54] ^ d[55] ^ d[56] ^ p[4]  ;

   assign q[5] = d[26] ^ d[27] ^ d[28] ^ d[29] ^ d[30] ^ d[31] ^ d[32]
               ^ d[33] ^ d[34] ^ d[35] ^ d[36] ^ d[37] ^ d[38] ^ d[39]
               ^ d[40] ^ d[41] ^ d[42] ^ d[43] ^ d[44] ^ d[45] ^ d[46]
               ^ d[47] ^ d[48] ^ d[49] ^ d[50] ^ d[51] ^ d[52] ^ d[53]
               ^ d[54] ^ d[55] ^ d[56] ^ p[5]  ;

   assign q[6] = d[57] ^ d[58] ^ d[59] ^ d[60] ^ d[61] ^ d[62] ^ d[63] ^ p[6] ;

   assign parity = d[0]  ^ d[1]  ^ d[2]  ^ d[3]  ^ d[4]  ^ d[5]  ^ d[6]  ^ d[7]
                 ^ d[8]  ^ d[9]  ^ d[10] ^ d[11] ^ d[12] ^ d[13] ^ d[14] ^ d[15]
                 ^ d[16] ^ d[17] ^ d[18] ^ d[19] ^ d[20] ^ d[21] ^ d[22] ^ d[23]
                 ^ d[24] ^ d[25] ^ d[26] ^ d[27] ^ d[28] ^ d[29] ^ d[30] ^ d[31]
                 ^ d[32] ^ d[33] ^ d[34] ^ d[35] ^ d[36] ^ d[37] ^ d[38] ^ d[39]
                 ^ d[40] ^ d[41] ^ d[42] ^ d[43] ^ d[44] ^ d[45] ^ d[46] ^ d[47]
                 ^ d[48] ^ d[49] ^ d[50] ^ d[51] ^ d[52] ^ d[53] ^ d[54] ^ d[55]
                 ^ d[56] ^ d[57] ^ d[58] ^ d[59] ^ d[60] ^ d[61] ^ d[62] ^ d[63]
                 ^ p[0]  ^ p[1]  ^ p[2]  ^ p[3]  ^ p[4]  ^ p[5]  ^ p[6]  ^ p[7];

endmodule // zzecc_exu_chkecc2



////////////////////////////////////////////////////////////////////////////////

module zzecc_sctag_24b_gen ( din, dout, parity ) ;

// Input Ports
input  [23:0] din ;

// Output Ports
output [23:0] dout ;
output [5:0]  parity ;

wire   [23:0] dout ;
wire   [5:0]  parity ;

// Local Reg and Wires
wire          p1 ;
wire          p2 ;
wire          p4 ;
wire          p8 ;
wire          p16 ;
wire          p30 ;


//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
//    |1 |2 |3 |4 |5 |6 |7 |8 |9 |10|11|12|13|14|15 |16 |17 |18 |19 |20 |21 |22 |23 |24 |25 |26 |27 |28 |29 |30 |
//    |P1|P2|D0|P4|D1|D2|D3|P8|D4|D5|D6|D7|D8|D9|D10|P16|D11|D12|D13|D14|D15|D16|D17|D18|D19|D20|D21|D22|D23|P30|
//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
//P1  |  |  |* |  |* |  |* |  |* |  |* |  |* |  | * |   | * |   | * |   | * |   | * |   | * |   | * |   | * |   |
//P2  |  |  |* |  |  |* |* |  |  |* |* |  |  |* | * |   |   | * | * |   |   | * | * |   |   | * | * |   |   |   |
//P4  |  |  |  |  |* |* |* |  |  |  |  |* |* |* | * |   |   |   |   | * | * | * | * |   |   |   |   | * | * |   |
//P8  |  |  |  |  |  |  |  |  |* |* |* |* |* |* | * |   |   |   |   |   |   |   |   | * | * | * | * | * | * |   |
//P16 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   |   | * | * | * | * | * | * | * | * | * | * | * | * | * |   |
//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
//p30 |  |  |* |  |* |* |  |  |* |* |  |* |  |  | * |   | * | * |   | * |   |   | * | * |   |   | * |   | * |   |
//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|


assign p1  = din[0]  ^ din[1]  ^ din[3]  ^ din[4]  ^ din[6]  ^ din[8]  ^
             din[10] ^ din[11] ^ din[13] ^ din[15] ^ din[17] ^ din[19] ^
             din[21] ^ din[23] ;

assign p2  = din[0]  ^ din[2]  ^ din[3]  ^ din[5]  ^ din[6]  ^ din[9]  ^
             din[10] ^ din[12] ^ din[13] ^ din[16] ^ din[17] ^ din[20] ^
             din[21] ;

assign p4  = din[1]  ^ din[2]  ^ din[3]  ^ din[7]  ^ din[8]  ^ din[9]  ^
             din[10] ^ din[14] ^ din[15] ^ din[16] ^ din[17] ^ din[22] ^
             din[23] ;

assign p8  = din[4]  ^ din[5]  ^ din[6]  ^ din[7]  ^ din[8]  ^ din[9]  ^
             din[10] ^ din[18] ^ din[19] ^ din[20] ^ din[21] ^ din[22] ^
             din[23] ;

assign p16 = din[11] ^ din[12] ^ din[13] ^ din[14] ^ din[15] ^ din[16] ^
             din[17] ^ din[18] ^ din[19] ^ din[20] ^ din[21] ^ din[22] ^
             din[23] ;

assign p30 = din[0]  ^ din[1]  ^ din[2]  ^ din[4]  ^ din[5]  ^
             din[7]  ^ din[10] ^ din[11] ^ din[12] ^ din[14] ^
             din[17] ^ din[18] ^ din[21] ^ din[23] ;

assign dout   = din ;
assign parity = {p30, p16, p8, p4, p2, p1} ;

endmodule



////////////////////////////////////////////////////////////////////////////////

module zzecc_sctag_30b_cor ( din, parity, dout, corrected_bit ) ;

// Input Ports
input  [23:0] din ;
input  [4:0]  parity ;

// Output Ports
output [23:0] dout ;
output [4:0]  corrected_bit ;

wire   [23:0] dout ;
wire   [4:0]  corrected_bit ;

// Local Reg and Wires
wire          p1 ;
wire          p2 ;
wire          p4 ;
wire          p8 ;
wire          p16 ;
wire [23:0]   error_bit ;


//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
//    |1 |2 |3 |4 |5 |6 |7 |8 |9 |10|11|12|13|14|15 |16 |17 |18 |19 |20 |21 |22 |23 |24 |25 |26 |27 |28 |29 |30 |
//    |P1|P2|D0|P4|D1|D2|D3|P8|D4|D5|D6|D7|D8|D9|D10|P16|D11|D12|D13|D14|D15|D16|D17|D18|D19|D20|D21|D22|D23|P30|
//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
//P1  |* |  |* |  |* |  |* |  |* |  |* |  |* |  | * |   | * |   | * |   | * |   | * |   | * |   | * |   | * |   |
//P2  |  |* |* |  |  |* |* |  |  |* |* |  |  |* | * |   |   | * | * |   |   | * | * |   |   | * | * |   |   |   |
//P4  |  |  |  |* |* |* |* |  |  |  |  |* |* |* | * |   |   |   |   | * | * | * | * |   |   |   |   | * | * |   |
//P8  |  |  |  |  |  |  |  |* |* |* |* |* |* |* | * |   |   |   |   |   |   |   |   | * | * | * | * | * | * |   |
//P16 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   | * | * | * | * | * | * | * | * | * | * | * | * | * | * |   |
//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
//p30 |* |* |* |* |* |* |* |* |* |* |* |* |* |* | * | * | * | * | * | * | * | * | * | * | * | * | * | * | * | * |
//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|


assign p1  = parity[0] ^
             din[0]  ^ din[1]  ^ din[3]  ^ din[4]  ^ din[6]  ^ din[8]  ^
             din[10] ^ din[11] ^ din[13] ^ din[15] ^ din[17] ^ din[19] ^
             din[21] ^ din[23] ;

assign p2  = parity[1] ^
             din[0]  ^ din[2]  ^ din[3]  ^ din[5]  ^ din[6]  ^ din[9]  ^
             din[10] ^ din[12] ^ din[13] ^ din[16] ^ din[17] ^ din[20] ^
             din[21] ;

assign p4  = parity[2] ^
             din[1]  ^ din[2]  ^ din[3]  ^ din[7]  ^ din[8]  ^ din[9]  ^
             din[10] ^ din[14] ^ din[15] ^ din[16] ^ din[17] ^ din[22] ^
             din[23] ;

assign p8  = parity[3] ^
             din[4]  ^ din[5]  ^ din[6]  ^ din[7]  ^ din[8]  ^ din[9]  ^
             din[10] ^ din[18] ^ din[19] ^ din[20] ^ din[21] ^ din[22] ^
             din[23] ;

assign p16 = parity[4] ^
             din[11] ^ din[12] ^ din[13] ^ din[14] ^ din[15] ^ din[16] ^
             din[17] ^ din[18] ^ din[19] ^ din[20] ^ din[21] ^ din[22] ^
             din[23] ;

assign  error_bit[0]  = !p16 & !p8 & !p4 &  p2 &  p1 ; // 3
assign  error_bit[1]  = !p16 & !p8 &  p4 & !p2 &  p1 ; // 5
assign  error_bit[2]  = !p16 & !p8 &  p4 &  p2 & !p1 ; // 6
assign  error_bit[3]  = !p16 & !p8 &  p4 &  p2 &  p1 ; // 7
assign  error_bit[4]  = !p16 &  p8 & !p4 & !p2 &  p1 ; // 9
assign  error_bit[5]  = !p16 &  p8 & !p4 &  p2 & !p1 ; // 10
assign  error_bit[6]  = !p16 &  p8 & !p4 &  p2 &  p1 ; // 11
assign  error_bit[7]  = !p16 &  p8 &  p4 & !p2 & !p1 ; // 12
assign  error_bit[8]  = !p16 &  p8 &  p4 & !p2 &  p1 ; // 13
assign  error_bit[9]  = !p16 &  p8 &  p4 &  p2 & !p1 ; // 14
assign  error_bit[10] = !p16 &  p8 &  p4 &  p2 &  p1 ; // 15
assign  error_bit[11] =  p16 & !p8 & !p4 & !p2 &  p1 ; // 17
assign  error_bit[12] =  p16 & !p8 & !p4 &  p2 & !p1 ; // 18
assign  error_bit[13] =  p16 & !p8 & !p4 &  p2 &  p1 ; // 19
assign  error_bit[14] =  p16 & !p8 &  p4 & !p2 & !p1 ; // 20
assign  error_bit[15] =  p16 & !p8 &  p4 & !p2 &  p1 ; // 21
assign  error_bit[16] =  p16 & !p8 &  p4 &  p2 & !p1 ; // 22
assign  error_bit[17] =  p16 & !p8 &  p4 &  p2 &  p1 ; // 23
assign  error_bit[18] =  p16 &  p8 & !p4 & !p2 & !p1 ; // 24
assign  error_bit[19] =  p16 &  p8 & !p4 & !p2 &  p1 ; // 25
assign  error_bit[20] =  p16 &  p8 & !p4 &  p2 & !p1 ; // 26
assign  error_bit[21] =  p16 &  p8 & !p4 &  p2 &  p1 ; // 27
assign  error_bit[22] =  p16 &  p8 &  p4 & !p2 & !p1 ; // 28
assign  error_bit[23] =  p16 &  p8 &  p4 & !p2 &  p1 ; // 29

assign  dout          = din ^ error_bit ;
assign  corrected_bit = {p16, p8, p4, p2, p1} ;

endmodule



////////////////////////////////////////////////////////////////////////////////
//Module Name: zzecc_sctag_ecc39
//Function: Error Detection and Correction
//
//

module zzecc_sctag_ecc39 ( dout, cflag, pflag, parity, din);

   //Output: 32bit corrected data
   output[31:0] dout;
   output [5:0] cflag;
   output 	pflag;
   
   //Input: 32bit data din
   input [31:0] din;
   input [6:0]	parity;

   wire 	c0,c1,c2,c3,c4,c5;
   wire [31:0] 	err_bit_pos;

   //refer to the comments in parity_gen_32b.v for the position description
   
   assign c0= parity[0]^(din[0]^din[1])^(din[3]^din[4])^(din[6]^din[8])
                     ^(din[10]^din[11])^(din[13]^din[15])^(din[17]^din[19])
		     ^(din[21]^din[23])^(din[25]^din[26])^(din[28]^din[30]);
   
   assign c1= parity[1]^(din[0]^din[2])^(din[3]^din[5])^(din[6]^din[9])
                     ^(din[10]^din[12])^(din[13]^din[16])^(din[17]^din[20])
		     ^(din[21]^din[24])^(din[25]^din[27])^(din[28]^din[31]);
   
   assign c2= parity[2]^(din[1]^din[2])^(din[3]^din[7])^(din[8]^din[9])
                     ^(din[10]^din[14])^(din[15]^din[16])^(din[17]^din[22])
		     ^(din[23]^din[24])^(din[25]^din[29])^(din[30]^din[31]);
   
   assign c3= parity[3]^(din[4]^din[5])^(din[6]^din[7])^(din[8]^din[9])
                     ^(din[10]^din[18])^(din[19]^din[20])^(din[21]^din[22])
		     ^(din[23]^din[24])^din[25];
   
   assign c4= parity[4]^(din[11]^din[12])^(din[13]^din[14])^
                    (din[15]^din[16])^(din[17]^din[18])^(din[19]^din[20])^
                    (din[21]^din[22])^(din[23]^din[24])^din[25];

   assign c5= parity[5]^(din[26]^din[27])^(din[28]^din[29])^
		    (din[30]^din[31]);

   //generate total parity flag
   assign pflag= c0 ^
		(( (((parity[1]^parity[2])^(parity[3]^parity[4])) ^
		 ((parity[5]^parity[6])^(din[2]^din[5]))) ^		 
		 (((din[7]^din[9])^(din[12]^din[14])) ^
		 ((din[16]^din[18])^(din[20]^din[22]))) ) ^
		 ((din[24]^din[27])^(din[29]^din[31])) );
   
   assign cflag= {c5,c4,c3,c2,c1,c0};
   
   //6 to 32 decoder
   assign err_bit_pos[0] = (c0)&(c1)&(~c2)&(~c3)&(~c4)&(~c5);
   assign err_bit_pos[1] = (c0)&(~c1)&(c2)&(~c3)&(~c4)&(~c5);
   assign err_bit_pos[2] = (~c0)&(c1)&(c2)&(~c3)&(~c4)&(~c5);
   assign err_bit_pos[3] = (c0)&(c1)&(c2)&(~c3)&(~c4)&(~c5);
   assign err_bit_pos[4] = (c0)&(~c1)&(~c2)&(c3)&(~c4)&(~c5);
   assign err_bit_pos[5] = (~c0)&(c1)&(~c2)&(c3)&(~c4)&(~c5);
   assign err_bit_pos[6] = (c0)&(c1)&(~c2)&(c3)&(~c4)&(~c5);
   assign err_bit_pos[7] = (~c0)&(~c1)&(c2)&(c3)&(~c4)&(~c5);
   assign err_bit_pos[8] = (c0)&(~c1)&(c2)&(c3)&(~c4)&(~c5);
   assign err_bit_pos[9] = (~c0)&(c1)&(c2)&(c3)&(~c4)&(~c5);
   assign err_bit_pos[10] = (c0)&(c1)&(c2)&(c3)&(~c4)&(~c5);
   assign err_bit_pos[11] = (c0)&(~c1)&(~c2)&(~c3)&(c4)&(~c5);
   assign err_bit_pos[12] = (~c0)&(c1)&(~c2)&(~c3)&(c4)&(~c5);
   assign err_bit_pos[13] = (c0)&(c1)&(~c2)&(~c3)&(c4)&(~c5);
   assign err_bit_pos[14] = (~c0)&(~c1)&(c2)&(~c3)&(c4)&(~c5);
   assign err_bit_pos[15] = (c0)&(~c1)&(c2)&(~c3)&(c4)&(~c5);
   assign err_bit_pos[16] = (~c0)&(c1)&(c2)&(~c3)&(c4)&(~c5);
   assign err_bit_pos[17] = (c0)&(c1)&(c2)&(~c3)&(c4)&(~c5);
   assign err_bit_pos[18] = (~c0)&(~c1)&(~c2)&(c3)&(c4)&(~c5);
   assign err_bit_pos[19] = (c0)&(~c1)&(~c2)&(c3)&(c4)&(~c5);
   assign err_bit_pos[20] = (~c0)&(c1)&(~c2)&(c3)&(c4)&(~c5);
   assign err_bit_pos[21] = (c0)&(c1)&(~c2)&(c3)&(c4)&(~c5);
   assign err_bit_pos[22] = (~c0)&(~c1)&(c2)&(c3)&(c4)&(~c5);
   assign err_bit_pos[23] = (c0)&(~c1)&(c2)&(c3)&(c4)&(~c5);
   assign err_bit_pos[24] = (~c0)&(c1)&(c2)&(c3)&(c4)&(~c5);
   assign err_bit_pos[25] = (c0)&(c1)&(c2)&(c3)&(c4)&(~c5);
   assign err_bit_pos[26] = (c0)&(~c1)&(~c2)&(~c3)&(~c4)&(c5);
   assign err_bit_pos[27] = (~c0)&(c1)&(~c2)&(~c3)&(~c4)&(c5);
   assign err_bit_pos[28] = (c0)&(c1)&(~c2)&(~c3)&(~c4)&(c5);
   assign err_bit_pos[29] = (~c0)&(~c1)&(c2)&(~c3)&(~c4)&(c5);
   assign err_bit_pos[30] = (c0)&(~c1)&(c2)&(~c3)&(~c4)&(c5);
   assign err_bit_pos[31] = (~c0)&(c1)&(c2)&(~c3)&(~c4)&(c5);

   //correct the error bit, it can only correct one error bit.
   
   assign dout = din ^ err_bit_pos;

endmodule // zzecc_sctag_ecc39


////////////////////////////////////////////////////////////////////////////////
//Module Name: zzecc_sctag_pgen_32b
//Function: Generate 7 parity bits for 32bits input data
//

module zzecc_sctag_pgen_32b ( dout, parity, din);

   //Output: 32bit dout and 7bit parity bit
   output[31:0] dout;
   output [6:0] parity;

   //Input: 32bit data din
   input [31:0] din;

   //input data passing through this module
   assign dout = din ;

   //generate parity bits based on the hamming codes
   //the method to generate parity bit is shown as follows
   //1   2  3  4  5  6  7  8  9 10 11 12 13 14  15  16  17  18  19
   //P1 P2 d0 P4 d1 d2 d3 P8 d4 d5 d6 d7 d8 d9 d10 P16 d11 d12 d13 
   //
   // 20  21  22  23  24  25  26  27  28  29  30  31  32  33  34  35 
   //d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 P32 d26 d27 d28
   //
   // 36  37  38       
   //d29 d30 d31
   //For binary numbers B1-B2-B3-B4-B5-B6:
   //B1=1 for (1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35,37,39,...)
   //B2=1 for (2,3,6,7,10,11,14,15,18,19,22,23,26,27,30,31,34,35,38,39...)
   //B3=1 for (4,5,6,7,12,13,14,15,20,21,22,23,28,29,30,31,36,37,38,39....)
   //B4=1 for (8,9,10,11,12,13,14,15,24,25,26,27,28,29,30,31,40,41,42,....)
   //B5=1 for (16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,48,49,...)
   //B6=1 for (32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49...)
   //Parity bit P1,P2,P4,P8,P16,P32 can be generated from the above group of
   //bits B1=1,B2=1,B3=1,B4=1,B5=1,B6=1 respectively.

   //use parity[5:0] to stand for P1,P2,P4,P8,P16,P32
   assign parity[0] = (din[0]^din[1])^(din[3]^din[4])^(din[6]^din[8])
                     ^(din[10]^din[11])^(din[13]^din[15])^(din[17]^din[19])
		     ^(din[21]^din[23])^(din[25]^din[26])^(din[28]^din[30]);
   //
   assign parity[1] = (din[0]^din[2])^(din[3]^din[5])^(din[6]^din[9])
                     ^(din[10]^din[12])^(din[13]^din[16])^(din[17]^din[20])
		     ^(din[21]^din[24])^(din[25]^din[27])^(din[28]^din[31]);
   //
   assign parity[2] = (din[1]^din[2])^(din[3]^din[7])^(din[8]^din[9])
                     ^(din[10]^din[14])^(din[15]^din[16])^(din[17]^din[22])
		     ^(din[23]^din[24])^(din[25]^din[29])^(din[30]^din[31]);
   //
   assign parity[3] = (din[4]^din[5])^(din[6]^din[7])^(din[8]^din[9])
                     ^(din[10]^din[18])^(din[19]^din[20])^(din[21]^din[22])
		     ^(din[23]^din[24])^din[25];
   //
   assign parity[4] = (din[11]^din[12])^(din[13]^din[14])^(din[15]^din[16])
                     ^(din[17]^din[18])^(din[19]^din[20])^(din[21]^din[22])
		     ^(din[23]^din[24])^din[25];
   //
   assign parity[5] = (din[26]^din[27])^(din[28]^din[29])^(din[30]^din[31]);

   //the last parity bit is the xor of all 38bits
   //assign parity[6] = (^din)^(^parity[5:0]);
   //it can be further simplified as:
   //din= d0  d1  d2  d3  d4  d5  d6  d7  d8  d9 d10 d11 d12 d13 d14 d15 
   //p0 =  x   x       x   x       x       x       x   x       x       x
   //p1 =  x       x   x       x   x           x   x       x   x
   //p2 =      x   x   x               x   x   x   x               x   x
   //p3 =                  x   x   x   x   x   x   x  
   //p4 =                                              x   x   x   x   x
   //p5 =
   //-------------------------------------------------------------------
   //Total 3   3   3   4   3   3   4   3   4   4   5   3   3   4   3   4 
   //
   //din=d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 d31 
   //p0=       x       x       x       x       x   x       x       x    
   //p1=   x   x           x   x           x   x       x   x           x
   //p2=   x   x                   x   x   x   x               x   x   x
   //p3=           x   x   x   x   x   x   x   x
   //p4=   x   x   x   x   x   x   x   x   x   x
   //p5=                                           x   x   x   x   x   x
   //-------------------------------------------------------------------
   //total 4   5   3   4   4   5   4   5   5   6   3   3   4   3   4   4

   //so total=even number, the corresponding bit will not show up in the
   //final xor tree.
   assign parity[6] =  din[0] ^ din[1]  ^ din[2]  ^ din[4]  ^ din[5] ^ din[7]
		    ^ din[10] ^ din[11] ^ din[12] ^ din[14] ^ din[17]
		    ^ din[18] ^ din[21] ^ din[23] ^ din[24] ^ din[26]
		    ^ din[27] ^ din[29];
   
endmodule // zzecc_sctag_pgen_32b

////////////////////////////////////////////////////////////////////////////////
// 34 bit parity tree

module zzpar34 ( z, d );
   input  [33:0] d;
   output        z;

   assign  z =  d[0]  ^ d[1]  ^ d[2]  ^ d[3]  ^ d[4]  ^ d[5]  ^ d[6]  ^ d[7]
	      ^ d[8]  ^ d[9]  ^ d[10] ^ d[11] ^ d[12] ^ d[13] ^ d[14] ^ d[15]
	      ^ d[16] ^ d[17] ^ d[18] ^ d[19] ^ d[20] ^ d[21] ^ d[22] ^ d[23]
	      ^ d[24] ^ d[25] ^ d[26] ^ d[27] ^ d[28] ^ d[29] ^ d[30] ^ d[31]
	      ^ d[32] ^ d[33]; 

endmodule // zzpar34



////////////////////////////////////////////////////////////////////////////////
// 32 bit parity tree

module zzpar32 ( z, d );
   input  [31:0] d;
   output        z;

   assign  z =  d[0]  ^ d[1]  ^ d[2]  ^ d[3]  ^ d[4]  ^ d[5]  ^ d[6]  ^ d[7]
	      ^ d[8]  ^ d[9]  ^ d[10] ^ d[11] ^ d[12] ^ d[13] ^ d[14] ^ d[15]
	      ^ d[16] ^ d[17] ^ d[18] ^ d[19] ^ d[20] ^ d[21] ^ d[22] ^ d[23]
	      ^ d[24] ^ d[25] ^ d[26] ^ d[27] ^ d[28] ^ d[29] ^ d[30] ^ d[31]; 

endmodule // zzpar32



////////////////////////////////////////////////////////////////////////////////
// 28 bit parity tree

module zzpar28 ( z, d );
   input  [27:0] d;
   output        z;

   assign  z =  d[0]  ^ d[1]  ^ d[2]  ^ d[3]  ^ d[4]  ^ d[5]  ^ d[6]  ^ d[7]
	      ^ d[8]  ^ d[9]  ^ d[10] ^ d[11] ^ d[12] ^ d[13] ^ d[14] ^ d[15]
	      ^ d[16] ^ d[17] ^ d[18] ^ d[19] ^ d[20] ^ d[21] ^ d[22] ^ d[23]
	      ^ d[24] ^ d[25] ^ d[26] ^ d[27]; 

endmodule // zzpar28



////////////////////////////////////////////////////////////////////////////////
// 16 bit parity tree

module zzpar16 ( z, d );
   input  [15:0] d;
   output        z;

   assign z = d[0] ^ d[1] ^ d[2]  ^ d[3]  ^ d[4]  ^ d[5]  ^ d[6]  ^ d[7]
	    ^ d[8] ^ d[9] ^ d[10] ^ d[11] ^ d[12] ^ d[13] ^ d[14] ^ d[15]; 
   
endmodule // zzpar16



////////////////////////////////////////////////////////////////////////////////
// 8 bit parity tree

module zzpar8 ( z, d );
   input  [7:0] d;
   output       z;

   assign  z =  d[0] ^ d[1] ^ d[2] ^ d[3] ^ d[4] ^ d[5] ^ d[6] ^ d[7]; 

endmodule // zzpar8



////////////////////////////////////////////////////////////////////////////////
//    64 -> 6 priority encoder
//    Bit 63 has the highest priority

module zzpenc64 (/*AUTOARG*/
   // Outputs
   z, 
   // Inputs
  a 
   );

   input [63:0] a;
   output [5:0] z;

   integer      i;
   reg  [5:0]   z;

     always @ (a)
     begin
          z = 6'b0;
          for (i=0;i<64;i=i+1)
               if (a[i])
                      z = i;
     end

endmodule // zzpenc64

////////////////////////////////////////////////////////////////////////////////
//    4-bit 60x buffers

module zzbufh_60x4 (/*AUTOARG*/
   // Outputs
   z,
   // Inputs
  a
   );

   input [3:0] a;
   output [3:0] z;

   assign z = a;

endmodule //zzbufh_60x4

// LVT modules added below

module zzadd64_lv ( rs1_data, rs2_data, cin, adder_out, cout32, cout64 );

   input [63:0]  rs1_data;   // 1st input operand
   input [63:0]  rs2_data;   // 2nd input operand
   input         cin;        // carry in

   output [63:0] adder_out;  // result of adder
   output        cout32;     // carry out from lower 32 bit add
   output        cout64;     // carry out from 64 bit add

   assign {cout32, adder_out[31:0]}  = rs1_data[31:0]  + rs2_data[31:0]  + cin;
   assign {cout64, adder_out[63:32]} = rs1_data[63:32] + rs2_data[63:32] + cout32;

endmodule // zzadd64_lv

module zzpar8_lv ( z, d );
   input  [7:0] d;
   output       z;

   assign  z =  d[0] ^ d[1] ^ d[2] ^ d[3] ^ d[4] ^ d[5] ^ d[6] ^ d[7]; 

endmodule // zzpar8_lv


module zzpar32_lv ( z, d );
   input  [31:0] d;
   output        z;

   assign  z =  d[0]  ^ d[1]  ^ d[2]  ^ d[3]  ^ d[4]  ^ d[5]  ^ d[6]  ^ d[7]
              ^ d[8]  ^ d[9]  ^ d[10] ^ d[11] ^ d[12] ^ d[13] ^ d[14] ^ d[15]
              ^ d[16] ^ d[17] ^ d[18] ^ d[19] ^ d[20] ^ d[21] ^ d[22] ^ d[23]
              ^ d[24] ^ d[25] ^ d[26] ^ d[27] ^ d[28] ^ d[29] ^ d[30] ^ d[31];

endmodule // zzpar32_lv



module zznor64_32_lv ( znor64, znor32, a );
  input  [63:0] a;
  output        znor64;
  output        znor32;

  assign znor32 =  ~(a[0]  | a[1]  | a[2]  | a[3]  | a[4]  | a[5]  | a[6]  | a[7]
		   | a[8]  | a[9]  | a[10] | a[11] | a[12] | a[13] | a[14] | a[15]
		   | a[16] | a[17] | a[18] | a[19] | a[20] | a[21] | a[22] | a[23]
		   | a[24] | a[25] | a[26] | a[27] | a[28] | a[29] | a[30] | a[31]); 

  assign znor64 =  ~(a[0]  | a[1]  | a[2]  | a[3]  | a[4]  | a[5]  | a[6]  | a[7]
		   | a[8]  | a[9]  | a[10] | a[11] | a[12] | a[13] | a[14] | a[15]
		   | a[16] | a[17] | a[18] | a[19] | a[20] | a[21] | a[22] | a[23]
		   | a[24] | a[25] | a[26] | a[27] | a[28] | a[29] | a[30] | a[31] 
		   | a[32] | a[33] | a[34] | a[35] | a[36] | a[37] | a[38] | a[39] 
		   | a[40] | a[41] | a[42] | a[43] | a[44] | a[45] | a[46] | a[47] 
		   | a[48] | a[49] | a[50] | a[51] | a[52] | a[53] | a[54] | a[55] 
		   | a[56] | a[57] | a[58] | a[59] | a[60] | a[61] | a[62] | a[63]);

endmodule // zznor64_32_lv

////////////////////////////////////////////////////////////////////////////////
//    64 -> 6 priority encoder
//    Bit 63 has the highest priority
//    LVT version

module zzpenc64_lv (/*AUTOARG*/
   // Outputs
   z,
   // Inputs
  a
   );

   input [63:0] a;
   output [5:0] z;

   integer      i;
   reg  [5:0]   z;

     always @ (a)
     begin
          z = 6'b0;
          for (i=0;i<64;i=i+1)
               if (a[i])
                      z = i;
     end

endmodule // zzpenc64_lv

////////////////////////////////////////////////////////////////////////////////
// 36 bit or gate
// LVT version

module zzor36_lv ( z, a );
  input  [35:0] a;
  output        z;

  assign z =  (a[0]  | a[1]  | a[2]  | a[3]  | a[4]  | a[5]  | a[6]  | a[7]
             | a[8]  | a[9]  | a[10] | a[11] | a[12] | a[13] | a[14] | a[15]
             | a[16] | a[17] | a[18] | a[19] | a[20] | a[21] | a[22] | a[23]
             | a[24] | a[25] | a[26] | a[27] | a[28] | a[29] | a[30] | a[31]
             | a[32] | a[33] | a[34] | a[35]);

endmodule // zzor36_lv

////////////////////////////////////////////////////////////////////////////////
// 34 bit parity tree
// LVT version

module zzpar34_lv ( z, d );
   input  [33:0] d;
   output        z;

   assign  z =  d[0]  ^ d[1]  ^ d[2]  ^ d[3]  ^ d[4]  ^ d[5]  ^ d[6]  ^ d[7]
              ^ d[8]  ^ d[9]  ^ d[10] ^ d[11] ^ d[12] ^ d[13] ^ d[14] ^ d[15]
              ^ d[16] ^ d[17] ^ d[18] ^ d[19] ^ d[20] ^ d[21] ^ d[22] ^ d[23]
              ^ d[24] ^ d[25] ^ d[26] ^ d[27] ^ d[28] ^ d[29] ^ d[30] ^ d[31]
              ^ d[32] ^ d[33];

endmodule // zzpar34_lv


// ========== Copyright Header Begin ============================================
// Copyright (c) 2015 Princeton University
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// ========== Copyright Header End ============================================





































































    
    
    
    
    
    

    
    
    
    
    
    
    
    

// ========== Copyright Header Begin ============================================
// Copyright (c) 2015 Princeton University
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// ========== Copyright Header End ============================================






// ========== Copyright Header Begin ============================================
// Copyright (c) 2015 Princeton University
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// ========== Copyright Header End ============================================





   // PITON_BOARD
    





   // PITON_BOARD
    


   // PITONSYS_UART_BOOT
        
        
    
  // PITON_BOARD



















// see network_define.v for used defines




// `define PC_BLK_IN_STRG_BLK      `STRG_BLK_WIDTH/`PC_BLK_WIDTH














   // 64-bit interface by default
    
    






















// Copyright (c) 2015 Princeton University
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

// Filename: chip_rst_seq.v
// Author: mmckeown
// Description: Generates chip reset sequence for bootup

module chip_rst_seq(
    input                   clk,
    input                   rst_n,
    input                   ref_clk_locked,
    input                   chip_clk_locked,

    output                  pll_rst_n,
    output                  chip_rst_n,
    output                  jtag_rst_n,

    output                  piton_ready_n   
);

///////////////////////
// Type declarations //
///////////////////////

wire                        piton_ready;

//////////////////////
// Sequential Logic //
//////////////////////

/////////////////////////
// Combinational Logic //
/////////////////////////

// Chip JTAG and JTAG resets can be the same,
// don't see any reason that cannot be
assign jtag_rst_n = chip_rst_n;

// Invert sense of piton_ready
assign piton_ready_n = ~piton_ready;

//////////////////////////
// Sub-module Instances //
//////////////////////////

// Hold PLL in reset for 100 core_ref_clk cycles
alarm_counter #(.COUNTER_WIDTH(7), .ALARM_THRESHOLD(7'd100)) pll_rst_alarm_counter(
    .clk (clk),
    .rst_n (rst_n),
    .en (ref_clk_locked),
    .trigger (pll_rst_n)
);

// Hold chip and chip JTAG in reset for 1000 cycles
alarm_counter #(.COUNTER_WIDTH(10), .ALARM_THRESHOLD(10'd1000)) chip_jtag_rst_alarm_counter(
    .clk (clk),
    .rst_n (rst_n),
    .en (chip_clk_locked),
    .trigger (chip_rst_n)
);

// Wait 10,000 cycles for chip to be ready
alarm_counter #(.COUNTER_WIDTH(14), .ALARM_THRESHOLD(14'd10000)) piton_ready_alarm_counter (
    .clk (clk),
    .rst_n (rst_n),
    .en (chip_rst_n),
    .trigger (piton_ready)
);

endmodule
// Copyright (c) 2015 Princeton University
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

/*
 * Filename: alarm_counter.v
 * Description: Counts parameterizable number of cycles and
 *              raises a trigger signal
 * Author: Michael McKeown
 * Date Created: 2/5/2106
 */

module alarm_counter 
(
    input       clk,
    input       rst_n,
    input       en,
    output reg  trigger
);

/*********************/
/* Type declarations */
/*********************/

parameter COUNTER_WIDTH = 7;
parameter ALARM_THRESHOLD = 7'd100;

reg [COUNTER_WIDTH-1:0] count_f, count_next;

/********************/
/* Sequential Logic */
/********************/

always @ (posedge clk)
begin
    if (~rst_n)
        count_f <= {COUNTER_WIDTH{1'b0}};
    else if (en)
        count_f <= count_next;
end

/***********************/
/* Combinational Logic */
/***********************/

always @ *
begin
    if (count_f <= ALARM_THRESHOLD)
    begin
        count_next = count_f + 1'b1;
        trigger = 1'b0;
    end
    else
    begin
        count_next = count_f;
        trigger = 1'b1;
    end
end

/************************/
/* Sub-module Instances */
/************************/

endmodule
/*
Copyright (c) 2015 Princeton University
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

/********************************************************************
 * Author: Sam Payne
 * 
 * Module encapsulates an asynchronus FIFO used for bridging signals
 * across clock domains, parameters allow for different sized modules
 * compatible with wide range of frequencies.
 *
 * * *******************************************************************/



module async_fifo 
#(
	parameter DSIZE = 64,
	parameter ASIZE = 5,
	parameter MEMSIZE = 16 // should be 2 ^ (ASIZE-1)
)
(
	rdata, 
	rempty,
	rclk,
	ren,
	wdata,
	wfull,
	wclk,
	wval,
	wreset,
	rreset
	);

//Inputs and Outputs
output  [DSIZE-1:0] 	rdata;
output			rempty;
output 			wfull;
input	[DSIZE-1:0]	wdata;
input			wval;
input			ren;
input			rclk;
input			wclk;
input 			wreset;
input			rreset;

//Internal Registers
reg	[ASIZE-1:0]	g_wptr;
reg	[ASIZE-1:0]	g_rptr;

reg	[ASIZE-1:0]	g_rsync1, g_rsync2;
reg	[ASIZE-1:0]	g_wsync1, g_wsync2;

//Memory
reg	[DSIZE-1:0] 	fifo[MEMSIZE-1:0];

wire [ASIZE-1:0] b_wptr;
wire [ASIZE-1:0] b_wptr_next;
wire [ASIZE-1:0] g_wptr_next;
wire [ASIZE-1:0] b_rptr;
wire [ASIZE-1:0] b_rptr_next;
wire [ASIZE-1:0] g_rptr_next;

/********************************************************************
COMBINATIONAL LOGIC
********************************************************************/

//convert gray to binary
assign b_wptr[ASIZE-1:0] = ({1'b0, b_wptr[ASIZE-1:1]} ^ g_wptr[ASIZE-1:0]);
assign b_rptr[ASIZE-1:0] = ({1'b0, b_rptr[ASIZE-1:1]} ^ g_rptr[ASIZE-1:0]);

//increment
assign b_wptr_next = b_wptr + 1;
assign b_rptr_next = b_rptr + 1;

//convert binary to gray
assign g_wptr_next[ASIZE-1:0] = {1'b0, b_wptr_next[ASIZE-1:1]} ^ b_wptr_next[ASIZE-1:0];
assign g_rptr_next[ASIZE-1:0] = {1'b0, b_rptr_next[ASIZE-1:1]} ^ b_rptr_next[ASIZE-1:0];

//full and empty signals
assign wfull =  (g_wptr[ASIZE-1]   != g_rsync2[ASIZE-1]  ) && 
		(g_wptr[ASIZE-2]   != g_rsync2[ASIZE-2]  ) &&
		(g_wptr[ASIZE-3:0] == g_rsync2[ASIZE-3:0]) ||
		(wreset || rreset);

assign rempty =  (g_wsync2[ASIZE-1:0] == g_rptr[ASIZE-1:0]) ||
	         (wreset || rreset);

//output values
assign rdata = fifo[b_rptr[ASIZE-2:0]];

/********************************************************************
SEQUENTIAL LOGIC
********************************************************************/

//transfer register values
always @(posedge rclk) begin
	if (rreset) begin
		g_rptr <= 0;
	end
	else if (ren && !rempty) begin
		g_rptr <= g_rptr_next;
	end

	g_wsync1 <= g_wptr;
	g_wsync2 <= g_wsync1;
end

always @(posedge wclk) begin
	if (wreset) begin
		g_wptr <= 0;
	end
	else if (wval && !wfull) begin
		fifo[b_wptr[ASIZE-2:0]] <= wdata;
		g_wptr <= g_wptr_next;
	end

	g_rsync1 <= g_rptr;
	g_rsync2 <= g_rsync1;

	
end

endmodule
// Copyright (c) 2015 Princeton University
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

// Author:      Alexey Lavrov, Tri Nguyen
// Description: A simple wrapper to infer Xilinx BRAMs for SRAMs

module bram_1rw_wrapper 
#(parameter NAME="", DEPTH=1, ADDR_WIDTH=1, BITMASK_WIDTH=1, DATA_WIDTH=1)
(
    input                         MEMCLK,
    input wire RESET_N,
    input                         CE,
    input   [ADDR_WIDTH-1:0]      A,
    input                         RDWEN,
    input   [BITMASK_WIDTH-1:0]   BW,
    input   [DATA_WIDTH-1:0]      DIN,
    output  [DATA_WIDTH-1:0]      DOUT
);

wire                            write_en;
wire                            read_en;

// Temporary storage for write data
reg                             wen_r;
reg   [ADDR_WIDTH-1:0    ]      A_r;
reg   [BITMASK_WIDTH-1:0 ]      BW_r;
reg   [DATA_WIDTH-1:0    ]      DIN_r;
reg   [DATA_WIDTH-1:0    ]      DOUT_r;

reg                             ren_r;

reg   [DATA_WIDTH-1:0    ]      bram_data_in_r;

wire                            bram_wen;
wire                            bram_ren;
reg  [DATA_WIDTH-1:0    ]      bram_data_out;
wire  [DATA_WIDTH-1:0    ]      bram_data_in;
wire  [DATA_WIDTH-1:0    ]      up_to_date_data;
wire                            rw_conflict;
reg                             rw_conflict_r;



reg   [ADDR_WIDTH-1:0    ]      WRITE_ADDRESS_REG_muxed;
reg                            bram_write_en_muxed;
reg  [DATA_WIDTH-1:0    ]      bram_data_in_muxed;

assign write_en   = CE & (RDWEN == 1'b0);
assign read_en    = CE & (RDWEN == 1'b1);


// Intermediate logic for write processing
always @(posedge MEMCLK) begin
   wen_r <= write_en;
   A_r   <= A;
   BW_r  <= BW;
   DIN_r <= DIN;
end

always @(posedge MEMCLK) begin
  ren_r  <= read_en;
end

always @(posedge MEMCLK)
   bram_data_in_r <= bram_data_in;

always @(posedge MEMCLK)
   rw_conflict_r  <= rw_conflict;

always @(posedge MEMCLK)
  DOUT_r  <= DOUT;

assign bram_data_in = (up_to_date_data & ~BW_r) | (DIN_r & BW_r);

// processing of read in case if it just in the next cycle after read to the same address
assign rw_conflict      = wen_r & CE & (A_r == A);                         // read or write to the same address
assign up_to_date_data  = rw_conflict_r ? bram_data_in_r : bram_data_out;  // delay of mem is 1 cycle
assign bram_ren         = (read_en | write_en) & ~rw_conflict;             // do not read in case of a conflict
                                                                        // to make behaviour of a memory robust
assign bram_wen      = wen_r;

assign DOUT          = ren_r ? up_to_date_data : DOUT_r;

// BRAM
reg [DATA_WIDTH-1:0] ram [DEPTH-1:0];
// reg [%d-1:0] bram_data_out;
always @(posedge MEMCLK) begin
  if (bram_write_en_muxed) begin
      ram[WRITE_ADDRESS_REG_muxed] <= bram_data_in_muxed;
  end
  if (bram_ren) begin
    bram_data_out <= ram[A];
  end
end
// END BRAM

 // undefined by default

/* BIST logic for resetting RAM content to 0s on reset*/
localparam INIT_STATE = 1'd0;
localparam DONE_STATE  = 1'd1;

reg [ADDR_WIDTH-1:0] bist_index;
reg [ADDR_WIDTH-1:0] bist_index_next;
reg init_done;
reg init_done_next;

always @ (posedge MEMCLK)
begin
   if (!RESET_N)
   begin
      bist_index <= 0;
      init_done <= 0;
   end
   else
   begin
      bist_index <= bist_index_next;
      init_done <= init_done_next;
   end
end

always @ *
begin
   bist_index_next = init_done ? bist_index : bist_index + 1;
   init_done_next = ((|(~bist_index)) == 0) | init_done;
end

// MUX for BIST
always @ *
begin
   if (!init_done)
   begin
      WRITE_ADDRESS_REG_muxed = bist_index;
      bram_write_en_muxed = 1'b1;
      bram_data_in_muxed = {DATA_WIDTH{1'b0}};
   end
   else
   begin
      WRITE_ADDRESS_REG_muxed = A_r;
      bram_write_en_muxed = bram_wen;
      bram_data_in_muxed = bram_data_in;
   end
end













endmodule
// Copyright (c) 2015 Princeton University
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

// Author:      Alexey Lavrov, Tri Nguyen
// Description: A simple wrapper to infer Xilinx BRAMs for SRAMs, modified to be synthesizable

module bram_1r1w_wrapper 
#(parameter NAME="", DEPTH=1, ADDR_WIDTH=1, BITMASK_WIDTH=1, DATA_WIDTH=1)
(
  input wire MEMCLK,
  input wire RESET_N,
  input wire CEA,
  input wire [ADDR_WIDTH-1:0] AA,
  input wire [ADDR_WIDTH-1:0] AB,

  input wire RDWENA,
  input wire CEB,
  input wire RDWENB,
  input wire [DATA_WIDTH-1:0] BWA,
  input wire [DATA_WIDTH-1:0] DINA,
  output reg [DATA_WIDTH-1:0] DOUTA,
  input wire [DATA_WIDTH-1:0] BWB,
  input wire [DATA_WIDTH-1:0] DINB,
  output wire [DATA_WIDTH-1:0] DOUTB
  // input wire [`BIST_OP_WIDTH-1:0] BIST_COMMAND,
  // input wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] BIST_DIN,
  // output reg [`SRAM_WRAPPER_BUS_WIDTH-1:0] BIST_DOUT,
  // input wire [`BIST_ID_WIDTH-1:0] SRAMID
);

wire                            write_enable_in;
wire                            read_enable_in;

// Temporary storage for write data
reg                             write_enable_in_reg;
reg   [ADDR_WIDTH-1:0    ]      WRITE_ADDRESS_REG;
reg   [ADDR_WIDTH-1:0    ]      WRITE_ADDRESS_REG_muxed;
reg   [BITMASK_WIDTH-1:0 ]      WRITE_BIT_MASK_REG;
reg   [DATA_WIDTH-1:0    ]      DIN_r;
// reg   [DATA_WIDTH-1:0    ]      DOUTB_r;

reg                             read_enable_in_reg;

reg   [DATA_WIDTH-1:0    ]      bram_data_in_r;

wire                            bram_write_en;
reg                            bram_write_en_muxed;
wire                            bram_read_en;
wire                            bram_write_read_en;
reg  [DATA_WIDTH-1:0    ]      bram_data_write_read_out_reg;
reg  [DATA_WIDTH-1:0    ]      bram_data_read_out_reg;
reg  [DATA_WIDTH-1:0    ]      bram_data_in;
reg  [DATA_WIDTH-1:0    ]      bram_data_in_muxed;
wire  [DATA_WIDTH-1:0    ]      last_wrote_data;
wire                            rw_conflict;
reg                             rw_conflict_r;
wire                            ww_conflict;
reg                             ww_conflict_r;

/* renaming signals */
assign read_enable_in    = CEA & (RDWENA == 1'b1);
assign write_enable_in   = CEB & (RDWENB == 1'b0);
wire [ADDR_WIDTH-1:0    ] READ_ADDRESS = AA;
wire [ADDR_WIDTH-1:0    ] WRITE_ADDRESS = AB;
wire [BITMASK_WIDTH-1:0    ] WRITE_BIT_MASK = BWB;

// Intermediate logic for write processing
always @(posedge MEMCLK) begin
  write_enable_in_reg <= write_enable_in;
  WRITE_ADDRESS_REG   <= WRITE_ADDRESS;
  WRITE_BIT_MASK_REG  <= WRITE_BIT_MASK;
  DIN_r <= DINB;
  read_enable_in_reg  <= read_enable_in;
  bram_data_in_r <= bram_data_in;
  rw_conflict_r  <= rw_conflict;
  ww_conflict_r  <= ww_conflict;
  // DOUTB_r  <= DOUTB;
end

// determining read-write and write-write conflict for data bypassing
assign rw_conflict      = write_enable_in_reg & read_enable_in & (WRITE_ADDRESS_REG == READ_ADDRESS);
assign ww_conflict      = write_enable_in_reg & write_enable_in & (WRITE_ADDRESS_REG == WRITE_ADDRESS);
assign DOUTB = {DATA_WIDTH{1'bx}}; // port B is always used for write

// calculate the correct read and write data after accoutning for conflicts
always @ * begin
  bram_data_in = (DIN_r & WRITE_BIT_MASK_REG);
  if (ww_conflict_r)
    bram_data_in = bram_data_in | (bram_data_in_r & ~WRITE_BIT_MASK_REG);
  else
    bram_data_in = bram_data_in | (bram_data_write_read_out_reg & ~WRITE_BIT_MASK_REG);
  

  // note: DOUT retains value if read enable is not asserted
  // which is why default value is not set for DOUT
  if (read_enable_in_reg) begin
    DOUTA = bram_data_read_out_reg; 
    if (rw_conflict_r) begin
      DOUTA = bram_data_in_r;
    end
  end
end

// synthesizable BRAM
assign bram_write_en      = write_enable_in_reg;
assign bram_read_en         = (read_enable_in) & ~rw_conflict;             // do not read in case of a conflict
assign bram_write_read_en         = (write_enable_in) & ~ww_conflict;             // do not read in case of a conflict

reg [DATA_WIDTH-1:0] ram [DEPTH-1:0];
// reg [%d-1:0] bram_data_write_read_out_reg;
always @(posedge MEMCLK) begin
  if (bram_write_en_muxed) begin
    ram[WRITE_ADDRESS_REG_muxed] <= bram_data_in_muxed;
  end
  if (bram_read_en) begin
    bram_data_read_out_reg <= ram[READ_ADDRESS];
  end
  if (bram_write_read_en) begin
    bram_data_write_read_out_reg <= ram[WRITE_ADDRESS];
  end
end
// END BRAM


/* BIST logic for resetting RAM content to 0s on reset*/
localparam INIT_STATE = 1'd0;
localparam DONE_STATE  = 1'd1;

reg [ADDR_WIDTH-1:0] bist_index;
reg [ADDR_WIDTH-1:0] bist_index_next;
reg init_done;
reg init_done_next;

always @ (posedge MEMCLK)
begin
   if (!RESET_N)
   begin
      bist_index <= 0;
      init_done <= 0;
   end
   else
   begin
      bist_index <= bist_index_next;
      init_done <= init_done_next;
   end
end

always @ *
begin
   bist_index_next = init_done ? bist_index : bist_index + 1;
   init_done_next = ((|(~bist_index)) == 0) | init_done;
end

// MUX for BIST
always @ *
begin
   if (!init_done)
   begin
      WRITE_ADDRESS_REG_muxed = bist_index;
      bram_write_en_muxed = 1'b1;
      bram_data_in_muxed = {DATA_WIDTH{1'b0}};
   end
   else
   begin
      WRITE_ADDRESS_REG_muxed = WRITE_ADDRESS_REG;
      bram_write_en_muxed = bram_write_en;
      bram_data_in_muxed = bram_data_in;
   end
end


endmodule
