----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:41:23 07/18/2022 
-- Design Name: 
-- Module Name:    main - Behavioral 
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


entity main is
	port(
		CLK : in std_logic
	);
end main;


architecture Behavioral of main is

	component ula32b is 
		port(
			A,B : in std_logic_vector(31 downto 0);
			OP : in std_logic_vector(3 downto 0);
			RESULT : out std_logic_vector(31 downto 0);
			ZERO : out std_logic);
		end component;


	component memDados is 
		port (
			DadoLido : out std_logic_vector (31 downto 0);
			DadoEscrita : in std_logic_vector (31 downto 0);
			Endereco : in std_logic_vector (31 downto 0);
			EscreverMem : in std_logic;
			Clock : in std_logic;
			LerMem : in std_logic;
			DebugEndereco : in std_logic_vector(7 downto 0);
			DebugPalavra : out std_logic_vector(15 downto 0));
		end component;
		
	component memInstrucoes is
		port (
			Endereco : in std_logic_vector(31 downto 0);
			Palavra : out std_logic_vector(31 downto 0)
		);
	end component;
	
	component somador32b is
		port( A, B : in std_logic_vector(31 downto 0);
				SOMA : out std_logic_vector(31 downto 0);
				COUT : out std_logic);
		end component;
	
	
	component control is
		port (
			opcode: in std_logic_vector(5 downto 0);
			reg_dest,jump, branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write: out std_logic;
			alu_op: out std_logic_vector(1 downto 0));
	end component;
	
	component alu_control is
		port (
			funct: in std_logic_vector(5 downto 0);
			alu_op: in std_logic_vector(1 downto 0);
			alu_control_fuct: out std_logic_vector(3 downto 0)
		);
	end component;
	
	component pc is
		port(
			CLK: in std_logic;
			address_to_load: in std_logic_vector(31 downto 0);
			current_address: out std_logic_vector(31 downto 0));
		end component;
	
	component sign_extend is
		port (
			X: in std_logic_vector(15 downto 0);
			Y: out std_logic_vector(31 downto 0)
		);
	end component;
	
	component shifter is
		port (
			x: in std_logic_vector(31 downto 0);
			y: out std_logic_vector(31 downto 0)
		);
	end component;
	
	
begin


end Behavioral;

