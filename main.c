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

#include "stm32f4xx_nucleo.h"
#include "stm32f4xx_it.h"
#include "main.h"
 
void delay()
{
  volatile unsigned int i;
  for (i = 0xFFFFF; i > 0; i--)
      ;
}
 
int main() {
  int i = 100;

  BSP_LED_Init(0);

  while (i--) {
    BSP_LED_On(0);
    delay();
    BSP_LED_Off(0);
    delay();
  }

  return 0; 
}
