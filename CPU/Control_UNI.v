`ifndef PARAM
	`include "../Parametros.v"
`endif

//*
// * Bloco de Controle UNICICLO
// *
 

 module Control_UNI(
    input  [31:0] iInstr, 
    output    	 	oOrigAULA, oOrigBULA, oRegWrite, oMemWrite, oMemRead,
	 output [1:0]	oMem2Reg, oOrigPC,
	 output [4:0]  oALUControl
`ifdef RV32IMF
	 ,
	 output [4:0]  oFPALUControl,
	 output			oFPToMem, oFPIntToFloat, oFPEscreveReg,
	 output [1:0]	oFPFloatToInt, oFPWriteSrc
`endif
);


wire [6:0] Opcode = iInstr[ 6: 0];
wire [2:0] Funct3	= iInstr[14:12];
wire [6:0] Funct7	= iInstr[31:25];
wire [4:0] Rs2		= iInstr[24:20];


always @(*)
	case(Opcode)
		OPC_LOAD:
			begin
				oOrigAULA		<= 1'b0;
				oOrigBULA 		<= 1'b1;
				oRegWrite		<= 1'b1;
				oMemWrite		<= 1'b0; 
				oMemRead 		<= 1'b1; 
				oALUControl		<= OPADD;
				oMem2Reg 		<= 2'b10;
				oOrigPC			<= 2'b00;
				
		`ifdef RV32IMF
		
				oFPALUControl 	<= OPNULL;	//don't care
				oFPToMem			<= 1'b0;
				oFPFloatToInt	<= 2'b00;
				oFPIntToFloat	<= 1'b0;		//don't care
				oFPEscreveReg	<= 1'b0;		
				oFPWriteSrc		<= 2'b00;	//don't care
				
		`endif
			end
		OPC_OPIMM:
			begin
				oOrigAULA  	<= 1'b0;
				oOrigBULA 	<= 1'b1;
				oRegWrite	<= 1'b1;
				oMemWrite	<= 1'b0; 
				oMemRead 	<= 1'b0; 
				oMem2Reg 	<= 2'b00;
				oOrigPC		<= 2'b00;
				
		`ifdef RV32IMF
		
				oFPALUControl 	<= OPNULL;	//don't care
				oFPToMem			<= 1'b0;
				oFPFloatToInt	<= 2'b00;
				oFPIntToFloat	<= 1'b0;		//don't care
				oFPEscreveReg	<= 1'b0;		
				oFPWriteSrc		<= 2'b00;	//don't care
				
		`endif
				
				case (Funct3)
					FUNCT3_ADD:			oALUControl <= OPADD;
					FUNCT3_SLL:			oALUControl <= OPSLL;
					FUNCT3_SLT:			oALUControl <= OPSLT;
					FUNCT3_SLTU:		oALUControl	<= OPSLTU;
					FUNCT3_XOR:			oALUControl <= OPXOR;
					FUNCT3_SRL,
					FUNCT3_SRA:
						if(Funct7==FUNCT7_SRA)  oALUControl <= OPSRA;
						else 							oALUControl <= OPSRL;
					FUNCT3_OR:			oALUControl <= OPOR;
					FUNCT3_AND:			oALUControl <= OPAND;	
					default: // instrucao invalida
						begin
							oOrigAULA  	<= 1'b0;
							oOrigBULA 	<= 1'b0;
							oRegWrite	<= 1'b0;
							oMemWrite	<= 1'b0; 
							oMemRead 	<= 1'b0; 
							oALUControl	<= OPNULL;
							oMem2Reg 	<= 2'b00;
							oOrigPC		<= 2'b00;
							
					`ifdef RV32IMF
		
							oFPALUControl 	<= OPNULL;	//don't care
							oFPToMem			<= 1'b0;
							oFPFloatToInt	<= 2'b00;
							oFPIntToFloat	<= 1'b0;		//don't care
							oFPEscreveReg	<= 1'b0;		
							oFPWriteSrc		<= 2'b00;	//don't care
				
					`endif
						end				
				endcase
			end
			
		OPC_AUIPC:
			begin
				oOrigAULA  	<= 1'b1;
				oOrigBULA 	<= 1'b1;
				oRegWrite	<= 1'b1;
				oMemWrite	<= 1'b0; 
				oMemRead 	<= 1'b0; 
				oALUControl	<= OPADD;
				oMem2Reg 	<= 2'b00;
				oOrigPC		<= 2'b00;
				
		`ifdef RV32IMF
		
				oFPALUControl 	<= OPNULL;	//don't care
				oFPToMem			<= 1'b0;
				oFPFloatToInt	<= 2'b00;
				oFPIntToFloat	<= 1'b0;		//don't care
				oFPEscreveReg	<= 1'b0;		
				oFPWriteSrc		<= 2'b00;	//don't care
				
		`endif
			end
			
		OPC_STORE:
			begin
				oOrigAULA  	<= 1'b0;
				oOrigBULA 	<= 1'b1;
				oRegWrite	<= 1'b0;
				oMemWrite	<= 1'b1; 
				oMemRead 	<= 1'b0; 
				oALUControl	<= OPADD;
				oMem2Reg 	<= 2'b00;
				oOrigPC		<= 2'b00;
				
		`ifdef RV32IMF
		
				oFPALUControl 	<= OPNULL;	//don't care
				oFPToMem			<= 1'b0;
				oFPFloatToInt	<= 2'b00;
				oFPIntToFloat	<= 1'b0;		//don't care
				oFPEscreveReg	<= 1'b0;		
				oFPWriteSrc		<= 2'b00;	//don't care
				
		`endif
			end
		
		OPC_RTYPE:
			begin
				oOrigAULA  	<= 1'b0;
				oOrigBULA 	<= 1'b0;
				oRegWrite	<= 1'b1;
				oMemWrite	<= 1'b0; 
				oMemRead 	<= 1'b0; 
				oMem2Reg 	<= 2'b00;
				oOrigPC		<= 2'b00;
				
		`ifdef RV32IMF
		
				oFPALUControl 	<= OPNULL;	//don't care
				oFPToMem			<= 1'b0;
				oFPFloatToInt	<= 2'b00;
				oFPIntToFloat	<= 1'b0;		//don't care
				oFPEscreveReg	<= 1'b0;		
				oFPWriteSrc		<= 2'b00;	//don't care
				
		`endif
			case (Funct7)
				FUNCT7_ADD,  // ou qualquer outro 7'b0000000
				FUNCT7_SUB:	 // SUB ou SRA			
					case (Funct3)
						FUNCT3_ADD,
						FUNCT3_SUB:
							if(Funct7==FUNCT7_SUB)   oALUControl <= OPSUB;
							else 							 oALUControl <= OPADD;
						FUNCT3_SLL:			oALUControl <= OPSLL;
						FUNCT3_SLT:			oALUControl <= OPSLT;
						FUNCT3_SLTU:		oALUControl	<= OPSLTU;
						FUNCT3_XOR:			oALUControl <= OPXOR;
						FUNCT3_SRL,
						FUNCT3_SRA:
							if(Funct7==FUNCT7_SRA)  oALUControl <= OPSRA;
							else 							oALUControl <= OPSRL;
						FUNCT3_OR:			oALUControl <= OPOR;
						FUNCT3_AND:			oALUControl <= OPAND;
						default: // instrucao invalida
							begin
								oOrigAULA  	<= 1'b0;
								oOrigBULA 	<= 1'b0;
								oRegWrite	<= 1'b0;
								oMemWrite	<= 1'b0; 
								oMemRead 	<= 1'b0; 
								oALUControl	<= OPNULL;
								oMem2Reg 	<= 2'b00;
								oOrigPC		<= 2'b00;
								
						`ifdef RV32IMF
						
								oFPALUControl 	<= OPNULL;
								oFPToMem			<= 1'b0;
								oFPFloatToInt	<= 2'b00;
								oFPIntToFloat	<= 1'b0;
								oFPEscreveReg	<= 1'b0;
								oFPWriteSrc		<= 2'b00;
								
						`endif
							end				
					endcase

`ifdef RV32M					
				FUNCT7_MULDIV:
			
					case (Funct3)
						FUNCT3_MUL:			oALUControl <= OPMUL;
						FUNCT3_MULH:		oALUControl <= OPMULH;
						FUNCT3_MULHSU:		oALUControl <= OPMULHSU;
						FUNCT3_MULHU:		oALUControl <= OPMULHU;
						FUNCT3_DIV:			oALUControl <= OPDIV;
						FUNCT3_DIVU:		oALUControl <= OPDIVU;
						FUNCT3_REM:			oALUControl <= OPREM;
						FUNCT3_REMU:		oALUControl <= OPREMU;	
						default: // instrucao invalida
							begin
								oOrigAULA  	<= 1'b0;
								oOrigBULA 	<= 1'b0;
								oRegWrite	<= 1'b0;
								oMemWrite	<= 1'b0; 
								oMemRead 	<= 1'b0; 
								oALUControl	<= OPNULL;
								oMem2Reg 	<= 2'b00;
								oOrigPC		<= 2'b00;
								
						`ifdef RV32IMF
		
								oFPALUControl 	<= OPNULL;	//don't care
								oFPToMem			<= 1'b0;
								oFPFloatToInt	<= 2'b00;
								oFPIntToFloat	<= 1'b0;		//don't care
								oFPEscreveReg	<= 1'b0;		
								oFPWriteSrc		<= 2'b00;	//don't care
				
						`endif
							end				
					endcase
`endif			
				default: // instrucao invalida
					begin
						oOrigAULA  	<= 1'b0;
						oOrigBULA 	<= 1'b0;
						oRegWrite	<= 1'b0;
						oMemWrite	<= 1'b0; 
						oMemRead 	<= 1'b0; 
						oALUControl	<= OPNULL;
						oMem2Reg 	<= 2'b00;
						oOrigPC		<= 2'b00;
						
				`ifdef RV32IMF
				
						oFPALUControl 	<= OPNULL;
						oFPToMem			<= 1'b0;
						oFPFloatToInt	<= 2'b00;
						oFPIntToFloat	<= 1'b0;
						oFPEscreveReg	<= 1'b0;
						oFPWriteSrc		<= 2'b00;
						
				`endif
					end				
			endcase			
		end
		
		OPC_LUI:
			begin
				oOrigAULA  	<= 1'b0;
				oOrigBULA 	<= 1'b1;
				oRegWrite	<= 1'b1;
				oMemWrite	<= 1'b0; 
				oMemRead 	<= 1'b0; 
				oALUControl	<= OPLUI;
				oMem2Reg 	<= 2'b00;
				oOrigPC		<= 2'b00;
				
		`ifdef RV32IMF
		
				oFPALUControl 	<= OPNULL;	//don't care
				oFPToMem			<= 1'b0;
				oFPFloatToInt	<= 2'b00;
				oFPIntToFloat	<= 1'b0;		//don't care
				oFPEscreveReg	<= 1'b0;		
				oFPWriteSrc		<= 2'b00;	//don't care
				
		`endif
			end
			
		OPC_BRANCH:
			begin
				oOrigAULA  	<= 1'b0;
				oOrigBULA 	<= 1'b0;
				oRegWrite	<= 1'b0;
				oMemWrite	<= 1'b0; 
				oMemRead 	<= 1'b0; 
				oALUControl	<= OPADD;
				oMem2Reg 	<= 2'b00;
				oOrigPC		<= 2'b01;
				
		`ifdef RV32IMF
		
				oFPALUControl 	<= OPNULL;	//don't care
				oFPToMem			<= 1'b0;
				oFPFloatToInt	<= 2'b00;
				oFPIntToFloat	<= 1'b0;		//don't care
				oFPEscreveReg	<= 1'b0;		
				oFPWriteSrc		<= 2'b00;	//don't care
				
		`endif
			end
			
		OPC_JALR:
			begin
				oOrigAULA  	<= 1'b0;
				oOrigBULA 	<= 1'b0;
				oRegWrite	<= 1'b1;
				oMemWrite	<= 1'b0; 
				oMemRead 	<= 1'b0; 
				oALUControl	<= OPADD;
				oMem2Reg 	<= 2'b01;
				oOrigPC		<= 2'b11;
				
		`ifdef RV32IMF
		
				oFPALUControl 	<= OPNULL;	//don't care
				oFPToMem			<= 1'b0;
				oFPFloatToInt	<= 2'b00;
				oFPIntToFloat	<= 1'b0;		//don't care
				oFPEscreveReg	<= 1'b0;		
				oFPWriteSrc		<= 2'b00;	//don't care
				
		`endif
			end
		
		OPC_JAL:
			begin
				oOrigAULA  	<= 1'b0;
				oOrigBULA 	<= 1'b0;
				oRegWrite	<= 1'b1;
				oMemWrite	<= 1'b0; 
				oMemRead 	<= 1'b0; 
				oALUControl	<= OPADD;
				oMem2Reg 	<= 2'b01;
				oOrigPC		<= 2'b10;
				
		`ifdef RV32IMF
		
				oFPALUControl 	<= OPNULL;	//don't care
				oFPToMem			<= 1'b0;
				oFPFloatToInt	<= 2'b00;
				oFPIntToFloat	<= 1'b0;		//don't care
				oFPEscreveReg	<= 1'b0;		
				oFPWriteSrc		<= 2'b00;	//don't care
				
		`endif
			end
`ifdef RV32IMF
		OPC_FOPR:
			begin
				oOrigAULA  	<= 1'b0;
				oOrigBULA 	<= 1'b0;
				oRegWrite	<= 1'b0; 	//apenas instrs com R[rd], else 0.
				oMemWrite	<= 1'b0; 
				oMemRead 	<= 1'b0;
				oALUControl	<= OPNULL;	//don't care pra add, sub, mul, div, sqrt, sgnjs, min, max.
				oMem2Reg 	<= 2'b00;	//don't care pra add, sub, mul, div, sqrt, sgnjs, min, max.
				oOrigPC		<= 2'b00;	//pc+4 sempre.

				oFPToMem			<= 1'b0;	//don't care
				oFPFloatToInt	<= 2'b00;	//don't care pra add, sub, mul, div, sqrt, sgnjs, min, max. 
				oFPIntToFloat	<= 1'b1;	//1=dado vindo de F, 0=dado vindo de R.
				oFPEscreveReg	<= 1'b1;	//apenas instrs com F[rd], else 0.
				oFPWriteSrc		<= 2'b00;	//0 para armazenar o resultado da fpula, 1 pro resultado de mem2reg.
			
				case (Funct7)
				//intruções da forma F[rd]=F[rs1] op F[rs2]
					//instruções que dependem apenas do func7 (funcs7 únicos.)
					FUNCT7_FADD:			oFPALUControl	<= FOPADD;
					FUNCT7_FSUB:			oFPALUControl	<= FOPSUB;
					FUNCT7_SQRT:			oFPALUControl	<= FOPSQRT;
					FUNCT7_FDIV:			oFPALUControl	<= FOPDIV;
					FUNCT7_FMUL:			oFPALUControl	<= FOPMUL;
					
					//instruções que dependem do func3
					FUNCT7_FMAX,			
					FUNCT7_FMIN:
						begin
						if(Funct3==FUNCT3_MAX)
							oFPALUControl	<= FOPMAX;
						else								
							oFPALUControl	<= FOPMIN;
						end
						
					FUNCT7_FSGNJ,			
					FUNCT7_FSGNJN,			
					FUNCT7_FSGNJX:	
						begin
						if(Funct3==FUNCT3_SGNJ)			
							oFPALUControl	<= FOPSGNJ;
						else 
							begin
								if(Funct3==FUNCT3_SGNJN)	
									oFPALUControl	<= FOPSGNJN;
								else								
									oFPALUControl	<= FOPSGNJX;
							end
						end
						
					
					
					FUNCT7_FCVT_S_W,	//Convert from Integer	F[rd]=float(R[rs1])
					FUNCT7_FCVT_S_WU:	//Convert from Unsig Integer	F[rd]=float(R[rs1])
						begin
							oOrigAULA  	<= 1'b0;		//don't care
							oOrigBULA 	<= 1'b0;		//don't care
							oRegWrite	<= 1'b0; 	
							oMemWrite	<= 1'b0; 
							oMemRead 	<= 1'b0;
							oALUControl	<= OPNULL;	//don't care
							oMem2Reg 	<= 2'b00;	//don't care
							oOrigPC		<= 2'b00;	//pc+4 sempre.

							oFPToMem			<= 1'b0;		//don't care
							oFPFloatToInt	<= 2'b00;	//don't care	
							oFPIntToFloat	<= 1'b0;	
							oFPEscreveReg	<= 1'b1;	
							oFPWriteSrc		<= 2'b00;	
							
							if(Rs2==5'b00000)	oFPALUControl	<= FOPCVTSW;
							else					oFPALUControl	<= FOPCVTSWU;
						end
					
					FUNCT7_FCVT_W_S,	//Convert to Integer	R[rd]=integer(F[rs1])
					FUNCT7_FCVT_WU_S:	//Convert to Unsig Integer	R[rd]=integer(F[rs1])
						begin
							oOrigAULA  	<= 1'b0;		//don't care
							oOrigBULA 	<= 1'b0;		//don't care
							oRegWrite	<= 1'b1; 	
							oMemWrite	<= 1'b0; 
							oMemRead 	<= 1'b0;
							oALUControl	<= OPNULL;	//don't care
							oMem2Reg 	<= 2'b00;	//don't care
							oOrigPC		<= 2'b00;	//pc+4 sempre.

							oFPToMem			<= 1'b0;		//don't care
							oFPFloatToInt	<= 2'b01;		
							oFPIntToFloat	<= 1'b1;	
							oFPEscreveReg	<= 1'b0;	
							oFPWriteSrc		<= 2'b00;	//don't care
							
							if(Rs2==5'b00000)	oFPALUControl	<= FOPCVTWS;
							else					oFPALUControl	<= FOPCVTWUS;
						end
					
					
					FUNCT7_FEQ,	//Compare Float EQual		R[rd]=(F[rs1]==F[rs2])?1:0
					FUNCT7_FLT:	//Compare Float Less Than	R[rd]=(F[rs1]<F[rs2])?1:0
						begin
							oOrigAULA  	<= 1'b0;		//don't care
							oOrigBULA 	<= 1'b0;		//don't care
							oRegWrite	<= 1'b1; 	
							oMemWrite	<= 1'b0; 
							oMemRead 	<= 1'b0;
							oALUControl	<= OPNULL;	//don't care
							oMem2Reg 	<= 2'b00;	//don't care
							oOrigPC		<= 2'b00;	//pc+4 sempre.

							oFPToMem			<= 1'b0;		//don't care
							oFPFloatToInt	<= 2'b01;		
							oFPIntToFloat	<= 1'b1;	
							oFPEscreveReg	<= 1'b0;	
							oFPWriteSrc		<= 2'b00;	//don't care
							
							if(Funct3==FUNCT3_FEQ)	oFPALUControl	<= FOPCEQ;
							else							oFPALUControl	<= FOPCLT;
						end
					
					FUNCT7_FMVSX:	//Move from Integer	F[rd]=R[rs1]
						begin
							oOrigAULA  	<= 1'b0;		//don't care
							oOrigBULA 	<= 1'b0;		//don't care
							oRegWrite	<= 1'b0; 	
							oMemWrite	<= 1'b0; 
							oMemRead 	<= 1'b0;
							oALUControl	<= OPNULL;	//don't care
							oMem2Reg 	<= 2'b00;	//don't care
							oOrigPC		<= 2'b00;	//pc+4 sempre.

							oFPToMem			<= 1'b0;		//don't care
							oFPFloatToInt	<= 2'b00;	//don't care	
							oFPIntToFloat	<= 1'b0;	
							oFPEscreveReg	<= 1'b1;	
							oFPWriteSrc		<= 2'b00;	
							oFPALUControl	<= FOPMVSX;
						end
						
					FUNCT7_FMVXS:	//Move to Integer	R[rd]=F[rs1]
						begin
							oOrigAULA  	<= 1'b0;		//don't care
							oOrigBULA 	<= 1'b0;		//don't care
							oRegWrite	<= 1'b1; 	
							oMemWrite	<= 1'b0; 
							oMemRead 	<= 1'b0;
							oALUControl	<= OPNULL;	//don't care
							oMem2Reg 	<= 2'b00;	//don't care
							oOrigPC		<= 2'b00;	//pc+4 sempre.

							oFPToMem			<= 1'b0;		//don't care
							oFPFloatToInt	<= 2'b01;		
							oFPIntToFloat	<= 1'b1;	
							oFPEscreveReg	<= 1'b0;	
							oFPWriteSrc		<= 2'b00;	//don't care
							oFPALUControl	<= FOPMVXS;
						end
					
					default: // instrucao invalida
						begin
							oOrigAULA  	<= 1'b0;
							oOrigBULA 	<= 1'b0;
							oRegWrite	<= 1'b0;
							oMemWrite	<= 1'b0; 
							oMemRead 	<= 1'b0; 
							oALUControl	<= OPNULL;
							oMem2Reg 	<= 2'b00;
							oOrigPC		<= 2'b00;
						
							oFPALUControl 	<= OPNULL;
							oFPToMem			<= 1'b0;
							oFPFloatToInt	<= 2'b00;
							oFPIntToFloat	<= 1'b0;
							oFPEscreveReg	<= 1'b0;
							oFPWriteSrc		<= 2'b00;
						end				
				endcase	
			end
			
		OPC_FLW:
			begin
				oOrigAULA  	<= 1'b0; //R[rs1]
				oOrigBULA 	<= 1'b1; //imediato
				oRegWrite	<= 1'b0; 
				oMemWrite	<= 1'b0; 
				oMemRead 	<= 1'b1; 
				oALUControl	<= OPADD; 
				oMem2Reg 	<= 2'b00; //don't care			oq deve ser escrito no banco de reg: 00=resultado da ula, 01=pc+4, 10=memoria.
				oOrigPC		<= 2'b00; //calcula qual vai ser o proximo PC, 00=pc+4.
				
				
				oFPALUControl 	<= OPNULL;
				oFPToMem			<= 1'b0; //don't care
				oFPFloatToInt	<= 2'b00; //don't care
				oFPIntToFloat	<= 1'b0; //don't care
				oFPEscreveReg	<= 1'b1;
				oFPWriteSrc		<= 2'b01; //se vai escrever a partir da fpula ou da memoria
			end
			
		OPC_FSW:
			begin
				oOrigAULA  	<= 1'b0; //R[rs1]
				oOrigBULA 	<= 1'b1; //imediato
				oRegWrite	<= 1'b0; 
				oMemWrite	<= 1'b1; 
				oMemRead 	<= 1'b0; 
				oALUControl	<= OPADD; 
				oMem2Reg 	<= 2'b00; //don't care			oq deve ser escrito no banco de reg: 00=resultado da ula, 01=pc+4, 10=memoria.
				oOrigPC		<= 2'b00; //calcula qual vai ser o proximo PC, 00=pc+4.
				
				
				oFPALUControl 	<= OPNULL;
				oFPToMem			<= 1'b1;
				oFPFloatToInt	<= 2'b00; //don't care
				oFPIntToFloat	<= 1'b0; //don't care
				oFPEscreveReg	<= 1'b0;
				oFPWriteSrc		<= 2'b00; //don't care		se vai escrever a partir da fpula ou da memoria
				
			end
`endif
		default: // instrucao invalida
        begin
				oOrigAULA  	<= 1'b0;
				oOrigBULA 	<= 1'b0;
				oRegWrite	<= 1'b0;
				oMemWrite	<= 1'b0; 
				oMemRead 	<= 1'b0; 
				oALUControl	<= OPNULL;
				oMem2Reg 	<= 2'b00;
				oOrigPC		<= 2'b00;
				
		`ifdef RV32IMF
				
				oFPALUControl 	<= OPNULL;
				oFPToMem			<= 1'b0;
				oFPFloatToInt	<= 1'b0;
				oFPIntToFloat	<= 1'b0;
				oFPEscreveReg	<= 1'b0;
				oFPWriteSrc		<= 1'b0;
				
		`endif
        end
		
	endcase

endmodule
