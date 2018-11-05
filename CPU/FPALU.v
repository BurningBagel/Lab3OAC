`ifndef PARAM
	`include "Parametros.v"
`endif

module FPALU (
	input iclock,
	input [31:0] idataa,idatab,
	input [4:0] icontrol,
	output reg [31:0] oresult,
	output reg onan, ozero, ooverflow, ounderflow,
	output reg oCompResult
	);

//wire [3:0] icontrol = FOPADD;   // Para análise

// Para a operacao add e sub
wire [31:0] resultadd;
wire nanadd,zeroadd,overflowadd,underflowadd;

// Para a operacao mul
wire [31:0] resultmul;
wire nanmul,zeromul,overflowmul,underflowmul;

// Para a operacao div
wire [31:0] resultdiv;
wire nandiv,zerodiv,overflowdiv,underflowdiv;

// Para a operacao sqrt
wire [31:0] resultsqrt;
wire nansqrt,zerosqrt,overflowsqrt;

// Para a operacao abs
wire [31:0] resultabs;
wire nanabs,zeroabs,overflowabs,underflowabs;

// Para a operacao compara_equal
wire resultc_eq;

// Para a operacao compara_menor
wire resultc_lt;

// Para a operacao compara_menorigual
wire resultc_le;

// Para a operacao converte simples_word
wire [31:0] resultcvt_s_w;

// Para a operacao converte word_simples
wire [31:0] resultcvt_w_s;
wire nancvt_w_s,overflowcvt_w_s,underflowcvt_w_s;

// Para a operação converte word unsigned_simples
wire [31:0] resultcvt_wu_s;

// Para a operação converte simples_word unsigned
wire [31:0] resultcvt_s_wu;

// Para a operação max
wire [31:0] resultmax;

// Para a operação min
wire [31:0] resultmin;

always @(*)
	begin
		case (icontrol)
			FOPADD,
			FOPSUB:		//soma e Subtração
			begin
				oresult = resultadd;
				onan = nanadd;
				ozero = zeroadd;
				ooverflow = overflowadd;
				ounderflow = underflowadd;
				oCompResult = 1'b0;
			end

			FOPMUL:		//multiplicação
			begin
				oresult = resultmul;
				onan = nanmul;
				ozero = zeromul;
				ooverflow = overflowmul;
				ounderflow = underflowmul;
				oCompResult = 1'b0;
			end

			FOPDIV:		//divisão
			begin
				oresult = resultdiv;
				onan = nandiv;
				ozero = zerodiv;
				ooverflow = overflowdiv;
				ounderflow = underflowdiv;
				oCompResult = 1'b0;
			end

			FOPSQRT:		//sqrt
			begin
				oresult = resultsqrt;
				onan = nansqrt;
				ozero = zerosqrt;
				ooverflow = overflowsqrt;
				ounderflow = 1'b0;
				oCompResult = 1'b0;
			end

			FOPABS:		//abs
			begin
				oresult = resultabs;
				onan = nanabs;
				ozero = zeroabs;
				ooverflow = overflowabs;
				ounderflow = underflowabs;
				oCompResult = 1'b0;
			end

			FOPNEG:		//neg
			begin
				oresult[31] = ~idataa[31];
				oresult[30:0] = idataa[30:0];
				onan = 1'b0;
				ozero = 1'b0;
				ooverflow = 1'b0;
				ounderflow = 1'b0;
				oCompResult = 1'b0;
			end

			FOPSGNJ:		//signj #TODO
			begin
				oresult[31] = idatab[31]; //f1 = sinalde(b)+valorde(a)
				oresult[30:0] = idataa[30:0];
				onan = 1'b0;
				ozero = 1'b0;
				ooverflow = 1'b0;
				ounderflow = 1'b0;
				oCompResult = 1'b0;
			end

			FOPSGNJN:		//signjn #TODO
			begin
				oresult[31] = ~idatab[31]; //f1 = nega(sinalde(b))+valorde(a)
				oresult[30:0] = idataa[30:0];
				onan = 1'b0;
				ozero = 1'b0;
				ooverflow = 1'b0;
				ounderflow = 1'b0;
				oCompResult = 1'b0;
			end

			FOPSGNJX:		//signjx #TODO
			begin
				oresult[31] = idataa[31] ^ idatab[31]; //f1 = xor(sinalde(a),sinalde(b))+valorde(a)
				oresult[30:0] = idataa[30:0];
				onan = 1'b0;
				ozero = 1'b0;
				ooverflow = 1'b0;
				ounderflow = 1'b0;
				oCompResult = 1'b0;
			end

			FOPCEQ:		//c_eq
			begin
				oresult = 32'b0;
				onan = 1'b0;
				ozero = 1'b0;
				ooverflow = 1'b0;
				ounderflow = 1'b0;
				oCompResult = resultc_eq;
			end

			FOPCLT:		//c_lt
			begin
				oresult = 32'b0;
				onan = 1'b0;
				ozero = 1'b0;
				ooverflow = 1'b0;
				ounderflow = 1'b0;
				oCompResult = resultc_lt;
			end

			FOPCLE:		//c_le
			begin
				oresult = 32'b0;
				onan = 1'b0;
				ozero = 1'b0;
				ooverflow = 1'b0;
				ounderflow = 1'b0;

				oCompResult = resultc_le;
			end

			FOPCVTSW:		//cvt_s_w
			begin
				oresult = resultcvt_s_w;
				onan = 1'b0;
				ozero = 1'b0;
				ooverflow = 1'b0;
				ounderflow = 1'b0;
				oCompResult = 1'b0;
			end

			FOPCVTWS:		//cvt_w_s
			begin
				oresult = resultcvt_w_s;
				onan = nancvt_w_s;
				ozero = (resultcvt_w_s==32'b0);
				ooverflow = overflowcvt_w_s;
				ounderflow = underflowcvt_w_s;
				oCompResult = 1'b0;

			end
			
			FOPMAX:			//max
			begin
				oresult = resultmax;
				onan = 1'b0;
				ozero = 1'b0;
				ooverflow = 1'b0;
				ounderflow = 1'b0;
				oCompResult = 1'b0;
			end
			
			FOPMIN:			//min
			begin
				oresult = resultmin;
				onan = 1'b0;
				ozero = 1'b0;
				ooverflow = 1'b0;
				ounderflow = 1'b0;
				oCompResult = 1'b0;
			end
			
			FOPCVTSWU:		//cvt_s_wu
			begin
				oresult = resultcvt_s_wu;
				onan = 1'b0;
				ozero = 1'b0;
				ooverflow = 1'b0;
				ounderflow = 1'b0;
				oCompResult = 1'b0;
			end
			
			FOPCVTWUS:		//cvt_wu_s
			begin
				oresult = resultcvt_wu_s;
				onan = 1'b0;
				ozero = 1'b0;
				ooverflow = 1'b0;
				ounderflow = 1'b0;
				oCompResult = 1'b0;
			end

			default
			begin
				oresult = 32'h0;
				onan = 1'b0;
				ozero = 1'b0;
				ooverflow = 1'b0;
				ounderflow = 1'b0;
				oCompResult = 1'b0;
			end
		endcase
	end

add_sub add1 (
	.add_sub(icontrol==FOPADD),
	.clock(iclock),
	.dataa(idataa),
	.datab(idatab),
	.nan(nanadd),
	.overflow(overflowadd),
	.result(resultadd),
	.underflow(underflowadd),
	.zero(zeroadd));

mul_s mul1 (
	.clock(iclock),
	.dataa(idataa),
	.datab(idatab),
	.nan(nanmul),
	.overflow(overflowmul),
	.result(resultmul),
	.underflow(underflowmul),
	.zero(zeromul));

div_s div1 (
	.clock(iclock),
	.dataa(idataa),
	.datab(idatab),
	.nan(nandiv),
	.overflow(overflowdiv),
	.result(resultdiv),
	.underflow(underflowdiv),
	.zero(zerodiv));

sqrt_s sqrt1 (
	.clock(iclock),
	.data(idataa),
	.nan(nansqrt),
	.overflow(overflowsqrt),
	.result(resultsqrt),
	.zero(zerosqrt));

abs_s abs1 (
	.data(idataa),
	.nan(nanabs),
	.overflow(overflowabs),
	.result(resultabs),
	.underflow(underflowabs),
	.zero(zeroabs));

c_comp c_comp1 (
	.clock (iclock),
	.dataa (idataa),
	.datab (idatab),
	.aeb (resultc_eq),
	.alb (resultc_lt),
	.aleb (resultc_le));

cvt_s_w cvt_s_w1 (
	.clock (iclock),
	.dataa (idataa),
	.result (resultcvt_s_w));

cvt_w_s cvt_w_s1 (
	.clock (iclock),
	.dataa (idataa),
	.nan (nancvt_w_s),
	.overflow (overflowcvt_w_s),
	.result (resultcvt_w_s),
	.underflow (underflowcvt_w_s));
	
fmax fmax1 (
	.clock (iclock),
	.a (idataa),
	.b (idatab),
	.q (resultmax);
);


fmin fmin1 (
	.clock (iclock),
	.a (idataa),
	.b (idatab),
	.q (resultmin);
);

cvt_wu_s cvt_wu_s1(
	.clock (iclock),
	.a (idataa),
	.q (resultcvt_wu_s);

);
cvt_s_wu cvt_s_wu1(
	.clock (iclock),
	.a (idataa),
	.q (resultcvt_s_wu);
);

endmodule
