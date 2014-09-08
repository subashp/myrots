/*
*
* Copyright (C) Patryk Jaworski <regalis@regalis.com.pl>
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program. If not, see <http://www.gnu.org/licenses/>.
*
*/
#include <stm32f4xx.h>
#include <stm32f4xx_hal.h>
#include <stm324x9i_eval.h>

#include "system.h"
 
/* Helpers for SystemInitError() */
#define SYSTEM_INIT_ERROR_FLASH 0x01
#define SYSTEM_INIT_ERROR_PLL 0x02
#define SYSTEM_INIT_ERROR_CLKSRC 0x04
#define SYSTEM_INIT_ERROR_HSI 0x08
 
void SystemInit() {
  /* Enable Power Control clock */
  RCC->APB1ENR |= RCC_APB1LPENR_PWRLPEN;
  /* Regulator voltage scaling output selection: Scale 2 */
  PWR->CR |= PWR_CR_VOS_1;
 
  /* Wait until HSI ready */
  while ((RCC->CR & RCC_CR_HSIRDY) == 0);
 
  /* Store calibration value */
  PWR->CR |= (uint32_t)(16 << 3);
 
  /* Disable main PLL */
  RCC->CR &= ~(RCC_CR_PLLON);
  /* Wait until PLL ready (disabled) */
  while ((RCC->CR & RCC_CR_PLLRDY) != 0);
 
  /*
   * Configure Main PLL
   * HSI as clock input
   * fvco = 336MHz
   * fpllout = 84MHz
   * fusb = 48MHz
   * PLLM = 16
   * PLLN = 336
   * PLLP = 4
   * PLLQ = 7
   */
  RCC->PLLCFGR = (uint32_t)((uint32_t)0x20000000 | (uint32_t)(16 << 0) | (uint32_t)(336 << 6) | 
          RCC_PLLCFGR_PLLP_0 | (uint32_t)(7 << 24));
 
  /* PLL On */
  RCC->CR |= RCC_CR_PLLON;
  /* Wait until PLL is locked */
  while ((RCC->CR & RCC_CR_PLLRDY) == 0);
 
  /* 
   * FLASH configuration block
   * enable instruction cache
   * enable prefetch
   * set latency to 2WS (3 CPU cycles)
   */
  FLASH->ACR |= FLASH_ACR_ICEN | FLASH_ACR_PRFTEN | FLASH_ACR_LATENCY_2WS;
 
  /* Check flash latency */
  if ((FLASH->ACR & FLASH_ACR_LATENCY) != FLASH_ACR_LATENCY_2WS) {
    SystemInitError(SYSTEM_INIT_ERROR_FLASH);
  }
 
  /* Set clock source to PLL */
  RCC->CFGR |= RCC_CFGR_SW_PLL;
  /* Check clock source */
  while ((RCC->CFGR & RCC_CFGR_SWS_PLL) != RCC_CFGR_SWS_PLL);
 
  /* Set HCLK (AHB1) prescaler (DIV1) */
  RCC->CFGR &= ~(RCC_CFGR_HPRE);
 
  /* Set APB1 Low speed prescaler (APB1) DIV2 */
  RCC->CFGR |= RCC_CFGR_PPRE1_DIV2;
 
  /* SET APB2 High speed srescaler (APB2) DIV1 */
  RCC->CFGR &= ~(RCC_CFGR_PPRE2);
}

void SystemInitError(uint8_t error_source) {
  while(1);
}

#if 0
static void Error_Handler(void)
{
  /* Turn LED2 on */
  BSP_LED_On(LED2);
  while(1)
  {
  }
}
/**
  * @brief  System Clock Configuration
  *         The system Clock is configured as follow : 
  *            System Clock source            = PLL (HSI)
  *            SYSCLK(Hz)                     = 84000000
  *            HCLK(Hz)                       = 84000000
  *            AHB Prescaler                  = 1
  *            APB1 Prescaler                 = 2
  *            APB2 Prescaler                 = 1
  *            HSI Frequency(Hz)              = 16000000
  *            PLL_M                          = 16
  *            PLL_N                          = 336
  *            PLL_P                          = 4
  *            PLL_Q                          = 7
  *            VDD(V)                         = 3.3
  *            Main regulator output voltage  = Scale2 mode
  *            Flash Latency(WS)              = 2
  * @param  None
  * @retval None
  */

void SystemClock_Config(void)
{
  RCC_ClkInitTypeDef RCC_ClkInitStruct;
  RCC_OscInitTypeDef RCC_OscInitStruct;

  /* Enable Power Control clock */
  __PWR_CLK_ENABLE();

  /* The voltage scaling allows optimizing the power consumption when the device is 
     clocked below the maximum system frequency, to update the voltage scaling value 
     regarding system frequency refer to product datasheet.  */
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE2);

  /* Enable HSI Oscillator and activate PLL with HSI as source */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = 0x10;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLM = 16;
  RCC_OscInitStruct.PLL.PLLN = 336;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV4;
  RCC_OscInitStruct.PLL.PLLQ = 7;
  if(HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /* Select PLL as system clock source and configure the HCLK, PCLK1 and PCLK2 
     clocks dividers */
  RCC_ClkInitStruct.ClockType = (RCC_CLOCKTYPE_SYSCLK | RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2);
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;
  if(HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }
}
#endif
