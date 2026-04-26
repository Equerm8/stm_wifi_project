/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2026 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "tim.h"
#include "usart.h"
#include "gpio.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include <stdbool.h>
#include <stdio.h>
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */
typedef enum {
	DHT_start,
	DHT_wait_for_init,
	DHT_gpio_to_input,
	DHT_wait_for_low_response,
	DHT_wait_for_high_response,
	DHT_wait_for_data,
	DHT_read_bit_start,    // Odpowiednik pierwszego while (czekanie na stan wysoki)
    DHT_read_bit_decision, // Odpowiednik delay(40) i decyzji 0 lub 1
    DHT_read_bit_end,
    DHT_wait_for_next_init,
	DHT_error,



} DHT_Process;

typedef enum {
    DHT_Rh_byte1,
    DHT_Rh_byte2,
    DHT_temp_byte1,
    DHT_temp_byte2,
    DHT_sum
} DHT_parameters_index;
/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
#define UART_TIMEOUT 10
#define DHT_TIMEOUT 10000
#define DHT_LOW_RSP_TIME 40 // us
#define DHT_HIGH_RSP_TIME 80 // us
#define DHT_HIGH_PULSE_DURATION 40 // us
#define DHT_PARAMS_NUM 6

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */

volatile uint32_t led_ticks;
volatile uint32_t dht_ticks;
volatile bool is_usr_btn_pressed;
uint8_t btn_pressed_msg[]="Button pressed!";

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
/* USER CODE BEGIN PFP */
void DHT11_Start (void);
uint8_t DHT11_check_response (void);
uint8_t DHT11_Read (void);
void Set_Pin_Input (GPIO_TypeDef *GPIOx, uint16_t GPIO_Pin);
void Set_Pin_Output (GPIO_TypeDef *GPIOx, uint16_t GPIO_Pin);
void delay (uint16_t time);

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{

  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_USART2_UART_Init();
  MX_TIM6_Init();
  /* USER CODE BEGIN 2 */

  // time-based funcs

  SysTick_Config(SystemCoreClock / 1000);





    DHT_Process DHT_state = DHT_start;
    uint16_t DHT_timestamp = 0;
    int8_t DHT_response = 0;
    uint8_t DHT_read_i = 0, DHT_read_j = 0;
    DHT_parameters_index DHT_param_index = DHT_Rh_byte1;
    uint16_t DHT_parameters[DHT_PARAMS_NUM] = {};
    int i = 0; int j = 0;



  /* USER CODE END 2 */





  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
    while (1)
    {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */

	  // state machine for DHT
        switch (DHT_state)
        {
            case DHT_start:
                Set_Pin_Output (DHT_control_GPIO_Port, DHT_control_Pin);  // set the pin as output
                HAL_GPIO_WritePin (DHT_control_GPIO_Port, DHT_control_Pin, 0);   // pull the pin low
                DHT_timestamp = HAL_GetTick();
                DHT_state = DHT_wait_for_init;
                break;


            case DHT_wait_for_init:
                if (HAL_GetTick() - DHT_timestamp >= 18)
                {
                    DHT_state = DHT_gpio_to_input;
                }
                break;


            case DHT_gpio_to_input:
                Set_Pin_Input(DHT_control_GPIO_Port, DHT_control_Pin);    // set as input
                DHT_state = DHT_wait_for_low_response;
                __HAL_TIM_SET_COUNTER(&htim6, 0);
                __HAL_TIM_ENABLE(&htim6);
                break;

            case DHT_wait_for_low_response:
                if (__HAL_TIM_GET_COUNTER(&htim6) >= DHT_LOW_RSP_TIME)
                {
                    if (!(HAL_GPIO_ReadPin (DHT_control_GPIO_Port, DHT_control_Pin)))
                    {
                        __HAL_TIM_SET_COUNTER(&htim6, 0);
                        DHT_state = DHT_wait_for_high_response;
                    }
                }
                else if(__HAL_TIM_GET_COUNTER(&htim6) >= DHT_TIMEOUT)
                {
                    DHT_response = -1;
                    DHT_state = DHT_error;
                }
                break;


            case DHT_wait_for_high_response:
                if (__HAL_TIM_GET_COUNTER(&htim6) >= DHT_HIGH_RSP_TIME)
                {
                    __HAL_TIM_DISABLE(&htim6);
                    DHT_response = 1;
                    DHT_state = DHT_wait_for_data;

                }
                else if(__HAL_TIM_GET_COUNTER(&htim6) >= DHT_TIMEOUT)
                {
                    DHT_response = -1;
                    DHT_state = DHT_error;
                }
                break;


            case DHT_wait_for_data:
                if (HAL_GPIO_ReadPin (DHT_control_GPIO_Port, DHT_control_Pin) == GPIO_PIN_RESET)
                {
                    __HAL_TIM_DISABLE(&htim6);
                    __HAL_TIM_SET_COUNTER(&htim6, 0);
                    DHT_state = DHT_read_bit_start;
                }
                break;

            case DHT_read_bit_start:
                if (HAL_GPIO_ReadPin(DHT_control_GPIO_Port, DHT_control_Pin) == GPIO_PIN_SET)
                {
                    __HAL_TIM_SET_COUNTER(&htim6, 0);
                    __HAL_TIM_ENABLE(&htim6);
                    DHT_state = DHT_read_bit_decision;
                }
                break;
                // timeout

            case DHT_read_bit_decision:
                if (__HAL_TIM_GET_COUNTER(&htim6) >= DHT_HIGH_PULSE_DURATION)
                {
                    if (!(HAL_GPIO_ReadPin(DHT_control_GPIO_Port, DHT_control_Pin)))
                    {
                        i &= ~(1 << (7-j));
                    }
                    else
                    {
                        i |= (1 << (7-j));
                    }
                    DHT_state = DHT_read_bit_end;
                }
                break;


            case DHT_read_bit_end:
                if (!(HAL_GPIO_ReadPin(DHT_control_GPIO_Port, DHT_control_Pin)))
                {
                    j++;
                    if (j < 8)
                    {
                        __HAL_TIM_SET_COUNTER(&htim6, 0);
                        DHT_state = DHT_read_bit_start;
                    }
                    else
                    {
                        j = 0;
                        DHT_parameters[DHT_param_index] = i;
                        i = 0;
                        DHT_param_index++;
                        if (DHT_param_index >= DHT_PARAMS_NUM-1)
                        {
                            DHT_state = DHT_wait_for_next_init;
                            DHT_param_index = 0;
                            DHT_timestamp = HAL_GetTick();
                        }
                        else
                        {
                            DHT_state = DHT_read_bit_start;
                        }

                    }
                }
                break;


            case DHT_wait_for_next_init:
                if (HAL_GetTick() - DHT_timestamp >= 5000)
                {
                    uint16_t TEMP = DHT_parameters[DHT_temp_byte1];
                    uint16_t RH = DHT_parameters[DHT_Rh_byte1];

                    uint16_t temperature = (float) TEMP;
                    uint16_t humidity = (float) RH;

                    char msg[32];
                    int len = sprintf(msg, "Temp: %d C, Hum: %d %%\r\n", temperature, humidity);
                    HAL_UART_Transmit(&huart2, (uint8_t*)msg, len, 100);
                    DHT_state = DHT_start;
                }
                break;
        }



	  if (led_ticks >= 500)
	  {
		  HAL_GPIO_TogglePin(LED_GREEN_GPIO_Port, LED_GREEN_Pin);
		  led_ticks=0;
	  }

	  if (is_usr_btn_pressed)
	  {
		  HAL_GPIO_TogglePin(LED_GREEN_GPIO_Port, LED_GREEN_Pin);
		  is_usr_btn_pressed = false;

	  }
  }
  /* USER CODE END 3 */
}







/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  HAL_PWREx_ControlVoltageScaling(PWR_REGULATOR_VOLTAGE_SCALE1);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSIDiv = RCC_HSI_DIV1;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_HSI;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_0) != HAL_OK)
  {
    Error_Handler();
  }
}

/* USER CODE BEGIN 4 */
void HAL_GPIO_EXTI_Falling_Callback(uint16_t GPIO_Pin)
{
	if (GPIO_Pin == USR_BTN_Pin)
	{
		is_usr_btn_pressed = true;
	}
}
void delay (uint16_t time)
{
	/* change your code here for the delay in microseconds */
	__HAL_TIM_ENABLE(&htim6);
	__HAL_TIM_SET_COUNTER(&htim6, 0);
	while ((__HAL_TIM_GET_COUNTER(&htim6))<time);
	__HAL_TIM_DISABLE(&htim6);
}
void Set_Pin_Output (GPIO_TypeDef *GPIOx, uint16_t GPIO_Pin)
{
	GPIO_InitTypeDef GPIO_InitStruct = {0};
	GPIO_InitStruct.Pin = GPIO_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(GPIOx, &GPIO_InitStruct);
}
void Set_Pin_Input (GPIO_TypeDef *GPIOx, uint16_t GPIO_Pin)
{
	GPIO_InitTypeDef GPIO_InitStruct = {0};
	GPIO_InitStruct.Pin = GPIO_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
	GPIO_InitStruct.Pull = GPIO_PULLUP;
	HAL_GPIO_Init(GPIOx, &GPIO_InitStruct);
}


/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}
#ifdef USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
