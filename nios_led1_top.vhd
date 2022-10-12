------------------------------------------------------
LIBRARY IEEE;
USE ieee.std_logic_1164.all;
------------------------------------------------------
ENTITY nios_led1_top IS
PORT (	clk	:	IN STD_LOGIC;
			sw		:	IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			ledg	:	OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
END ENTITY nios_led1_top;
------------------------------------------------------
ARCHITECTURE arch OF nios_led1_top IS

	COMPONENT nios_led1 IS
	PORT	(clk_clk			: IN STD_LOGIC;
			led_export		: OUT STD_LOGIC_VECTOR(1 downto 0);
			reset_reset_n	: IN STD_LOGIC;
			switch_export	: IN STD_LOGIC_VECTOR(9 downto 0));
	END COMPONENT nios_led1;

BEGIN
	nios_unit:	COMPONENT nios_led1
					PORT MAP	(clk_clk			=> clk,
								 reset_reset_n => '1',
								 led_export		=> ledg,
								 switch_export => sw);
END ARCHITECTURE;