----------------------------------------------------------------------------------
-- Company: UFSJ
-- Engineer: Milene
-- 
-- Create Date:    16:22:46 07/05/2022 
-- Design Name: 
-- Module Name:    processadorComInterface - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity processadorComInterface is
	port(
		Clock: in std_logic;
		Inicializar: in std_logic;	
		CA : out  STD_LOGIC;
		CB : out  STD_LOGIC;
		CC : out  STD_LOGIC;
		CD : out  STD_LOGIC;
		CE : out  STD_LOGIC;
		CF : out  STD_LOGIC;
		CG : out  STD_LOGIC;
		DP : out  STD_LOGIC;
		AN : out  std_logic_vector(3 downto 0);
		endereco : in std_logic_vector(7 downto 0)
	);
end processadorComInterface;

architecture Behavioral of processadorComInterface is
	component decod7seg_4dig is
		 port ( N0 : in  std_logic_vector(3 downto 0);
				  N1 : in  std_logic_vector(3 downto 0);
				  N2 : in  std_logic_vector(3 downto 0);
				  N3 : in  std_logic_vector(3 downto 0);
				  CLK_50MHz : in std_logic;
				  CA : out  STD_LOGIC;
				  CB : out  STD_LOGIC;
				  CC : out  STD_LOGIC;
				  CD : out  STD_LOGIC;
				  CE : out  STD_LOGIC;
				  CF : out  STD_LOGIC;
				  CG : out  STD_LOGIC;
				  DP : out  STD_LOGIC;
				  AN : out  std_logic_vector(3 downto 0)
				);

	end component;

	component main is
	  port (
		 Clock: in std_logic;
		 Inicializar: in std_logic;
		 DebugEndereco : in std_logic_vector(7 downto 0);
		 DebugPalavra : out std_logic_vector(31 downto 0)
		 );
	end component;

	signal palavra : std_logic_vector(31 downto 0);
	signal nInicializar : std_logic;
begin
	nInicializar <= not Inicializar;
	
	proc : main port map (
		Inicializar => nInicializar,
		Clock => Clock,
		DebugEndereco => endereco,
		DebugPalavra => palavra
	);
	
	display : decod7seg_4dig port map (
		N0 => palavra(3 downto 0),
		N1 => palavra(7 downto 4),
		N2 => palavra(11 downto 8),
		N3	=> palavra(15 downto 12),
		CLK_50MHz => Clock,
		CA => CA,
		CB => CB,
		CC => CC,
		CD => CD,
		CE => CE,
		CF => CF,
		CG => CG,
		DP => DP,
		AN => AN
	);

end Behavioral;

