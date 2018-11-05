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
`ifdef RVIMF
	 ,
	 output [4:0]  oFPALUControl,
	 output			oFPToMem, FPFloatToInt, FPIntToFloat, FPEscreveReg, FPWriteSrc
`endif
);


wire [6:0] Opcode = iInstr[ 6: 0];
wire [2:0] Funct3	= iInstr[14:12];
wire [6:0] Funct7	= iInstr[31:25];


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
				
				`ifdef RVIMF
				oFPALUControl 	<= OPNULL;
				oFPToMem			<= 1'b0;
				oFPFloatToInt	<= 1'b0;
				oFPIntToFloat	<= 1'b0;
				oFPEscreveReg	<= 1'b0;
				oFPWriteSrc		<= 1'b0;
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
				
				`ifdef RVIMF
				oFPALUControl 	<= OPNULL;
				oFPToMem			<= 1'b0;
				oFPFloatToInt	<= 1'b0;
				oFPIntToFloat	<= 1'b0;
				oFPEscreveReg	<= 1'b0;
				oFPWriteSrc		<= 1'b0;
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
				
				`ifdef RVIMF
				oFPALUControl 	<= OPNULL;
				oFPToMem			<= 1'b0;
				oFPFloatToInt	<= 1'b0;
				oFPIntToFloat	<= 1'b0;
				oFPEscreveReg	<= 1'b0;
				oFPWriteSrc		<= 1'b0;
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
				
				`ifdef RVIMF
				oFPALUControl 	<= OPNULL;
				oFPToMem			<= 1'b0;
				oFPFloatToInt	<= 1'b0;
				oFPIntToFloat	<= 1'b0;
				oFPEscreveReg	<= 1'b0;
				oFPWriteSrc		<= 1'b0;
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
				
				`ifdef RVIMF
				oFPALUControl 	<= OPNULL;
				oFPToMem			<= 1'b0;
				oFPFloatToInt	<= 1'b0;
				oFPIntToFloat	<= 1'b0;
				oFPEscreveReg	<= 1'b0;
				oFPWriteSrc		<= 1'b0;
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
								
								`ifdef RVIMF
								oFPALUControl 	<= OPNULL;
								oFPToMem			<= 1'b0;
								oFPFloatToInt	<= 1'b0;
								oFPIntToFloat	<= 1'b0;
								oFPEscreveReg	<= 1'b0;
								oFPWriteSrc		<= 1'b0;
								`endif
							end				
					endcase

`ifdef RV32M					
				FUNCT7_MULDIV:
				
				`ifdef RVIMF
				oFPALUControl 	<= OPNULL;
				oFPToMem			<= 1'b0;
				oFPFloatToInt	<= 1'b0;
				oFPIntToFloat	<= 1'b0;
				oFPEscreveReg	<= 1'b0;
				oFPWriteSrc		<= 1'b0;
				`endif
			
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
						
						`ifdef RVIMF
						oFPALUControl 	<= OPNULL;
						oFPToMem			<= 1'b0;
						oFPFloatToInt	<= 1'b0;
						oFPIntToFloat	<= 1'b0;
						oFPEscreveReg	<= 1'b0;
						oFPWriteSrc		<= 1'b0;
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
				
				`ifdef RVIMF
				oFPALUControl 	<= OPNULL;
				oFPToMem			<= 1'b0;
				oFPFloatToInt	<= 1'b0;
				oFPIntToFloat	<= 1'b0;
				oFPEscreveReg	<= 1'b0;
				oFPWriteSrc		<= 1'b0;
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
				
				`ifdef RVIMF
				oFPALUControl 	<= OPNULL;
				oFPToMem			<= 1'b0;
				oFPFloatToInt	<= 1'b0;
				oFPIntToFloat	<= 1'b0;
				oFPEscreveReg	<= 1'b0;
				oFPWriteSrc		<= 1'b0;
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
				
				`ifdef RVIMF
				oFPALUControl 	<= OPNULL;
				oFPToMem			<= 1'b0;
				oFPFloatToInt	<= 1'b0;
				oFPIntToFloat	<= 1'b0;
				oFPEscreveReg	<= 1'b0;
				oFPWriteSrc		<= 1'b0;
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
				
				`ifdef RVIMF
				oFPALUControl 	<= OPNULL;
				oFPToMem			<= 1'b0;
				oFPFloatToInt	<= 1'b0;
				oFPIntToFloat	<= 1'b0;
				oFPEscreveReg	<= 1'b0;
				oFPWriteSrc		<= 1'b0;
				`endif
			end
`ifdef RVIMF
		OPC_FOPR:
			begin
				oOrigAULA  	<= 1'b0;
				oOrigBULA 	<= 1'b0;
				oRegWrite	<= 1'b1;
				oMemWrite	<= 1'b0; 
				oMemRead 	<= 1'b0;
				oALUControl	<= OPNULL;	
				oMem2Reg 	<= 2'b00;
				oOrigPC		<= 2'b00;

				oFPToMem			<= 1'b0;
				oFPFloatToInt	<= 1'b0;
				oFPIntToFloat	<= 1'b0;
				oFPEscreveReg	<= 1'b0;
				oFPWriteSrc		<= 1'b0;
			
				case (Funct7)
					FUNCT7_FADD: 
					FUNCT7_FSUB:
					FUNCT7_FCVT_S_W:
					FUNCT7_FCVT_W_S:
					FUNCT7_FCVT_S_WU:
					FUNCT7_FCVT_WU_S:
					FUNCT7_FDIV:
					FUNCT7_FEQ:
					FUNCT7_FLT:
					FUNCT7_FMAX:
					FUNCT7_FMIN:
					FUNCT7_FMUL:
					FUNCT7_FSGNJ:
					FUNCT7_FSGNJN:
					FUNCT7_FSGNJX:
					FUNCT7_SQRT:
					FUNCT7_FMVSX:
					FUNCT7_FMVXS:
					
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
							oFPFloatToInt	<= 1'b0;
							oFPIntToFloat	<= 1'b0;
							oFPEscreveReg	<= 1'b0;
							oFPWriteSrc		<= 1'b0;
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
				oFPFloatToInt	<= 1'b0; //don't care
				oFPIntToFloat	<= 1'b0; //don't care
				oFPEscreveReg	<= 1'b1;
				oFPWriteSrc		<= 1'b1; //se vai escrever a partir da fpula ou da memoria
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
				oFPFloatToInt	<= 1'b0; //don't care
				oFPIntToFloat	<= 1'b0; //don't care
				oFPEscreveReg	<= 1'b0;
				oFPWriteSrc		<= 1'b0; //don't care		se vai escrever a partir da fpula ou da memoria
				
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
				
				`ifdef RVIMF
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
