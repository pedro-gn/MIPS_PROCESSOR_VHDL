----------------------------------------------------------------------------------
-- Company: UFSJ
-- Engineer: Milene
-- 
-- Create Date:    13:50:52 07/01/2022 
-- Module Name:    memDados - Behavioral 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity memDados is
	port (
		DadoLido : out std_logic_vector (31 downto 0);
		DadoEscrita : in std_logic_vector (31 downto 0);
		Endereco : in std_logic_vector (31 downto 0);
		EscreverMem : in std_logic;
		Clock : in std_logic;
		LerMem : in std_logic;
		DebugEndereco : in std_logic_vector(7 downto 0);
		DebugPalavra : out std_logic_vector(15 downto 0));
end memDados;

architecture Behavioral of memDados is
    type tipoMemoria is array(0 to 255) of std_logic_vector(31 downto 0);
    signal memoria : tipoMemoria;
begin
	process(Clock)
	begin
		if rising_edge(Clock) AND (EscreverMem='1') then
			-- converter de bytes para palavras e limitar para somente 256 palavras
			memoria(to_integer(unsigned(Endereco(9 downto 2)))) <= DadoEscrita;
		end if;
	end process;
	
	DadoLido <= memoria(to_integer(unsigned(Endereco(9 downto 2)))) when LerMem = '1'; -- converter de bytes para palavras
	DebugPalavra <= memoria(to_integer(unsigned(DebugEndereco)));
end Behavioral;