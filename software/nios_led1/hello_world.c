

#include <stdio.h>
#include "io.h"
#include "alt_types.h"
#include "system.h"


void sw_get_command(alt_u32 sw_base, int *prd){
	*prd = IORD(sw_base, 0) & 0x000003ff; // read flashing period
}

void led_flash(alt_u32 led_base, int prd){
	static alt_u8 led_pattern = 0x01; //initial pattern
	unsigned long i, itr;
	led_pattern ^= 0x03; //toggle 2 LEDs (2LSBs);
	IOWR(led_base, 0, led_pattern);
	itr = prd *2500;
	for(i=0; i<itr; i++){} // dummy loop for delay
}

int main()
{
	int prd;
	while(1){
		sw_get_command(SWITCH_BASE, &prd);
		led_flash(LED_BASE, prd);
	}
  return 0;
}
