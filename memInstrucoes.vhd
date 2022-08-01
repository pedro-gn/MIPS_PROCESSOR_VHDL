----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:00:55 07/01/2022 
-- Design Name: 
-- Module Name:    memInstrucoes - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity memInstrucoes is
	port (
		Endereco : in std_logic_vector(31 downto 0);
		Palavra : out std_logic_vector(31 downto 0)
	);
end memInstrucoes;

architecture Behavioral of memInstrucoes is
	type tipoMemoria is array(0 to 255) of std_logic_vector(31 downto 0);
	signal memoria : tipoMemoria;    
	 
begin
	memoria(0 to 11) <=
	 ("00100000000010000000000000000001", "00100000000010010000000000101000", 
    "10101100000010000000000000000000", "10101100000010000000000000000100", 
    "00100000000010100000000000001000", "00010001010010010000000000000110", 
    "10001101010010111111111111111100", "10001101010011001111111111111000", 
    "00000001011011000110100000100000", "10101101010011010000000000000000", 
    "00100001010010100000000000000100", "00001000000100000000000000000101");
	 
	Palavra <= memoria(to_integer(unsigned(Endereco(9 downto 2))));
end Behavioral;