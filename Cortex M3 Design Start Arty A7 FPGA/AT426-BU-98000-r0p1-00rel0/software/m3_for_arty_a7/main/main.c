/*
 * Simple Cortex-M3 Bootloader (for ITCM/XPM setup)
 * Arjun Raj — FPGA DesignStart Edition
 */

#include <stdint.h>
#include "core_cm3.h"     // CMSIS (for SCB->VTOR, __set_MSP, etc.)
#include "uart.h"         // your UART print routines from existing code
#include "gpio.h"

#define ITCM_BASE       0x00000000UL
#define XPM_BASE        0x00100000UL
#define XPM_SIZE        (32 * 1024U)  // 32 KB
#define WORDS_XPM       (XPM_SIZE / 4U)
#define MAGIC_ADDR      (XPM_BASE + 4U)

/* Simple UART print wrapper (assumes InitialiseUART() and print() exist) */
static inline void print_msg(const char *msg) {
    print(msg);
}

/* Function pointer type for user app */
typedef void (*app_entry_t)(void);

int main(void)
{
    uint32_t *xpm_ptr = (uint32_t *)XPM_BASE;
    uint32_t nonzero_count = 0;

    InitialiseUART();
    print_msg("\r\n==============================\r\n");
    print_msg("Welcome to ITCM Bootloader\r\n");
    print_msg("==============================\r\n");

    // 1??  Scan XPM to check if it’s empty
    for (uint32_t i = 0; i < WORDS_XPM; i++) {
        if (xpm_ptr[i] != 0x00000000) {
            nonzero_count++;
            break;
        }
    }

    if (nonzero_count == 0) {
        print_msg("XPM empty – no program to execute\r\n");
        while (1);   // stay here
    }

    print_msg("Program detected in XPM\r\n");

    // 2??  Read initial MSP and Reset vector from XPM vector table
    uint32_t new_msp   = *((uint32_t *)(XPM_BASE + 0x00));
    uint32_t reset_vec = *((uint32_t *)(XPM_BASE + 0x04));

    // 3??  Sanity check: vector address should be within XPM range
    if (reset_vec < XPM_BASE || reset_vec > (XPM_BASE + XPM_SIZE)) {
        print_msg("Invalid reset vector in XPM – aborting\r\n");
        while (1);
    }

    print_msg("Jumping to application in XPM...\r\n");

    // 4??  Relocate vector table to XPM
    SCB->VTOR = XPM_BASE;

    // 5??  Update MSP and branch to Reset_Handler of app
    __set_MSP(new_msp);

    app_entry_t app_entry = (app_entry_t)reset_vec;
    app_entry();

    // Should never return
    while (1);
}