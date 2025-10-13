/*
 * Copyright:
 * ----------------------------------------------------------------
 * This confidential and proprietary software may be used only as
 * authorised by a licensing agreement from ARM Limited
 *   (C) COPYRIGHT 2014, 2016 ARM Limited
 *       ALL RIGHTS RESERVED
 * The entire notice above must be reproduced on all authorised
 * copies and copies may only be made to the extent permitted
 * by a licensing agreement from ARM Limited.
 * ----------------------------------------------------------------
 * File:     main.c
 * Release Information : Cortex-M3 DesignStart-r0p1-00rel0
 * ----------------------------------------------------------------
 *
 */

/*
 * --------Included Headers--------
 */
#if defined(__CC_ARM) || defined(__ARMCC_VERSION)
  #ifndef inline
    #define inline __inline
  #endif
#endif
/*
 * Full integrated main.c example for ARM Cortex M3 + Xilinx GPIO + UART
 */

#include <stdio.h>
#include <string.h>
#include "xparameters.h"
#include "xgpio.h"
#include "m3_for_arty.h"    // Your platform-specific stuff (e.g. NVIC functions)
#include "uart.h"           // UART init and print functions

// Device defines (adjust to your hardware setup)
#define GPIO_LEDS_DEVICE_ID      XPAR_AXI_GPIO_1_DEVICE_ID      // LEDs & Switches
#define GPIO_RGB_DEVICE_ID       XPAR_AXI_GPIO_0_DEVICE_ID      // Push Buttons & RGB LEDs
#define LED_CHANNEL              2   // LED output channel
#define SWITCH_CHANNEL           1   // Switch input channel
#define LED_MASK                 0x0F
#define SWITCH_MASK              0x0F
#define RGB_CHANNEL              2
#define BUTTON_CHANNEL           1
#define BUTTON_MASK              0x0F
#define RGB_LED_MASK(i)          (0x07 << (i*3))   // 3 bits per RGB LED

typedef enum {
    RGB_OFF = 0x0,
    RGB_BLUE = 0x1,
    RGB_GREEN = 0x2,
    RGB_RED = 0x4,
    RGB_CYAN = 0x3,      // blue + green
    RGB_MAGENTA = 0x5,   // blue + red
    RGB_YELLOW = 0x6,    // green + red
    RGB_WHITE = 0x7      // red + green + blue
} rgb_color_t;

// GPIO instances
XGpio gpio_leds, gpio_rgb;

// State tracking
static rgb_color_t current_rgb_color[4] = {RGB_OFF, RGB_OFF, RGB_OFF, RGB_OFF};
static u32 last_switch_state = 0;
static u32 last_button_state = 0;

// Forward declarations
int InitialiseUART(void);
void print(const char *str);

void init_platform(void);
void cleanup_platform(void);

void print_boot_messages(void) {
    print("\r\nWelcome to ARM Cortex M3\r\n");
    print("BOOTING FROM ITCM\r\n");
    print("TRAIL VERSION 1.0\r\n");
}

void gpio_init(void) {
    XGpio_Initialize(&gpio_leds, GPIO_LEDS_DEVICE_ID);
    XGpio_SetDataDirection(&gpio_leds, SWITCH_CHANNEL, SWITCH_MASK);
    XGpio_SetDataDirection(&gpio_leds, LED_CHANNEL, 0x00);

    XGpio_Initialize(&gpio_rgb, GPIO_RGB_DEVICE_ID);
    XGpio_SetDataDirection(&gpio_rgb, BUTTON_CHANNEL, BUTTON_MASK);
    XGpio_SetDataDirection(&gpio_rgb, RGB_CHANNEL, 0x00);

    XGpio_DiscreteWrite(&gpio_leds, LED_CHANNEL, 0x00);
    XGpio_DiscreteWrite(&gpio_rgb, RGB_CHANNEL, 0x00);
}

void handle_switch_leds(void) {
    u32 switches = XGpio_DiscreteRead(&gpio_leds, SWITCH_CHANNEL) & SWITCH_MASK;
    XGpio_DiscreteWrite(&gpio_leds, LED_CHANNEL, switches);

    int i;
    for (i = 0; i < 4; i++) {
        u32 mask = 1 << i;
        if ((switches & mask) != (last_switch_state & mask)) {
            char msg1[64];
            sprintf(msg1,"Switch %d %s: LED %d %s\r\n", 
                i, (switches & mask) ? "ON" : "OFF", i, (switches & mask) ? "ON" : "OFF");
            print(msg1);
        }
    }
    last_switch_state = switches;
}

void set_rgb_led(int index, rgb_color_t color) {
    u32 reg = XGpio_DiscreteRead(&gpio_rgb, RGB_CHANNEL);
    u32 mask = RGB_LED_MASK(index);
    reg = (reg & ~mask) | (((u32)color << (index * 3)) & mask);
    XGpio_DiscreteWrite(&gpio_rgb, RGB_CHANNEL, reg);
}

void cycle_rgb_color(int index) {
    switch (current_rgb_color[index]) {
        case RGB_OFF:     current_rgb_color[index] = RGB_RED;     break;
        case RGB_RED:     current_rgb_color[index] = RGB_GREEN;   break;
        case RGB_GREEN:   current_rgb_color[index] = RGB_BLUE;    break;
        case RGB_BLUE:    current_rgb_color[index] = RGB_CYAN;    break;
        case RGB_CYAN:    current_rgb_color[index] = RGB_MAGENTA; break;
        case RGB_MAGENTA: current_rgb_color[index] = RGB_YELLOW;  break;
        case RGB_YELLOW:  current_rgb_color[index] = RGB_WHITE;   break;
        case RGB_WHITE:   current_rgb_color[index] = RGB_OFF;     break;
        default:          current_rgb_color[index] = RGB_OFF;     break;
    }
    set_rgb_led(index, current_rgb_color[index]);
}

void handle_buttons_rgb(void) {
    u32 buttons = XGpio_DiscreteRead(&gpio_rgb, BUTTON_CHANNEL) & BUTTON_MASK;

    int i;
    for (i = 0; i < 4; i++) {
        u32 mask = 1 << i;
        if ((buttons & mask) && !(last_button_state & mask)) {  // Edge detection
            cycle_rgb_color(i);
            char msg[64];
            sprintf(msg, "Button %d pressed, RGB LED %d -> color %d\r\n", i, i, current_rgb_color[i]);
            print(msg);
        }
    }
    last_button_state = buttons;
}

void delay_us(unsigned int us) {
    // Rough delay loop for 50 MHz system (adjust based on your clock)
    volatile unsigned int count;
    while (us--) {
        count = 10; // adjust this for your CPU speed (e.g. 10 for 50MHz)
        while (count--) {
            __asm("nop");
        }
    }
}

// ------------------------
// UART and platform init
// ------------------------

/*
 * Definitions of InitialiseUART and print are removed from here
 * because they are implemented in uart.c/print.c already.
 * Just keep the declarations here.
 */

void init_platform(void) {
    InitialiseUART();           // Initialize UART for print output
    
    // Clear interrupts if you want
    NVIC_ClearAllPendingIRQ();
    
    // Additional peripheral init can be done here (SPI, GPIO interrupts etc.)
}

void cleanup_platform(void) {
    // If you want to disable interrupts or power down peripherals, do it here
    // Otherwise, empty
}

// ------------------------
// Main
// ------------------------

int main() {
    init_platform();        // UART and basic platform init

    print_boot_messages();  // Print welcome messages
    gpio_init();            // Setup GPIOs

    print("System Ready.\r\n");

    while(1) {
        handle_switch_leds();
        handle_buttons_rgb();
        delay_us(50000);
    }

    cleanup_platform();     // Cleanup if needed (usually never reached)
    return 0;
}
