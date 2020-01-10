// Generator : SpinalHDL v1.3.6    git head : 9bf01e7f360e003fac1dd5ca8b8f4bffec0e52b8
// Date      : 09/01/2020, 13:39:25
// Component : VexRiscv


`define AluBitwiseCtrlEnum_defaultEncoding_type [1:0]
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 2'b00
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 2'b01
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 2'b10

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

`define EnvCtrlEnum_defaultEncoding_type [0:0]
`define EnvCtrlEnum_defaultEncoding_NONE 1'b0
`define EnvCtrlEnum_defaultEncoding_XRET 1'b1

`define BranchCtrlEnum_defaultEncoding_type [1:0]
`define BranchCtrlEnum_defaultEncoding_INC 2'b00
`define BranchCtrlEnum_defaultEncoding_B 2'b01
`define BranchCtrlEnum_defaultEncoding_JAL 2'b10
`define BranchCtrlEnum_defaultEncoding_JALR 2'b11

`define ShiftCtrlEnum_defaultEncoding_type [1:0]
`define ShiftCtrlEnum_defaultEncoding_DISABLE_1 2'b00
`define ShiftCtrlEnum_defaultEncoding_SLL_1 2'b01
`define ShiftCtrlEnum_defaultEncoding_SRL_1 2'b10
`define ShiftCtrlEnum_defaultEncoding_SRA_1 2'b11

`define Src2CtrlEnum_defaultEncoding_type [1:0]
`define Src2CtrlEnum_defaultEncoding_RS 2'b00
`define Src2CtrlEnum_defaultEncoding_IMI 2'b01
`define Src2CtrlEnum_defaultEncoding_IMS 2'b10
`define Src2CtrlEnum_defaultEncoding_PC 2'b11

`define Src1CtrlEnum_defaultEncoding_type [1:0]
`define Src1CtrlEnum_defaultEncoding_RS 2'b00
`define Src1CtrlEnum_defaultEncoding_IMU 2'b01
`define Src1CtrlEnum_defaultEncoding_PC_INCREMENT 2'b10
`define Src1CtrlEnum_defaultEncoding_URS1 2'b11

module StreamFifoLowLatency (
      input   io_push_valid,
      output  io_push_ready,
      input   io_push_payload_error,
      input  [31:0] io_push_payload_inst,
      output reg  io_pop_valid,
      input   io_pop_ready,
      output reg  io_pop_payload_error,
      output reg [31:0] io_pop_payload_inst,
      input   io_flush,
      output [0:0] io_occupancy,
      input   clk,
      input   reset);
  wire  _zz_5_;
  wire [0:0] _zz_6_;
  reg  _zz_1_;
  reg  pushPtr_willIncrement;
  reg  pushPtr_willClear;
  wire  pushPtr_willOverflowIfInc;
  wire  pushPtr_willOverflow;
  reg  popPtr_willIncrement;
  reg  popPtr_willClear;
  wire  popPtr_willOverflowIfInc;
  wire  popPtr_willOverflow;
  wire  ptrMatch;
  reg  risingOccupancy;
  wire  empty;
  wire  full;
  wire  pushing;
  wire  popping;
  wire [32:0] _zz_2_;
  wire [32:0] _zz_3_;
  reg [32:0] _zz_4_;
  assign _zz_5_ = (! empty);
  assign _zz_6_ = _zz_2_[0 : 0];
  always @ (*) begin
    _zz_1_ = 1'b0;
    if(pushing)begin
      _zz_1_ = 1'b1;
    end
  end

  always @ (*) begin
    pushPtr_willIncrement = 1'b0;
    if(pushing)begin
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    pushPtr_willClear = 1'b0;
    if(io_flush)begin
      pushPtr_willClear = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = 1'b1;
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @ (*) begin
    popPtr_willIncrement = 1'b0;
    if(popping)begin
      popPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    popPtr_willClear = 1'b0;
    if(io_flush)begin
      popPtr_willClear = 1'b1;
    end
  end

  assign popPtr_willOverflowIfInc = 1'b1;
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  assign ptrMatch = 1'b1;
  assign empty = (ptrMatch && (! risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign pushing = (io_push_valid && io_push_ready);
  assign popping = (io_pop_valid && io_pop_ready);
  assign io_push_ready = (! full);
  always @ (*) begin
    if(_zz_5_)begin
      io_pop_valid = 1'b1;
    end else begin
      io_pop_valid = io_push_valid;
    end
  end

  assign _zz_2_ = _zz_3_;
  always @ (*) begin
    if(_zz_5_)begin
      io_pop_payload_error = _zz_6_[0];
    end else begin
      io_pop_payload_error = io_push_payload_error;
    end
  end

  always @ (*) begin
    if(_zz_5_)begin
      io_pop_payload_inst = _zz_2_[32 : 1];
    end else begin
      io_pop_payload_inst = io_push_payload_inst;
    end
  end

  assign io_occupancy = (risingOccupancy && ptrMatch);
  assign _zz_3_ = _zz_4_;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      risingOccupancy <= 1'b0;
    end else begin
      if((pushing != popping))begin
        risingOccupancy <= pushing;
      end
      if(io_flush)begin
        risingOccupancy <= 1'b0;
      end
    end
  end

  always @ (posedge clk) begin
    if(_zz_1_)begin
      _zz_4_ <= {io_push_payload_inst,io_push_payload_error};
    end
  end

endmodule

module VexRiscv (
      output  iBus_cmd_valid,
      input   iBus_cmd_ready,
      output [31:0] iBus_cmd_payload_pc,
      input   iBus_rsp_valid,
      input   iBus_rsp_payload_error,
      input  [31:0] iBus_rsp_payload_inst,
      input   timerInterrupt,
      input   externalInterrupt,
      input   softwareInterrupt,
      output  dBus_cmd_valid,
      input   dBus_cmd_ready,
      output  dBus_cmd_payload_wr,
      output [31:0] dBus_cmd_payload_address,
      output [31:0] dBus_cmd_payload_data,
      output [1:0] dBus_cmd_payload_size,
      input   dBus_rsp_ready,
      input   dBus_rsp_error,
      input  [31:0] dBus_rsp_data,
      input   clk,
      input   reset);
  reg [31:0] _zz_134_;
  reg [31:0] _zz_135_;
  wire  IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready;
  wire  IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid;
  wire  IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  wire [31:0] IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  wire [0:0] IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy;
  wire  _zz_136_;
  wire  _zz_137_;
  wire  _zz_138_;
  wire  _zz_139_;
  wire  _zz_140_;
  wire [1:0] _zz_141_;
  wire  _zz_142_;
  wire  _zz_143_;
  wire  _zz_144_;
  wire  _zz_145_;
  wire  _zz_146_;
  wire  _zz_147_;
  wire  _zz_148_;
  wire  _zz_149_;
  wire  _zz_150_;
  wire  _zz_151_;
  wire [1:0] _zz_152_;
  wire  _zz_153_;
  wire [1:0] _zz_154_;
  wire [1:0] _zz_155_;
  wire [2:0] _zz_156_;
  wire [31:0] _zz_157_;
  wire [2:0] _zz_158_;
  wire [0:0] _zz_159_;
  wire [2:0] _zz_160_;
  wire [0:0] _zz_161_;
  wire [2:0] _zz_162_;
  wire [0:0] _zz_163_;
  wire [2:0] _zz_164_;
  wire [0:0] _zz_165_;
  wire [2:0] _zz_166_;
  wire [0:0] _zz_167_;
  wire [0:0] _zz_168_;
  wire [0:0] _zz_169_;
  wire [0:0] _zz_170_;
  wire [0:0] _zz_171_;
  wire [0:0] _zz_172_;
  wire [0:0] _zz_173_;
  wire [0:0] _zz_174_;
  wire [0:0] _zz_175_;
  wire [0:0] _zz_176_;
  wire [0:0] _zz_177_;
  wire [0:0] _zz_178_;
  wire [2:0] _zz_179_;
  wire [4:0] _zz_180_;
  wire [11:0] _zz_181_;
  wire [11:0] _zz_182_;
  wire [31:0] _zz_183_;
  wire [31:0] _zz_184_;
  wire [31:0] _zz_185_;
  wire [31:0] _zz_186_;
  wire [31:0] _zz_187_;
  wire [31:0] _zz_188_;
  wire [31:0] _zz_189_;
  wire [31:0] _zz_190_;
  wire [32:0] _zz_191_;
  wire [19:0] _zz_192_;
  wire [11:0] _zz_193_;
  wire [11:0] _zz_194_;
  wire [0:0] _zz_195_;
  wire [0:0] _zz_196_;
  wire [0:0] _zz_197_;
  wire [0:0] _zz_198_;
  wire [0:0] _zz_199_;
  wire [0:0] _zz_200_;
  wire  _zz_201_;
  wire  _zz_202_;
  wire [31:0] _zz_203_;
  wire  _zz_204_;
  wire  _zz_205_;
  wire [0:0] _zz_206_;
  wire [0:0] _zz_207_;
  wire [1:0] _zz_208_;
  wire [1:0] _zz_209_;
  wire  _zz_210_;
  wire [0:0] _zz_211_;
  wire [18:0] _zz_212_;
  wire [31:0] _zz_213_;
  wire [31:0] _zz_214_;
  wire [31:0] _zz_215_;
  wire [31:0] _zz_216_;
  wire [31:0] _zz_217_;
  wire [31:0] _zz_218_;
  wire [0:0] _zz_219_;
  wire [3:0] _zz_220_;
  wire  _zz_221_;
  wire [1:0] _zz_222_;
  wire [1:0] _zz_223_;
  wire  _zz_224_;
  wire [0:0] _zz_225_;
  wire [15:0] _zz_226_;
  wire [31:0] _zz_227_;
  wire [31:0] _zz_228_;
  wire [31:0] _zz_229_;
  wire [0:0] _zz_230_;
  wire [0:0] _zz_231_;
  wire [31:0] _zz_232_;
  wire [31:0] _zz_233_;
  wire [31:0] _zz_234_;
  wire [31:0] _zz_235_;
  wire  _zz_236_;
  wire [0:0] _zz_237_;
  wire [0:0] _zz_238_;
  wire [0:0] _zz_239_;
  wire [0:0] _zz_240_;
  wire  _zz_241_;
  wire [0:0] _zz_242_;
  wire [12:0] _zz_243_;
  wire [31:0] _zz_244_;
  wire [31:0] _zz_245_;
  wire [31:0] _zz_246_;
  wire [31:0] _zz_247_;
  wire  _zz_248_;
  wire  _zz_249_;
  wire [0:0] _zz_250_;
  wire [0:0] _zz_251_;
  wire [0:0] _zz_252_;
  wire [0:0] _zz_253_;
  wire  _zz_254_;
  wire [0:0] _zz_255_;
  wire [9:0] _zz_256_;
  wire [31:0] _zz_257_;
  wire [31:0] _zz_258_;
  wire [31:0] _zz_259_;
  wire [31:0] _zz_260_;
  wire [31:0] _zz_261_;
  wire [0:0] _zz_262_;
  wire [0:0] _zz_263_;
  wire [1:0] _zz_264_;
  wire [1:0] _zz_265_;
  wire  _zz_266_;
  wire [0:0] _zz_267_;
  wire [6:0] _zz_268_;
  wire [31:0] _zz_269_;
  wire [31:0] _zz_270_;
  wire [31:0] _zz_271_;
  wire [31:0] _zz_272_;
  wire [31:0] _zz_273_;
  wire [0:0] _zz_274_;
  wire [1:0] _zz_275_;
  wire [1:0] _zz_276_;
  wire [1:0] _zz_277_;
  wire  _zz_278_;
  wire [0:0] _zz_279_;
  wire [3:0] _zz_280_;
  wire [31:0] _zz_281_;
  wire [31:0] _zz_282_;
  wire [31:0] _zz_283_;
  wire [31:0] _zz_284_;
  wire [31:0] _zz_285_;
  wire [31:0] _zz_286_;
  wire [31:0] _zz_287_;
  wire [31:0] _zz_288_;
  wire [31:0] _zz_289_;
  wire [0:0] _zz_290_;
  wire [2:0] _zz_291_;
  wire [1:0] _zz_292_;
  wire [1:0] _zz_293_;
  wire  _zz_294_;
  wire [0:0] _zz_295_;
  wire [0:0] _zz_296_;
  wire [31:0] _zz_297_;
  wire [31:0] _zz_298_;
  wire [31:0] _zz_299_;
  wire  _zz_300_;
  wire [31:0] _zz_301_;
  wire [31:0] _zz_302_;
  wire [31:0] _zz_303_;
  wire [31:0] _zz_304_;
  wire  _zz_305_;
  wire [31:0] decode_SRC1;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_1_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_2_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_3_;
  wire [31:0] execute_BRANCH_CALC;
  wire [31:0] decode_RS2;
  wire `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type _zz_4_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_5_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_6_;
  wire  decode_CSR_WRITE_OPCODE;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_7_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_8_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_9_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_10_;
  wire `EnvCtrlEnum_defaultEncoding_type decode_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_11_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_12_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_13_;
  wire  decode_MEMORY_ENABLE;
  wire `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_14_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_15_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_16_;
  wire [1:0] memory_MEMORY_ADDRESS_LOW;
  wire [1:0] execute_MEMORY_ADDRESS_LOW;
  wire [31:0] writeBack_REGFILE_WRITE_DATA;
  wire [31:0] execute_REGFILE_WRITE_DATA;
  wire [31:0] decode_SRC2;
  wire  decode_CSR_READ_OPCODE;
  wire  decode_SRC_LESS_UNSIGNED;
  wire [31:0] memory_PC;
  wire  decode_MEMORY_STORE;
  wire [31:0] writeBack_FORMAL_PC_NEXT;
  wire [31:0] memory_FORMAL_PC_NEXT;
  wire [31:0] execute_FORMAL_PC_NEXT;
  wire [31:0] decode_FORMAL_PC_NEXT;
  wire [31:0] memory_MEMORY_READ_DATA;
  wire `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_17_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_18_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_19_;
  wire  decode_BYPASSABLE_EXECUTE_STAGE;
  wire [31:0] decode_RS1;
  wire  decode_IS_CSR;
  wire  execute_BRANCH_DO;
  wire  decode_SRC2_FORCE_ZERO;
  wire  execute_BYPASSABLE_MEMORY_STAGE;
  wire  decode_BYPASSABLE_MEMORY_STAGE;
  wire [31:0] memory_BRANCH_CALC;
  wire  memory_BRANCH_DO;
  wire [31:0] _zz_20_;
  wire [31:0] execute_PC;
  wire [31:0] execute_RS1;
  wire `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_21_;
  wire  _zz_22_;
  wire  decode_RS2_USE;
  wire  decode_RS1_USE;
  wire  execute_REGFILE_WRITE_VALID;
  wire  execute_BYPASSABLE_EXECUTE_STAGE;
  wire  memory_REGFILE_WRITE_VALID;
  wire [31:0] memory_INSTRUCTION;
  wire  memory_BYPASSABLE_MEMORY_STAGE;
  wire  writeBack_REGFILE_WRITE_VALID;
  wire [31:0] memory_REGFILE_WRITE_DATA;
  wire `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_23_;
  wire  _zz_24_;
  wire [31:0] _zz_25_;
  wire [31:0] _zz_26_;
  wire  execute_SRC_LESS_UNSIGNED;
  wire  execute_SRC2_FORCE_ZERO;
  wire  execute_SRC_USE_SUB_LESS;
  wire [31:0] _zz_27_;
  wire [31:0] _zz_28_;
  wire `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_29_;
  wire [31:0] _zz_30_;
  wire [31:0] _zz_31_;
  wire `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_32_;
  wire [31:0] _zz_33_;
  wire  decode_SRC_USE_SUB_LESS;
  wire  decode_SRC_ADD_ZERO;
  wire  _zz_34_;
  wire [31:0] execute_SRC_ADD_SUB;
  wire  execute_SRC_LESS;
  wire `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type _zz_35_;
  wire [31:0] _zz_36_;
  wire [31:0] execute_SRC2;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_37_;
  wire [31:0] _zz_38_;
  wire  _zz_39_;
  reg  _zz_40_;
  wire [31:0] _zz_41_;
  wire [31:0] _zz_42_;
  wire [31:0] decode_INSTRUCTION_ANTICIPATED;
  reg  decode_REGFILE_WRITE_VALID;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_43_;
  wire  _zz_44_;
  wire  _zz_45_;
  wire  _zz_46_;
  wire  _zz_47_;
  wire  _zz_48_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_49_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_50_;
  wire  _zz_51_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_52_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_53_;
  wire  _zz_54_;
  wire  _zz_55_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_56_;
  wire  _zz_57_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_58_;
  wire  _zz_59_;
  wire  _zz_60_;
  reg [31:0] _zz_61_;
  wire [31:0] execute_SRC1;
  wire  execute_CSR_READ_OPCODE;
  wire  execute_CSR_WRITE_OPCODE;
  wire  execute_IS_CSR;
  wire `EnvCtrlEnum_defaultEncoding_type memory_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_62_;
  wire `EnvCtrlEnum_defaultEncoding_type execute_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_63_;
  wire  _zz_64_;
  wire  _zz_65_;
  wire `EnvCtrlEnum_defaultEncoding_type writeBack_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_66_;
  wire  writeBack_MEMORY_STORE;
  reg [31:0] _zz_67_;
  wire  writeBack_MEMORY_ENABLE;
  wire [1:0] writeBack_MEMORY_ADDRESS_LOW;
  wire [31:0] writeBack_MEMORY_READ_DATA;
  wire  memory_MEMORY_STORE;
  wire  memory_MEMORY_ENABLE;
  wire [31:0] _zz_68_;
  wire [31:0] execute_SRC_ADD;
  wire [1:0] _zz_69_;
  wire [31:0] execute_RS2;
  wire [31:0] execute_INSTRUCTION;
  wire  execute_MEMORY_STORE;
  wire  execute_MEMORY_ENABLE;
  wire  execute_ALIGNEMENT_FAULT;
  reg [31:0] _zz_70_;
  wire [31:0] decode_PC;
  wire [31:0] _zz_71_;
  wire [31:0] _zz_72_;
  wire [31:0] _zz_73_;
  wire [31:0] decode_INSTRUCTION;
  wire [31:0] _zz_74_;
  wire [31:0] writeBack_PC;
  wire [31:0] writeBack_INSTRUCTION;
  wire  decode_arbitration_haltItself;
  reg  decode_arbitration_haltByOther;
  reg  decode_arbitration_removeIt;
  wire  decode_arbitration_flushIt;
  wire  decode_arbitration_flushNext;
  wire  decode_arbitration_isValid;
  wire  decode_arbitration_isStuck;
  wire  decode_arbitration_isStuckByOthers;
  wire  decode_arbitration_isFlushed;
  wire  decode_arbitration_isMoving;
  wire  decode_arbitration_isFiring;
  reg  execute_arbitration_haltItself;
  wire  execute_arbitration_haltByOther;
  reg  execute_arbitration_removeIt;
  wire  execute_arbitration_flushIt;
  wire  execute_arbitration_flushNext;
  reg  execute_arbitration_isValid;
  wire  execute_arbitration_isStuck;
  wire  execute_arbitration_isStuckByOthers;
  wire  execute_arbitration_isFlushed;
  wire  execute_arbitration_isMoving;
  wire  execute_arbitration_isFiring;
  reg  memory_arbitration_haltItself;
  wire  memory_arbitration_haltByOther;
  reg  memory_arbitration_removeIt;
  wire  memory_arbitration_flushIt;
  reg  memory_arbitration_flushNext;
  reg  memory_arbitration_isValid;
  wire  memory_arbitration_isStuck;
  wire  memory_arbitration_isStuckByOthers;
  wire  memory_arbitration_isFlushed;
  wire  memory_arbitration_isMoving;
  wire  memory_arbitration_isFiring;
  wire  writeBack_arbitration_haltItself;
  wire  writeBack_arbitration_haltByOther;
  reg  writeBack_arbitration_removeIt;
  wire  writeBack_arbitration_flushIt;
  reg  writeBack_arbitration_flushNext;
  reg  writeBack_arbitration_isValid;
  wire  writeBack_arbitration_isStuck;
  wire  writeBack_arbitration_isStuckByOthers;
  wire  writeBack_arbitration_isFlushed;
  wire  writeBack_arbitration_isMoving;
  wire  writeBack_arbitration_isFiring;
  wire [31:0] lastStageInstruction /* verilator public */ ;
  wire [31:0] lastStagePc /* verilator public */ ;
  wire  lastStageIsValid /* verilator public */ ;
  wire  lastStageIsFiring /* verilator public */ ;
  reg  IBusSimplePlugin_fetcherHalt;
  reg  IBusSimplePlugin_fetcherflushIt;
  reg  IBusSimplePlugin_incomingInstruction;
  wire  IBusSimplePlugin_pcValids_0;
  wire  IBusSimplePlugin_pcValids_1;
  wire  IBusSimplePlugin_pcValids_2;
  wire  IBusSimplePlugin_pcValids_3;
  reg  CsrPlugin_jumpInterface_valid;
  reg [31:0] CsrPlugin_jumpInterface_payload;
  wire  CsrPlugin_exceptionPendings_0;
  wire  CsrPlugin_exceptionPendings_1;
  wire  CsrPlugin_exceptionPendings_2;
  wire  CsrPlugin_exceptionPendings_3;
  wire  contextSwitching;
  reg [1:0] CsrPlugin_privilege;
  wire  CsrPlugin_forceMachineWire;
  wire  CsrPlugin_allowInterrupts;
  wire  CsrPlugin_allowException;
  wire  BranchPlugin_jumpInterface_valid;
  wire [31:0] BranchPlugin_jumpInterface_payload;
  wire  IBusSimplePlugin_jump_pcLoad_valid;
  wire [31:0] IBusSimplePlugin_jump_pcLoad_payload;
  wire [1:0] _zz_75_;
  wire  IBusSimplePlugin_fetchPc_output_valid;
  wire  IBusSimplePlugin_fetchPc_output_ready;
  wire [31:0] IBusSimplePlugin_fetchPc_output_payload;
  reg [31:0] IBusSimplePlugin_fetchPc_pcReg /* verilator public */ ;
  reg  IBusSimplePlugin_fetchPc_corrected;
  reg  IBusSimplePlugin_fetchPc_pcRegPropagate;
  reg  IBusSimplePlugin_fetchPc_booted;
  reg  IBusSimplePlugin_fetchPc_inc;
  reg [31:0] IBusSimplePlugin_fetchPc_pc;
  wire  IBusSimplePlugin_iBusRsp_stages_0_input_valid;
  wire  IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  wire [31:0] IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  wire  IBusSimplePlugin_iBusRsp_stages_0_output_valid;
  wire  IBusSimplePlugin_iBusRsp_stages_0_output_ready;
  wire [31:0] IBusSimplePlugin_iBusRsp_stages_0_output_payload;
  reg  IBusSimplePlugin_iBusRsp_stages_0_halt;
  wire  IBusSimplePlugin_iBusRsp_stages_0_inputSample;
  wire  IBusSimplePlugin_iBusRsp_stages_1_input_valid;
  wire  IBusSimplePlugin_iBusRsp_stages_1_input_ready;
  wire [31:0] IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  wire  IBusSimplePlugin_iBusRsp_stages_1_output_valid;
  wire  IBusSimplePlugin_iBusRsp_stages_1_output_ready;
  wire [31:0] IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  wire  IBusSimplePlugin_iBusRsp_stages_1_halt;
  wire  IBusSimplePlugin_iBusRsp_stages_1_inputSample;
  wire  _zz_76_;
  wire  _zz_77_;
  wire  _zz_78_;
  wire  _zz_79_;
  reg  _zz_80_;
  reg  IBusSimplePlugin_iBusRsp_readyForError;
  wire  IBusSimplePlugin_iBusRsp_inputBeforeStage_valid;
  wire  IBusSimplePlugin_iBusRsp_inputBeforeStage_ready;
  wire [31:0] IBusSimplePlugin_iBusRsp_inputBeforeStage_payload_pc;
  wire  IBusSimplePlugin_iBusRsp_inputBeforeStage_payload_rsp_error;
  wire [31:0] IBusSimplePlugin_iBusRsp_inputBeforeStage_payload_rsp_inst;
  wire  IBusSimplePlugin_iBusRsp_inputBeforeStage_payload_isRvc;
  wire  IBusSimplePlugin_injector_decodeInput_valid;
  wire  IBusSimplePlugin_injector_decodeInput_ready;
  wire [31:0] IBusSimplePlugin_injector_decodeInput_payload_pc;
  wire  IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  wire [31:0] IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  wire  IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  reg  _zz_81_;
  reg [31:0] _zz_82_;
  reg  _zz_83_;
  reg [31:0] _zz_84_;
  reg  _zz_85_;
  reg  IBusSimplePlugin_injector_nextPcCalc_valids_0;
  reg  IBusSimplePlugin_injector_nextPcCalc_valids_1;
  reg  IBusSimplePlugin_injector_nextPcCalc_valids_2;
  reg  IBusSimplePlugin_injector_nextPcCalc_valids_3;
  reg  IBusSimplePlugin_injector_nextPcCalc_valids_4;
  reg  IBusSimplePlugin_injector_decodeRemoved;
  reg [31:0] IBusSimplePlugin_injector_formal_rawInDecode;
  wire  IBusSimplePlugin_cmd_valid;
  wire  IBusSimplePlugin_cmd_ready;
  wire [31:0] IBusSimplePlugin_cmd_payload_pc;
  reg [2:0] IBusSimplePlugin_pendingCmd;
  wire [2:0] IBusSimplePlugin_pendingCmdNext;
  reg [2:0] IBusSimplePlugin_rspJoin_discardCounter;
  wire  IBusSimplePlugin_rspJoin_rspBufferOutput_valid;
  wire  IBusSimplePlugin_rspJoin_rspBufferOutput_ready;
  wire  IBusSimplePlugin_rspJoin_rspBufferOutput_payload_error;
  wire [31:0] IBusSimplePlugin_rspJoin_rspBufferOutput_payload_inst;
  wire  iBus_rsp_takeWhen_valid;
  wire  iBus_rsp_takeWhen_payload_error;
  wire [31:0] iBus_rsp_takeWhen_payload_inst;
  wire [31:0] IBusSimplePlugin_rspJoin_fetchRsp_pc;
  reg  IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  wire [31:0] IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  wire  IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  wire  IBusSimplePlugin_rspJoin_join_valid;
  wire  IBusSimplePlugin_rspJoin_join_ready;
  wire [31:0] IBusSimplePlugin_rspJoin_join_payload_pc;
  wire  IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  wire [31:0] IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  wire  IBusSimplePlugin_rspJoin_join_payload_isRvc;
  wire  IBusSimplePlugin_rspJoin_exceptionDetected;
  wire  IBusSimplePlugin_rspJoin_redoRequired;
  wire  _zz_86_;
  wire  _zz_87_;
  reg  execute_DBusSimplePlugin_skipCmd;
  reg [31:0] _zz_88_;
  reg [3:0] _zz_89_;
  wire [3:0] execute_DBusSimplePlugin_formalMask;
  reg [31:0] writeBack_DBusSimplePlugin_rspShifted;
  wire  _zz_90_;
  reg [31:0] _zz_91_;
  wire  _zz_92_;
  reg [31:0] _zz_93_;
  reg [31:0] writeBack_DBusSimplePlugin_rspFormated;
  wire [1:0] CsrPlugin_misa_base;
  wire [25:0] CsrPlugin_misa_extensions;
  wire [1:0] CsrPlugin_mtvec_mode;
  wire [29:0] CsrPlugin_mtvec_base;
  reg [31:0] CsrPlugin_mepc;
  reg  CsrPlugin_mstatus_MIE;
  reg  CsrPlugin_mstatus_MPIE;
  reg [1:0] CsrPlugin_mstatus_MPP;
  reg  CsrPlugin_mip_MEIP;
  reg  CsrPlugin_mip_MTIP;
  reg  CsrPlugin_mip_MSIP;
  reg  CsrPlugin_mie_MEIE;
  reg  CsrPlugin_mie_MTIE;
  reg  CsrPlugin_mie_MSIE;
  reg  CsrPlugin_mcause_interrupt;
  reg [3:0] CsrPlugin_mcause_exceptionCode;
  reg [31:0] CsrPlugin_mtval;
  reg [63:0] CsrPlugin_mcycle = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  reg [63:0] CsrPlugin_minstret = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  wire  _zz_94_;
  wire  _zz_95_;
  wire  _zz_96_;
  reg  CsrPlugin_interrupt_valid;
  reg [3:0] CsrPlugin_interrupt_code /* verilator public */ ;
  reg [1:0] CsrPlugin_interrupt_targetPrivilege;
  wire  CsrPlugin_exception;
  wire  CsrPlugin_lastStageWasWfi;
  reg  CsrPlugin_pipelineLiberator_done;
  wire  CsrPlugin_interruptJump /* verilator public */ ;
  reg  CsrPlugin_hadException;
  wire [1:0] CsrPlugin_targetPrivilege;
  wire [3:0] CsrPlugin_trapCause;
  reg [1:0] CsrPlugin_xtvec_mode;
  reg [29:0] CsrPlugin_xtvec_base;
  wire  execute_CsrPlugin_inWfi /* verilator public */ ;
  reg  execute_CsrPlugin_wfiWake;
  wire  execute_CsrPlugin_blockedBySideEffects;
  reg  execute_CsrPlugin_illegalAccess;
  reg  execute_CsrPlugin_illegalInstruction;
  reg [31:0] execute_CsrPlugin_readData;
  wire  execute_CsrPlugin_writeInstruction;
  wire  execute_CsrPlugin_readInstruction;
  wire  execute_CsrPlugin_writeEnable;
  wire  execute_CsrPlugin_readEnable;
  wire [31:0] execute_CsrPlugin_readToWriteData;
  reg [31:0] execute_CsrPlugin_writeData;
  wire [11:0] execute_CsrPlugin_csrAddress;
  wire [24:0] _zz_97_;
  wire  _zz_98_;
  wire  _zz_99_;
  wire  _zz_100_;
  wire  _zz_101_;
  wire  _zz_102_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_103_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_104_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_105_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_106_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_107_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_108_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_109_;
  wire [4:0] decode_RegFilePlugin_regFileReadAddress1;
  wire [4:0] decode_RegFilePlugin_regFileReadAddress2;
  wire [31:0] decode_RegFilePlugin_rs1Data;
  wire [31:0] decode_RegFilePlugin_rs2Data;
  reg  lastStageRegFileWrite_valid /* verilator public */ ;
  wire [4:0] lastStageRegFileWrite_payload_address /* verilator public */ ;
  wire [31:0] lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg  _zz_110_;
  reg [31:0] execute_IntAluPlugin_bitwise;
  reg [31:0] _zz_111_;
  reg [31:0] _zz_112_;
  wire  _zz_113_;
  reg [19:0] _zz_114_;
  wire  _zz_115_;
  reg [19:0] _zz_116_;
  reg [31:0] _zz_117_;
  reg [31:0] execute_SrcPlugin_addSub;
  wire  execute_SrcPlugin_less;
  reg  execute_LightShifterPlugin_isActive;
  wire  execute_LightShifterPlugin_isShift;
  reg [4:0] execute_LightShifterPlugin_amplitudeReg;
  wire [4:0] execute_LightShifterPlugin_amplitude;
  wire [31:0] execute_LightShifterPlugin_shiftInput;
  wire  execute_LightShifterPlugin_done;
  reg [31:0] _zz_118_;
  reg  _zz_119_;
  reg  _zz_120_;
  wire  _zz_121_;
  reg  _zz_122_;
  reg [4:0] _zz_123_;
  wire  execute_BranchPlugin_eq;
  wire [2:0] _zz_124_;
  reg  _zz_125_;
  reg  _zz_126_;
  wire [31:0] execute_BranchPlugin_branch_src1;
  wire  _zz_127_;
  reg [10:0] _zz_128_;
  wire  _zz_129_;
  reg [19:0] _zz_130_;
  wire  _zz_131_;
  reg [18:0] _zz_132_;
  reg [31:0] _zz_133_;
  wire [31:0] execute_BranchPlugin_branch_src2;
  wire [31:0] execute_BranchPlugin_branchAdder;
  reg  decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  reg  execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  reg  decode_to_execute_SRC2_FORCE_ZERO;
  reg  execute_to_memory_BRANCH_DO;
  reg  decode_to_execute_IS_CSR;
  reg [31:0] decode_to_execute_RS1;
  reg [31:0] decode_to_execute_INSTRUCTION;
  reg [31:0] execute_to_memory_INSTRUCTION;
  reg [31:0] memory_to_writeBack_INSTRUCTION;
  reg  decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  reg `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg [31:0] memory_to_writeBack_MEMORY_READ_DATA;
  reg [31:0] decode_to_execute_FORMAL_PC_NEXT;
  reg [31:0] execute_to_memory_FORMAL_PC_NEXT;
  reg [31:0] memory_to_writeBack_FORMAL_PC_NEXT;
  reg  decode_to_execute_MEMORY_STORE;
  reg  execute_to_memory_MEMORY_STORE;
  reg  memory_to_writeBack_MEMORY_STORE;
  reg  decode_to_execute_SRC_USE_SUB_LESS;
  reg [31:0] decode_to_execute_PC;
  reg [31:0] execute_to_memory_PC;
  reg [31:0] memory_to_writeBack_PC;
  reg  decode_to_execute_SRC_LESS_UNSIGNED;
  reg  decode_to_execute_CSR_READ_OPCODE;
  reg [31:0] decode_to_execute_SRC2;
  reg [31:0] execute_to_memory_REGFILE_WRITE_DATA;
  reg [31:0] memory_to_writeBack_REGFILE_WRITE_DATA;
  reg [1:0] execute_to_memory_MEMORY_ADDRESS_LOW;
  reg [1:0] memory_to_writeBack_MEMORY_ADDRESS_LOW;
  reg `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg  decode_to_execute_MEMORY_ENABLE;
  reg  execute_to_memory_MEMORY_ENABLE;
  reg  memory_to_writeBack_MEMORY_ENABLE;
  reg `EnvCtrlEnum_defaultEncoding_type decode_to_execute_ENV_CTRL;
  reg `EnvCtrlEnum_defaultEncoding_type execute_to_memory_ENV_CTRL;
  reg `EnvCtrlEnum_defaultEncoding_type memory_to_writeBack_ENV_CTRL;
  reg  decode_to_execute_CSR_WRITE_OPCODE;
  reg `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg [31:0] decode_to_execute_RS2;
  reg [31:0] execute_to_memory_BRANCH_CALC;
  reg  decode_to_execute_REGFILE_WRITE_VALID;
  reg  execute_to_memory_REGFILE_WRITE_VALID;
  reg  memory_to_writeBack_REGFILE_WRITE_VALID;
  reg `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg [31:0] decode_to_execute_SRC1;
  `ifndef SYNTHESIS
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_1__string;
  reg [39:0] _zz_2__string;
  reg [39:0] _zz_3__string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_4__string;
  reg [63:0] _zz_5__string;
  reg [63:0] _zz_6__string;
  reg [31:0] _zz_7__string;
  reg [31:0] _zz_8__string;
  reg [31:0] _zz_9__string;
  reg [31:0] _zz_10__string;
  reg [31:0] decode_ENV_CTRL_string;
  reg [31:0] _zz_11__string;
  reg [31:0] _zz_12__string;
  reg [31:0] _zz_13__string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_14__string;
  reg [31:0] _zz_15__string;
  reg [31:0] _zz_16__string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_17__string;
  reg [71:0] _zz_18__string;
  reg [71:0] _zz_19__string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_21__string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_23__string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_29__string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_32__string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_35__string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_37__string;
  reg [71:0] _zz_43__string;
  reg [95:0] _zz_49__string;
  reg [31:0] _zz_50__string;
  reg [39:0] _zz_52__string;
  reg [23:0] _zz_53__string;
  reg [63:0] _zz_56__string;
  reg [31:0] _zz_58__string;
  reg [31:0] memory_ENV_CTRL_string;
  reg [31:0] _zz_62__string;
  reg [31:0] execute_ENV_CTRL_string;
  reg [31:0] _zz_63__string;
  reg [31:0] writeBack_ENV_CTRL_string;
  reg [31:0] _zz_66__string;
  reg [31:0] _zz_103__string;
  reg [63:0] _zz_104__string;
  reg [23:0] _zz_105__string;
  reg [39:0] _zz_106__string;
  reg [31:0] _zz_107__string;
  reg [95:0] _zz_108__string;
  reg [71:0] _zz_109__string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  reg [31:0] decode_to_execute_ENV_CTRL_string;
  reg [31:0] execute_to_memory_ENV_CTRL_string;
  reg [31:0] memory_to_writeBack_ENV_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;
  assign _zz_136_ = (execute_arbitration_isValid && execute_IS_CSR);
  assign _zz_137_ = ((execute_arbitration_isValid && execute_LightShifterPlugin_isShift) && (execute_SRC2[4 : 0] != (5'b00000)));
  assign _zz_138_ = (! execute_arbitration_isStuckByOthers);
  assign _zz_139_ = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_140_ = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_141_ = writeBack_INSTRUCTION[29 : 28];
  assign _zz_142_ = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_143_ = (1'b1 || (! 1'b1));
  assign _zz_144_ = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_145_ = (1'b1 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign _zz_146_ = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_147_ = (1'b1 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign _zz_148_ = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < (2'b11)));
  assign _zz_149_ = ((_zz_94_ && 1'b1) && (! 1'b0));
  assign _zz_150_ = ((_zz_95_ && 1'b1) && (! 1'b0));
  assign _zz_151_ = ((_zz_96_ && 1'b1) && (! 1'b0));
  assign _zz_152_ = writeBack_INSTRUCTION[13 : 12];
  assign _zz_153_ = execute_INSTRUCTION[13];
  assign _zz_154_ = (_zz_75_ & (~ _zz_155_));
  assign _zz_155_ = (_zz_75_ - (2'b01));
  assign _zz_156_ = {IBusSimplePlugin_fetchPc_inc,(2'b00)};
  assign _zz_157_ = {29'd0, _zz_156_};
  assign _zz_158_ = (IBusSimplePlugin_pendingCmd + _zz_160_);
  assign _zz_159_ = (IBusSimplePlugin_cmd_valid && IBusSimplePlugin_cmd_ready);
  assign _zz_160_ = {2'd0, _zz_159_};
  assign _zz_161_ = iBus_rsp_valid;
  assign _zz_162_ = {2'd0, _zz_161_};
  assign _zz_163_ = (iBus_rsp_valid && (IBusSimplePlugin_rspJoin_discardCounter != (3'b000)));
  assign _zz_164_ = {2'd0, _zz_163_};
  assign _zz_165_ = iBus_rsp_valid;
  assign _zz_166_ = {2'd0, _zz_165_};
  assign _zz_167_ = _zz_97_[0 : 0];
  assign _zz_168_ = _zz_97_[1 : 1];
  assign _zz_169_ = _zz_97_[4 : 4];
  assign _zz_170_ = _zz_97_[7 : 7];
  assign _zz_171_ = _zz_97_[8 : 8];
  assign _zz_172_ = _zz_97_[14 : 14];
  assign _zz_173_ = _zz_97_[18 : 18];
  assign _zz_174_ = _zz_97_[19 : 19];
  assign _zz_175_ = _zz_97_[20 : 20];
  assign _zz_176_ = _zz_97_[21 : 21];
  assign _zz_177_ = _zz_97_[22 : 22];
  assign _zz_178_ = execute_SRC_LESS;
  assign _zz_179_ = (3'b100);
  assign _zz_180_ = decode_INSTRUCTION[19 : 15];
  assign _zz_181_ = decode_INSTRUCTION[31 : 20];
  assign _zz_182_ = {decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]};
  assign _zz_183_ = ($signed(_zz_184_) + $signed(_zz_187_));
  assign _zz_184_ = ($signed(_zz_185_) + $signed(_zz_186_));
  assign _zz_185_ = execute_SRC1;
  assign _zz_186_ = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_187_ = (execute_SRC_USE_SUB_LESS ? _zz_188_ : _zz_189_);
  assign _zz_188_ = (32'b00000000000000000000000000000001);
  assign _zz_189_ = (32'b00000000000000000000000000000000);
  assign _zz_190_ = (_zz_191_ >>> 1);
  assign _zz_191_ = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_LightShifterPlugin_shiftInput[31]),execute_LightShifterPlugin_shiftInput};
  assign _zz_192_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_193_ = execute_INSTRUCTION[31 : 20];
  assign _zz_194_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_195_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_196_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_197_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_198_ = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_199_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_200_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_201_ = 1'b1;
  assign _zz_202_ = 1'b1;
  assign _zz_203_ = (32'b00000000000000000111000001010100);
  assign _zz_204_ = ((decode_INSTRUCTION & (32'b01000000000000000011000001010100)) == (32'b01000000000000000001000000010000));
  assign _zz_205_ = ((decode_INSTRUCTION & (32'b00000000000000000111000001010100)) == (32'b00000000000000000001000000010000));
  assign _zz_206_ = ((decode_INSTRUCTION & _zz_213_) == (32'b00000000000000000000000000100000));
  assign _zz_207_ = ((decode_INSTRUCTION & _zz_214_) == (32'b00000000000000000000000000100000));
  assign _zz_208_ = {(_zz_215_ == _zz_216_),(_zz_217_ == _zz_218_)};
  assign _zz_209_ = (2'b00);
  assign _zz_210_ = ({_zz_99_,{_zz_219_,_zz_220_}} != (6'b000000));
  assign _zz_211_ = (_zz_221_ != (1'b0));
  assign _zz_212_ = {(_zz_222_ != _zz_223_),{_zz_224_,{_zz_225_,_zz_226_}}};
  assign _zz_213_ = (32'b00000000000000000000000000110100);
  assign _zz_214_ = (32'b00000000000000000000000001100100);
  assign _zz_215_ = (decode_INSTRUCTION & (32'b00000000000000000010000000010000));
  assign _zz_216_ = (32'b00000000000000000010000000000000);
  assign _zz_217_ = (decode_INSTRUCTION & (32'b00000000000000000101000000000000));
  assign _zz_218_ = (32'b00000000000000000001000000000000);
  assign _zz_219_ = ((decode_INSTRUCTION & _zz_227_) == (32'b00000000000000000001000000010000));
  assign _zz_220_ = {(_zz_228_ == _zz_229_),{_zz_98_,{_zz_230_,_zz_231_}}};
  assign _zz_221_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001011000)) == (32'b00000000000000000000000000000000));
  assign _zz_222_ = {(_zz_232_ == _zz_233_),(_zz_234_ == _zz_235_)};
  assign _zz_223_ = (2'b00);
  assign _zz_224_ = ({_zz_236_,_zz_102_} != (2'b00));
  assign _zz_225_ = ({_zz_237_,_zz_238_} != (2'b00));
  assign _zz_226_ = {(_zz_239_ != _zz_240_),{_zz_241_,{_zz_242_,_zz_243_}}};
  assign _zz_227_ = (32'b00000000000000000001000000010000);
  assign _zz_228_ = (decode_INSTRUCTION & (32'b00000000000000000010000000010000));
  assign _zz_229_ = (32'b00000000000000000010000000010000);
  assign _zz_230_ = ((decode_INSTRUCTION & _zz_244_) == (32'b00000000000000000000000000000100));
  assign _zz_231_ = ((decode_INSTRUCTION & _zz_245_) == (32'b00000000000000000000000000000000));
  assign _zz_232_ = (decode_INSTRUCTION & (32'b00000000000000000000000001100100));
  assign _zz_233_ = (32'b00000000000000000000000000100100);
  assign _zz_234_ = (decode_INSTRUCTION & (32'b00000000000000000011000001010100));
  assign _zz_235_ = (32'b00000000000000000001000000010000);
  assign _zz_236_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000010100)) == (32'b00000000000000000000000000000100));
  assign _zz_237_ = ((decode_INSTRUCTION & _zz_246_) == (32'b00000000000000000000000000000100));
  assign _zz_238_ = _zz_102_;
  assign _zz_239_ = ((decode_INSTRUCTION & _zz_247_) == (32'b00000000000000000000000001010000));
  assign _zz_240_ = (1'b0);
  assign _zz_241_ = ({_zz_248_,_zz_249_} != (2'b00));
  assign _zz_242_ = ({_zz_250_,_zz_251_} != (2'b00));
  assign _zz_243_ = {(_zz_252_ != _zz_253_),{_zz_254_,{_zz_255_,_zz_256_}}};
  assign _zz_244_ = (32'b00000000000000000000000000001100);
  assign _zz_245_ = (32'b00000000000000000000000000101000);
  assign _zz_246_ = (32'b00000000000000000000000001000100);
  assign _zz_247_ = (32'b00000000000000000011000001010000);
  assign _zz_248_ = ((decode_INSTRUCTION & (32'b00000000000000000001000001010000)) == (32'b00000000000000000001000001010000));
  assign _zz_249_ = ((decode_INSTRUCTION & (32'b00000000000000000010000001010000)) == (32'b00000000000000000010000001010000));
  assign _zz_250_ = ((decode_INSTRUCTION & _zz_257_) == (32'b00000000000000000000000001000000));
  assign _zz_251_ = ((decode_INSTRUCTION & _zz_258_) == (32'b00000000000000000000000001000000));
  assign _zz_252_ = ((decode_INSTRUCTION & _zz_259_) == (32'b00000000000000000001000000000000));
  assign _zz_253_ = (1'b0);
  assign _zz_254_ = ((_zz_260_ == _zz_261_) != (1'b0));
  assign _zz_255_ = ({_zz_262_,_zz_263_} != (2'b00));
  assign _zz_256_ = {(_zz_264_ != _zz_265_),{_zz_266_,{_zz_267_,_zz_268_}}};
  assign _zz_257_ = (32'b00000000000000000000000001010000);
  assign _zz_258_ = (32'b00000000000000000011000001000000);
  assign _zz_259_ = (32'b00000000000000000001000000000000);
  assign _zz_260_ = (decode_INSTRUCTION & (32'b00000000000000000011000000000000));
  assign _zz_261_ = (32'b00000000000000000010000000000000);
  assign _zz_262_ = _zz_101_;
  assign _zz_263_ = ((decode_INSTRUCTION & _zz_269_) == (32'b00000000000000000000000000100000));
  assign _zz_264_ = {_zz_101_,(_zz_270_ == _zz_271_)};
  assign _zz_265_ = (2'b00);
  assign _zz_266_ = ((_zz_272_ == _zz_273_) != (1'b0));
  assign _zz_267_ = ({_zz_274_,_zz_275_} != (3'b000));
  assign _zz_268_ = {(_zz_276_ != _zz_277_),{_zz_278_,{_zz_279_,_zz_280_}}};
  assign _zz_269_ = (32'b00000000000000000000000001110000);
  assign _zz_270_ = (decode_INSTRUCTION & (32'b00000000000000000000000000100000));
  assign _zz_271_ = (32'b00000000000000000000000000000000);
  assign _zz_272_ = (decode_INSTRUCTION & (32'b00000000000000000000000000010000));
  assign _zz_273_ = (32'b00000000000000000000000000010000);
  assign _zz_274_ = ((decode_INSTRUCTION & _zz_281_) == (32'b00000000000000000000000001000000));
  assign _zz_275_ = {(_zz_282_ == _zz_283_),(_zz_284_ == _zz_285_)};
  assign _zz_276_ = {(_zz_286_ == _zz_287_),(_zz_288_ == _zz_289_)};
  assign _zz_277_ = (2'b00);
  assign _zz_278_ = (_zz_100_ != (1'b0));
  assign _zz_279_ = ({_zz_290_,_zz_291_} != (4'b0000));
  assign _zz_280_ = {(_zz_292_ != _zz_293_),{_zz_294_,{_zz_295_,_zz_296_}}};
  assign _zz_281_ = (32'b00000000000000000000000001000100);
  assign _zz_282_ = (decode_INSTRUCTION & (32'b00000000000000000010000000010100));
  assign _zz_283_ = (32'b00000000000000000010000000010000);
  assign _zz_284_ = (decode_INSTRUCTION & (32'b01000000000000000100000000110100));
  assign _zz_285_ = (32'b01000000000000000000000000110000);
  assign _zz_286_ = (decode_INSTRUCTION & (32'b00000000000000000110000000000100));
  assign _zz_287_ = (32'b00000000000000000110000000000000);
  assign _zz_288_ = (decode_INSTRUCTION & (32'b00000000000000000101000000000100));
  assign _zz_289_ = (32'b00000000000000000100000000000000);
  assign _zz_290_ = ((decode_INSTRUCTION & _zz_297_) == (32'b00000000000000000000000000000000));
  assign _zz_291_ = {(_zz_298_ == _zz_299_),{_zz_100_,_zz_300_}};
  assign _zz_292_ = {_zz_99_,(_zz_301_ == _zz_302_)};
  assign _zz_293_ = (2'b00);
  assign _zz_294_ = ((_zz_303_ == _zz_304_) != (1'b0));
  assign _zz_295_ = (_zz_305_ != (1'b0));
  assign _zz_296_ = (_zz_98_ != (1'b0));
  assign _zz_297_ = (32'b00000000000000000000000001000100);
  assign _zz_298_ = (decode_INSTRUCTION & (32'b00000000000000000000000000011000));
  assign _zz_299_ = (32'b00000000000000000000000000000000);
  assign _zz_300_ = ((decode_INSTRUCTION & (32'b00000000000000000101000000000100)) == (32'b00000000000000000001000000000000));
  assign _zz_301_ = (decode_INSTRUCTION & (32'b00000000000000000000000000011100));
  assign _zz_302_ = (32'b00000000000000000000000000000100);
  assign _zz_303_ = (decode_INSTRUCTION & (32'b00000000000000000000000001011000));
  assign _zz_304_ = (32'b00000000000000000000000001000000);
  assign _zz_305_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000100000)) == (32'b00000000000000000000000000100000));
  always @ (posedge clk) begin
    if(_zz_40_) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  always @ (posedge clk) begin
    if(_zz_201_) begin
      _zz_134_ <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge clk) begin
    if(_zz_202_) begin
      _zz_135_ <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  StreamFifoLowLatency IBusSimplePlugin_rspJoin_rspBuffer_c ( 
    .io_push_valid(iBus_rsp_takeWhen_valid),
    .io_push_ready(IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready),
    .io_push_payload_error(iBus_rsp_takeWhen_payload_error),
    .io_push_payload_inst(iBus_rsp_takeWhen_payload_inst),
    .io_pop_valid(IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid),
    .io_pop_ready(IBusSimplePlugin_rspJoin_rspBufferOutput_ready),
    .io_pop_payload_error(IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error),
    .io_pop_payload_inst(IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst),
    .io_flush(IBusSimplePlugin_fetcherflushIt),
    .io_occupancy(IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy),
    .clk(clk),
    .reset(reset) 
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(decode_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_1_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_1__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_1__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_1__string = "AND_1";
      default : _zz_1__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_2_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_2__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_2__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_2__string = "AND_1";
      default : _zz_2__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_3_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_3__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_3__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_3__string = "AND_1";
      default : _zz_3__string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_4_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_4__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_4__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_4__string = "BITWISE ";
      default : _zz_4__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_5_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_5__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_5__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_5__string = "BITWISE ";
      default : _zz_5__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_6_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_6__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_6__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_6__string = "BITWISE ";
      default : _zz_6__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_7_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_7__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_7__string = "XRET";
      default : _zz_7__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_8_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_8__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_8__string = "XRET";
      default : _zz_8__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_9_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_9__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_9__string = "XRET";
      default : _zz_9__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_10_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_10__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_10__string = "XRET";
      default : _zz_10__string = "????";
    endcase
  end
  always @(*) begin
    case(decode_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_ENV_CTRL_string = "XRET";
      default : decode_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_11_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_11__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_11__string = "XRET";
      default : _zz_11__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_12_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_12__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_12__string = "XRET";
      default : _zz_12__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_13_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_13__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_13__string = "XRET";
      default : _zz_13__string = "????";
    endcase
  end
  always @(*) begin
    case(decode_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_BRANCH_CTRL_string = "JALR";
      default : decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_14_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_14__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_14__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_14__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_14__string = "JALR";
      default : _zz_14__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_15_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_15__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_15__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_15__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_15__string = "JALR";
      default : _zz_15__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_16_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_16__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_16__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_16__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_16__string = "JALR";
      default : _zz_16__string = "????";
    endcase
  end
  always @(*) begin
    case(decode_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_17_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_17__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_17__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_17__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_17__string = "SRA_1    ";
      default : _zz_17__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_18_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_18__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_18__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_18__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_18__string = "SRA_1    ";
      default : _zz_18__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_19_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_19__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_19__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_19__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_19__string = "SRA_1    ";
      default : _zz_19__string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : execute_BRANCH_CTRL_string = "JALR";
      default : execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_21_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_21__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_21__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_21__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_21__string = "JALR";
      default : _zz_21__string = "????";
    endcase
  end
  always @(*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : execute_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_23_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_23__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_23__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_23__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_23__string = "SRA_1    ";
      default : _zz_23__string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : decode_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : decode_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : decode_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : decode_SRC2_CTRL_string = "PC ";
      default : decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_29_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_29__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_29__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_29__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_29__string = "PC ";
      default : _zz_29__string = "???";
    endcase
  end
  always @(*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : decode_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : decode_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : decode_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : decode_SRC1_CTRL_string = "URS1        ";
      default : decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_32_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_32__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_32__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_32__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_32__string = "URS1        ";
      default : _zz_32__string = "????????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : execute_ALU_CTRL_string = "BITWISE ";
      default : execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_35_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_35__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_35__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_35__string = "BITWISE ";
      default : _zz_35__string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_37_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_37__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_37__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_37__string = "AND_1";
      default : _zz_37__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_43_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_43__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_43__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_43__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_43__string = "SRA_1    ";
      default : _zz_43__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_49_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_49__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_49__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_49__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_49__string = "URS1        ";
      default : _zz_49__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_50_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_50__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_50__string = "XRET";
      default : _zz_50__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_52_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_52__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_52__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_52__string = "AND_1";
      default : _zz_52__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_53_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_53__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_53__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_53__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_53__string = "PC ";
      default : _zz_53__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_56_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_56__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_56__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_56__string = "BITWISE ";
      default : _zz_56__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_58_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_58__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_58__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_58__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_58__string = "JALR";
      default : _zz_58__string = "????";
    endcase
  end
  always @(*) begin
    case(memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_ENV_CTRL_string = "XRET";
      default : memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_62_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_62__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_62__string = "XRET";
      default : _zz_62__string = "????";
    endcase
  end
  always @(*) begin
    case(execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_ENV_CTRL_string = "XRET";
      default : execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_63_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_63__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_63__string = "XRET";
      default : _zz_63__string = "????";
    endcase
  end
  always @(*) begin
    case(writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : writeBack_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : writeBack_ENV_CTRL_string = "XRET";
      default : writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_66_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_66__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_66__string = "XRET";
      default : _zz_66__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_103_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_103__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_103__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_103__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_103__string = "JALR";
      default : _zz_103__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_104_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_104__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_104__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_104__string = "BITWISE ";
      default : _zz_104__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_105_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_105__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_105__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_105__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_105__string = "PC ";
      default : _zz_105__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_106_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_106__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_106__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_106__string = "AND_1";
      default : _zz_106__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_107_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_107__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_107__string = "XRET";
      default : _zz_107__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_108_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_108__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_108__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_108__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_108__string = "URS1        ";
      default : _zz_108__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_109_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_109__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_109__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_109__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_109__string = "SRA_1    ";
      default : _zz_109__string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_to_execute_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_to_execute_ENV_CTRL_string = "XRET";
      default : decode_to_execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_to_memory_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_to_memory_ENV_CTRL_string = "XRET";
      default : execute_to_memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_to_writeBack_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_to_writeBack_ENV_CTRL_string = "XRET";
      default : memory_to_writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  `endif

  assign decode_SRC1 = _zz_33_;
  assign decode_ALU_BITWISE_CTRL = _zz_1_;
  assign _zz_2_ = _zz_3_;
  assign execute_BRANCH_CALC = _zz_20_;
  assign decode_RS2 = _zz_41_;
  assign decode_ALU_CTRL = _zz_4_;
  assign _zz_5_ = _zz_6_;
  assign decode_CSR_WRITE_OPCODE = _zz_65_;
  assign _zz_7_ = _zz_8_;
  assign _zz_9_ = _zz_10_;
  assign decode_ENV_CTRL = _zz_11_;
  assign _zz_12_ = _zz_13_;
  assign decode_MEMORY_ENABLE = _zz_47_;
  assign decode_BRANCH_CTRL = _zz_14_;
  assign _zz_15_ = _zz_16_;
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = _zz_69_;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign execute_REGFILE_WRITE_DATA = _zz_36_;
  assign decode_SRC2 = _zz_30_;
  assign decode_CSR_READ_OPCODE = _zz_64_;
  assign decode_SRC_LESS_UNSIGNED = _zz_45_;
  assign memory_PC = execute_to_memory_PC;
  assign decode_MEMORY_STORE = _zz_59_;
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = _zz_71_;
  assign memory_MEMORY_READ_DATA = _zz_68_;
  assign decode_SHIFT_CTRL = _zz_17_;
  assign _zz_18_ = _zz_19_;
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_60_;
  assign decode_RS1 = _zz_42_;
  assign decode_IS_CSR = _zz_51_;
  assign execute_BRANCH_DO = _zz_22_;
  assign decode_SRC2_FORCE_ZERO = _zz_34_;
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_54_;
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_PC = decode_to_execute_PC;
  assign execute_RS1 = decode_to_execute_RS1;
  assign execute_BRANCH_CTRL = _zz_21_;
  assign decode_RS2_USE = _zz_44_;
  assign decode_RS1_USE = _zz_57_;
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign execute_SHIFT_CTRL = _zz_23_;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_27_ = decode_PC;
  assign _zz_28_ = decode_RS2;
  assign decode_SRC2_CTRL = _zz_29_;
  assign _zz_31_ = decode_RS1;
  assign decode_SRC1_CTRL = _zz_32_;
  assign decode_SRC_USE_SUB_LESS = _zz_55_;
  assign decode_SRC_ADD_ZERO = _zz_48_;
  assign execute_SRC_ADD_SUB = _zz_26_;
  assign execute_SRC_LESS = _zz_24_;
  assign execute_ALU_CTRL = _zz_35_;
  assign execute_SRC2 = decode_to_execute_SRC2;
  assign execute_ALU_BITWISE_CTRL = _zz_37_;
  assign _zz_38_ = writeBack_INSTRUCTION;
  assign _zz_39_ = writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    _zz_40_ = 1'b0;
    if(lastStageRegFileWrite_valid)begin
      _zz_40_ = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = _zz_74_;
  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_46_;
    if((decode_INSTRUCTION[11 : 7] == (5'b00000)))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  always @ (*) begin
    _zz_61_ = execute_REGFILE_WRITE_DATA;
    if(_zz_136_)begin
      _zz_61_ = execute_CsrPlugin_readData;
    end
    if(_zz_137_)begin
      _zz_61_ = _zz_118_;
    end
  end

  assign execute_SRC1 = decode_to_execute_SRC1;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_62_;
  assign execute_ENV_CTRL = _zz_63_;
  assign writeBack_ENV_CTRL = _zz_66_;
  assign writeBack_MEMORY_STORE = memory_to_writeBack_MEMORY_STORE;
  always @ (*) begin
    _zz_67_ = writeBack_REGFILE_WRITE_DATA;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      _zz_67_ = writeBack_DBusSimplePlugin_rspFormated;
    end
  end

  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_MEMORY_READ_DATA = memory_to_writeBack_MEMORY_READ_DATA;
  assign memory_MEMORY_STORE = execute_to_memory_MEMORY_STORE;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_SRC_ADD = _zz_25_;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign execute_MEMORY_STORE = decode_to_execute_MEMORY_STORE;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_ALIGNEMENT_FAULT = 1'b0;
  always @ (*) begin
    _zz_70_ = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid)begin
      _zz_70_ = BranchPlugin_jumpInterface_payload;
    end
  end

  assign decode_PC = _zz_73_;
  assign decode_INSTRUCTION = _zz_72_;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  assign decode_arbitration_haltItself = 1'b0;
  always @ (*) begin
    decode_arbitration_haltByOther = 1'b0;
    if((CsrPlugin_interrupt_valid && CsrPlugin_allowInterrupts))begin
      decode_arbitration_haltByOther = decode_arbitration_isValid;
    end
    if(({(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET))}} != (3'b000)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if((decode_arbitration_isValid && (_zz_119_ || _zz_120_)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_removeIt = 1'b0;
    if(decode_arbitration_isFlushed)begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  assign decode_arbitration_flushNext = 1'b0;
  always @ (*) begin
    execute_arbitration_haltItself = 1'b0;
    if(((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_87_)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(_zz_136_)begin
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
    if(_zz_137_)begin
      if(_zz_138_)begin
        if(! execute_LightShifterPlugin_done) begin
          execute_arbitration_haltItself = 1'b1;
        end
      end
    end
  end

  assign execute_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    execute_arbitration_removeIt = 1'b0;
    if(execute_arbitration_isFlushed)begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  assign execute_arbitration_flushIt = 1'b0;
  assign execute_arbitration_flushNext = 1'b0;
  always @ (*) begin
    memory_arbitration_haltItself = 1'b0;
    if((((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (! memory_MEMORY_STORE)) && ((! dBus_rsp_ready) || 1'b0)))begin
      memory_arbitration_haltItself = 1'b1;
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    memory_arbitration_removeIt = 1'b0;
    if(memory_arbitration_isFlushed)begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  assign memory_arbitration_flushIt = 1'b0;
  always @ (*) begin
    memory_arbitration_flushNext = 1'b0;
    if(BranchPlugin_jumpInterface_valid)begin
      memory_arbitration_flushNext = 1'b1;
    end
  end

  assign writeBack_arbitration_haltItself = 1'b0;
  assign writeBack_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(writeBack_arbitration_isFlushed)begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  assign writeBack_arbitration_flushIt = 1'b0;
  always @ (*) begin
    writeBack_arbitration_flushNext = 1'b0;
    if(_zz_139_)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(_zz_140_)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
  end

  assign lastStageInstruction = writeBack_INSTRUCTION;
  assign lastStagePc = writeBack_PC;
  assign lastStageIsValid = writeBack_arbitration_isValid;
  assign lastStageIsFiring = writeBack_arbitration_isFiring;
  always @ (*) begin
    IBusSimplePlugin_fetcherHalt = 1'b0;
    if(_zz_139_)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(_zz_140_)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_fetcherflushIt = 1'b0;
    if(({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}} != (4'b0000)))begin
      IBusSimplePlugin_fetcherflushIt = 1'b1;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_incomingInstruction = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_valid)begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
    if(IBusSimplePlugin_injector_decodeInput_valid)begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_jumpInterface_valid = 1'b0;
    if(_zz_139_)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(_zz_140_)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_jumpInterface_payload = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    if(_zz_139_)begin
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,(2'b00)};
    end
    if(_zz_140_)begin
      case(_zz_141_)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        default : begin
        end
      endcase
    end
  end

  assign CsrPlugin_forceMachineWire = 1'b0;
  assign CsrPlugin_allowInterrupts = 1'b1;
  assign CsrPlugin_allowException = 1'b1;
  assign IBusSimplePlugin_jump_pcLoad_valid = ({BranchPlugin_jumpInterface_valid,CsrPlugin_jumpInterface_valid} != (2'b00));
  assign _zz_75_ = {BranchPlugin_jumpInterface_valid,CsrPlugin_jumpInterface_valid};
  assign IBusSimplePlugin_jump_pcLoad_payload = (_zz_154_[0] ? CsrPlugin_jumpInterface_payload : BranchPlugin_jumpInterface_payload);
  always @ (*) begin
    IBusSimplePlugin_fetchPc_corrected = 1'b0;
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_corrected = 1'b1;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_ready)begin
      IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b1;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_fetchPc_pc = (IBusSimplePlugin_fetchPc_pcReg + _zz_157_);
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_pc = IBusSimplePlugin_jump_pcLoad_payload;
    end
    IBusSimplePlugin_fetchPc_pc[0] = 1'b0;
    IBusSimplePlugin_fetchPc_pc[1] = 1'b0;
  end

  assign IBusSimplePlugin_fetchPc_output_valid = ((! IBusSimplePlugin_fetcherHalt) && IBusSimplePlugin_fetchPc_booted);
  assign IBusSimplePlugin_fetchPc_output_payload = IBusSimplePlugin_fetchPc_pc;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_valid = IBusSimplePlugin_fetchPc_output_valid;
  assign IBusSimplePlugin_fetchPc_output_ready = IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_payload = IBusSimplePlugin_fetchPc_output_payload;
  assign IBusSimplePlugin_iBusRsp_stages_0_inputSample = 1'b1;
  always @ (*) begin
    IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b0;
    if((IBusSimplePlugin_iBusRsp_stages_0_input_valid && ((! IBusSimplePlugin_cmd_valid) || (! IBusSimplePlugin_cmd_ready))))begin
      IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b1;
    end
  end

  assign _zz_76_ = (! IBusSimplePlugin_iBusRsp_stages_0_halt);
  assign IBusSimplePlugin_iBusRsp_stages_0_input_ready = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && _zz_76_);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && _zz_76_);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_payload = IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b0;
  assign _zz_77_ = (! IBusSimplePlugin_iBusRsp_stages_1_halt);
  assign IBusSimplePlugin_iBusRsp_stages_1_input_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_ready && _zz_77_);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_valid = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && _zz_77_);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_payload = IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_0_output_ready = _zz_78_;
  assign _zz_78_ = ((1'b0 && (! _zz_79_)) || IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign _zz_79_ = _zz_80_;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_valid = _zz_79_;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_payload = IBusSimplePlugin_fetchPc_pcReg;
  always @ (*) begin
    IBusSimplePlugin_iBusRsp_readyForError = 1'b1;
    if(IBusSimplePlugin_injector_decodeInput_valid)begin
      IBusSimplePlugin_iBusRsp_readyForError = 1'b0;
    end
    if((! IBusSimplePlugin_pcValids_0))begin
      IBusSimplePlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign IBusSimplePlugin_iBusRsp_inputBeforeStage_ready = ((1'b0 && (! IBusSimplePlugin_injector_decodeInput_valid)) || IBusSimplePlugin_injector_decodeInput_ready);
  assign IBusSimplePlugin_injector_decodeInput_valid = _zz_81_;
  assign IBusSimplePlugin_injector_decodeInput_payload_pc = _zz_82_;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_error = _zz_83_;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_inst = _zz_84_;
  assign IBusSimplePlugin_injector_decodeInput_payload_isRvc = _zz_85_;
  assign _zz_74_ = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusSimplePlugin_iBusRsp_inputBeforeStage_payload_rsp_inst);
  assign IBusSimplePlugin_pcValids_0 = IBusSimplePlugin_injector_nextPcCalc_valids_1;
  assign IBusSimplePlugin_pcValids_1 = IBusSimplePlugin_injector_nextPcCalc_valids_2;
  assign IBusSimplePlugin_pcValids_2 = IBusSimplePlugin_injector_nextPcCalc_valids_3;
  assign IBusSimplePlugin_pcValids_3 = IBusSimplePlugin_injector_nextPcCalc_valids_4;
  assign IBusSimplePlugin_injector_decodeInput_ready = (! decode_arbitration_isStuck);
  assign decode_arbitration_isValid = (IBusSimplePlugin_injector_decodeInput_valid && (! IBusSimplePlugin_injector_decodeRemoved));
  assign _zz_73_ = IBusSimplePlugin_injector_decodeInput_payload_pc;
  assign _zz_72_ = IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  assign _zz_71_ = (decode_PC + (32'b00000000000000000000000000000100));
  assign iBus_cmd_valid = IBusSimplePlugin_cmd_valid;
  assign IBusSimplePlugin_cmd_ready = iBus_cmd_ready;
  assign iBus_cmd_payload_pc = IBusSimplePlugin_cmd_payload_pc;
  assign IBusSimplePlugin_pendingCmdNext = (_zz_158_ - _zz_162_);
  assign IBusSimplePlugin_cmd_valid = ((IBusSimplePlugin_iBusRsp_stages_0_input_valid && IBusSimplePlugin_iBusRsp_stages_0_output_ready) && (IBusSimplePlugin_pendingCmd != (3'b111)));
  assign IBusSimplePlugin_cmd_payload_pc = {IBusSimplePlugin_iBusRsp_stages_0_input_payload[31 : 2],(2'b00)};
  assign iBus_rsp_takeWhen_valid = (iBus_rsp_valid && (! (IBusSimplePlugin_rspJoin_discardCounter != (3'b000))));
  assign iBus_rsp_takeWhen_payload_error = iBus_rsp_payload_error;
  assign iBus_rsp_takeWhen_payload_inst = iBus_rsp_payload_inst;
  assign IBusSimplePlugin_rspJoin_rspBufferOutput_valid = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid;
  assign IBusSimplePlugin_rspJoin_rspBufferOutput_payload_error = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  assign IBusSimplePlugin_rspJoin_rspBufferOutput_payload_inst = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  assign IBusSimplePlugin_rspJoin_fetchRsp_pc = IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  always @ (*) begin
    IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = IBusSimplePlugin_rspJoin_rspBufferOutput_payload_error;
    if((! IBusSimplePlugin_rspJoin_rspBufferOutput_valid))begin
      IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = 1'b0;
    end
  end

  assign IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst = IBusSimplePlugin_rspJoin_rspBufferOutput_payload_inst;
  assign IBusSimplePlugin_rspJoin_exceptionDetected = 1'b0;
  assign IBusSimplePlugin_rspJoin_redoRequired = 1'b0;
  assign IBusSimplePlugin_rspJoin_join_valid = (IBusSimplePlugin_iBusRsp_stages_1_output_valid && IBusSimplePlugin_rspJoin_rspBufferOutput_valid);
  assign IBusSimplePlugin_rspJoin_join_payload_pc = IBusSimplePlugin_rspJoin_fetchRsp_pc;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_error = IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_inst = IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  assign IBusSimplePlugin_rspJoin_join_payload_isRvc = IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_valid ? (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready) : IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_rspJoin_rspBufferOutput_ready = (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready);
  assign _zz_86_ = (! (IBusSimplePlugin_rspJoin_exceptionDetected || IBusSimplePlugin_rspJoin_redoRequired));
  assign IBusSimplePlugin_rspJoin_join_ready = (IBusSimplePlugin_iBusRsp_inputBeforeStage_ready && _zz_86_);
  assign IBusSimplePlugin_iBusRsp_inputBeforeStage_valid = (IBusSimplePlugin_rspJoin_join_valid && _zz_86_);
  assign IBusSimplePlugin_iBusRsp_inputBeforeStage_payload_pc = IBusSimplePlugin_rspJoin_join_payload_pc;
  assign IBusSimplePlugin_iBusRsp_inputBeforeStage_payload_rsp_error = IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  assign IBusSimplePlugin_iBusRsp_inputBeforeStage_payload_rsp_inst = IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  assign IBusSimplePlugin_iBusRsp_inputBeforeStage_payload_isRvc = IBusSimplePlugin_rspJoin_join_payload_isRvc;
  assign _zz_87_ = 1'b0;
  always @ (*) begin
    execute_DBusSimplePlugin_skipCmd = 1'b0;
    if(execute_ALIGNEMENT_FAULT)begin
      execute_DBusSimplePlugin_skipCmd = 1'b1;
    end
  end

  assign dBus_cmd_valid = (((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_isFlushed)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_87_));
  assign dBus_cmd_payload_wr = execute_MEMORY_STORE;
  assign dBus_cmd_payload_size = execute_INSTRUCTION[13 : 12];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_88_ = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_88_ = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_88_ = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_88_;
  assign _zz_69_ = dBus_cmd_payload_address[1 : 0];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_89_ = (4'b0001);
      end
      2'b01 : begin
        _zz_89_ = (4'b0011);
      end
      default : begin
        _zz_89_ = (4'b1111);
      end
    endcase
  end

  assign execute_DBusSimplePlugin_formalMask = (_zz_89_ <<< dBus_cmd_payload_address[1 : 0]);
  assign dBus_cmd_payload_address = execute_SRC_ADD;
  assign _zz_68_ = dBus_rsp_data;
  always @ (*) begin
    writeBack_DBusSimplePlugin_rspShifted = writeBack_MEMORY_READ_DATA;
    case(writeBack_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[15 : 8];
      end
      2'b10 : begin
        writeBack_DBusSimplePlugin_rspShifted[15 : 0] = writeBack_MEMORY_READ_DATA[31 : 16];
      end
      2'b11 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign _zz_90_ = (writeBack_DBusSimplePlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_91_[31] = _zz_90_;
    _zz_91_[30] = _zz_90_;
    _zz_91_[29] = _zz_90_;
    _zz_91_[28] = _zz_90_;
    _zz_91_[27] = _zz_90_;
    _zz_91_[26] = _zz_90_;
    _zz_91_[25] = _zz_90_;
    _zz_91_[24] = _zz_90_;
    _zz_91_[23] = _zz_90_;
    _zz_91_[22] = _zz_90_;
    _zz_91_[21] = _zz_90_;
    _zz_91_[20] = _zz_90_;
    _zz_91_[19] = _zz_90_;
    _zz_91_[18] = _zz_90_;
    _zz_91_[17] = _zz_90_;
    _zz_91_[16] = _zz_90_;
    _zz_91_[15] = _zz_90_;
    _zz_91_[14] = _zz_90_;
    _zz_91_[13] = _zz_90_;
    _zz_91_[12] = _zz_90_;
    _zz_91_[11] = _zz_90_;
    _zz_91_[10] = _zz_90_;
    _zz_91_[9] = _zz_90_;
    _zz_91_[8] = _zz_90_;
    _zz_91_[7 : 0] = writeBack_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_92_ = (writeBack_DBusSimplePlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_93_[31] = _zz_92_;
    _zz_93_[30] = _zz_92_;
    _zz_93_[29] = _zz_92_;
    _zz_93_[28] = _zz_92_;
    _zz_93_[27] = _zz_92_;
    _zz_93_[26] = _zz_92_;
    _zz_93_[25] = _zz_92_;
    _zz_93_[24] = _zz_92_;
    _zz_93_[23] = _zz_92_;
    _zz_93_[22] = _zz_92_;
    _zz_93_[21] = _zz_92_;
    _zz_93_[20] = _zz_92_;
    _zz_93_[19] = _zz_92_;
    _zz_93_[18] = _zz_92_;
    _zz_93_[17] = _zz_92_;
    _zz_93_[16] = _zz_92_;
    _zz_93_[15 : 0] = writeBack_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_152_)
      2'b00 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_91_;
      end
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_93_;
      end
      default : begin
        writeBack_DBusSimplePlugin_rspFormated = writeBack_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  always @ (*) begin
    CsrPlugin_privilege = (2'b11);
    if(CsrPlugin_forceMachineWire)begin
      CsrPlugin_privilege = (2'b11);
    end
  end

  assign CsrPlugin_misa_base = (2'b01);
  assign CsrPlugin_misa_extensions = (26'b00000000000000000001000010);
  assign CsrPlugin_mtvec_mode = (2'b00);
  assign CsrPlugin_mtvec_base = (30'b000000000000000000000000001000);
  assign _zz_94_ = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_95_ = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_96_ = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exception = 1'b0;
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  always @ (*) begin
    CsrPlugin_pipelineLiberator_done = ((! ({writeBack_arbitration_isValid,{memory_arbitration_isValid,execute_arbitration_isValid}} != (3'b000))) && IBusSimplePlugin_pcValids_0);
    if(CsrPlugin_hadException)begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign CsrPlugin_interruptJump = ((CsrPlugin_interrupt_valid && CsrPlugin_pipelineLiberator_done) && CsrPlugin_allowInterrupts);
  assign CsrPlugin_targetPrivilege = CsrPlugin_interrupt_targetPrivilege;
  assign CsrPlugin_trapCause = CsrPlugin_interrupt_code;
  always @ (*) begin
    CsrPlugin_xtvec_mode = (2'bxx);
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_mtvec_mode;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    CsrPlugin_xtvec_base = (30'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_base = CsrPlugin_mtvec_base;
      end
      default : begin
      end
    endcase
  end

  assign contextSwitching = CsrPlugin_jumpInterface_valid;
  assign _zz_65_ = (! (((decode_INSTRUCTION[14 : 13] == (2'b01)) && (decode_INSTRUCTION[19 : 15] == (5'b00000))) || ((decode_INSTRUCTION[14 : 13] == (2'b11)) && (decode_INSTRUCTION[19 : 15] == (5'b00000)))));
  assign _zz_64_ = (decode_INSTRUCTION[13 : 7] != (7'b0100000));
  assign execute_CsrPlugin_inWfi = 1'b0;
  assign execute_CsrPlugin_blockedBySideEffects = ({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00));
  always @ (*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    case(execute_CsrPlugin_csrAddress)
      12'b001100000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
      12'b001101000100 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
      12'b001100000100 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
      12'b001101000010 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
      end
      default : begin
      end
    endcase
    if((CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]))begin
      execute_CsrPlugin_illegalAccess = 1'b1;
    end
    if(((! execute_arbitration_isValid) || (! execute_IS_CSR)))begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
  end

  always @ (*) begin
    execute_CsrPlugin_illegalInstruction = 1'b0;
    if((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)))begin
      if((CsrPlugin_privilege < execute_INSTRUCTION[29 : 28]))begin
        execute_CsrPlugin_illegalInstruction = 1'b1;
      end
    end
  end

  always @ (*) begin
    execute_CsrPlugin_readData = (32'b00000000000000000000000000000000);
    case(execute_CsrPlugin_csrAddress)
      12'b001100000000 : begin
        execute_CsrPlugin_readData[12 : 11] = CsrPlugin_mstatus_MPP;
        execute_CsrPlugin_readData[7 : 7] = CsrPlugin_mstatus_MPIE;
        execute_CsrPlugin_readData[3 : 3] = CsrPlugin_mstatus_MIE;
      end
      12'b001101000100 : begin
        execute_CsrPlugin_readData[11 : 11] = CsrPlugin_mip_MEIP;
        execute_CsrPlugin_readData[7 : 7] = CsrPlugin_mip_MTIP;
        execute_CsrPlugin_readData[3 : 3] = CsrPlugin_mip_MSIP;
      end
      12'b001100000100 : begin
        execute_CsrPlugin_readData[11 : 11] = CsrPlugin_mie_MEIE;
        execute_CsrPlugin_readData[7 : 7] = CsrPlugin_mie_MTIE;
        execute_CsrPlugin_readData[3 : 3] = CsrPlugin_mie_MSIE;
      end
      12'b001101000010 : begin
        execute_CsrPlugin_readData[31 : 31] = CsrPlugin_mcause_interrupt;
        execute_CsrPlugin_readData[3 : 0] = CsrPlugin_mcause_exceptionCode;
      end
      default : begin
      end
    endcase
  end

  assign execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
  assign execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
  assign execute_CsrPlugin_writeEnable = ((execute_CsrPlugin_writeInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  assign execute_CsrPlugin_readEnable = ((execute_CsrPlugin_readInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  assign execute_CsrPlugin_readToWriteData = execute_CsrPlugin_readData;
  always @ (*) begin
    case(_zz_153_)
      1'b0 : begin
        execute_CsrPlugin_writeData = execute_SRC1;
      end
      default : begin
        execute_CsrPlugin_writeData = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign _zz_98_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001010000)) == (32'b00000000000000000000000000010000));
  assign _zz_99_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001001000)) == (32'b00000000000000000000000001001000));
  assign _zz_100_ = ((decode_INSTRUCTION & (32'b00000000000000000110000000000100)) == (32'b00000000000000000010000000000000));
  assign _zz_101_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000000100)) == (32'b00000000000000000000000000000100));
  assign _zz_102_ = ((decode_INSTRUCTION & (32'b00000000000000000100000001010000)) == (32'b00000000000000000100000001010000));
  assign _zz_97_ = {(((decode_INSTRUCTION & _zz_203_) == (32'b00000000000000000101000000010000)) != (1'b0)),{({_zz_204_,_zz_205_} != (2'b00)),{({_zz_206_,_zz_207_} != (2'b00)),{(_zz_208_ != _zz_209_),{_zz_210_,{_zz_211_,_zz_212_}}}}}};
  assign _zz_60_ = _zz_167_[0];
  assign _zz_59_ = _zz_168_[0];
  assign _zz_103_ = _zz_97_[3 : 2];
  assign _zz_58_ = _zz_103_;
  assign _zz_57_ = _zz_169_[0];
  assign _zz_104_ = _zz_97_[6 : 5];
  assign _zz_56_ = _zz_104_;
  assign _zz_55_ = _zz_170_[0];
  assign _zz_54_ = _zz_171_[0];
  assign _zz_105_ = _zz_97_[10 : 9];
  assign _zz_53_ = _zz_105_;
  assign _zz_106_ = _zz_97_[12 : 11];
  assign _zz_52_ = _zz_106_;
  assign _zz_51_ = _zz_172_[0];
  assign _zz_107_ = _zz_97_[15 : 15];
  assign _zz_50_ = _zz_107_;
  assign _zz_108_ = _zz_97_[17 : 16];
  assign _zz_49_ = _zz_108_;
  assign _zz_48_ = _zz_173_[0];
  assign _zz_47_ = _zz_174_[0];
  assign _zz_46_ = _zz_175_[0];
  assign _zz_45_ = _zz_176_[0];
  assign _zz_44_ = _zz_177_[0];
  assign _zz_109_ = _zz_97_[24 : 23];
  assign _zz_43_ = _zz_109_;
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = _zz_134_;
  assign decode_RegFilePlugin_rs2Data = _zz_135_;
  assign _zz_42_ = decode_RegFilePlugin_rs1Data;
  assign _zz_41_ = decode_RegFilePlugin_rs2Data;
  always @ (*) begin
    lastStageRegFileWrite_valid = (_zz_39_ && writeBack_arbitration_isFiring);
    if(_zz_110_)begin
      lastStageRegFileWrite_valid = 1'b1;
    end
  end

  assign lastStageRegFileWrite_payload_address = _zz_38_[11 : 7];
  assign lastStageRegFileWrite_payload_data = _zz_67_;
  always @ (*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
    endcase
  end

  always @ (*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_BITWISE : begin
        _zz_111_ = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_111_ = {31'd0, _zz_178_};
      end
      default : begin
        _zz_111_ = execute_SRC_ADD_SUB;
      end
    endcase
  end

  assign _zz_36_ = _zz_111_;
  assign _zz_34_ = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  always @ (*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_112_ = _zz_31_;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_112_ = {29'd0, _zz_179_};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_112_ = {decode_INSTRUCTION[31 : 12],(12'b000000000000)};
      end
      default : begin
        _zz_112_ = {27'd0, _zz_180_};
      end
    endcase
  end

  assign _zz_33_ = _zz_112_;
  assign _zz_113_ = _zz_181_[11];
  always @ (*) begin
    _zz_114_[19] = _zz_113_;
    _zz_114_[18] = _zz_113_;
    _zz_114_[17] = _zz_113_;
    _zz_114_[16] = _zz_113_;
    _zz_114_[15] = _zz_113_;
    _zz_114_[14] = _zz_113_;
    _zz_114_[13] = _zz_113_;
    _zz_114_[12] = _zz_113_;
    _zz_114_[11] = _zz_113_;
    _zz_114_[10] = _zz_113_;
    _zz_114_[9] = _zz_113_;
    _zz_114_[8] = _zz_113_;
    _zz_114_[7] = _zz_113_;
    _zz_114_[6] = _zz_113_;
    _zz_114_[5] = _zz_113_;
    _zz_114_[4] = _zz_113_;
    _zz_114_[3] = _zz_113_;
    _zz_114_[2] = _zz_113_;
    _zz_114_[1] = _zz_113_;
    _zz_114_[0] = _zz_113_;
  end

  assign _zz_115_ = _zz_182_[11];
  always @ (*) begin
    _zz_116_[19] = _zz_115_;
    _zz_116_[18] = _zz_115_;
    _zz_116_[17] = _zz_115_;
    _zz_116_[16] = _zz_115_;
    _zz_116_[15] = _zz_115_;
    _zz_116_[14] = _zz_115_;
    _zz_116_[13] = _zz_115_;
    _zz_116_[12] = _zz_115_;
    _zz_116_[11] = _zz_115_;
    _zz_116_[10] = _zz_115_;
    _zz_116_[9] = _zz_115_;
    _zz_116_[8] = _zz_115_;
    _zz_116_[7] = _zz_115_;
    _zz_116_[6] = _zz_115_;
    _zz_116_[5] = _zz_115_;
    _zz_116_[4] = _zz_115_;
    _zz_116_[3] = _zz_115_;
    _zz_116_[2] = _zz_115_;
    _zz_116_[1] = _zz_115_;
    _zz_116_[0] = _zz_115_;
  end

  always @ (*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_117_ = _zz_28_;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_117_ = {_zz_114_,decode_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_117_ = {_zz_116_,{decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_117_ = _zz_27_;
      end
    endcase
  end

  assign _zz_30_ = _zz_117_;
  always @ (*) begin
    execute_SrcPlugin_addSub = _zz_183_;
    if(execute_SRC2_FORCE_ZERO)begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign _zz_26_ = execute_SrcPlugin_addSub;
  assign _zz_25_ = execute_SrcPlugin_addSub;
  assign _zz_24_ = execute_SrcPlugin_less;
  assign execute_LightShifterPlugin_isShift = (execute_SHIFT_CTRL != `ShiftCtrlEnum_defaultEncoding_DISABLE_1);
  assign execute_LightShifterPlugin_amplitude = (execute_LightShifterPlugin_isActive ? execute_LightShifterPlugin_amplitudeReg : execute_SRC2[4 : 0]);
  assign execute_LightShifterPlugin_shiftInput = (execute_LightShifterPlugin_isActive ? memory_REGFILE_WRITE_DATA : execute_SRC1);
  assign execute_LightShifterPlugin_done = (execute_LightShifterPlugin_amplitude[4 : 1] == (4'b0000));
  always @ (*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
        _zz_118_ = (execute_LightShifterPlugin_shiftInput <<< 1);
      end
      default : begin
        _zz_118_ = _zz_190_;
      end
    endcase
  end

  always @ (*) begin
    _zz_119_ = 1'b0;
    if(_zz_122_)begin
      if((_zz_123_ == decode_INSTRUCTION[19 : 15]))begin
        _zz_119_ = 1'b1;
      end
    end
    if(_zz_142_)begin
      if(_zz_143_)begin
        if((writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]))begin
          _zz_119_ = 1'b1;
        end
      end
    end
    if(_zz_144_)begin
      if(_zz_145_)begin
        if((memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]))begin
          _zz_119_ = 1'b1;
        end
      end
    end
    if(_zz_146_)begin
      if(_zz_147_)begin
        if((execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]))begin
          _zz_119_ = 1'b1;
        end
      end
    end
    if((! decode_RS1_USE))begin
      _zz_119_ = 1'b0;
    end
  end

  always @ (*) begin
    _zz_120_ = 1'b0;
    if(_zz_122_)begin
      if((_zz_123_ == decode_INSTRUCTION[24 : 20]))begin
        _zz_120_ = 1'b1;
      end
    end
    if(_zz_142_)begin
      if(_zz_143_)begin
        if((writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]))begin
          _zz_120_ = 1'b1;
        end
      end
    end
    if(_zz_144_)begin
      if(_zz_145_)begin
        if((memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]))begin
          _zz_120_ = 1'b1;
        end
      end
    end
    if(_zz_146_)begin
      if(_zz_147_)begin
        if((execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]))begin
          _zz_120_ = 1'b1;
        end
      end
    end
    if((! decode_RS2_USE))begin
      _zz_120_ = 1'b0;
    end
  end

  assign _zz_121_ = (_zz_39_ && writeBack_arbitration_isFiring);
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_124_ = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_124_ == (3'b000))) begin
        _zz_125_ = execute_BranchPlugin_eq;
    end else if((_zz_124_ == (3'b001))) begin
        _zz_125_ = (! execute_BranchPlugin_eq);
    end else if((((_zz_124_ & (3'b101)) == (3'b101)))) begin
        _zz_125_ = (! execute_SRC_LESS);
    end else begin
        _zz_125_ = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_126_ = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_126_ = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_126_ = 1'b1;
      end
      default : begin
        _zz_126_ = _zz_125_;
      end
    endcase
  end

  assign _zz_22_ = _zz_126_;
  assign execute_BranchPlugin_branch_src1 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JALR) ? execute_RS1 : execute_PC);
  assign _zz_127_ = _zz_192_[19];
  always @ (*) begin
    _zz_128_[10] = _zz_127_;
    _zz_128_[9] = _zz_127_;
    _zz_128_[8] = _zz_127_;
    _zz_128_[7] = _zz_127_;
    _zz_128_[6] = _zz_127_;
    _zz_128_[5] = _zz_127_;
    _zz_128_[4] = _zz_127_;
    _zz_128_[3] = _zz_127_;
    _zz_128_[2] = _zz_127_;
    _zz_128_[1] = _zz_127_;
    _zz_128_[0] = _zz_127_;
  end

  assign _zz_129_ = _zz_193_[11];
  always @ (*) begin
    _zz_130_[19] = _zz_129_;
    _zz_130_[18] = _zz_129_;
    _zz_130_[17] = _zz_129_;
    _zz_130_[16] = _zz_129_;
    _zz_130_[15] = _zz_129_;
    _zz_130_[14] = _zz_129_;
    _zz_130_[13] = _zz_129_;
    _zz_130_[12] = _zz_129_;
    _zz_130_[11] = _zz_129_;
    _zz_130_[10] = _zz_129_;
    _zz_130_[9] = _zz_129_;
    _zz_130_[8] = _zz_129_;
    _zz_130_[7] = _zz_129_;
    _zz_130_[6] = _zz_129_;
    _zz_130_[5] = _zz_129_;
    _zz_130_[4] = _zz_129_;
    _zz_130_[3] = _zz_129_;
    _zz_130_[2] = _zz_129_;
    _zz_130_[1] = _zz_129_;
    _zz_130_[0] = _zz_129_;
  end

  assign _zz_131_ = _zz_194_[11];
  always @ (*) begin
    _zz_132_[18] = _zz_131_;
    _zz_132_[17] = _zz_131_;
    _zz_132_[16] = _zz_131_;
    _zz_132_[15] = _zz_131_;
    _zz_132_[14] = _zz_131_;
    _zz_132_[13] = _zz_131_;
    _zz_132_[12] = _zz_131_;
    _zz_132_[11] = _zz_131_;
    _zz_132_[10] = _zz_131_;
    _zz_132_[9] = _zz_131_;
    _zz_132_[8] = _zz_131_;
    _zz_132_[7] = _zz_131_;
    _zz_132_[6] = _zz_131_;
    _zz_132_[5] = _zz_131_;
    _zz_132_[4] = _zz_131_;
    _zz_132_[3] = _zz_131_;
    _zz_132_[2] = _zz_131_;
    _zz_132_[1] = _zz_131_;
    _zz_132_[0] = _zz_131_;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_133_ = {{_zz_128_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_133_ = {_zz_130_,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        _zz_133_ = {{_zz_132_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src2 = _zz_133_;
  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign _zz_20_ = {execute_BranchPlugin_branchAdder[31 : 1],(1'b0)};
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = memory_BRANCH_CALC;
  assign _zz_19_ = decode_SHIFT_CTRL;
  assign _zz_17_ = _zz_43_;
  assign _zz_23_ = decode_to_execute_SHIFT_CTRL;
  assign _zz_32_ = _zz_49_;
  assign _zz_29_ = _zz_53_;
  assign _zz_16_ = decode_BRANCH_CTRL;
  assign _zz_14_ = _zz_58_;
  assign _zz_21_ = decode_to_execute_BRANCH_CTRL;
  assign _zz_13_ = decode_ENV_CTRL;
  assign _zz_10_ = execute_ENV_CTRL;
  assign _zz_8_ = memory_ENV_CTRL;
  assign _zz_11_ = _zz_50_;
  assign _zz_63_ = decode_to_execute_ENV_CTRL;
  assign _zz_62_ = execute_to_memory_ENV_CTRL;
  assign _zz_66_ = memory_to_writeBack_ENV_CTRL;
  assign _zz_6_ = decode_ALU_CTRL;
  assign _zz_4_ = _zz_56_;
  assign _zz_35_ = decode_to_execute_ALU_CTRL;
  assign _zz_3_ = decode_ALU_BITWISE_CTRL;
  assign _zz_1_ = _zz_52_;
  assign _zz_37_ = decode_to_execute_ALU_BITWISE_CTRL;
  assign decode_arbitration_isFlushed = (({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,execute_arbitration_flushNext}} != (3'b000)) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,{execute_arbitration_flushIt,decode_arbitration_flushIt}}} != (4'b0000)));
  assign execute_arbitration_isFlushed = (({writeBack_arbitration_flushNext,memory_arbitration_flushNext} != (2'b00)) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,execute_arbitration_flushIt}} != (3'b000)));
  assign memory_arbitration_isFlushed = ((writeBack_arbitration_flushNext != (1'b0)) || ({writeBack_arbitration_flushIt,memory_arbitration_flushIt} != (2'b00)));
  assign writeBack_arbitration_isFlushed = (1'b0 || (writeBack_arbitration_flushIt != (1'b0)));
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (((1'b0 || execute_arbitration_isStuck) || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || ((1'b0 || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  assign memory_arbitration_isStuckByOthers = (memory_arbitration_haltByOther || (1'b0 || writeBack_arbitration_isStuck));
  assign memory_arbitration_isStuck = (memory_arbitration_haltItself || memory_arbitration_isStuckByOthers);
  assign memory_arbitration_isMoving = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  assign memory_arbitration_isFiring = ((memory_arbitration_isValid && (! memory_arbitration_isStuck)) && (! memory_arbitration_removeIt));
  assign writeBack_arbitration_isStuckByOthers = (writeBack_arbitration_haltByOther || 1'b0);
  assign writeBack_arbitration_isStuck = (writeBack_arbitration_haltItself || writeBack_arbitration_isStuckByOthers);
  assign writeBack_arbitration_isMoving = ((! writeBack_arbitration_isStuck) && (! writeBack_arbitration_removeIt));
  assign writeBack_arbitration_isFiring = ((writeBack_arbitration_isValid && (! writeBack_arbitration_isStuck)) && (! writeBack_arbitration_removeIt));
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      IBusSimplePlugin_fetchPc_pcReg <= (32'b10000000000000000000000000000000);
      IBusSimplePlugin_fetchPc_booted <= 1'b0;
      IBusSimplePlugin_fetchPc_inc <= 1'b0;
      _zz_80_ <= 1'b0;
      _zz_81_ <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      IBusSimplePlugin_injector_decodeRemoved <= 1'b0;
      IBusSimplePlugin_pendingCmd <= (3'b000);
      IBusSimplePlugin_rspJoin_discardCounter <= (3'b000);
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= (2'b11);
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_interrupt_valid <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      execute_CsrPlugin_wfiWake <= 1'b0;
      _zz_110_ <= 1'b1;
      execute_LightShifterPlugin_isActive <= 1'b0;
      _zz_122_ <= 1'b0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      memory_to_writeBack_REGFILE_WRITE_DATA <= (32'b00000000000000000000000000000000);
      memory_to_writeBack_INSTRUCTION <= (32'b00000000000000000000000000000000);
    end else begin
      IBusSimplePlugin_fetchPc_booted <= 1'b1;
      if((IBusSimplePlugin_fetchPc_corrected || IBusSimplePlugin_fetchPc_pcRegPropagate))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusSimplePlugin_fetchPc_output_valid && IBusSimplePlugin_fetchPc_output_ready))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b1;
      end
      if(((! IBusSimplePlugin_fetchPc_output_valid) && IBusSimplePlugin_fetchPc_output_ready))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusSimplePlugin_fetchPc_booted && ((IBusSimplePlugin_fetchPc_output_ready || IBusSimplePlugin_fetcherflushIt) || IBusSimplePlugin_fetchPc_pcRegPropagate)))begin
        IBusSimplePlugin_fetchPc_pcReg <= IBusSimplePlugin_fetchPc_pc;
      end
      if(IBusSimplePlugin_fetcherflushIt)begin
        _zz_80_ <= 1'b0;
      end
      if(_zz_78_)begin
        _zz_80_ <= IBusSimplePlugin_iBusRsp_stages_0_output_valid;
      end
      if(IBusSimplePlugin_iBusRsp_inputBeforeStage_ready)begin
        _zz_81_ <= IBusSimplePlugin_iBusRsp_inputBeforeStage_valid;
      end
      if(IBusSimplePlugin_fetcherflushIt)begin
        _zz_81_ <= 1'b0;
      end
      if(IBusSimplePlugin_fetcherflushIt)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if((! (! IBusSimplePlugin_iBusRsp_stages_1_input_ready)))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if(IBusSimplePlugin_fetcherflushIt)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((! (! IBusSimplePlugin_injector_decodeInput_ready)))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= IBusSimplePlugin_injector_nextPcCalc_valids_0;
      end
      if(IBusSimplePlugin_fetcherflushIt)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(IBusSimplePlugin_fetcherflushIt)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= IBusSimplePlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusSimplePlugin_fetcherflushIt)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(IBusSimplePlugin_fetcherflushIt)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if((! memory_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= IBusSimplePlugin_injector_nextPcCalc_valids_2;
      end
      if(IBusSimplePlugin_fetcherflushIt)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(IBusSimplePlugin_fetcherflushIt)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if((! writeBack_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_4 <= IBusSimplePlugin_injector_nextPcCalc_valids_3;
      end
      if(IBusSimplePlugin_fetcherflushIt)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if(decode_arbitration_removeIt)begin
        IBusSimplePlugin_injector_decodeRemoved <= 1'b1;
      end
      if(IBusSimplePlugin_fetcherflushIt)begin
        IBusSimplePlugin_injector_decodeRemoved <= 1'b0;
      end
      IBusSimplePlugin_pendingCmd <= IBusSimplePlugin_pendingCmdNext;
      IBusSimplePlugin_rspJoin_discardCounter <= (IBusSimplePlugin_rspJoin_discardCounter - _zz_164_);
      if(IBusSimplePlugin_fetcherflushIt)begin
        IBusSimplePlugin_rspJoin_discardCounter <= (IBusSimplePlugin_pendingCmd - _zz_166_);
      end
      CsrPlugin_interrupt_valid <= 1'b0;
      if(_zz_148_)begin
        if(_zz_149_)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_150_)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_151_)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(_zz_139_)begin
        case(CsrPlugin_targetPrivilege)
          2'b11 : begin
            CsrPlugin_mstatus_MIE <= 1'b0;
            CsrPlugin_mstatus_MPIE <= CsrPlugin_mstatus_MIE;
            CsrPlugin_mstatus_MPP <= CsrPlugin_privilege;
          end
          default : begin
          end
        endcase
      end
      if(_zz_140_)begin
        case(_zz_141_)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= (2'b00);
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= ({_zz_96_,{_zz_95_,_zz_94_}} != (3'b000));
      _zz_110_ <= 1'b0;
      if(_zz_137_)begin
        if(_zz_138_)begin
          execute_LightShifterPlugin_isActive <= 1'b1;
          if(execute_LightShifterPlugin_done)begin
            execute_LightShifterPlugin_isActive <= 1'b0;
          end
        end
      end
      if(execute_arbitration_removeIt)begin
        execute_LightShifterPlugin_isActive <= 1'b0;
      end
      _zz_122_ <= _zz_121_;
      if((! writeBack_arbitration_isStuck))begin
        memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
      end
      if((! writeBack_arbitration_isStuck))begin
        memory_to_writeBack_REGFILE_WRITE_DATA <= memory_REGFILE_WRITE_DATA;
      end
      if(((! execute_arbitration_isStuck) || execute_arbitration_removeIt))begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt)))begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(((! memory_arbitration_isStuck) || memory_arbitration_removeIt))begin
        memory_arbitration_isValid <= 1'b0;
      end
      if(((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt)))begin
        memory_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(((! writeBack_arbitration_isStuck) || writeBack_arbitration_removeIt))begin
        writeBack_arbitration_isValid <= 1'b0;
      end
      if(((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt)))begin
        writeBack_arbitration_isValid <= memory_arbitration_isValid;
      end
      case(execute_CsrPlugin_csrAddress)
        12'b001100000000 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mstatus_MPP <= execute_CsrPlugin_writeData[12 : 11];
            CsrPlugin_mstatus_MPIE <= _zz_195_[0];
            CsrPlugin_mstatus_MIE <= _zz_196_[0];
          end
        end
        12'b001101000100 : begin
        end
        12'b001100000100 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mie_MEIE <= _zz_198_[0];
            CsrPlugin_mie_MTIE <= _zz_199_[0];
            CsrPlugin_mie_MSIE <= _zz_200_[0];
          end
        end
        12'b001101000010 : begin
        end
        default : begin
        end
      endcase
    end
  end

  always @ (posedge clk) begin
    if(IBusSimplePlugin_iBusRsp_inputBeforeStage_ready)begin
      _zz_82_ <= IBusSimplePlugin_iBusRsp_inputBeforeStage_payload_pc;
      _zz_83_ <= IBusSimplePlugin_iBusRsp_inputBeforeStage_payload_rsp_error;
      _zz_84_ <= IBusSimplePlugin_iBusRsp_inputBeforeStage_payload_rsp_inst;
      _zz_85_ <= IBusSimplePlugin_iBusRsp_inputBeforeStage_payload_isRvc;
    end
    if(IBusSimplePlugin_injector_decodeInput_ready)begin
      IBusSimplePlugin_injector_formal_rawInDecode <= IBusSimplePlugin_iBusRsp_inputBeforeStage_payload_rsp_inst;
    end
    if(!(! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck))) begin
      $display("ERROR DBusSimplePlugin doesn't allow memory stage stall when read happend");
    end
    if(!(! (((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_MEMORY_STORE)) && writeBack_arbitration_isStuck))) begin
      $display("ERROR DBusSimplePlugin doesn't allow writeback stage stall when read happend");
    end
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + (64'b0000000000000000000000000000000000000000000000000000000000000001));
    if(writeBack_arbitration_isFiring)begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + (64'b0000000000000000000000000000000000000000000000000000000000000001));
    end
    if(_zz_148_)begin
      if(_zz_149_)begin
        CsrPlugin_interrupt_code <= (4'b0111);
        CsrPlugin_interrupt_targetPrivilege <= (2'b11);
      end
      if(_zz_150_)begin
        CsrPlugin_interrupt_code <= (4'b0011);
        CsrPlugin_interrupt_targetPrivilege <= (2'b11);
      end
      if(_zz_151_)begin
        CsrPlugin_interrupt_code <= (4'b1011);
        CsrPlugin_interrupt_targetPrivilege <= (2'b11);
      end
    end
    if(_zz_139_)begin
      case(CsrPlugin_targetPrivilege)
        2'b11 : begin
          CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
          CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
          CsrPlugin_mepc <= decode_PC;
        end
        default : begin
        end
      endcase
    end
    if(_zz_137_)begin
      if(_zz_138_)begin
        execute_LightShifterPlugin_amplitudeReg <= (execute_LightShifterPlugin_amplitude - (5'b00001));
      end
    end
    if(_zz_121_)begin
      _zz_123_ <= _zz_38_[11 : 7];
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS1 <= _zz_31_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_18_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_READ_DATA <= memory_MEMORY_READ_DATA;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= decode_FORMAL_PC_NEXT;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FORMAL_PC_NEXT <= execute_FORMAL_PC_NEXT;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_70_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_STORE <= decode_MEMORY_STORE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_STORE <= execute_MEMORY_STORE;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_STORE <= memory_MEMORY_STORE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= _zz_27_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PC <= execute_PC;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2 <= decode_SRC2;
    end
    if(((! memory_arbitration_isStuck) && (! execute_arbitration_isStuckByOthers)))begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_61_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_15_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ENABLE <= execute_MEMORY_ENABLE;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ENABLE <= memory_MEMORY_ENABLE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ENV_CTRL <= _zz_12_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_ENV_CTRL <= _zz_9_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_ENV_CTRL <= _zz_7_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_CTRL <= _zz_5_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS2 <= _zz_28_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_VALID <= execute_REGFILE_WRITE_VALID;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_VALID <= memory_REGFILE_WRITE_VALID;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_2_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1 <= decode_SRC1;
    end
    case(execute_CsrPlugin_csrAddress)
      12'b001100000000 : begin
      end
      12'b001101000100 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mip_MSIP <= _zz_197_[0];
        end
      end
      12'b001100000100 : begin
      end
      12'b001101000010 : begin
      end
      default : begin
      end
    endcase
  end

endmodule

