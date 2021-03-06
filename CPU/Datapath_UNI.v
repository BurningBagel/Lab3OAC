`ifndef PARAM
	`include "../Parametros.v"
`endif

//
// Caminho de dados processador RISC-V Uniciclo
//
// 2018-2 Marcus Vinicius Lamar
//

module Datapath_UNI (
    // Inputs e clocks
    input  wire        iCLK, iCLK50, iRST,
    input  wire [31:0] iInitialPC,

    // Para monitoramento
    output wire [31:0] mPC, mInstr,
    output wire [31:0] mRegDisp,
    input  wire [ 4:0] mRegDispSelect,
    output wire [31:0] mDebug,	 
    input  wire [ 4:0] mVGASelect,
    output wire [31:0] mVGARead,
	 output wire [31:0] mRead1,
	 output wire [31:0] mRead2,
	 output wire [31:0] mRegWrite,
	 output wire [31:0] mULA,

`ifdef RV32IMF
	 //output wire [31:0] mFPRead1,
	 //output wire [31:0] mFPRead2,
	 //output wire [31:0] mFPALUResult,
	 //output wire [31:0] mFPALUOrigA,
	 //output wire [31:0] mFPALUOrigB,
`endif


    //  Barramento de Dados
    output wire        DwReadEnable, DwWriteEnable,
    output wire [ 3:0] DwByteEnable,
    output wire [31:0] DwAddress, DwWriteData,
    input  wire [31:0] DwReadData,

    // Barramento de Instrucoes
    output wire        IwReadEnable, IwWriteEnable,
    output wire [ 3:0] IwByteEnable,
    output wire [31:0] IwAddress, IwWriteData,
    input  wire [31:0] IwReadData

);



// ****************************************************** 
// Definicao dos fios e registradores							 

reg  [31:0] PC;
wire [31:0] wPC, wPC4;
wire [ 4:0] wRs1, wRs2, wRd;
wire [31:0] wRead1, wRead2, wRegWrite;
wire [31:0] wOrigAULA,wOrigBULA,wALUresult;
wire [31:0] wiPC;
wire 			wBranch;
wire [31:0] wBranchPC;
wire [31:0] wImmediate;
wire [31:0] wInstr;
wire [ 2:0] wFunct3;

// sinais do controle 
wire        wCRegWrite;
wire 		   wCOrigAULA,wCOrigBULA;
wire [ 1:0] wCOrigPC;
wire [ 1:0] wCMem2Reg;
wire 			wCMemRead, wCMemWrite;
wire [ 4:0] wCALUControl;

wire [31:0] wFPWrite,wRegWriteFinal;

// fios FP
`ifdef RV32IMF
wire [31:0] wFPRead1, wFPRead2, wFPRegWrite;
wire [31:0] wOrigFPAULA,wOrigFPBULA,wFPALUresult;

wire			wCFPRegWrite,wCFPToMem,wCFPIntToFloat;
wire [4:0]  wCFPALUControl;
wire [1:0]	wCFPWriteSrc,wCFPFloatToInt;

// wire [31:0] wFPWrite; // fio que recebe saída do MUX depois da memória de dados
wire [31:0] wFPStore; // saída do Mux para escolher entre wRead2 e saída da FPULA

`endif

`ifndef RV32IMF
assign wRegWriteFinal = wRegWrite;
`endif

//assign wFPWrite = wRegWrite;

// Sinais de monitoramento e Debug
wire [31:0] wRegDisp, wVGARead;
wire [ 4:0] wRegDispSelect, wVGASelect;

assign mPC					= wPC; 
assign mInstr				= wInstr;
assign mRead1				= wRead1;
assign mRead2				= wRead2;
assign mRegWrite			= wRegWriteFinal;
assign mULA					= wALUresult;
assign mDebug				= 32'h000ACE10;	// Ligar onde for preciso	
assign mRegDisp			= wRegDisp;
assign mVGARead			= wVGARead;
assign wRegDispSelect 	= mRegDispSelect;
assign wVGASelect 		= mVGASelect;

`ifdef RV32IMF
//assign   mFPRead1			= wFPRead1;
//assign   mFPRead2			= wFPRead2;
//assign   mFPALUResult	= wFPALUresult;
//assign   mFPALUOrigA		= wOrigFPAULA;
//assign   mFPALUOrigB		= wOrigFPBULA;

`endif


// ****************************************************** 
// Inicializacao do PC						  						 

initial
	begin
		PC         <= BEGINNING_TEXT;
	end


// ****************************************************** 
// Definicao das estruturas assign		  						 

assign wPC			= PC;
assign wPC4       = wPC + 32'h00000004;
assign wBranchPC  = wPC + wImmediate;
assign wRs1			= wInstr[19:15];
assign wRs2			= wInstr[24:20];
assign wRd			= wInstr[11: 7];
assign wFunct3		= wInstr[14:12];


// ****************************************************** 
// Instanciacao das estruturas 	 		  						 


// Barramento da Memoria de Instrucoes 
assign    IwReadEnable      = ON;
assign    IwWriteEnable     = OFF;
assign    IwByteEnable      = 4'b1111;
assign    IwAddress         = wPC;
assign    IwWriteData       = ZERO;
assign    wInstr            = IwReadData;


// Banco de Registradores 
Registers REGISTERS0 (
    .iCLK(iCLK),
    .iRST(iRST),
    .iReadRegister1(wRs1),
    .iReadRegister2(wRs2),
    .iWriteRegister(wRd),
    .iWriteData(wRegWriteFinal),
    .iRegWrite(wCRegWrite),
    .oReadData1(wRead1),
    .oReadData2(wRead2),
	 
    .iRegDispSelect(wRegDispSelect),    // seleção para display
    .oRegDisp(wRegDisp),                // Reg display
    .iVGASelect(wVGASelect),            // para mostrar Regs na tela
    .oVGARead(wVGARead)                 // para mostrar Regs na tela
	);


// Unidade geradora do imediato 
ImmGen IMMGEN0 (
    .iInstrucao(wInstr),
    .oImm(wImmediate)
);


// ALU 
ALU ALU0 (
    .iControl(wCALUControl),
    .iA(wOrigAULA),
    .iB(wOrigBULA),
    .oResult(wALUresult),
    .oZero()
	);

// FPALU <<<<<----------
`ifdef RV32IMF
FPALU fpalu0(
	.icontrol(wCALUControl),
	.iclock(ICLK),
	.idataa(wOrigFPAULA),
	.idatab(wOrigFPBULA),
	.oresult(wFPALUresult),
	.oZero()
);
// FPREGISTERS
Registers REGISTERS1(
	.iCLK(ICLK),
	.iRST(iRST),
   .iReadRegister1(wRs1),
   .iReadRegister2(wRs2),
   .iWriteRegister(wRd),
	.iWriteData(wFPRegWrite),
	.iRegWrite(wCFPRegWrite),
	.oReadData1(wFPRead1),
	.oReadData2(wFPRead2),
	
);
`endif
	
// Unidade de controle de escrita 
wire [31:0] wMemDataWrite, wReadData;
wire [ 3:0] wMemEnable;

// caso a FPULA não esteja ativa, o wFPStore irá sempre assumir o valor de wRead2
//assign wFPStore          = wRead2;

MemStore MEMSTORE0 (
    .iAlignment(wALUresult[1:0]),
    .iFunct3(wFunct3),
    .iData(wFPStore),
    .oData(wMemDataWrite),
    .oByteEnable(wMemEnable),
    .oException()
	);

// Barramento da memoria de dados 
assign DwReadEnable     = wCMemRead;
assign DwWriteEnable    = wCMemWrite;
assign DwByteEnable     = wMemEnable;
assign DwWriteData      = wMemDataWrite;
assign wReadData        = DwReadData;
assign DwAddress        = wALUresult;


// Unidade de controle de leitura 
wire [31:0] wMemLoad;

MemLoad MEMLOAD0 (
    .iAlignment(wALUresult[1:0]),
    .iFunct3(wFunct3),
    .iData(wReadData),
    .oData(wMemLoad),
    .oException()
	);

	
	
// Unidade de Controle 
Control_UNI CONTROL0 (
    .iInstr(wInstr),
    .oOrigAULA(wCOrigAULA),
    .oOrigBULA(wCOrigBULA),	 
    .oMem2Reg(wCMem2Reg),
    .oRegWrite(wCRegWrite),
    .oMemWrite(wCMemWrite),
	 .oMemRead(wCMemRead),
    .oALUControl(wCALUControl),
    .oOrigPC(wCOrigPC)
	 `ifdef RV32IMF
	 ,
	 .oFPALUControl(wCFPALUControl),
	 .oFPToMem(wCFPToMem),
	 .oFPFloatToInt(wCFPFloatToInt),
	 .oFPIntToFloat(wCFPIntToFloat),
	 .oFPEscreveReg(wCFPEscreveReg),
	 .oFPWriteSrc(wCFPWriteSrc)
	 `endif
	);


// Unidade de controle de Branches 
BranchControl BC0 (
    .iFunct3(wFunct3),
    .iA(wRead1), 
	 .iB(wRead2),
    .oBranch(wBranch)
);



// ******************************************************
// multiplexadores							  						 


always @(*)
    case(wCOrigAULA)
        1'b0:      wOrigAULA <= wRead1;
        1'b1:      wOrigAULA <= wPC;
		  default:	 wOrigAULA <= ZERO;
    endcase

	 

always @(*)
    case(wCOrigBULA)
        1'b0:      wOrigBULA <= wRead2;
        1'b1:      wOrigBULA <= wImmediate;
		  default:	 wOrigBULA <= ZERO;
    endcase	 
	 

	 
always @(*)
    case(wCMem2Reg)
        2'b00:     wRegWrite <= wALUresult;		// Tipo-R e Tipo-I
        2'b01:     wRegWrite <= wPC4;				// jalr e jal
        2'b10:     wRegWrite <= wMemLoad;			// Loads
        default:   wRegWrite <= ZERO;
    endcase

	 
always @(*)
	case(wCOrigPC)
		2'b00:     wiPC <= wPC4;												// PC+4
      2'b01:     wiPC <= wBranch ? wBranchPC: wPC4;					// Branches
      2'b10:     wiPC <= wBranchPC;											// jal
      2'b11:     wiPC <= (wRead1+wImmediate) & ~(32'h000000001);	// jalr
		default:	  wiPC <= ZERO;
	endcase


`ifdef RV32IMF
// Multiplexadores FP
always @(*)
	case(wCFPIntToFloat)
		1'b0:		  wOrigFPAULA <= wRead1;
		1'b1:		  wOrigFPAULA <= wFPRead1;
		default:   wOrigFPAULA <= ZERO;
	endcase

always @(*)
	case(wCFPFloatToInt)
		2'b00:	  wRegWriteFinal <= wRegWrite;
		2'b01:     wRegWriteFinal <= wFPALUresult;
		2'b10:     wRegWriteFinal <= wFPRead1;
		default:   wRegWriteFinal <= ZERO;
	endcase

always @(*)
	case(wCFPWriteSrc)
		2'b00:     wFPRegWrite <= wFPALUresult;
		2'b01:     wFPRegWrite <= wRegWrite;
		2'b10:	  wFPRegWrite <= wRead1;
		default:   wFPRegWrite <= ZERO;
	endcase

always @(*)
	case(wCFPToMem)
		1'b0:      wFPStore <= wRead2;
		1'b1:      wFPStore <= wFPRead2;
		default:   wFPStore <= ZERO;
	endcase

`endif
// ****************************************************** 
// A cada ciclo de clock					  						 


always @(posedge iCLK or posedge iRST)
begin
    if(iRST)
			PC	<= iInitialPC;
    else
			PC	<= wiPC;
end


endmodule
