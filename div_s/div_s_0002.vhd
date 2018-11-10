-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 18.0 (Release Build #614)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2018 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from div_s_0002
-- VHDL created on Sat Nov 10 18:06:57 2018


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity div_s_0002 is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        b : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end div_s_0002;

architecture normal of div_s_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstBiasM1_uid6_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstBias_uid7_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expX_uid9_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracX_uid10_fpDivTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal signX_uid11_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expY_uid12_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracY_uid13_fpDivTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal signY_uid14_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal paddingY_uid15_fpDivTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal updatedY_uid16_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal fracYZero_uid15_fpDivTest_a : STD_LOGIC_VECTOR (23 downto 0);
    signal fracYZero_uid15_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracYZero_uid15_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid18_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstAllZWE_uid20_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal excZ_x_uid23_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid24_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid25_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid25_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid26_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid27_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid28_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid29_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid30_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid31_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid31_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid37_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid37_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid38_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid38_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid39_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid39_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid40_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid41_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid42_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid43_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid44_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid45_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid46_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid46_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXmY_uid47_fpDivTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expXmY_uid47_fpDivTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expXmY_uid47_fpDivTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expXmY_uid47_fpDivTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expR_uid48_fpDivTest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal expR_uid48_fpDivTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expR_uid48_fpDivTest_o : STD_LOGIC_VECTOR (10 downto 0);
    signal expR_uid48_fpDivTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal yAddr_uid51_fpDivTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal yPE_uid52_fpDivTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal invY_uid54_fpDivTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal invY_uid54_fpDivTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal invYO_uid55_fpDivTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal invYO_uid55_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal lOAdded_uid57_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal z4_uid60_fpDivTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal oFracXZ4_uid61_fpDivTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal divValPreNormYPow2Exc_uid63_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal divValPreNormYPow2Exc_uid63_fpDivTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal norm_uid64_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal divValPreNormHigh_uid65_fpDivTest_in : STD_LOGIC_VECTOR (26 downto 0);
    signal divValPreNormHigh_uid65_fpDivTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal divValPreNormLow_uid66_fpDivTest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal divValPreNormLow_uid66_fpDivTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal normFracRnd_uid67_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal normFracRnd_uid67_fpDivTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal expFracRnd_uid68_fpDivTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal zeroPaddingInAddition_uid74_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expFracPostRnd_uid75_fpDivTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_a : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_b : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_o : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_q : STD_LOGIC_VECTOR (35 downto 0);
    signal fracXExt_uid77_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal fracPostRndF_uid79_fpDivTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal fracPostRndF_uid79_fpDivTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracPostRndF_uid80_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostRndF_uid80_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expPostRndFR_uid81_fpDivTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal expPostRndFR_uid81_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expPostRndF_uid82_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expPostRndF_uid82_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal lOAdded_uid84_fpDivTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal lOAdded_uid87_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal qDivProdNorm_uid90_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal qDivProdFracHigh_uid91_fpDivTest_in : STD_LOGIC_VECTOR (47 downto 0);
    signal qDivProdFracHigh_uid91_fpDivTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal qDivProdFracLow_uid92_fpDivTest_in : STD_LOGIC_VECTOR (46 downto 0);
    signal qDivProdFracLow_uid92_fpDivTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal qDivProdFrac_uid93_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal qDivProdFrac_uid93_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal qDivProdExp_opA_uid94_fpDivTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal qDivProdExp_opA_uid94_fpDivTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal qDivProdExp_opA_uid94_fpDivTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal qDivProdExp_opA_uid94_fpDivTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal qDivProdExp_opBs_uid95_fpDivTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal qDivProdExp_opBs_uid95_fpDivTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal qDivProdExp_opBs_uid95_fpDivTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal qDivProdExp_opBs_uid95_fpDivTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal qDivProdExp_uid96_fpDivTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal qDivProdExp_uid96_fpDivTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal qDivProdExp_uid96_fpDivTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal qDivProdExp_uid96_fpDivTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal qDivProdFracWF_uid97_fpDivTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal qDivProdLTX_opA_uid98_fpDivTest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal qDivProdLTX_opA_uid98_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal qDivProdLTX_opA_uid99_fpDivTest_q : STD_LOGIC_VECTOR (30 downto 0);
    signal qDivProdLTX_opB_uid100_fpDivTest_q : STD_LOGIC_VECTOR (30 downto 0);
    signal qDividerProdLTX_uid101_fpDivTest_a : STD_LOGIC_VECTOR (32 downto 0);
    signal qDividerProdLTX_uid101_fpDivTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal qDividerProdLTX_uid101_fpDivTest_o : STD_LOGIC_VECTOR (32 downto 0);
    signal qDividerProdLTX_uid101_fpDivTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal betweenFPwF_uid102_fpDivTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal betweenFPwF_uid102_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal extraUlp_uid103_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal extraUlp_uid103_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostRndFT_uid104_fpDivTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPreExcExt_uid105_fpDivTest_a : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExcExt_uid105_fpDivTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExcExt_uid105_fpDivTest_o : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExcExt_uid105_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal fracPostRndFPostUlp_uid106_fpDivTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal fracPostRndFPostUlp_uid106_fpDivTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPreExc_uid107_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreExc_uid107_fpDivTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal ovfIncRnd_uid109_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracPostRndInc_uid110_fpDivTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expFracPostRndInc_uid110_fpDivTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expFracPostRndInc_uid110_fpDivTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expFracPostRndInc_uid110_fpDivTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expFracPostRndR_uid111_fpDivTest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracPostRndR_uid111_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expRPreExc_uid112_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRPreExc_uid112_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expRExt_uid114_fpDivTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expUdf_uid115_fpDivTest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expUdf_uid115_fpDivTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expUdf_uid115_fpDivTest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expUdf_uid115_fpDivTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid118_fpDivTest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expOvf_uid118_fpDivTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expOvf_uid118_fpDivTest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expOvf_uid118_fpDivTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal zeroOverReg_uid119_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regOverRegWithUf_uid120_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xRegOrZero_uid121_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regOrZeroOverInf_uid122_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid123_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid123_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRYZ_uid124_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRYROvf_uid125_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYZ_uid126_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYR_uid127_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid128_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid128_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZYZ_uid129_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYI_uid130_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid131_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid131_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid132_fpDivTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid133_fpDivTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal oneFracRPostExc2_uid134_fpDivTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPostExc_uid137_fpDivTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid137_fpDivTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid141_fpDivTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid141_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal invExcRNaN_uid142_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sRPostExc_uid143_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal sRPostExc_uid143_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal divR_uid144_fpDivTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal os_uid148_invTables_q : STD_LOGIC_VECTOR (31 downto 0);
    signal os_uid152_invTables_q : STD_LOGIC_VECTOR (21 downto 0);
    signal yT1_uid160_invPolyEval_b : STD_LOGIC_VECTOR (12 downto 0);
    signal lowRangeB_uid162_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid162_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid163_invPolyEval_b : STD_LOGIC_VECTOR (12 downto 0);
    signal s1sumAHighB_uid164_invPolyEval_a : STD_LOGIC_VECTOR (22 downto 0);
    signal s1sumAHighB_uid164_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal s1sumAHighB_uid164_invPolyEval_o : STD_LOGIC_VECTOR (22 downto 0);
    signal s1sumAHighB_uid164_invPolyEval_q : STD_LOGIC_VECTOR (22 downto 0);
    signal s1_uid165_invPolyEval_q : STD_LOGIC_VECTOR (23 downto 0);
    signal lowRangeB_uid168_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid168_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid169_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal s2sumAHighB_uid170_invPolyEval_a : STD_LOGIC_VECTOR (32 downto 0);
    signal s2sumAHighB_uid170_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal s2sumAHighB_uid170_invPolyEval_o : STD_LOGIC_VECTOR (32 downto 0);
    signal s2sumAHighB_uid170_invPolyEval_q : STD_LOGIC_VECTOR (32 downto 0);
    signal s2_uid171_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal osig_uid174_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal osig_uid177_pT1_uid161_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal osig_uid180_pT2_uid167_invPolyEval_b : STD_LOGIC_VECTOR (24 downto 0);
    signal memoryC0_uid146_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid146_invTables_lutmem_ia : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC0_uid146_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid146_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid146_invTables_lutmem_ir : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC0_uid146_invTables_lutmem_r : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC0_uid147_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid147_invTables_lutmem_ia : STD_LOGIC_VECTOR (11 downto 0);
    signal memoryC0_uid147_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid147_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid147_invTables_lutmem_ir : STD_LOGIC_VECTOR (11 downto 0);
    signal memoryC0_uid147_invTables_lutmem_r : STD_LOGIC_VECTOR (11 downto 0);
    signal memoryC1_uid150_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid150_invTables_lutmem_ia : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC1_uid150_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid150_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid150_invTables_lutmem_ir : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC1_uid150_invTables_lutmem_r : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC1_uid151_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid151_invTables_lutmem_ia : STD_LOGIC_VECTOR (1 downto 0);
    signal memoryC1_uid151_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid151_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid151_invTables_lutmem_ir : STD_LOGIC_VECTOR (1 downto 0);
    signal memoryC1_uid151_invTables_lutmem_r : STD_LOGIC_VECTOR (1 downto 0);
    signal memoryC2_uid154_invTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid154_invTables_lutmem_ia : STD_LOGIC_VECTOR (12 downto 0);
    signal memoryC2_uid154_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid154_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid154_invTables_lutmem_ir : STD_LOGIC_VECTOR (12 downto 0);
    signal memoryC2_uid154_invTables_lutmem_r : STD_LOGIC_VECTOR (12 downto 0);
    signal qDivProd_uid89_fpDivTest_cma_reset : std_logic;
    type qDivProd_uid89_fpDivTest_cma_a0type is array(NATURAL range <>) of UNSIGNED(24 downto 0);
    signal qDivProd_uid89_fpDivTest_cma_a0 : qDivProd_uid89_fpDivTest_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of qDivProd_uid89_fpDivTest_cma_a0 : signal is true;
    type qDivProd_uid89_fpDivTest_cma_c0type is array(NATURAL range <>) of UNSIGNED(23 downto 0);
    signal qDivProd_uid89_fpDivTest_cma_c0 : qDivProd_uid89_fpDivTest_cma_c0type(0 to 0);
    attribute preserve of qDivProd_uid89_fpDivTest_cma_c0 : signal is true;
    type qDivProd_uid89_fpDivTest_cma_ptype is array(NATURAL range <>) of UNSIGNED(48 downto 0);
    signal qDivProd_uid89_fpDivTest_cma_p : qDivProd_uid89_fpDivTest_cma_ptype(0 to 0);
    signal qDivProd_uid89_fpDivTest_cma_u : qDivProd_uid89_fpDivTest_cma_ptype(0 to 0);
    signal qDivProd_uid89_fpDivTest_cma_w : qDivProd_uid89_fpDivTest_cma_ptype(0 to 0);
    signal qDivProd_uid89_fpDivTest_cma_x : qDivProd_uid89_fpDivTest_cma_ptype(0 to 0);
    signal qDivProd_uid89_fpDivTest_cma_y : qDivProd_uid89_fpDivTest_cma_ptype(0 to 0);
    signal qDivProd_uid89_fpDivTest_cma_s : qDivProd_uid89_fpDivTest_cma_ptype(0 to 0);
    signal qDivProd_uid89_fpDivTest_cma_qq : STD_LOGIC_VECTOR (48 downto 0);
    signal qDivProd_uid89_fpDivTest_cma_q : STD_LOGIC_VECTOR (48 downto 0);
    signal qDivProd_uid89_fpDivTest_cma_ena0 : std_logic;
    signal qDivProd_uid89_fpDivTest_cma_ena1 : std_logic;
    signal prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_reset : std_logic;
    type prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_a0type is array(NATURAL range <>) of UNSIGNED(26 downto 0);
    signal prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_a0 : prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_a0 : signal is true;
    signal prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_c0 : qDivProd_uid89_fpDivTest_cma_c0type(0 to 0);
    attribute preserve of prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_c0 : signal is true;
    type prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_ptype is array(NATURAL range <>) of UNSIGNED(50 downto 0);
    signal prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_p : prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_ptype(0 to 0);
    signal prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_u : prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_ptype(0 to 0);
    signal prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_w : prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_ptype(0 to 0);
    signal prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_x : prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_ptype(0 to 0);
    signal prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_y : prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_ptype(0 to 0);
    signal prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_s : prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_ptype(0 to 0);
    signal prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_qq : STD_LOGIC_VECTOR (50 downto 0);
    signal prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_q : STD_LOGIC_VECTOR (50 downto 0);
    signal prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_ena0 : std_logic;
    signal prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_ena1 : std_logic;
    signal prodXY_uid176_pT1_uid161_invPolyEval_cma_reset : std_logic;
    type prodXY_uid176_pT1_uid161_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(12 downto 0);
    signal prodXY_uid176_pT1_uid161_invPolyEval_cma_a0 : prodXY_uid176_pT1_uid161_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid176_pT1_uid161_invPolyEval_cma_a0 : signal is true;
    type prodXY_uid176_pT1_uid161_invPolyEval_cma_c0type is array(NATURAL range <>) of SIGNED(12 downto 0);
    signal prodXY_uid176_pT1_uid161_invPolyEval_cma_c0 : prodXY_uid176_pT1_uid161_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of prodXY_uid176_pT1_uid161_invPolyEval_cma_c0 : signal is true;
    type prodXY_uid176_pT1_uid161_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(13 downto 0);
    signal prodXY_uid176_pT1_uid161_invPolyEval_cma_l : prodXY_uid176_pT1_uid161_invPolyEval_cma_ltype(0 to 0);
    type prodXY_uid176_pT1_uid161_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(26 downto 0);
    signal prodXY_uid176_pT1_uid161_invPolyEval_cma_p : prodXY_uid176_pT1_uid161_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid176_pT1_uid161_invPolyEval_cma_u : prodXY_uid176_pT1_uid161_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid176_pT1_uid161_invPolyEval_cma_w : prodXY_uid176_pT1_uid161_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid176_pT1_uid161_invPolyEval_cma_x : prodXY_uid176_pT1_uid161_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid176_pT1_uid161_invPolyEval_cma_y : prodXY_uid176_pT1_uid161_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid176_pT1_uid161_invPolyEval_cma_s : prodXY_uid176_pT1_uid161_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid176_pT1_uid161_invPolyEval_cma_qq : STD_LOGIC_VECTOR (25 downto 0);
    signal prodXY_uid176_pT1_uid161_invPolyEval_cma_q : STD_LOGIC_VECTOR (25 downto 0);
    signal prodXY_uid176_pT1_uid161_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid176_pT1_uid161_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid179_pT2_uid167_invPolyEval_cma_reset : std_logic;
    type prodXY_uid179_pT2_uid167_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(13 downto 0);
    signal prodXY_uid179_pT2_uid167_invPolyEval_cma_a0 : prodXY_uid179_pT2_uid167_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid179_pT2_uid167_invPolyEval_cma_a0 : signal is true;
    type prodXY_uid179_pT2_uid167_invPolyEval_cma_c0type is array(NATURAL range <>) of SIGNED(23 downto 0);
    signal prodXY_uid179_pT2_uid167_invPolyEval_cma_c0 : prodXY_uid179_pT2_uid167_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of prodXY_uid179_pT2_uid167_invPolyEval_cma_c0 : signal is true;
    type prodXY_uid179_pT2_uid167_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(14 downto 0);
    signal prodXY_uid179_pT2_uid167_invPolyEval_cma_l : prodXY_uid179_pT2_uid167_invPolyEval_cma_ltype(0 to 0);
    type prodXY_uid179_pT2_uid167_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(38 downto 0);
    signal prodXY_uid179_pT2_uid167_invPolyEval_cma_p : prodXY_uid179_pT2_uid167_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid179_pT2_uid167_invPolyEval_cma_u : prodXY_uid179_pT2_uid167_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid179_pT2_uid167_invPolyEval_cma_w : prodXY_uid179_pT2_uid167_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid179_pT2_uid167_invPolyEval_cma_x : prodXY_uid179_pT2_uid167_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid179_pT2_uid167_invPolyEval_cma_y : prodXY_uid179_pT2_uid167_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid179_pT2_uid167_invPolyEval_cma_s : prodXY_uid179_pT2_uid167_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid179_pT2_uid167_invPolyEval_cma_qq : STD_LOGIC_VECTOR (37 downto 0);
    signal prodXY_uid179_pT2_uid167_invPolyEval_cma_q : STD_LOGIC_VECTOR (37 downto 0);
    signal prodXY_uid179_pT2_uid167_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid179_pT2_uid167_invPolyEval_cma_ena1 : std_logic;
    signal redist0_memoryC0_uid147_invTables_lutmem_r_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist1_memoryC0_uid146_invTables_lutmem_r_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist2_osig_uid180_pT2_uid167_invPolyEval_b_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist3_lowRangeB_uid162_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_sRPostExc_uid143_fpDivTest_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_excREnc_uid133_fpDivTest_q_6_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist6_ovfIncRnd_uid109_fpDivTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_fracPostRndFPostUlp_uid106_fpDivTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist8_fracPostRndFT_uid104_fpDivTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist9_fracPostRndFT_uid104_fpDivTest_b_2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist10_extraUlp_uid103_fpDivTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_qDivProdLTX_opA_uid98_fpDivTest_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist12_qDivProdFracWF_uid97_fpDivTest_b_2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist13_qDivProdExp_opA_uid94_fpDivTest_q_3_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist16_norm_uid64_fpDivTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_lOAdded_uid57_fpDivTest_q_2_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist18_invYO_uid55_fpDivTest_b_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_invY_uid54_fpDivTest_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist20_yPE_uid52_fpDivTest_b_2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist21_yPE_uid52_fpDivTest_b_5_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist22_yAddr_uid51_fpDivTest_b_2_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist23_yAddr_uid51_fpDivTest_b_5_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist24_signR_uid46_fpDivTest_q_15_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_expXIsMax_uid24_fpDivTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_excZ_x_uid23_fpDivTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_fracY_uid13_fpDivTest_b_13_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist30_expY_uid12_fpDivTest_b_13_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist32_fracX_uid10_fpDivTest_b_13_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist33_fracX_uid10_fpDivTest_b_17_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist35_expX_uid9_fpDivTest_b_13_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist36_expX_uid9_fpDivTest_b_17_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist14_expPostRndFR_uid81_fpDivTest_b_7_outputreg_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist14_expPostRndFR_uid81_fpDivTest_b_7_mem_reset0 : std_logic;
    signal redist14_expPostRndFR_uid81_fpDivTest_b_7_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist14_expPostRndFR_uid81_fpDivTest_b_7_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist14_expPostRndFR_uid81_fpDivTest_b_7_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist14_expPostRndFR_uid81_fpDivTest_b_7_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist14_expPostRndFR_uid81_fpDivTest_b_7_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist14_expPostRndFR_uid81_fpDivTest_b_7_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist14_expPostRndFR_uid81_fpDivTest_b_7_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist14_expPostRndFR_uid81_fpDivTest_b_7_rdcnt_i : signal is true;
    signal redist14_expPostRndFR_uid81_fpDivTest_b_7_rdcnt_eq : std_logic;
    attribute preserve of redist14_expPostRndFR_uid81_fpDivTest_b_7_rdcnt_eq : signal is true;
    signal redist14_expPostRndFR_uid81_fpDivTest_b_7_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist14_expPostRndFR_uid81_fpDivTest_b_7_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist14_expPostRndFR_uid81_fpDivTest_b_7_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_expPostRndFR_uid81_fpDivTest_b_7_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_expPostRndFR_uid81_fpDivTest_b_7_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_expPostRndFR_uid81_fpDivTest_b_7_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_expPostRndFR_uid81_fpDivTest_b_7_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only : boolean;
    attribute preserve_syn_only of redist14_expPostRndFR_uid81_fpDivTest_b_7_sticky_ena_q : signal is true;
    signal redist14_expPostRndFR_uid81_fpDivTest_b_7_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_fracPostRndF_uid80_fpDivTest_q_5_outputreg_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist15_fracPostRndF_uid80_fpDivTest_q_5_mem_reset0 : std_logic;
    signal redist15_fracPostRndF_uid80_fpDivTest_q_5_mem_ia : STD_LOGIC_VECTOR (23 downto 0);
    signal redist15_fracPostRndF_uid80_fpDivTest_q_5_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist15_fracPostRndF_uid80_fpDivTest_q_5_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist15_fracPostRndF_uid80_fpDivTest_q_5_mem_iq : STD_LOGIC_VECTOR (23 downto 0);
    signal redist15_fracPostRndF_uid80_fpDivTest_q_5_mem_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist15_fracPostRndF_uid80_fpDivTest_q_5_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist15_fracPostRndF_uid80_fpDivTest_q_5_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist15_fracPostRndF_uid80_fpDivTest_q_5_rdcnt_i : signal is true;
    signal redist15_fracPostRndF_uid80_fpDivTest_q_5_rdcnt_eq : std_logic;
    attribute preserve of redist15_fracPostRndF_uid80_fpDivTest_q_5_rdcnt_eq : signal is true;
    signal redist15_fracPostRndF_uid80_fpDivTest_q_5_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist15_fracPostRndF_uid80_fpDivTest_q_5_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist15_fracPostRndF_uid80_fpDivTest_q_5_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_fracPostRndF_uid80_fpDivTest_q_5_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_fracPostRndF_uid80_fpDivTest_q_5_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_fracPostRndF_uid80_fpDivTest_q_5_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_fracPostRndF_uid80_fpDivTest_q_5_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist15_fracPostRndF_uid80_fpDivTest_q_5_sticky_ena_q : signal is true;
    signal redist15_fracPostRndF_uid80_fpDivTest_q_5_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_fracY_uid13_fpDivTest_b_10_outputreg_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist27_fracY_uid13_fpDivTest_b_10_mem_reset0 : std_logic;
    signal redist27_fracY_uid13_fpDivTest_b_10_mem_ia : STD_LOGIC_VECTOR (22 downto 0);
    signal redist27_fracY_uid13_fpDivTest_b_10_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist27_fracY_uid13_fpDivTest_b_10_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist27_fracY_uid13_fpDivTest_b_10_mem_iq : STD_LOGIC_VECTOR (22 downto 0);
    signal redist27_fracY_uid13_fpDivTest_b_10_mem_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist27_fracY_uid13_fpDivTest_b_10_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist27_fracY_uid13_fpDivTest_b_10_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist27_fracY_uid13_fpDivTest_b_10_rdcnt_i : signal is true;
    signal redist27_fracY_uid13_fpDivTest_b_10_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist27_fracY_uid13_fpDivTest_b_10_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist27_fracY_uid13_fpDivTest_b_10_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist27_fracY_uid13_fpDivTest_b_10_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_fracY_uid13_fpDivTest_b_10_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_fracY_uid13_fpDivTest_b_10_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_fracY_uid13_fpDivTest_b_10_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_fracY_uid13_fpDivTest_b_10_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist27_fracY_uid13_fpDivTest_b_10_sticky_ena_q : signal is true;
    signal redist27_fracY_uid13_fpDivTest_b_10_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_expY_uid12_fpDivTest_b_10_outputreg_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist29_expY_uid12_fpDivTest_b_10_mem_reset0 : std_logic;
    signal redist29_expY_uid12_fpDivTest_b_10_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist29_expY_uid12_fpDivTest_b_10_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist29_expY_uid12_fpDivTest_b_10_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist29_expY_uid12_fpDivTest_b_10_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist29_expY_uid12_fpDivTest_b_10_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist29_expY_uid12_fpDivTest_b_10_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist29_expY_uid12_fpDivTest_b_10_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist29_expY_uid12_fpDivTest_b_10_rdcnt_i : signal is true;
    signal redist29_expY_uid12_fpDivTest_b_10_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist29_expY_uid12_fpDivTest_b_10_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist29_expY_uid12_fpDivTest_b_10_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist29_expY_uid12_fpDivTest_b_10_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_expY_uid12_fpDivTest_b_10_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_expY_uid12_fpDivTest_b_10_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_expY_uid12_fpDivTest_b_10_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_expY_uid12_fpDivTest_b_10_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist29_expY_uid12_fpDivTest_b_10_sticky_ena_q : signal is true;
    signal redist29_expY_uid12_fpDivTest_b_10_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_fracX_uid10_fpDivTest_b_9_outputreg_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist31_fracX_uid10_fpDivTest_b_9_mem_reset0 : std_logic;
    signal redist31_fracX_uid10_fpDivTest_b_9_mem_ia : STD_LOGIC_VECTOR (22 downto 0);
    signal redist31_fracX_uid10_fpDivTest_b_9_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist31_fracX_uid10_fpDivTest_b_9_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist31_fracX_uid10_fpDivTest_b_9_mem_iq : STD_LOGIC_VECTOR (22 downto 0);
    signal redist31_fracX_uid10_fpDivTest_b_9_mem_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist31_fracX_uid10_fpDivTest_b_9_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist31_fracX_uid10_fpDivTest_b_9_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist31_fracX_uid10_fpDivTest_b_9_rdcnt_i : signal is true;
    signal redist31_fracX_uid10_fpDivTest_b_9_rdcnt_eq : std_logic;
    attribute preserve of redist31_fracX_uid10_fpDivTest_b_9_rdcnt_eq : signal is true;
    signal redist31_fracX_uid10_fpDivTest_b_9_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist31_fracX_uid10_fpDivTest_b_9_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist31_fracX_uid10_fpDivTest_b_9_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist31_fracX_uid10_fpDivTest_b_9_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_fracX_uid10_fpDivTest_b_9_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_fracX_uid10_fpDivTest_b_9_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_fracX_uid10_fpDivTest_b_9_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_fracX_uid10_fpDivTest_b_9_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist31_fracX_uid10_fpDivTest_b_9_sticky_ena_q : signal is true;
    signal redist31_fracX_uid10_fpDivTest_b_9_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_fracX_uid10_fpDivTest_b_13_inputreg_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist33_fracX_uid10_fpDivTest_b_17_inputreg_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist34_expX_uid9_fpDivTest_b_10_outputreg_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist34_expX_uid9_fpDivTest_b_10_mem_reset0 : std_logic;
    signal redist34_expX_uid9_fpDivTest_b_10_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist34_expX_uid9_fpDivTest_b_10_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist34_expX_uid9_fpDivTest_b_10_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist34_expX_uid9_fpDivTest_b_10_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist34_expX_uid9_fpDivTest_b_10_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist34_expX_uid9_fpDivTest_b_10_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist34_expX_uid9_fpDivTest_b_10_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist34_expX_uid9_fpDivTest_b_10_rdcnt_i : signal is true;
    signal redist34_expX_uid9_fpDivTest_b_10_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist34_expX_uid9_fpDivTest_b_10_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist34_expX_uid9_fpDivTest_b_10_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist34_expX_uid9_fpDivTest_b_10_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_expX_uid9_fpDivTest_b_10_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_expX_uid9_fpDivTest_b_10_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_expX_uid9_fpDivTest_b_10_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_expX_uid9_fpDivTest_b_10_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist34_expX_uid9_fpDivTest_b_10_sticky_ena_q : signal is true;
    signal redist34_expX_uid9_fpDivTest_b_10_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist27_fracY_uid13_fpDivTest_b_10_notEnable(LOGICAL,256)
    redist27_fracY_uid13_fpDivTest_b_10_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist27_fracY_uid13_fpDivTest_b_10_nor(LOGICAL,257)
    redist27_fracY_uid13_fpDivTest_b_10_nor_q <= not (redist27_fracY_uid13_fpDivTest_b_10_notEnable_q or redist27_fracY_uid13_fpDivTest_b_10_sticky_ena_q);

    -- redist27_fracY_uid13_fpDivTest_b_10_mem_last(CONSTANT,253)
    redist27_fracY_uid13_fpDivTest_b_10_mem_last_q <= "0110";

    -- redist27_fracY_uid13_fpDivTest_b_10_cmp(LOGICAL,254)
    redist27_fracY_uid13_fpDivTest_b_10_cmp_b <= STD_LOGIC_VECTOR("0" & redist27_fracY_uid13_fpDivTest_b_10_rdcnt_q);
    redist27_fracY_uid13_fpDivTest_b_10_cmp_q <= "1" WHEN redist27_fracY_uid13_fpDivTest_b_10_mem_last_q = redist27_fracY_uid13_fpDivTest_b_10_cmp_b ELSE "0";

    -- redist27_fracY_uid13_fpDivTest_b_10_cmpReg(REG,255)
    redist27_fracY_uid13_fpDivTest_b_10_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist27_fracY_uid13_fpDivTest_b_10_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist27_fracY_uid13_fpDivTest_b_10_cmpReg_q <= STD_LOGIC_VECTOR(redist27_fracY_uid13_fpDivTest_b_10_cmp_q);
        END IF;
    END PROCESS;

    -- redist27_fracY_uid13_fpDivTest_b_10_sticky_ena(REG,258)
    redist27_fracY_uid13_fpDivTest_b_10_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist27_fracY_uid13_fpDivTest_b_10_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist27_fracY_uid13_fpDivTest_b_10_nor_q = "1") THEN
                redist27_fracY_uid13_fpDivTest_b_10_sticky_ena_q <= STD_LOGIC_VECTOR(redist27_fracY_uid13_fpDivTest_b_10_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist27_fracY_uid13_fpDivTest_b_10_enaAnd(LOGICAL,259)
    redist27_fracY_uid13_fpDivTest_b_10_enaAnd_q <= redist27_fracY_uid13_fpDivTest_b_10_sticky_ena_q and VCC_q;

    -- redist27_fracY_uid13_fpDivTest_b_10_rdcnt(COUNTER,251)
    -- low=0, high=7, step=1, init=0
    redist27_fracY_uid13_fpDivTest_b_10_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist27_fracY_uid13_fpDivTest_b_10_rdcnt_i <= TO_UNSIGNED(0, 3);
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist27_fracY_uid13_fpDivTest_b_10_rdcnt_i <= redist27_fracY_uid13_fpDivTest_b_10_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist27_fracY_uid13_fpDivTest_b_10_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist27_fracY_uid13_fpDivTest_b_10_rdcnt_i, 3)));

    -- fracY_uid13_fpDivTest(BITSELECT,12)@0
    fracY_uid13_fpDivTest_b <= b(22 downto 0);

    -- redist27_fracY_uid13_fpDivTest_b_10_wraddr(REG,252)
    redist27_fracY_uid13_fpDivTest_b_10_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist27_fracY_uid13_fpDivTest_b_10_wraddr_q <= "111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist27_fracY_uid13_fpDivTest_b_10_wraddr_q <= STD_LOGIC_VECTOR(redist27_fracY_uid13_fpDivTest_b_10_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist27_fracY_uid13_fpDivTest_b_10_mem(DUALMEM,250)
    redist27_fracY_uid13_fpDivTest_b_10_mem_ia <= STD_LOGIC_VECTOR(fracY_uid13_fpDivTest_b);
    redist27_fracY_uid13_fpDivTest_b_10_mem_aa <= redist27_fracY_uid13_fpDivTest_b_10_wraddr_q;
    redist27_fracY_uid13_fpDivTest_b_10_mem_ab <= redist27_fracY_uid13_fpDivTest_b_10_rdcnt_q;
    redist27_fracY_uid13_fpDivTest_b_10_mem_reset0 <= areset;
    redist27_fracY_uid13_fpDivTest_b_10_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 3,
        numwords_a => 8,
        width_b => 23,
        widthad_b => 3,
        numwords_b => 8,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist27_fracY_uid13_fpDivTest_b_10_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist27_fracY_uid13_fpDivTest_b_10_mem_reset0,
        clock1 => clk,
        address_a => redist27_fracY_uid13_fpDivTest_b_10_mem_aa,
        data_a => redist27_fracY_uid13_fpDivTest_b_10_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist27_fracY_uid13_fpDivTest_b_10_mem_ab,
        q_b => redist27_fracY_uid13_fpDivTest_b_10_mem_iq
    );
    redist27_fracY_uid13_fpDivTest_b_10_mem_q <= redist27_fracY_uid13_fpDivTest_b_10_mem_iq(22 downto 0);

    -- redist27_fracY_uid13_fpDivTest_b_10_outputreg(DELAY,249)
    redist27_fracY_uid13_fpDivTest_b_10_outputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist27_fracY_uid13_fpDivTest_b_10_mem_q, xout => redist27_fracY_uid13_fpDivTest_b_10_outputreg_q, clk => clk, aclr => areset );

    -- redist28_fracY_uid13_fpDivTest_b_13(DELAY,218)
    redist28_fracY_uid13_fpDivTest_b_13 : dspba_delay
    GENERIC MAP ( width => 23, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist27_fracY_uid13_fpDivTest_b_10_outputreg_q, xout => redist28_fracY_uid13_fpDivTest_b_13_q, clk => clk, aclr => areset );

    -- paddingY_uid15_fpDivTest(CONSTANT,14)
    paddingY_uid15_fpDivTest_q <= "00000000000000000000000";

    -- fracXIsZero_uid39_fpDivTest(LOGICAL,38)@13 + 1
    fracXIsZero_uid39_fpDivTest_qi <= "1" WHEN paddingY_uid15_fpDivTest_q = redist28_fracY_uid13_fpDivTest_b_13_q ELSE "0";
    fracXIsZero_uid39_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid39_fpDivTest_qi, xout => fracXIsZero_uid39_fpDivTest_q, clk => clk, aclr => areset );

    -- cstAllOWE_uid18_fpDivTest(CONSTANT,17)
    cstAllOWE_uid18_fpDivTest_q <= "11111111";

    -- redist29_expY_uid12_fpDivTest_b_10_notEnable(LOGICAL,267)
    redist29_expY_uid12_fpDivTest_b_10_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist29_expY_uid12_fpDivTest_b_10_nor(LOGICAL,268)
    redist29_expY_uid12_fpDivTest_b_10_nor_q <= not (redist29_expY_uid12_fpDivTest_b_10_notEnable_q or redist29_expY_uid12_fpDivTest_b_10_sticky_ena_q);

    -- redist29_expY_uid12_fpDivTest_b_10_mem_last(CONSTANT,264)
    redist29_expY_uid12_fpDivTest_b_10_mem_last_q <= "0110";

    -- redist29_expY_uid12_fpDivTest_b_10_cmp(LOGICAL,265)
    redist29_expY_uid12_fpDivTest_b_10_cmp_b <= STD_LOGIC_VECTOR("0" & redist29_expY_uid12_fpDivTest_b_10_rdcnt_q);
    redist29_expY_uid12_fpDivTest_b_10_cmp_q <= "1" WHEN redist29_expY_uid12_fpDivTest_b_10_mem_last_q = redist29_expY_uid12_fpDivTest_b_10_cmp_b ELSE "0";

    -- redist29_expY_uid12_fpDivTest_b_10_cmpReg(REG,266)
    redist29_expY_uid12_fpDivTest_b_10_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist29_expY_uid12_fpDivTest_b_10_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist29_expY_uid12_fpDivTest_b_10_cmpReg_q <= STD_LOGIC_VECTOR(redist29_expY_uid12_fpDivTest_b_10_cmp_q);
        END IF;
    END PROCESS;

    -- redist29_expY_uid12_fpDivTest_b_10_sticky_ena(REG,269)
    redist29_expY_uid12_fpDivTest_b_10_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist29_expY_uid12_fpDivTest_b_10_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist29_expY_uid12_fpDivTest_b_10_nor_q = "1") THEN
                redist29_expY_uid12_fpDivTest_b_10_sticky_ena_q <= STD_LOGIC_VECTOR(redist29_expY_uid12_fpDivTest_b_10_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist29_expY_uid12_fpDivTest_b_10_enaAnd(LOGICAL,270)
    redist29_expY_uid12_fpDivTest_b_10_enaAnd_q <= redist29_expY_uid12_fpDivTest_b_10_sticky_ena_q and VCC_q;

    -- redist29_expY_uid12_fpDivTest_b_10_rdcnt(COUNTER,262)
    -- low=0, high=7, step=1, init=0
    redist29_expY_uid12_fpDivTest_b_10_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist29_expY_uid12_fpDivTest_b_10_rdcnt_i <= TO_UNSIGNED(0, 3);
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist29_expY_uid12_fpDivTest_b_10_rdcnt_i <= redist29_expY_uid12_fpDivTest_b_10_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist29_expY_uid12_fpDivTest_b_10_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist29_expY_uid12_fpDivTest_b_10_rdcnt_i, 3)));

    -- expY_uid12_fpDivTest(BITSELECT,11)@0
    expY_uid12_fpDivTest_b <= b(30 downto 23);

    -- redist29_expY_uid12_fpDivTest_b_10_wraddr(REG,263)
    redist29_expY_uid12_fpDivTest_b_10_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist29_expY_uid12_fpDivTest_b_10_wraddr_q <= "111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist29_expY_uid12_fpDivTest_b_10_wraddr_q <= STD_LOGIC_VECTOR(redist29_expY_uid12_fpDivTest_b_10_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist29_expY_uid12_fpDivTest_b_10_mem(DUALMEM,261)
    redist29_expY_uid12_fpDivTest_b_10_mem_ia <= STD_LOGIC_VECTOR(expY_uid12_fpDivTest_b);
    redist29_expY_uid12_fpDivTest_b_10_mem_aa <= redist29_expY_uid12_fpDivTest_b_10_wraddr_q;
    redist29_expY_uid12_fpDivTest_b_10_mem_ab <= redist29_expY_uid12_fpDivTest_b_10_rdcnt_q;
    redist29_expY_uid12_fpDivTest_b_10_mem_reset0 <= areset;
    redist29_expY_uid12_fpDivTest_b_10_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 3,
        numwords_a => 8,
        width_b => 8,
        widthad_b => 3,
        numwords_b => 8,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist29_expY_uid12_fpDivTest_b_10_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist29_expY_uid12_fpDivTest_b_10_mem_reset0,
        clock1 => clk,
        address_a => redist29_expY_uid12_fpDivTest_b_10_mem_aa,
        data_a => redist29_expY_uid12_fpDivTest_b_10_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist29_expY_uid12_fpDivTest_b_10_mem_ab,
        q_b => redist29_expY_uid12_fpDivTest_b_10_mem_iq
    );
    redist29_expY_uid12_fpDivTest_b_10_mem_q <= redist29_expY_uid12_fpDivTest_b_10_mem_iq(7 downto 0);

    -- redist29_expY_uid12_fpDivTest_b_10_outputreg(DELAY,260)
    redist29_expY_uid12_fpDivTest_b_10_outputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist29_expY_uid12_fpDivTest_b_10_mem_q, xout => redist29_expY_uid12_fpDivTest_b_10_outputreg_q, clk => clk, aclr => areset );

    -- redist30_expY_uid12_fpDivTest_b_13(DELAY,220)
    redist30_expY_uid12_fpDivTest_b_13 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist29_expY_uid12_fpDivTest_b_10_outputreg_q, xout => redist30_expY_uid12_fpDivTest_b_13_q, clk => clk, aclr => areset );

    -- expXIsMax_uid38_fpDivTest(LOGICAL,37)@13 + 1
    expXIsMax_uid38_fpDivTest_qi <= "1" WHEN redist30_expY_uid12_fpDivTest_b_13_q = cstAllOWE_uid18_fpDivTest_q ELSE "0";
    expXIsMax_uid38_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid38_fpDivTest_qi, xout => expXIsMax_uid38_fpDivTest_q, clk => clk, aclr => areset );

    -- excI_y_uid41_fpDivTest(LOGICAL,40)@14
    excI_y_uid41_fpDivTest_q <= expXIsMax_uid38_fpDivTest_q and fracXIsZero_uid39_fpDivTest_q;

    -- redist31_fracX_uid10_fpDivTest_b_9_notEnable(LOGICAL,278)
    redist31_fracX_uid10_fpDivTest_b_9_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist31_fracX_uid10_fpDivTest_b_9_nor(LOGICAL,279)
    redist31_fracX_uid10_fpDivTest_b_9_nor_q <= not (redist31_fracX_uid10_fpDivTest_b_9_notEnable_q or redist31_fracX_uid10_fpDivTest_b_9_sticky_ena_q);

    -- redist31_fracX_uid10_fpDivTest_b_9_mem_last(CONSTANT,275)
    redist31_fracX_uid10_fpDivTest_b_9_mem_last_q <= "0101";

    -- redist31_fracX_uid10_fpDivTest_b_9_cmp(LOGICAL,276)
    redist31_fracX_uid10_fpDivTest_b_9_cmp_b <= STD_LOGIC_VECTOR("0" & redist31_fracX_uid10_fpDivTest_b_9_rdcnt_q);
    redist31_fracX_uid10_fpDivTest_b_9_cmp_q <= "1" WHEN redist31_fracX_uid10_fpDivTest_b_9_mem_last_q = redist31_fracX_uid10_fpDivTest_b_9_cmp_b ELSE "0";

    -- redist31_fracX_uid10_fpDivTest_b_9_cmpReg(REG,277)
    redist31_fracX_uid10_fpDivTest_b_9_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist31_fracX_uid10_fpDivTest_b_9_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist31_fracX_uid10_fpDivTest_b_9_cmpReg_q <= STD_LOGIC_VECTOR(redist31_fracX_uid10_fpDivTest_b_9_cmp_q);
        END IF;
    END PROCESS;

    -- redist31_fracX_uid10_fpDivTest_b_9_sticky_ena(REG,280)
    redist31_fracX_uid10_fpDivTest_b_9_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist31_fracX_uid10_fpDivTest_b_9_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist31_fracX_uid10_fpDivTest_b_9_nor_q = "1") THEN
                redist31_fracX_uid10_fpDivTest_b_9_sticky_ena_q <= STD_LOGIC_VECTOR(redist31_fracX_uid10_fpDivTest_b_9_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist31_fracX_uid10_fpDivTest_b_9_enaAnd(LOGICAL,281)
    redist31_fracX_uid10_fpDivTest_b_9_enaAnd_q <= redist31_fracX_uid10_fpDivTest_b_9_sticky_ena_q and VCC_q;

    -- redist31_fracX_uid10_fpDivTest_b_9_rdcnt(COUNTER,273)
    -- low=0, high=6, step=1, init=0
    redist31_fracX_uid10_fpDivTest_b_9_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist31_fracX_uid10_fpDivTest_b_9_rdcnt_i <= TO_UNSIGNED(0, 3);
            redist31_fracX_uid10_fpDivTest_b_9_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist31_fracX_uid10_fpDivTest_b_9_rdcnt_i = TO_UNSIGNED(5, 3)) THEN
                redist31_fracX_uid10_fpDivTest_b_9_rdcnt_eq <= '1';
            ELSE
                redist31_fracX_uid10_fpDivTest_b_9_rdcnt_eq <= '0';
            END IF;
            IF (redist31_fracX_uid10_fpDivTest_b_9_rdcnt_eq = '1') THEN
                redist31_fracX_uid10_fpDivTest_b_9_rdcnt_i <= redist31_fracX_uid10_fpDivTest_b_9_rdcnt_i + 2;
            ELSE
                redist31_fracX_uid10_fpDivTest_b_9_rdcnt_i <= redist31_fracX_uid10_fpDivTest_b_9_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist31_fracX_uid10_fpDivTest_b_9_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist31_fracX_uid10_fpDivTest_b_9_rdcnt_i, 3)));

    -- fracX_uid10_fpDivTest(BITSELECT,9)@0
    fracX_uid10_fpDivTest_b <= a(22 downto 0);

    -- redist31_fracX_uid10_fpDivTest_b_9_wraddr(REG,274)
    redist31_fracX_uid10_fpDivTest_b_9_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist31_fracX_uid10_fpDivTest_b_9_wraddr_q <= "110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist31_fracX_uid10_fpDivTest_b_9_wraddr_q <= STD_LOGIC_VECTOR(redist31_fracX_uid10_fpDivTest_b_9_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist31_fracX_uid10_fpDivTest_b_9_mem(DUALMEM,272)
    redist31_fracX_uid10_fpDivTest_b_9_mem_ia <= STD_LOGIC_VECTOR(fracX_uid10_fpDivTest_b);
    redist31_fracX_uid10_fpDivTest_b_9_mem_aa <= redist31_fracX_uid10_fpDivTest_b_9_wraddr_q;
    redist31_fracX_uid10_fpDivTest_b_9_mem_ab <= redist31_fracX_uid10_fpDivTest_b_9_rdcnt_q;
    redist31_fracX_uid10_fpDivTest_b_9_mem_reset0 <= areset;
    redist31_fracX_uid10_fpDivTest_b_9_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 23,
        widthad_b => 3,
        numwords_b => 7,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist31_fracX_uid10_fpDivTest_b_9_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist31_fracX_uid10_fpDivTest_b_9_mem_reset0,
        clock1 => clk,
        address_a => redist31_fracX_uid10_fpDivTest_b_9_mem_aa,
        data_a => redist31_fracX_uid10_fpDivTest_b_9_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist31_fracX_uid10_fpDivTest_b_9_mem_ab,
        q_b => redist31_fracX_uid10_fpDivTest_b_9_mem_iq
    );
    redist31_fracX_uid10_fpDivTest_b_9_mem_q <= redist31_fracX_uid10_fpDivTest_b_9_mem_iq(22 downto 0);

    -- redist31_fracX_uid10_fpDivTest_b_9_outputreg(DELAY,271)
    redist31_fracX_uid10_fpDivTest_b_9_outputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist31_fracX_uid10_fpDivTest_b_9_mem_q, xout => redist31_fracX_uid10_fpDivTest_b_9_outputreg_q, clk => clk, aclr => areset );

    -- redist32_fracX_uid10_fpDivTest_b_13_inputreg(DELAY,282)
    redist32_fracX_uid10_fpDivTest_b_13_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist31_fracX_uid10_fpDivTest_b_9_outputreg_q, xout => redist32_fracX_uid10_fpDivTest_b_13_inputreg_q, clk => clk, aclr => areset );

    -- redist32_fracX_uid10_fpDivTest_b_13(DELAY,222)
    redist32_fracX_uid10_fpDivTest_b_13 : dspba_delay
    GENERIC MAP ( width => 23, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist32_fracX_uid10_fpDivTest_b_13_inputreg_q, xout => redist32_fracX_uid10_fpDivTest_b_13_q, clk => clk, aclr => areset );

    -- fracXIsZero_uid25_fpDivTest(LOGICAL,24)@13 + 1
    fracXIsZero_uid25_fpDivTest_qi <= "1" WHEN paddingY_uid15_fpDivTest_q = redist32_fracX_uid10_fpDivTest_b_13_q ELSE "0";
    fracXIsZero_uid25_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid25_fpDivTest_qi, xout => fracXIsZero_uid25_fpDivTest_q, clk => clk, aclr => areset );

    -- redist34_expX_uid9_fpDivTest_b_10_notEnable(LOGICAL,291)
    redist34_expX_uid9_fpDivTest_b_10_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist34_expX_uid9_fpDivTest_b_10_nor(LOGICAL,292)
    redist34_expX_uid9_fpDivTest_b_10_nor_q <= not (redist34_expX_uid9_fpDivTest_b_10_notEnable_q or redist34_expX_uid9_fpDivTest_b_10_sticky_ena_q);

    -- redist34_expX_uid9_fpDivTest_b_10_mem_last(CONSTANT,288)
    redist34_expX_uid9_fpDivTest_b_10_mem_last_q <= "0110";

    -- redist34_expX_uid9_fpDivTest_b_10_cmp(LOGICAL,289)
    redist34_expX_uid9_fpDivTest_b_10_cmp_b <= STD_LOGIC_VECTOR("0" & redist34_expX_uid9_fpDivTest_b_10_rdcnt_q);
    redist34_expX_uid9_fpDivTest_b_10_cmp_q <= "1" WHEN redist34_expX_uid9_fpDivTest_b_10_mem_last_q = redist34_expX_uid9_fpDivTest_b_10_cmp_b ELSE "0";

    -- redist34_expX_uid9_fpDivTest_b_10_cmpReg(REG,290)
    redist34_expX_uid9_fpDivTest_b_10_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist34_expX_uid9_fpDivTest_b_10_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist34_expX_uid9_fpDivTest_b_10_cmpReg_q <= STD_LOGIC_VECTOR(redist34_expX_uid9_fpDivTest_b_10_cmp_q);
        END IF;
    END PROCESS;

    -- redist34_expX_uid9_fpDivTest_b_10_sticky_ena(REG,293)
    redist34_expX_uid9_fpDivTest_b_10_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist34_expX_uid9_fpDivTest_b_10_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist34_expX_uid9_fpDivTest_b_10_nor_q = "1") THEN
                redist34_expX_uid9_fpDivTest_b_10_sticky_ena_q <= STD_LOGIC_VECTOR(redist34_expX_uid9_fpDivTest_b_10_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist34_expX_uid9_fpDivTest_b_10_enaAnd(LOGICAL,294)
    redist34_expX_uid9_fpDivTest_b_10_enaAnd_q <= redist34_expX_uid9_fpDivTest_b_10_sticky_ena_q and VCC_q;

    -- redist34_expX_uid9_fpDivTest_b_10_rdcnt(COUNTER,286)
    -- low=0, high=7, step=1, init=0
    redist34_expX_uid9_fpDivTest_b_10_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist34_expX_uid9_fpDivTest_b_10_rdcnt_i <= TO_UNSIGNED(0, 3);
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist34_expX_uid9_fpDivTest_b_10_rdcnt_i <= redist34_expX_uid9_fpDivTest_b_10_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist34_expX_uid9_fpDivTest_b_10_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist34_expX_uid9_fpDivTest_b_10_rdcnt_i, 3)));

    -- expX_uid9_fpDivTest(BITSELECT,8)@0
    expX_uid9_fpDivTest_b <= a(30 downto 23);

    -- redist34_expX_uid9_fpDivTest_b_10_wraddr(REG,287)
    redist34_expX_uid9_fpDivTest_b_10_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist34_expX_uid9_fpDivTest_b_10_wraddr_q <= "111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist34_expX_uid9_fpDivTest_b_10_wraddr_q <= STD_LOGIC_VECTOR(redist34_expX_uid9_fpDivTest_b_10_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist34_expX_uid9_fpDivTest_b_10_mem(DUALMEM,285)
    redist34_expX_uid9_fpDivTest_b_10_mem_ia <= STD_LOGIC_VECTOR(expX_uid9_fpDivTest_b);
    redist34_expX_uid9_fpDivTest_b_10_mem_aa <= redist34_expX_uid9_fpDivTest_b_10_wraddr_q;
    redist34_expX_uid9_fpDivTest_b_10_mem_ab <= redist34_expX_uid9_fpDivTest_b_10_rdcnt_q;
    redist34_expX_uid9_fpDivTest_b_10_mem_reset0 <= areset;
    redist34_expX_uid9_fpDivTest_b_10_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 3,
        numwords_a => 8,
        width_b => 8,
        widthad_b => 3,
        numwords_b => 8,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist34_expX_uid9_fpDivTest_b_10_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist34_expX_uid9_fpDivTest_b_10_mem_reset0,
        clock1 => clk,
        address_a => redist34_expX_uid9_fpDivTest_b_10_mem_aa,
        data_a => redist34_expX_uid9_fpDivTest_b_10_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist34_expX_uid9_fpDivTest_b_10_mem_ab,
        q_b => redist34_expX_uid9_fpDivTest_b_10_mem_iq
    );
    redist34_expX_uid9_fpDivTest_b_10_mem_q <= redist34_expX_uid9_fpDivTest_b_10_mem_iq(7 downto 0);

    -- redist34_expX_uid9_fpDivTest_b_10_outputreg(DELAY,284)
    redist34_expX_uid9_fpDivTest_b_10_outputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist34_expX_uid9_fpDivTest_b_10_mem_q, xout => redist34_expX_uid9_fpDivTest_b_10_outputreg_q, clk => clk, aclr => areset );

    -- redist35_expX_uid9_fpDivTest_b_13(DELAY,225)
    redist35_expX_uid9_fpDivTest_b_13 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist34_expX_uid9_fpDivTest_b_10_outputreg_q, xout => redist35_expX_uid9_fpDivTest_b_13_q, clk => clk, aclr => areset );

    -- expXIsMax_uid24_fpDivTest(LOGICAL,23)@13
    expXIsMax_uid24_fpDivTest_q <= "1" WHEN redist35_expX_uid9_fpDivTest_b_13_q = cstAllOWE_uid18_fpDivTest_q ELSE "0";

    -- redist25_expXIsMax_uid24_fpDivTest_q_1(DELAY,215)
    redist25_expXIsMax_uid24_fpDivTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid24_fpDivTest_q, xout => redist25_expXIsMax_uid24_fpDivTest_q_1_q, clk => clk, aclr => areset );

    -- excI_x_uid27_fpDivTest(LOGICAL,26)@14
    excI_x_uid27_fpDivTest_q <= redist25_expXIsMax_uid24_fpDivTest_q_1_q and fracXIsZero_uid25_fpDivTest_q;

    -- excXIYI_uid130_fpDivTest(LOGICAL,129)@14
    excXIYI_uid130_fpDivTest_q <= excI_x_uid27_fpDivTest_q and excI_y_uid41_fpDivTest_q;

    -- fracXIsNotZero_uid40_fpDivTest(LOGICAL,39)@14
    fracXIsNotZero_uid40_fpDivTest_q <= not (fracXIsZero_uid39_fpDivTest_q);

    -- excN_y_uid42_fpDivTest(LOGICAL,41)@14
    excN_y_uid42_fpDivTest_q <= expXIsMax_uid38_fpDivTest_q and fracXIsNotZero_uid40_fpDivTest_q;

    -- fracXIsNotZero_uid26_fpDivTest(LOGICAL,25)@14
    fracXIsNotZero_uid26_fpDivTest_q <= not (fracXIsZero_uid25_fpDivTest_q);

    -- excN_x_uid28_fpDivTest(LOGICAL,27)@14
    excN_x_uid28_fpDivTest_q <= redist25_expXIsMax_uid24_fpDivTest_q_1_q and fracXIsNotZero_uid26_fpDivTest_q;

    -- cstAllZWE_uid20_fpDivTest(CONSTANT,19)
    cstAllZWE_uid20_fpDivTest_q <= "00000000";

    -- excZ_y_uid37_fpDivTest(LOGICAL,36)@13 + 1
    excZ_y_uid37_fpDivTest_qi <= "1" WHEN redist30_expY_uid12_fpDivTest_b_13_q = cstAllZWE_uid20_fpDivTest_q ELSE "0";
    excZ_y_uid37_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid37_fpDivTest_qi, xout => excZ_y_uid37_fpDivTest_q, clk => clk, aclr => areset );

    -- excZ_x_uid23_fpDivTest(LOGICAL,22)@13
    excZ_x_uid23_fpDivTest_q <= "1" WHEN redist35_expX_uid9_fpDivTest_b_13_q = cstAllZWE_uid20_fpDivTest_q ELSE "0";

    -- redist26_excZ_x_uid23_fpDivTest_q_1(DELAY,216)
    redist26_excZ_x_uid23_fpDivTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid23_fpDivTest_q, xout => redist26_excZ_x_uid23_fpDivTest_q_1_q, clk => clk, aclr => areset );

    -- excXZYZ_uid129_fpDivTest(LOGICAL,128)@14
    excXZYZ_uid129_fpDivTest_q <= redist26_excZ_x_uid23_fpDivTest_q_1_q and excZ_y_uid37_fpDivTest_q;

    -- excRNaN_uid131_fpDivTest(LOGICAL,130)@14 + 1
    excRNaN_uid131_fpDivTest_qi <= excXZYZ_uid129_fpDivTest_q or excN_x_uid28_fpDivTest_q or excN_y_uid42_fpDivTest_q or excXIYI_uid130_fpDivTest_q;
    excRNaN_uid131_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN_uid131_fpDivTest_qi, xout => excRNaN_uid131_fpDivTest_q, clk => clk, aclr => areset );

    -- invExcRNaN_uid142_fpDivTest(LOGICAL,141)@15
    invExcRNaN_uid142_fpDivTest_q <= not (excRNaN_uid131_fpDivTest_q);

    -- signY_uid14_fpDivTest(BITSELECT,13)@0
    signY_uid14_fpDivTest_b <= STD_LOGIC_VECTOR(b(31 downto 31));

    -- signX_uid11_fpDivTest(BITSELECT,10)@0
    signX_uid11_fpDivTest_b <= STD_LOGIC_VECTOR(a(31 downto 31));

    -- signR_uid46_fpDivTest(LOGICAL,45)@0 + 1
    signR_uid46_fpDivTest_qi <= signX_uid11_fpDivTest_b xor signY_uid14_fpDivTest_b;
    signR_uid46_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid46_fpDivTest_qi, xout => signR_uid46_fpDivTest_q, clk => clk, aclr => areset );

    -- redist24_signR_uid46_fpDivTest_q_15(DELAY,214)
    redist24_signR_uid46_fpDivTest_q_15 : dspba_delay
    GENERIC MAP ( width => 1, depth => 14, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid46_fpDivTest_q, xout => redist24_signR_uid46_fpDivTest_q_15_q, clk => clk, aclr => areset );

    -- sRPostExc_uid143_fpDivTest(LOGICAL,142)@15 + 1
    sRPostExc_uid143_fpDivTest_qi <= redist24_signR_uid46_fpDivTest_q_15_q and invExcRNaN_uid142_fpDivTest_q;
    sRPostExc_uid143_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sRPostExc_uid143_fpDivTest_qi, xout => sRPostExc_uid143_fpDivTest_q, clk => clk, aclr => areset );

    -- redist4_sRPostExc_uid143_fpDivTest_q_6(DELAY,194)
    redist4_sRPostExc_uid143_fpDivTest_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => sRPostExc_uid143_fpDivTest_q, xout => redist4_sRPostExc_uid143_fpDivTest_q_6_q, clk => clk, aclr => areset );

    -- redist15_fracPostRndF_uid80_fpDivTest_q_5_notEnable(LOGICAL,245)
    redist15_fracPostRndF_uid80_fpDivTest_q_5_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist15_fracPostRndF_uid80_fpDivTest_q_5_nor(LOGICAL,246)
    redist15_fracPostRndF_uid80_fpDivTest_q_5_nor_q <= not (redist15_fracPostRndF_uid80_fpDivTest_q_5_notEnable_q or redist15_fracPostRndF_uid80_fpDivTest_q_5_sticky_ena_q);

    -- redist15_fracPostRndF_uid80_fpDivTest_q_5_mem_last(CONSTANT,242)
    redist15_fracPostRndF_uid80_fpDivTest_q_5_mem_last_q <= "01";

    -- redist15_fracPostRndF_uid80_fpDivTest_q_5_cmp(LOGICAL,243)
    redist15_fracPostRndF_uid80_fpDivTest_q_5_cmp_q <= "1" WHEN redist15_fracPostRndF_uid80_fpDivTest_q_5_mem_last_q = redist15_fracPostRndF_uid80_fpDivTest_q_5_rdcnt_q ELSE "0";

    -- redist15_fracPostRndF_uid80_fpDivTest_q_5_cmpReg(REG,244)
    redist15_fracPostRndF_uid80_fpDivTest_q_5_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist15_fracPostRndF_uid80_fpDivTest_q_5_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist15_fracPostRndF_uid80_fpDivTest_q_5_cmpReg_q <= STD_LOGIC_VECTOR(redist15_fracPostRndF_uid80_fpDivTest_q_5_cmp_q);
        END IF;
    END PROCESS;

    -- redist15_fracPostRndF_uid80_fpDivTest_q_5_sticky_ena(REG,247)
    redist15_fracPostRndF_uid80_fpDivTest_q_5_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist15_fracPostRndF_uid80_fpDivTest_q_5_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist15_fracPostRndF_uid80_fpDivTest_q_5_nor_q = "1") THEN
                redist15_fracPostRndF_uid80_fpDivTest_q_5_sticky_ena_q <= STD_LOGIC_VECTOR(redist15_fracPostRndF_uid80_fpDivTest_q_5_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist15_fracPostRndF_uid80_fpDivTest_q_5_enaAnd(LOGICAL,248)
    redist15_fracPostRndF_uid80_fpDivTest_q_5_enaAnd_q <= redist15_fracPostRndF_uid80_fpDivTest_q_5_sticky_ena_q and VCC_q;

    -- redist15_fracPostRndF_uid80_fpDivTest_q_5_rdcnt(COUNTER,240)
    -- low=0, high=2, step=1, init=0
    redist15_fracPostRndF_uid80_fpDivTest_q_5_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist15_fracPostRndF_uid80_fpDivTest_q_5_rdcnt_i <= TO_UNSIGNED(0, 2);
            redist15_fracPostRndF_uid80_fpDivTest_q_5_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist15_fracPostRndF_uid80_fpDivTest_q_5_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                redist15_fracPostRndF_uid80_fpDivTest_q_5_rdcnt_eq <= '1';
            ELSE
                redist15_fracPostRndF_uid80_fpDivTest_q_5_rdcnt_eq <= '0';
            END IF;
            IF (redist15_fracPostRndF_uid80_fpDivTest_q_5_rdcnt_eq = '1') THEN
                redist15_fracPostRndF_uid80_fpDivTest_q_5_rdcnt_i <= redist15_fracPostRndF_uid80_fpDivTest_q_5_rdcnt_i + 2;
            ELSE
                redist15_fracPostRndF_uid80_fpDivTest_q_5_rdcnt_i <= redist15_fracPostRndF_uid80_fpDivTest_q_5_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist15_fracPostRndF_uid80_fpDivTest_q_5_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist15_fracPostRndF_uid80_fpDivTest_q_5_rdcnt_i, 2)));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- fracXExt_uid77_fpDivTest(BITJOIN,76)@13
    fracXExt_uid77_fpDivTest_q <= redist32_fracX_uid10_fpDivTest_b_13_q & GND_q;

    -- lOAdded_uid57_fpDivTest(BITJOIN,56)@9
    lOAdded_uid57_fpDivTest_q <= VCC_q & redist31_fracX_uid10_fpDivTest_b_9_outputreg_q;

    -- redist17_lOAdded_uid57_fpDivTest_q_2(DELAY,207)
    redist17_lOAdded_uid57_fpDivTest_q_2 : dspba_delay
    GENERIC MAP ( width => 24, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => lOAdded_uid57_fpDivTest_q, xout => redist17_lOAdded_uid57_fpDivTest_q_2_q, clk => clk, aclr => areset );

    -- z4_uid60_fpDivTest(CONSTANT,59)
    z4_uid60_fpDivTest_q <= "0000";

    -- oFracXZ4_uid61_fpDivTest(BITJOIN,60)@11
    oFracXZ4_uid61_fpDivTest_q <= redist17_lOAdded_uid57_fpDivTest_q_2_q & z4_uid60_fpDivTest_q;

    -- yAddr_uid51_fpDivTest(BITSELECT,50)@0
    yAddr_uid51_fpDivTest_b <= fracY_uid13_fpDivTest_b(22 downto 14);

    -- memoryC2_uid154_invTables_lutmem(DUALMEM,185)@0 + 2
    -- in j@20000000
    memoryC2_uid154_invTables_lutmem_aa <= yAddr_uid51_fpDivTest_b;
    memoryC2_uid154_invTables_lutmem_reset0 <= areset;
    memoryC2_uid154_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 13,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "div_s_0002_memoryC2_uid154_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid154_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid154_invTables_lutmem_aa,
        q_a => memoryC2_uid154_invTables_lutmem_ir
    );
    memoryC2_uid154_invTables_lutmem_r <= memoryC2_uid154_invTables_lutmem_ir(12 downto 0);

    -- yPE_uid52_fpDivTest(BITSELECT,51)@0
    yPE_uid52_fpDivTest_b <= b(13 downto 0);

    -- redist20_yPE_uid52_fpDivTest_b_2(DELAY,210)
    redist20_yPE_uid52_fpDivTest_b_2 : dspba_delay
    GENERIC MAP ( width => 14, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yPE_uid52_fpDivTest_b, xout => redist20_yPE_uid52_fpDivTest_b_2_q, clk => clk, aclr => areset );

    -- yT1_uid160_invPolyEval(BITSELECT,159)@2
    yT1_uid160_invPolyEval_b <= redist20_yPE_uid52_fpDivTest_b_2_q(13 downto 1);

    -- prodXY_uid176_pT1_uid161_invPolyEval_cma(CHAINMULTADD,188)@2 + 2
    prodXY_uid176_pT1_uid161_invPolyEval_cma_reset <= areset;
    prodXY_uid176_pT1_uid161_invPolyEval_cma_ena0 <= '1';
    prodXY_uid176_pT1_uid161_invPolyEval_cma_ena1 <= prodXY_uid176_pT1_uid161_invPolyEval_cma_ena0;
    prodXY_uid176_pT1_uid161_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid176_pT1_uid161_invPolyEval_cma_a0(0),14));
    prodXY_uid176_pT1_uid161_invPolyEval_cma_p(0) <= prodXY_uid176_pT1_uid161_invPolyEval_cma_l(0) * prodXY_uid176_pT1_uid161_invPolyEval_cma_c0(0);
    prodXY_uid176_pT1_uid161_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid176_pT1_uid161_invPolyEval_cma_p(0),27);
    prodXY_uid176_pT1_uid161_invPolyEval_cma_w(0) <= prodXY_uid176_pT1_uid161_invPolyEval_cma_u(0);
    prodXY_uid176_pT1_uid161_invPolyEval_cma_x(0) <= prodXY_uid176_pT1_uid161_invPolyEval_cma_w(0);
    prodXY_uid176_pT1_uid161_invPolyEval_cma_y(0) <= prodXY_uid176_pT1_uid161_invPolyEval_cma_x(0);
    prodXY_uid176_pT1_uid161_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid176_pT1_uid161_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid176_pT1_uid161_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid176_pT1_uid161_invPolyEval_cma_ena0 = '1') THEN
                prodXY_uid176_pT1_uid161_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(yT1_uid160_invPolyEval_b),13);
                prodXY_uid176_pT1_uid161_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(memoryC2_uid154_invTables_lutmem_r),13);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid176_pT1_uid161_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid176_pT1_uid161_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid176_pT1_uid161_invPolyEval_cma_ena1 = '1') THEN
                prodXY_uid176_pT1_uid161_invPolyEval_cma_s(0) <= prodXY_uid176_pT1_uid161_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid176_pT1_uid161_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 26, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid176_pT1_uid161_invPolyEval_cma_s(0)(25 downto 0)), xout => prodXY_uid176_pT1_uid161_invPolyEval_cma_qq, clk => clk, aclr => areset );
    prodXY_uid176_pT1_uid161_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid176_pT1_uid161_invPolyEval_cma_qq(25 downto 0));

    -- osig_uid177_pT1_uid161_invPolyEval(BITSELECT,176)@4
    osig_uid177_pT1_uid161_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid176_pT1_uid161_invPolyEval_cma_q(25 downto 12));

    -- highBBits_uid163_invPolyEval(BITSELECT,162)@4
    highBBits_uid163_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid177_pT1_uid161_invPolyEval_b(13 downto 1));

    -- redist22_yAddr_uid51_fpDivTest_b_2(DELAY,212)
    redist22_yAddr_uid51_fpDivTest_b_2 : dspba_delay
    GENERIC MAP ( width => 9, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid51_fpDivTest_b, xout => redist22_yAddr_uid51_fpDivTest_b_2_q, clk => clk, aclr => areset );

    -- memoryC1_uid151_invTables_lutmem(DUALMEM,184)@2 + 2
    -- in j@20000000
    memoryC1_uid151_invTables_lutmem_aa <= redist22_yAddr_uid51_fpDivTest_b_2_q;
    memoryC1_uid151_invTables_lutmem_reset0 <= areset;
    memoryC1_uid151_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 2,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "div_s_0002_memoryC1_uid151_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid151_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid151_invTables_lutmem_aa,
        q_a => memoryC1_uid151_invTables_lutmem_ir
    );
    memoryC1_uid151_invTables_lutmem_r <= memoryC1_uid151_invTables_lutmem_ir(1 downto 0);

    -- memoryC1_uid150_invTables_lutmem(DUALMEM,183)@2 + 2
    -- in j@20000000
    memoryC1_uid150_invTables_lutmem_aa <= redist22_yAddr_uid51_fpDivTest_b_2_q;
    memoryC1_uid150_invTables_lutmem_reset0 <= areset;
    memoryC1_uid150_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 20,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "div_s_0002_memoryC1_uid150_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid150_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid150_invTables_lutmem_aa,
        q_a => memoryC1_uid150_invTables_lutmem_ir
    );
    memoryC1_uid150_invTables_lutmem_r <= memoryC1_uid150_invTables_lutmem_ir(19 downto 0);

    -- os_uid152_invTables(BITJOIN,151)@4
    os_uid152_invTables_q <= memoryC1_uid151_invTables_lutmem_r & memoryC1_uid150_invTables_lutmem_r;

    -- s1sumAHighB_uid164_invPolyEval(ADD,163)@4 + 1
    s1sumAHighB_uid164_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => os_uid152_invTables_q(21)) & os_uid152_invTables_q));
    s1sumAHighB_uid164_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 13 => highBBits_uid163_invPolyEval_b(12)) & highBBits_uid163_invPolyEval_b));
    s1sumAHighB_uid164_invPolyEval_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            s1sumAHighB_uid164_invPolyEval_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            s1sumAHighB_uid164_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid164_invPolyEval_a) + SIGNED(s1sumAHighB_uid164_invPolyEval_b));
        END IF;
    END PROCESS;
    s1sumAHighB_uid164_invPolyEval_q <= s1sumAHighB_uid164_invPolyEval_o(22 downto 0);

    -- lowRangeB_uid162_invPolyEval(BITSELECT,161)@4
    lowRangeB_uid162_invPolyEval_in <= osig_uid177_pT1_uid161_invPolyEval_b(0 downto 0);
    lowRangeB_uid162_invPolyEval_b <= lowRangeB_uid162_invPolyEval_in(0 downto 0);

    -- redist3_lowRangeB_uid162_invPolyEval_b_1(DELAY,193)
    redist3_lowRangeB_uid162_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeB_uid162_invPolyEval_b, xout => redist3_lowRangeB_uid162_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- s1_uid165_invPolyEval(BITJOIN,164)@5
    s1_uid165_invPolyEval_q <= s1sumAHighB_uid164_invPolyEval_q & redist3_lowRangeB_uid162_invPolyEval_b_1_q;

    -- redist21_yPE_uid52_fpDivTest_b_5(DELAY,211)
    redist21_yPE_uid52_fpDivTest_b_5 : dspba_delay
    GENERIC MAP ( width => 14, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist20_yPE_uid52_fpDivTest_b_2_q, xout => redist21_yPE_uid52_fpDivTest_b_5_q, clk => clk, aclr => areset );

    -- prodXY_uid179_pT2_uid167_invPolyEval_cma(CHAINMULTADD,189)@5 + 2
    prodXY_uid179_pT2_uid167_invPolyEval_cma_reset <= areset;
    prodXY_uid179_pT2_uid167_invPolyEval_cma_ena0 <= '1';
    prodXY_uid179_pT2_uid167_invPolyEval_cma_ena1 <= prodXY_uid179_pT2_uid167_invPolyEval_cma_ena0;
    prodXY_uid179_pT2_uid167_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid179_pT2_uid167_invPolyEval_cma_a0(0),15));
    prodXY_uid179_pT2_uid167_invPolyEval_cma_p(0) <= prodXY_uid179_pT2_uid167_invPolyEval_cma_l(0) * prodXY_uid179_pT2_uid167_invPolyEval_cma_c0(0);
    prodXY_uid179_pT2_uid167_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid179_pT2_uid167_invPolyEval_cma_p(0),39);
    prodXY_uid179_pT2_uid167_invPolyEval_cma_w(0) <= prodXY_uid179_pT2_uid167_invPolyEval_cma_u(0);
    prodXY_uid179_pT2_uid167_invPolyEval_cma_x(0) <= prodXY_uid179_pT2_uid167_invPolyEval_cma_w(0);
    prodXY_uid179_pT2_uid167_invPolyEval_cma_y(0) <= prodXY_uid179_pT2_uid167_invPolyEval_cma_x(0);
    prodXY_uid179_pT2_uid167_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid179_pT2_uid167_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid179_pT2_uid167_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid179_pT2_uid167_invPolyEval_cma_ena0 = '1') THEN
                prodXY_uid179_pT2_uid167_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(redist21_yPE_uid52_fpDivTest_b_5_q),14);
                prodXY_uid179_pT2_uid167_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(s1_uid165_invPolyEval_q),24);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid179_pT2_uid167_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid179_pT2_uid167_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid179_pT2_uid167_invPolyEval_cma_ena1 = '1') THEN
                prodXY_uid179_pT2_uid167_invPolyEval_cma_s(0) <= prodXY_uid179_pT2_uid167_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid179_pT2_uid167_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 38, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid179_pT2_uid167_invPolyEval_cma_s(0)(37 downto 0)), xout => prodXY_uid179_pT2_uid167_invPolyEval_cma_qq, clk => clk, aclr => areset );
    prodXY_uid179_pT2_uid167_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid179_pT2_uid167_invPolyEval_cma_qq(37 downto 0));

    -- osig_uid180_pT2_uid167_invPolyEval(BITSELECT,179)@7
    osig_uid180_pT2_uid167_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid179_pT2_uid167_invPolyEval_cma_q(37 downto 13));

    -- redist2_osig_uid180_pT2_uid167_invPolyEval_b_1(DELAY,192)
    redist2_osig_uid180_pT2_uid167_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => osig_uid180_pT2_uid167_invPolyEval_b, xout => redist2_osig_uid180_pT2_uid167_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- highBBits_uid169_invPolyEval(BITSELECT,168)@8
    highBBits_uid169_invPolyEval_b <= STD_LOGIC_VECTOR(redist2_osig_uid180_pT2_uid167_invPolyEval_b_1_q(24 downto 2));

    -- redist23_yAddr_uid51_fpDivTest_b_5(DELAY,213)
    redist23_yAddr_uid51_fpDivTest_b_5 : dspba_delay
    GENERIC MAP ( width => 9, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist22_yAddr_uid51_fpDivTest_b_2_q, xout => redist23_yAddr_uid51_fpDivTest_b_5_q, clk => clk, aclr => areset );

    -- memoryC0_uid147_invTables_lutmem(DUALMEM,182)@5 + 2
    -- in j@20000000
    memoryC0_uid147_invTables_lutmem_aa <= redist23_yAddr_uid51_fpDivTest_b_5_q;
    memoryC0_uid147_invTables_lutmem_reset0 <= areset;
    memoryC0_uid147_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 12,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "div_s_0002_memoryC0_uid147_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid147_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid147_invTables_lutmem_aa,
        q_a => memoryC0_uid147_invTables_lutmem_ir
    );
    memoryC0_uid147_invTables_lutmem_r <= memoryC0_uid147_invTables_lutmem_ir(11 downto 0);

    -- redist0_memoryC0_uid147_invTables_lutmem_r_1(DELAY,190)
    redist0_memoryC0_uid147_invTables_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => memoryC0_uid147_invTables_lutmem_r, xout => redist0_memoryC0_uid147_invTables_lutmem_r_1_q, clk => clk, aclr => areset );

    -- memoryC0_uid146_invTables_lutmem(DUALMEM,181)@5 + 2
    -- in j@20000000
    memoryC0_uid146_invTables_lutmem_aa <= redist23_yAddr_uid51_fpDivTest_b_5_q;
    memoryC0_uid146_invTables_lutmem_reset0 <= areset;
    memoryC0_uid146_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 20,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "div_s_0002_memoryC0_uid146_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid146_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid146_invTables_lutmem_aa,
        q_a => memoryC0_uid146_invTables_lutmem_ir
    );
    memoryC0_uid146_invTables_lutmem_r <= memoryC0_uid146_invTables_lutmem_ir(19 downto 0);

    -- redist1_memoryC0_uid146_invTables_lutmem_r_1(DELAY,191)
    redist1_memoryC0_uid146_invTables_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => memoryC0_uid146_invTables_lutmem_r, xout => redist1_memoryC0_uid146_invTables_lutmem_r_1_q, clk => clk, aclr => areset );

    -- os_uid148_invTables(BITJOIN,147)@8
    os_uid148_invTables_q <= redist0_memoryC0_uid147_invTables_lutmem_r_1_q & redist1_memoryC0_uid146_invTables_lutmem_r_1_q;

    -- s2sumAHighB_uid170_invPolyEval(ADD,169)@8
    s2sumAHighB_uid170_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => os_uid148_invTables_q(31)) & os_uid148_invTables_q));
    s2sumAHighB_uid170_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 23 => highBBits_uid169_invPolyEval_b(22)) & highBBits_uid169_invPolyEval_b));
    s2sumAHighB_uid170_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s2sumAHighB_uid170_invPolyEval_a) + SIGNED(s2sumAHighB_uid170_invPolyEval_b));
    s2sumAHighB_uid170_invPolyEval_q <= s2sumAHighB_uid170_invPolyEval_o(32 downto 0);

    -- lowRangeB_uid168_invPolyEval(BITSELECT,167)@8
    lowRangeB_uid168_invPolyEval_in <= redist2_osig_uid180_pT2_uid167_invPolyEval_b_1_q(1 downto 0);
    lowRangeB_uid168_invPolyEval_b <= lowRangeB_uid168_invPolyEval_in(1 downto 0);

    -- s2_uid171_invPolyEval(BITJOIN,170)@8
    s2_uid171_invPolyEval_q <= s2sumAHighB_uid170_invPolyEval_q & lowRangeB_uid168_invPolyEval_b;

    -- invY_uid54_fpDivTest(BITSELECT,53)@8
    invY_uid54_fpDivTest_in <= s2_uid171_invPolyEval_q(31 downto 0);
    invY_uid54_fpDivTest_b <= invY_uid54_fpDivTest_in(31 downto 5);

    -- redist19_invY_uid54_fpDivTest_b_1(DELAY,209)
    redist19_invY_uid54_fpDivTest_b_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => invY_uid54_fpDivTest_b, xout => redist19_invY_uid54_fpDivTest_b_1_q, clk => clk, aclr => areset );

    -- prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma(CHAINMULTADD,187)@9 + 2
    prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_reset <= areset;
    prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_ena0 <= '1';
    prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_ena1 <= prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_ena0;
    prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_p(0) <= prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_a0(0) * prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_c0(0);
    prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_u(0) <= RESIZE(prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_p(0),51);
    prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_w(0) <= prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_u(0);
    prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_x(0) <= prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_w(0);
    prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_y(0) <= prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_x(0);
    prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_a0 <= (others => (others => '0'));
            prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_ena0 = '1') THEN
                prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_a0(0) <= RESIZE(UNSIGNED(redist19_invY_uid54_fpDivTest_b_1_q),27);
                prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_c0(0) <= RESIZE(UNSIGNED(lOAdded_uid57_fpDivTest_q),24);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_ena1 = '1') THEN
                prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_s(0) <= prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_delay : dspba_delay
    GENERIC MAP ( width => 51, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_s(0)(50 downto 0)), xout => prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_qq, clk => clk, aclr => areset );
    prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_q <= STD_LOGIC_VECTOR(prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_qq(50 downto 0));

    -- osig_uid174_divValPreNorm_uid59_fpDivTest(BITSELECT,173)@11
    osig_uid174_divValPreNorm_uid59_fpDivTest_b <= prodXY_uid173_divValPreNorm_uid59_fpDivTest_cma_q(50 downto 23);

    -- updatedY_uid16_fpDivTest(BITJOIN,15)@10
    updatedY_uid16_fpDivTest_q <= GND_q & paddingY_uid15_fpDivTest_q;

    -- fracYZero_uid15_fpDivTest(LOGICAL,16)@10 + 1
    fracYZero_uid15_fpDivTest_a <= STD_LOGIC_VECTOR("0" & redist27_fracY_uid13_fpDivTest_b_10_outputreg_q);
    fracYZero_uid15_fpDivTest_qi <= "1" WHEN fracYZero_uid15_fpDivTest_a = updatedY_uid16_fpDivTest_q ELSE "0";
    fracYZero_uid15_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracYZero_uid15_fpDivTest_qi, xout => fracYZero_uid15_fpDivTest_q, clk => clk, aclr => areset );

    -- divValPreNormYPow2Exc_uid63_fpDivTest(MUX,62)@11
    divValPreNormYPow2Exc_uid63_fpDivTest_s <= fracYZero_uid15_fpDivTest_q;
    divValPreNormYPow2Exc_uid63_fpDivTest_combproc: PROCESS (divValPreNormYPow2Exc_uid63_fpDivTest_s, osig_uid174_divValPreNorm_uid59_fpDivTest_b, oFracXZ4_uid61_fpDivTest_q)
    BEGIN
        CASE (divValPreNormYPow2Exc_uid63_fpDivTest_s) IS
            WHEN "0" => divValPreNormYPow2Exc_uid63_fpDivTest_q <= osig_uid174_divValPreNorm_uid59_fpDivTest_b;
            WHEN "1" => divValPreNormYPow2Exc_uid63_fpDivTest_q <= oFracXZ4_uid61_fpDivTest_q;
            WHEN OTHERS => divValPreNormYPow2Exc_uid63_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- norm_uid64_fpDivTest(BITSELECT,63)@11
    norm_uid64_fpDivTest_b <= STD_LOGIC_VECTOR(divValPreNormYPow2Exc_uid63_fpDivTest_q(27 downto 27));

    -- redist16_norm_uid64_fpDivTest_b_1(DELAY,206)
    redist16_norm_uid64_fpDivTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => norm_uid64_fpDivTest_b, xout => redist16_norm_uid64_fpDivTest_b_1_q, clk => clk, aclr => areset );

    -- zeroPaddingInAddition_uid74_fpDivTest(CONSTANT,73)
    zeroPaddingInAddition_uid74_fpDivTest_q <= "000000000000000000000000";

    -- expFracPostRnd_uid75_fpDivTest(BITJOIN,74)@12
    expFracPostRnd_uid75_fpDivTest_q <= redist16_norm_uid64_fpDivTest_b_1_q & zeroPaddingInAddition_uid74_fpDivTest_q & VCC_q;

    -- cstBiasM1_uid6_fpDivTest(CONSTANT,5)
    cstBiasM1_uid6_fpDivTest_q <= "01111110";

    -- expXmY_uid47_fpDivTest(SUB,46)@10 + 1
    expXmY_uid47_fpDivTest_a <= STD_LOGIC_VECTOR("0" & redist34_expX_uid9_fpDivTest_b_10_outputreg_q);
    expXmY_uid47_fpDivTest_b <= STD_LOGIC_VECTOR("0" & redist29_expY_uid12_fpDivTest_b_10_outputreg_q);
    expXmY_uid47_fpDivTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expXmY_uid47_fpDivTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expXmY_uid47_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expXmY_uid47_fpDivTest_a) - UNSIGNED(expXmY_uid47_fpDivTest_b));
        END IF;
    END PROCESS;
    expXmY_uid47_fpDivTest_q <= expXmY_uid47_fpDivTest_o(8 downto 0);

    -- expR_uid48_fpDivTest(ADD,47)@11 + 1
    expR_uid48_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 9 => expXmY_uid47_fpDivTest_q(8)) & expXmY_uid47_fpDivTest_q));
    expR_uid48_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & cstBiasM1_uid6_fpDivTest_q));
    expR_uid48_fpDivTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expR_uid48_fpDivTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expR_uid48_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(expR_uid48_fpDivTest_a) + SIGNED(expR_uid48_fpDivTest_b));
        END IF;
    END PROCESS;
    expR_uid48_fpDivTest_q <= expR_uid48_fpDivTest_o(9 downto 0);

    -- divValPreNormHigh_uid65_fpDivTest(BITSELECT,64)@11
    divValPreNormHigh_uid65_fpDivTest_in <= divValPreNormYPow2Exc_uid63_fpDivTest_q(26 downto 0);
    divValPreNormHigh_uid65_fpDivTest_b <= divValPreNormHigh_uid65_fpDivTest_in(26 downto 2);

    -- divValPreNormLow_uid66_fpDivTest(BITSELECT,65)@11
    divValPreNormLow_uid66_fpDivTest_in <= divValPreNormYPow2Exc_uid63_fpDivTest_q(25 downto 0);
    divValPreNormLow_uid66_fpDivTest_b <= divValPreNormLow_uid66_fpDivTest_in(25 downto 1);

    -- normFracRnd_uid67_fpDivTest(MUX,66)@11 + 1
    normFracRnd_uid67_fpDivTest_s <= norm_uid64_fpDivTest_b;
    normFracRnd_uid67_fpDivTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            normFracRnd_uid67_fpDivTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (normFracRnd_uid67_fpDivTest_s) IS
                WHEN "0" => normFracRnd_uid67_fpDivTest_q <= divValPreNormLow_uid66_fpDivTest_b;
                WHEN "1" => normFracRnd_uid67_fpDivTest_q <= divValPreNormHigh_uid65_fpDivTest_b;
                WHEN OTHERS => normFracRnd_uid67_fpDivTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- expFracRnd_uid68_fpDivTest(BITJOIN,67)@12
    expFracRnd_uid68_fpDivTest_q <= expR_uid48_fpDivTest_q & normFracRnd_uid67_fpDivTest_q;

    -- expFracPostRnd_uid76_fpDivTest(ADD,75)@12 + 1
    expFracPostRnd_uid76_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 35 => expFracRnd_uid68_fpDivTest_q(34)) & expFracRnd_uid68_fpDivTest_q));
    expFracPostRnd_uid76_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000" & expFracPostRnd_uid75_fpDivTest_q));
    expFracPostRnd_uid76_fpDivTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracPostRnd_uid76_fpDivTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracPostRnd_uid76_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(expFracPostRnd_uid76_fpDivTest_a) + SIGNED(expFracPostRnd_uid76_fpDivTest_b));
        END IF;
    END PROCESS;
    expFracPostRnd_uid76_fpDivTest_q <= expFracPostRnd_uid76_fpDivTest_o(35 downto 0);

    -- fracPostRndF_uid79_fpDivTest(BITSELECT,78)@13
    fracPostRndF_uid79_fpDivTest_in <= expFracPostRnd_uid76_fpDivTest_q(24 downto 0);
    fracPostRndF_uid79_fpDivTest_b <= fracPostRndF_uid79_fpDivTest_in(24 downto 1);

    -- invYO_uid55_fpDivTest(BITSELECT,54)@8
    invYO_uid55_fpDivTest_in <= STD_LOGIC_VECTOR(s2_uid171_invPolyEval_q(32 downto 0));
    invYO_uid55_fpDivTest_b <= STD_LOGIC_VECTOR(invYO_uid55_fpDivTest_in(32 downto 32));

    -- redist18_invYO_uid55_fpDivTest_b_5(DELAY,208)
    redist18_invYO_uid55_fpDivTest_b_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => invYO_uid55_fpDivTest_b, xout => redist18_invYO_uid55_fpDivTest_b_5_q, clk => clk, aclr => areset );

    -- fracPostRndF_uid80_fpDivTest(MUX,79)@13
    fracPostRndF_uid80_fpDivTest_s <= redist18_invYO_uid55_fpDivTest_b_5_q;
    fracPostRndF_uid80_fpDivTest_combproc: PROCESS (fracPostRndF_uid80_fpDivTest_s, fracPostRndF_uid79_fpDivTest_b, fracXExt_uid77_fpDivTest_q)
    BEGIN
        CASE (fracPostRndF_uid80_fpDivTest_s) IS
            WHEN "0" => fracPostRndF_uid80_fpDivTest_q <= fracPostRndF_uid79_fpDivTest_b;
            WHEN "1" => fracPostRndF_uid80_fpDivTest_q <= fracXExt_uid77_fpDivTest_q;
            WHEN OTHERS => fracPostRndF_uid80_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist15_fracPostRndF_uid80_fpDivTest_q_5_wraddr(REG,241)
    redist15_fracPostRndF_uid80_fpDivTest_q_5_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist15_fracPostRndF_uid80_fpDivTest_q_5_wraddr_q <= "10";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist15_fracPostRndF_uid80_fpDivTest_q_5_wraddr_q <= STD_LOGIC_VECTOR(redist15_fracPostRndF_uid80_fpDivTest_q_5_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist15_fracPostRndF_uid80_fpDivTest_q_5_mem(DUALMEM,239)
    redist15_fracPostRndF_uid80_fpDivTest_q_5_mem_ia <= STD_LOGIC_VECTOR(fracPostRndF_uid80_fpDivTest_q);
    redist15_fracPostRndF_uid80_fpDivTest_q_5_mem_aa <= redist15_fracPostRndF_uid80_fpDivTest_q_5_wraddr_q;
    redist15_fracPostRndF_uid80_fpDivTest_q_5_mem_ab <= redist15_fracPostRndF_uid80_fpDivTest_q_5_rdcnt_q;
    redist15_fracPostRndF_uid80_fpDivTest_q_5_mem_reset0 <= areset;
    redist15_fracPostRndF_uid80_fpDivTest_q_5_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 24,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 24,
        widthad_b => 2,
        numwords_b => 3,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist15_fracPostRndF_uid80_fpDivTest_q_5_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist15_fracPostRndF_uid80_fpDivTest_q_5_mem_reset0,
        clock1 => clk,
        address_a => redist15_fracPostRndF_uid80_fpDivTest_q_5_mem_aa,
        data_a => redist15_fracPostRndF_uid80_fpDivTest_q_5_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist15_fracPostRndF_uid80_fpDivTest_q_5_mem_ab,
        q_b => redist15_fracPostRndF_uid80_fpDivTest_q_5_mem_iq
    );
    redist15_fracPostRndF_uid80_fpDivTest_q_5_mem_q <= redist15_fracPostRndF_uid80_fpDivTest_q_5_mem_iq(23 downto 0);

    -- redist15_fracPostRndF_uid80_fpDivTest_q_5_outputreg(DELAY,238)
    redist15_fracPostRndF_uid80_fpDivTest_q_5_outputreg : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist15_fracPostRndF_uid80_fpDivTest_q_5_mem_q, xout => redist15_fracPostRndF_uid80_fpDivTest_q_5_outputreg_q, clk => clk, aclr => areset );

    -- betweenFPwF_uid102_fpDivTest(BITSELECT,101)@18
    betweenFPwF_uid102_fpDivTest_in <= STD_LOGIC_VECTOR(redist15_fracPostRndF_uid80_fpDivTest_q_5_outputreg_q(0 downto 0));
    betweenFPwF_uid102_fpDivTest_b <= STD_LOGIC_VECTOR(betweenFPwF_uid102_fpDivTest_in(0 downto 0));

    -- redist36_expX_uid9_fpDivTest_b_17(DELAY,226)
    redist36_expX_uid9_fpDivTest_b_17 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist35_expX_uid9_fpDivTest_b_13_q, xout => redist36_expX_uid9_fpDivTest_b_17_q, clk => clk, aclr => areset );

    -- redist33_fracX_uid10_fpDivTest_b_17_inputreg(DELAY,283)
    redist33_fracX_uid10_fpDivTest_b_17_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist32_fracX_uid10_fpDivTest_b_13_q, xout => redist33_fracX_uid10_fpDivTest_b_17_inputreg_q, clk => clk, aclr => areset );

    -- redist33_fracX_uid10_fpDivTest_b_17(DELAY,223)
    redist33_fracX_uid10_fpDivTest_b_17 : dspba_delay
    GENERIC MAP ( width => 23, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist33_fracX_uid10_fpDivTest_b_17_inputreg_q, xout => redist33_fracX_uid10_fpDivTest_b_17_q, clk => clk, aclr => areset );

    -- qDivProdLTX_opB_uid100_fpDivTest(BITJOIN,99)@17
    qDivProdLTX_opB_uid100_fpDivTest_q <= redist36_expX_uid9_fpDivTest_b_17_q & redist33_fracX_uid10_fpDivTest_b_17_q;

    -- lOAdded_uid87_fpDivTest(BITJOIN,86)@13
    lOAdded_uid87_fpDivTest_q <= VCC_q & redist28_fracY_uid13_fpDivTest_b_13_q;

    -- lOAdded_uid84_fpDivTest(BITJOIN,83)@13
    lOAdded_uid84_fpDivTest_q <= VCC_q & fracPostRndF_uid80_fpDivTest_q;

    -- qDivProd_uid89_fpDivTest_cma(CHAINMULTADD,186)@13 + 2
    qDivProd_uid89_fpDivTest_cma_reset <= areset;
    qDivProd_uid89_fpDivTest_cma_ena0 <= '1';
    qDivProd_uid89_fpDivTest_cma_ena1 <= qDivProd_uid89_fpDivTest_cma_ena0;
    qDivProd_uid89_fpDivTest_cma_p(0) <= qDivProd_uid89_fpDivTest_cma_a0(0) * qDivProd_uid89_fpDivTest_cma_c0(0);
    qDivProd_uid89_fpDivTest_cma_u(0) <= RESIZE(qDivProd_uid89_fpDivTest_cma_p(0),49);
    qDivProd_uid89_fpDivTest_cma_w(0) <= qDivProd_uid89_fpDivTest_cma_u(0);
    qDivProd_uid89_fpDivTest_cma_x(0) <= qDivProd_uid89_fpDivTest_cma_w(0);
    qDivProd_uid89_fpDivTest_cma_y(0) <= qDivProd_uid89_fpDivTest_cma_x(0);
    qDivProd_uid89_fpDivTest_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            qDivProd_uid89_fpDivTest_cma_a0 <= (others => (others => '0'));
            qDivProd_uid89_fpDivTest_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (qDivProd_uid89_fpDivTest_cma_ena0 = '1') THEN
                qDivProd_uid89_fpDivTest_cma_a0(0) <= RESIZE(UNSIGNED(lOAdded_uid84_fpDivTest_q),25);
                qDivProd_uid89_fpDivTest_cma_c0(0) <= RESIZE(UNSIGNED(lOAdded_uid87_fpDivTest_q),24);
            END IF;
        END IF;
    END PROCESS;
    qDivProd_uid89_fpDivTest_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            qDivProd_uid89_fpDivTest_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (qDivProd_uid89_fpDivTest_cma_ena1 = '1') THEN
                qDivProd_uid89_fpDivTest_cma_s(0) <= qDivProd_uid89_fpDivTest_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    qDivProd_uid89_fpDivTest_cma_delay : dspba_delay
    GENERIC MAP ( width => 49, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_cma_s(0)(48 downto 0)), xout => qDivProd_uid89_fpDivTest_cma_qq, clk => clk, aclr => areset );
    qDivProd_uid89_fpDivTest_cma_q <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_cma_qq(48 downto 0));

    -- qDivProdNorm_uid90_fpDivTest(BITSELECT,89)@15
    qDivProdNorm_uid90_fpDivTest_b <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_cma_q(48 downto 48));

    -- cstBias_uid7_fpDivTest(CONSTANT,6)
    cstBias_uid7_fpDivTest_q <= "01111111";

    -- qDivProdExp_opBs_uid95_fpDivTest(SUB,94)@15 + 1
    qDivProdExp_opBs_uid95_fpDivTest_a <= STD_LOGIC_VECTOR("0" & cstBias_uid7_fpDivTest_q);
    qDivProdExp_opBs_uid95_fpDivTest_b <= STD_LOGIC_VECTOR("00000000" & qDivProdNorm_uid90_fpDivTest_b);
    qDivProdExp_opBs_uid95_fpDivTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            qDivProdExp_opBs_uid95_fpDivTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            qDivProdExp_opBs_uid95_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(qDivProdExp_opBs_uid95_fpDivTest_a) - UNSIGNED(qDivProdExp_opBs_uid95_fpDivTest_b));
        END IF;
    END PROCESS;
    qDivProdExp_opBs_uid95_fpDivTest_q <= qDivProdExp_opBs_uid95_fpDivTest_o(8 downto 0);

    -- expPostRndFR_uid81_fpDivTest(BITSELECT,80)@13
    expPostRndFR_uid81_fpDivTest_in <= expFracPostRnd_uid76_fpDivTest_q(32 downto 0);
    expPostRndFR_uid81_fpDivTest_b <= expPostRndFR_uid81_fpDivTest_in(32 downto 25);

    -- expPostRndF_uid82_fpDivTest(MUX,81)@13
    expPostRndF_uid82_fpDivTest_s <= redist18_invYO_uid55_fpDivTest_b_5_q;
    expPostRndF_uid82_fpDivTest_combproc: PROCESS (expPostRndF_uid82_fpDivTest_s, expPostRndFR_uid81_fpDivTest_b, redist35_expX_uid9_fpDivTest_b_13_q)
    BEGIN
        CASE (expPostRndF_uid82_fpDivTest_s) IS
            WHEN "0" => expPostRndF_uid82_fpDivTest_q <= expPostRndFR_uid81_fpDivTest_b;
            WHEN "1" => expPostRndF_uid82_fpDivTest_q <= redist35_expX_uid9_fpDivTest_b_13_q;
            WHEN OTHERS => expPostRndF_uid82_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- qDivProdExp_opA_uid94_fpDivTest(ADD,93)@13 + 1
    qDivProdExp_opA_uid94_fpDivTest_a <= STD_LOGIC_VECTOR("0" & redist30_expY_uid12_fpDivTest_b_13_q);
    qDivProdExp_opA_uid94_fpDivTest_b <= STD_LOGIC_VECTOR("0" & expPostRndF_uid82_fpDivTest_q);
    qDivProdExp_opA_uid94_fpDivTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            qDivProdExp_opA_uid94_fpDivTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            qDivProdExp_opA_uid94_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(qDivProdExp_opA_uid94_fpDivTest_a) + UNSIGNED(qDivProdExp_opA_uid94_fpDivTest_b));
        END IF;
    END PROCESS;
    qDivProdExp_opA_uid94_fpDivTest_q <= qDivProdExp_opA_uid94_fpDivTest_o(8 downto 0);

    -- redist13_qDivProdExp_opA_uid94_fpDivTest_q_3(DELAY,203)
    redist13_qDivProdExp_opA_uid94_fpDivTest_q_3 : dspba_delay
    GENERIC MAP ( width => 9, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => qDivProdExp_opA_uid94_fpDivTest_q, xout => redist13_qDivProdExp_opA_uid94_fpDivTest_q_3_q, clk => clk, aclr => areset );

    -- qDivProdExp_uid96_fpDivTest(SUB,95)@16
    qDivProdExp_uid96_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist13_qDivProdExp_opA_uid94_fpDivTest_q_3_q));
    qDivProdExp_uid96_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 9 => qDivProdExp_opBs_uid95_fpDivTest_q(8)) & qDivProdExp_opBs_uid95_fpDivTest_q));
    qDivProdExp_uid96_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(qDivProdExp_uid96_fpDivTest_a) - SIGNED(qDivProdExp_uid96_fpDivTest_b));
    qDivProdExp_uid96_fpDivTest_q <= qDivProdExp_uid96_fpDivTest_o(10 downto 0);

    -- qDivProdLTX_opA_uid98_fpDivTest(BITSELECT,97)@16
    qDivProdLTX_opA_uid98_fpDivTest_in <= qDivProdExp_uid96_fpDivTest_q(7 downto 0);
    qDivProdLTX_opA_uid98_fpDivTest_b <= qDivProdLTX_opA_uid98_fpDivTest_in(7 downto 0);

    -- redist11_qDivProdLTX_opA_uid98_fpDivTest_b_1(DELAY,201)
    redist11_qDivProdLTX_opA_uid98_fpDivTest_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => qDivProdLTX_opA_uid98_fpDivTest_b, xout => redist11_qDivProdLTX_opA_uid98_fpDivTest_b_1_q, clk => clk, aclr => areset );

    -- qDivProdFracHigh_uid91_fpDivTest(BITSELECT,90)@15
    qDivProdFracHigh_uid91_fpDivTest_in <= qDivProd_uid89_fpDivTest_cma_q(47 downto 0);
    qDivProdFracHigh_uid91_fpDivTest_b <= qDivProdFracHigh_uid91_fpDivTest_in(47 downto 24);

    -- qDivProdFracLow_uid92_fpDivTest(BITSELECT,91)@15
    qDivProdFracLow_uid92_fpDivTest_in <= qDivProd_uid89_fpDivTest_cma_q(46 downto 0);
    qDivProdFracLow_uid92_fpDivTest_b <= qDivProdFracLow_uid92_fpDivTest_in(46 downto 23);

    -- qDivProdFrac_uid93_fpDivTest(MUX,92)@15
    qDivProdFrac_uid93_fpDivTest_s <= qDivProdNorm_uid90_fpDivTest_b;
    qDivProdFrac_uid93_fpDivTest_combproc: PROCESS (qDivProdFrac_uid93_fpDivTest_s, qDivProdFracLow_uid92_fpDivTest_b, qDivProdFracHigh_uid91_fpDivTest_b)
    BEGIN
        CASE (qDivProdFrac_uid93_fpDivTest_s) IS
            WHEN "0" => qDivProdFrac_uid93_fpDivTest_q <= qDivProdFracLow_uid92_fpDivTest_b;
            WHEN "1" => qDivProdFrac_uid93_fpDivTest_q <= qDivProdFracHigh_uid91_fpDivTest_b;
            WHEN OTHERS => qDivProdFrac_uid93_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- qDivProdFracWF_uid97_fpDivTest(BITSELECT,96)@15
    qDivProdFracWF_uid97_fpDivTest_b <= qDivProdFrac_uid93_fpDivTest_q(23 downto 1);

    -- redist12_qDivProdFracWF_uid97_fpDivTest_b_2(DELAY,202)
    redist12_qDivProdFracWF_uid97_fpDivTest_b_2 : dspba_delay
    GENERIC MAP ( width => 23, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => qDivProdFracWF_uid97_fpDivTest_b, xout => redist12_qDivProdFracWF_uid97_fpDivTest_b_2_q, clk => clk, aclr => areset );

    -- qDivProdLTX_opA_uid99_fpDivTest(BITJOIN,98)@17
    qDivProdLTX_opA_uid99_fpDivTest_q <= redist11_qDivProdLTX_opA_uid98_fpDivTest_b_1_q & redist12_qDivProdFracWF_uid97_fpDivTest_b_2_q;

    -- qDividerProdLTX_uid101_fpDivTest(COMPARE,100)@17 + 1
    qDividerProdLTX_uid101_fpDivTest_a <= STD_LOGIC_VECTOR("00" & qDivProdLTX_opA_uid99_fpDivTest_q);
    qDividerProdLTX_uid101_fpDivTest_b <= STD_LOGIC_VECTOR("00" & qDivProdLTX_opB_uid100_fpDivTest_q);
    qDividerProdLTX_uid101_fpDivTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            qDividerProdLTX_uid101_fpDivTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            qDividerProdLTX_uid101_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(qDividerProdLTX_uid101_fpDivTest_a) - UNSIGNED(qDividerProdLTX_uid101_fpDivTest_b));
        END IF;
    END PROCESS;
    qDividerProdLTX_uid101_fpDivTest_c(0) <= qDividerProdLTX_uid101_fpDivTest_o(32);

    -- extraUlp_uid103_fpDivTest(LOGICAL,102)@18 + 1
    extraUlp_uid103_fpDivTest_qi <= qDividerProdLTX_uid101_fpDivTest_c and betweenFPwF_uid102_fpDivTest_b;
    extraUlp_uid103_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => extraUlp_uid103_fpDivTest_qi, xout => extraUlp_uid103_fpDivTest_q, clk => clk, aclr => areset );

    -- fracPostRndFT_uid104_fpDivTest(BITSELECT,103)@18
    fracPostRndFT_uid104_fpDivTest_b <= redist15_fracPostRndF_uid80_fpDivTest_q_5_outputreg_q(23 downto 1);

    -- redist8_fracPostRndFT_uid104_fpDivTest_b_1(DELAY,198)
    redist8_fracPostRndFT_uid104_fpDivTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracPostRndFT_uid104_fpDivTest_b, xout => redist8_fracPostRndFT_uid104_fpDivTest_b_1_q, clk => clk, aclr => areset );

    -- fracRPreExcExt_uid105_fpDivTest(ADD,104)@19
    fracRPreExcExt_uid105_fpDivTest_a <= STD_LOGIC_VECTOR("0" & redist8_fracPostRndFT_uid104_fpDivTest_b_1_q);
    fracRPreExcExt_uid105_fpDivTest_b <= STD_LOGIC_VECTOR("00000000000000000000000" & extraUlp_uid103_fpDivTest_q);
    fracRPreExcExt_uid105_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(fracRPreExcExt_uid105_fpDivTest_a) + UNSIGNED(fracRPreExcExt_uid105_fpDivTest_b));
    fracRPreExcExt_uid105_fpDivTest_q <= fracRPreExcExt_uid105_fpDivTest_o(23 downto 0);

    -- ovfIncRnd_uid109_fpDivTest(BITSELECT,108)@19
    ovfIncRnd_uid109_fpDivTest_b <= STD_LOGIC_VECTOR(fracRPreExcExt_uid105_fpDivTest_q(23 downto 23));

    -- redist6_ovfIncRnd_uid109_fpDivTest_b_1(DELAY,196)
    redist6_ovfIncRnd_uid109_fpDivTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => ovfIncRnd_uid109_fpDivTest_b, xout => redist6_ovfIncRnd_uid109_fpDivTest_b_1_q, clk => clk, aclr => areset );

    -- expFracPostRndInc_uid110_fpDivTest(ADD,109)@20
    expFracPostRndInc_uid110_fpDivTest_a <= STD_LOGIC_VECTOR("0" & redist14_expPostRndFR_uid81_fpDivTest_b_7_outputreg_q);
    expFracPostRndInc_uid110_fpDivTest_b <= STD_LOGIC_VECTOR("00000000" & redist6_ovfIncRnd_uid109_fpDivTest_b_1_q);
    expFracPostRndInc_uid110_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracPostRndInc_uid110_fpDivTest_a) + UNSIGNED(expFracPostRndInc_uid110_fpDivTest_b));
    expFracPostRndInc_uid110_fpDivTest_q <= expFracPostRndInc_uid110_fpDivTest_o(8 downto 0);

    -- expFracPostRndR_uid111_fpDivTest(BITSELECT,110)@20
    expFracPostRndR_uid111_fpDivTest_in <= expFracPostRndInc_uid110_fpDivTest_q(7 downto 0);
    expFracPostRndR_uid111_fpDivTest_b <= expFracPostRndR_uid111_fpDivTest_in(7 downto 0);

    -- redist14_expPostRndFR_uid81_fpDivTest_b_7_notEnable(LOGICAL,234)
    redist14_expPostRndFR_uid81_fpDivTest_b_7_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist14_expPostRndFR_uid81_fpDivTest_b_7_nor(LOGICAL,235)
    redist14_expPostRndFR_uid81_fpDivTest_b_7_nor_q <= not (redist14_expPostRndFR_uid81_fpDivTest_b_7_notEnable_q or redist14_expPostRndFR_uid81_fpDivTest_b_7_sticky_ena_q);

    -- redist14_expPostRndFR_uid81_fpDivTest_b_7_mem_last(CONSTANT,231)
    redist14_expPostRndFR_uid81_fpDivTest_b_7_mem_last_q <= "011";

    -- redist14_expPostRndFR_uid81_fpDivTest_b_7_cmp(LOGICAL,232)
    redist14_expPostRndFR_uid81_fpDivTest_b_7_cmp_q <= "1" WHEN redist14_expPostRndFR_uid81_fpDivTest_b_7_mem_last_q = redist14_expPostRndFR_uid81_fpDivTest_b_7_rdcnt_q ELSE "0";

    -- redist14_expPostRndFR_uid81_fpDivTest_b_7_cmpReg(REG,233)
    redist14_expPostRndFR_uid81_fpDivTest_b_7_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist14_expPostRndFR_uid81_fpDivTest_b_7_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist14_expPostRndFR_uid81_fpDivTest_b_7_cmpReg_q <= STD_LOGIC_VECTOR(redist14_expPostRndFR_uid81_fpDivTest_b_7_cmp_q);
        END IF;
    END PROCESS;

    -- redist14_expPostRndFR_uid81_fpDivTest_b_7_sticky_ena(REG,236)
    redist14_expPostRndFR_uid81_fpDivTest_b_7_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist14_expPostRndFR_uid81_fpDivTest_b_7_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist14_expPostRndFR_uid81_fpDivTest_b_7_nor_q = "1") THEN
                redist14_expPostRndFR_uid81_fpDivTest_b_7_sticky_ena_q <= STD_LOGIC_VECTOR(redist14_expPostRndFR_uid81_fpDivTest_b_7_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist14_expPostRndFR_uid81_fpDivTest_b_7_enaAnd(LOGICAL,237)
    redist14_expPostRndFR_uid81_fpDivTest_b_7_enaAnd_q <= redist14_expPostRndFR_uid81_fpDivTest_b_7_sticky_ena_q and VCC_q;

    -- redist14_expPostRndFR_uid81_fpDivTest_b_7_rdcnt(COUNTER,229)
    -- low=0, high=4, step=1, init=0
    redist14_expPostRndFR_uid81_fpDivTest_b_7_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist14_expPostRndFR_uid81_fpDivTest_b_7_rdcnt_i <= TO_UNSIGNED(0, 3);
            redist14_expPostRndFR_uid81_fpDivTest_b_7_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist14_expPostRndFR_uid81_fpDivTest_b_7_rdcnt_i = TO_UNSIGNED(3, 3)) THEN
                redist14_expPostRndFR_uid81_fpDivTest_b_7_rdcnt_eq <= '1';
            ELSE
                redist14_expPostRndFR_uid81_fpDivTest_b_7_rdcnt_eq <= '0';
            END IF;
            IF (redist14_expPostRndFR_uid81_fpDivTest_b_7_rdcnt_eq = '1') THEN
                redist14_expPostRndFR_uid81_fpDivTest_b_7_rdcnt_i <= redist14_expPostRndFR_uid81_fpDivTest_b_7_rdcnt_i + 4;
            ELSE
                redist14_expPostRndFR_uid81_fpDivTest_b_7_rdcnt_i <= redist14_expPostRndFR_uid81_fpDivTest_b_7_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist14_expPostRndFR_uid81_fpDivTest_b_7_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist14_expPostRndFR_uid81_fpDivTest_b_7_rdcnt_i, 3)));

    -- redist14_expPostRndFR_uid81_fpDivTest_b_7_wraddr(REG,230)
    redist14_expPostRndFR_uid81_fpDivTest_b_7_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist14_expPostRndFR_uid81_fpDivTest_b_7_wraddr_q <= "100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist14_expPostRndFR_uid81_fpDivTest_b_7_wraddr_q <= STD_LOGIC_VECTOR(redist14_expPostRndFR_uid81_fpDivTest_b_7_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist14_expPostRndFR_uid81_fpDivTest_b_7_mem(DUALMEM,228)
    redist14_expPostRndFR_uid81_fpDivTest_b_7_mem_ia <= STD_LOGIC_VECTOR(expPostRndFR_uid81_fpDivTest_b);
    redist14_expPostRndFR_uid81_fpDivTest_b_7_mem_aa <= redist14_expPostRndFR_uid81_fpDivTest_b_7_wraddr_q;
    redist14_expPostRndFR_uid81_fpDivTest_b_7_mem_ab <= redist14_expPostRndFR_uid81_fpDivTest_b_7_rdcnt_q;
    redist14_expPostRndFR_uid81_fpDivTest_b_7_mem_reset0 <= areset;
    redist14_expPostRndFR_uid81_fpDivTest_b_7_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 8,
        widthad_b => 3,
        numwords_b => 5,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist14_expPostRndFR_uid81_fpDivTest_b_7_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist14_expPostRndFR_uid81_fpDivTest_b_7_mem_reset0,
        clock1 => clk,
        address_a => redist14_expPostRndFR_uid81_fpDivTest_b_7_mem_aa,
        data_a => redist14_expPostRndFR_uid81_fpDivTest_b_7_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist14_expPostRndFR_uid81_fpDivTest_b_7_mem_ab,
        q_b => redist14_expPostRndFR_uid81_fpDivTest_b_7_mem_iq
    );
    redist14_expPostRndFR_uid81_fpDivTest_b_7_mem_q <= redist14_expPostRndFR_uid81_fpDivTest_b_7_mem_iq(7 downto 0);

    -- redist14_expPostRndFR_uid81_fpDivTest_b_7_outputreg(DELAY,227)
    redist14_expPostRndFR_uid81_fpDivTest_b_7_outputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist14_expPostRndFR_uid81_fpDivTest_b_7_mem_q, xout => redist14_expPostRndFR_uid81_fpDivTest_b_7_outputreg_q, clk => clk, aclr => areset );

    -- redist10_extraUlp_uid103_fpDivTest_q_2(DELAY,200)
    redist10_extraUlp_uid103_fpDivTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => extraUlp_uid103_fpDivTest_q, xout => redist10_extraUlp_uid103_fpDivTest_q_2_q, clk => clk, aclr => areset );

    -- expRPreExc_uid112_fpDivTest(MUX,111)@20 + 1
    expRPreExc_uid112_fpDivTest_s <= redist10_extraUlp_uid103_fpDivTest_q_2_q;
    expRPreExc_uid112_fpDivTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRPreExc_uid112_fpDivTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (expRPreExc_uid112_fpDivTest_s) IS
                WHEN "0" => expRPreExc_uid112_fpDivTest_q <= redist14_expPostRndFR_uid81_fpDivTest_b_7_outputreg_q;
                WHEN "1" => expRPreExc_uid112_fpDivTest_q <= expFracPostRndR_uid111_fpDivTest_b;
                WHEN OTHERS => expRPreExc_uid112_fpDivTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- invExpXIsMax_uid43_fpDivTest(LOGICAL,42)@14
    invExpXIsMax_uid43_fpDivTest_q <= not (expXIsMax_uid38_fpDivTest_q);

    -- InvExpXIsZero_uid44_fpDivTest(LOGICAL,43)@14
    InvExpXIsZero_uid44_fpDivTest_q <= not (excZ_y_uid37_fpDivTest_q);

    -- excR_y_uid45_fpDivTest(LOGICAL,44)@14
    excR_y_uid45_fpDivTest_q <= InvExpXIsZero_uid44_fpDivTest_q and invExpXIsMax_uid43_fpDivTest_q;

    -- excXIYR_uid127_fpDivTest(LOGICAL,126)@14
    excXIYR_uid127_fpDivTest_q <= excI_x_uid27_fpDivTest_q and excR_y_uid45_fpDivTest_q;

    -- excXIYZ_uid126_fpDivTest(LOGICAL,125)@14
    excXIYZ_uid126_fpDivTest_q <= excI_x_uid27_fpDivTest_q and excZ_y_uid37_fpDivTest_q;

    -- expRExt_uid114_fpDivTest(BITSELECT,113)@13
    expRExt_uid114_fpDivTest_b <= STD_LOGIC_VECTOR(expFracPostRnd_uid76_fpDivTest_q(35 downto 25));

    -- expOvf_uid118_fpDivTest(COMPARE,117)@13 + 1
    expOvf_uid118_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => expRExt_uid114_fpDivTest_b(10)) & expRExt_uid114_fpDivTest_b));
    expOvf_uid118_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000" & cstAllOWE_uid18_fpDivTest_q));
    expOvf_uid118_fpDivTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expOvf_uid118_fpDivTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expOvf_uid118_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid118_fpDivTest_a) - SIGNED(expOvf_uid118_fpDivTest_b));
        END IF;
    END PROCESS;
    expOvf_uid118_fpDivTest_n(0) <= not (expOvf_uid118_fpDivTest_o(12));

    -- invExpXIsMax_uid29_fpDivTest(LOGICAL,28)@13
    invExpXIsMax_uid29_fpDivTest_q <= not (expXIsMax_uid24_fpDivTest_q);

    -- InvExpXIsZero_uid30_fpDivTest(LOGICAL,29)@13
    InvExpXIsZero_uid30_fpDivTest_q <= not (excZ_x_uid23_fpDivTest_q);

    -- excR_x_uid31_fpDivTest(LOGICAL,30)@13 + 1
    excR_x_uid31_fpDivTest_qi <= InvExpXIsZero_uid30_fpDivTest_q and invExpXIsMax_uid29_fpDivTest_q;
    excR_x_uid31_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excR_x_uid31_fpDivTest_qi, xout => excR_x_uid31_fpDivTest_q, clk => clk, aclr => areset );

    -- excXRYROvf_uid125_fpDivTest(LOGICAL,124)@14
    excXRYROvf_uid125_fpDivTest_q <= excR_x_uid31_fpDivTest_q and excR_y_uid45_fpDivTest_q and expOvf_uid118_fpDivTest_n;

    -- excXRYZ_uid124_fpDivTest(LOGICAL,123)@14
    excXRYZ_uid124_fpDivTest_q <= excR_x_uid31_fpDivTest_q and excZ_y_uid37_fpDivTest_q;

    -- excRInf_uid128_fpDivTest(LOGICAL,127)@14 + 1
    excRInf_uid128_fpDivTest_qi <= excXRYZ_uid124_fpDivTest_q or excXRYROvf_uid125_fpDivTest_q or excXIYZ_uid126_fpDivTest_q or excXIYR_uid127_fpDivTest_q;
    excRInf_uid128_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRInf_uid128_fpDivTest_qi, xout => excRInf_uid128_fpDivTest_q, clk => clk, aclr => areset );

    -- xRegOrZero_uid121_fpDivTest(LOGICAL,120)@14
    xRegOrZero_uid121_fpDivTest_q <= excR_x_uid31_fpDivTest_q or redist26_excZ_x_uid23_fpDivTest_q_1_q;

    -- regOrZeroOverInf_uid122_fpDivTest(LOGICAL,121)@14
    regOrZeroOverInf_uid122_fpDivTest_q <= xRegOrZero_uid121_fpDivTest_q and excI_y_uid41_fpDivTest_q;

    -- expUdf_uid115_fpDivTest(COMPARE,114)@13 + 1
    expUdf_uid115_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000000000" & GND_q));
    expUdf_uid115_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => expRExt_uid114_fpDivTest_b(10)) & expRExt_uid114_fpDivTest_b));
    expUdf_uid115_fpDivTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expUdf_uid115_fpDivTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expUdf_uid115_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid115_fpDivTest_a) - SIGNED(expUdf_uid115_fpDivTest_b));
        END IF;
    END PROCESS;
    expUdf_uid115_fpDivTest_n(0) <= not (expUdf_uid115_fpDivTest_o(12));

    -- regOverRegWithUf_uid120_fpDivTest(LOGICAL,119)@14
    regOverRegWithUf_uid120_fpDivTest_q <= expUdf_uid115_fpDivTest_n and excR_x_uid31_fpDivTest_q and excR_y_uid45_fpDivTest_q;

    -- zeroOverReg_uid119_fpDivTest(LOGICAL,118)@14
    zeroOverReg_uid119_fpDivTest_q <= redist26_excZ_x_uid23_fpDivTest_q_1_q and excR_y_uid45_fpDivTest_q;

    -- excRZero_uid123_fpDivTest(LOGICAL,122)@14 + 1
    excRZero_uid123_fpDivTest_qi <= zeroOverReg_uid119_fpDivTest_q or regOverRegWithUf_uid120_fpDivTest_q or regOrZeroOverInf_uid122_fpDivTest_q;
    excRZero_uid123_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRZero_uid123_fpDivTest_qi, xout => excRZero_uid123_fpDivTest_q, clk => clk, aclr => areset );

    -- concExc_uid132_fpDivTest(BITJOIN,131)@15
    concExc_uid132_fpDivTest_q <= excRNaN_uid131_fpDivTest_q & excRInf_uid128_fpDivTest_q & excRZero_uid123_fpDivTest_q;

    -- excREnc_uid133_fpDivTest(LOOKUP,132)@15 + 1
    excREnc_uid133_fpDivTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excREnc_uid133_fpDivTest_q <= "01";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (concExc_uid132_fpDivTest_q) IS
                WHEN "000" => excREnc_uid133_fpDivTest_q <= "01";
                WHEN "001" => excREnc_uid133_fpDivTest_q <= "00";
                WHEN "010" => excREnc_uid133_fpDivTest_q <= "10";
                WHEN "011" => excREnc_uid133_fpDivTest_q <= "00";
                WHEN "100" => excREnc_uid133_fpDivTest_q <= "11";
                WHEN "101" => excREnc_uid133_fpDivTest_q <= "00";
                WHEN "110" => excREnc_uid133_fpDivTest_q <= "00";
                WHEN "111" => excREnc_uid133_fpDivTest_q <= "00";
                WHEN OTHERS => -- unreachable
                               excREnc_uid133_fpDivTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- redist5_excREnc_uid133_fpDivTest_q_6(DELAY,195)
    redist5_excREnc_uid133_fpDivTest_q_6 : dspba_delay
    GENERIC MAP ( width => 2, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => excREnc_uid133_fpDivTest_q, xout => redist5_excREnc_uid133_fpDivTest_q_6_q, clk => clk, aclr => areset );

    -- expRPostExc_uid141_fpDivTest(MUX,140)@21
    expRPostExc_uid141_fpDivTest_s <= redist5_excREnc_uid133_fpDivTest_q_6_q;
    expRPostExc_uid141_fpDivTest_combproc: PROCESS (expRPostExc_uid141_fpDivTest_s, cstAllZWE_uid20_fpDivTest_q, expRPreExc_uid112_fpDivTest_q, cstAllOWE_uid18_fpDivTest_q)
    BEGIN
        CASE (expRPostExc_uid141_fpDivTest_s) IS
            WHEN "00" => expRPostExc_uid141_fpDivTest_q <= cstAllZWE_uid20_fpDivTest_q;
            WHEN "01" => expRPostExc_uid141_fpDivTest_q <= expRPreExc_uid112_fpDivTest_q;
            WHEN "10" => expRPostExc_uid141_fpDivTest_q <= cstAllOWE_uid18_fpDivTest_q;
            WHEN "11" => expRPostExc_uid141_fpDivTest_q <= cstAllOWE_uid18_fpDivTest_q;
            WHEN OTHERS => expRPostExc_uid141_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid134_fpDivTest(CONSTANT,133)
    oneFracRPostExc2_uid134_fpDivTest_q <= "00000000000000000000001";

    -- fracPostRndFPostUlp_uid106_fpDivTest(BITSELECT,105)@19
    fracPostRndFPostUlp_uid106_fpDivTest_in <= fracRPreExcExt_uid105_fpDivTest_q(22 downto 0);
    fracPostRndFPostUlp_uid106_fpDivTest_b <= fracPostRndFPostUlp_uid106_fpDivTest_in(22 downto 0);

    -- redist7_fracPostRndFPostUlp_uid106_fpDivTest_b_1(DELAY,197)
    redist7_fracPostRndFPostUlp_uid106_fpDivTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracPostRndFPostUlp_uid106_fpDivTest_b, xout => redist7_fracPostRndFPostUlp_uid106_fpDivTest_b_1_q, clk => clk, aclr => areset );

    -- redist9_fracPostRndFT_uid104_fpDivTest_b_2(DELAY,199)
    redist9_fracPostRndFT_uid104_fpDivTest_b_2 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist8_fracPostRndFT_uid104_fpDivTest_b_1_q, xout => redist9_fracPostRndFT_uid104_fpDivTest_b_2_q, clk => clk, aclr => areset );

    -- fracRPreExc_uid107_fpDivTest(MUX,106)@20 + 1
    fracRPreExc_uid107_fpDivTest_s <= redist10_extraUlp_uid103_fpDivTest_q_2_q;
    fracRPreExc_uid107_fpDivTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPreExc_uid107_fpDivTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPreExc_uid107_fpDivTest_s) IS
                WHEN "0" => fracRPreExc_uid107_fpDivTest_q <= redist9_fracPostRndFT_uid104_fpDivTest_b_2_q;
                WHEN "1" => fracRPreExc_uid107_fpDivTest_q <= redist7_fracPostRndFPostUlp_uid106_fpDivTest_b_1_q;
                WHEN OTHERS => fracRPreExc_uid107_fpDivTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- fracRPostExc_uid137_fpDivTest(MUX,136)@21
    fracRPostExc_uid137_fpDivTest_s <= redist5_excREnc_uid133_fpDivTest_q_6_q;
    fracRPostExc_uid137_fpDivTest_combproc: PROCESS (fracRPostExc_uid137_fpDivTest_s, paddingY_uid15_fpDivTest_q, fracRPreExc_uid107_fpDivTest_q, oneFracRPostExc2_uid134_fpDivTest_q)
    BEGIN
        CASE (fracRPostExc_uid137_fpDivTest_s) IS
            WHEN "00" => fracRPostExc_uid137_fpDivTest_q <= paddingY_uid15_fpDivTest_q;
            WHEN "01" => fracRPostExc_uid137_fpDivTest_q <= fracRPreExc_uid107_fpDivTest_q;
            WHEN "10" => fracRPostExc_uid137_fpDivTest_q <= paddingY_uid15_fpDivTest_q;
            WHEN "11" => fracRPostExc_uid137_fpDivTest_q <= oneFracRPostExc2_uid134_fpDivTest_q;
            WHEN OTHERS => fracRPostExc_uid137_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- divR_uid144_fpDivTest(BITJOIN,143)@21
    divR_uid144_fpDivTest_q <= redist4_sRPostExc_uid143_fpDivTest_q_6_q & expRPostExc_uid141_fpDivTest_q & fracRPostExc_uid137_fpDivTest_q;

    -- xOut(GPOUT,4)@21
    q <= divR_uid144_fpDivTest_q;

END normal;
