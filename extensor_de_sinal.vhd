----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:48:49 07/18/2022 
-- Design Name: 
-- Module Name:    extensor_de_sinal - Behavioral 
-- Project Name: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sign_extend is
	port (
		X: in std_logic_vector(15 downto 0);
		Y: out std_logic_vector(31 downto 0)
	);
end sign_extend;

architecture beh of sign_extend is
	begin
	Y <= std_logic_vector(resize(signed(X), Y'length));
end beh;

