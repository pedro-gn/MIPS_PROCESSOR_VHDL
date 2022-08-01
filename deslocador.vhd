----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:45:53 07/18/2022 
-- Design Name: 
-- Module Name:    deslocador - Behavioral 
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
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity shifter is
	port (
		x: in std_logic_vector(31 downto 0);
		y: out std_logic_vector(31 downto 0)
	);
end entity;

architecture beh of shifter is
	signal temp: std_logic_vector(n2-1 downto 0);

	begin
	temp <= std_logic_vector(resize(unsigned(x), n2));
	y <= std_logic_vector(shift_left(signed(temp), 2));
end beh;

