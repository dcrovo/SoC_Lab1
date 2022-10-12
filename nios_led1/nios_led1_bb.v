
module nios_led1 (
	clk_clk,
	led_export,
	reset_reset_n,
	switch_export);	

	input		clk_clk;
	output	[1:0]	led_export;
	input		reset_reset_n;
	input	[9:0]	switch_export;
endmodule
