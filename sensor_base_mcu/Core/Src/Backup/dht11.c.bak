#include "dht11.h"
#include "main.h"
#include <stdio.h>

static void Set_Pin_Output (GPIO_TypeDef *GPIOx, uint16_t GPIO_Pin);
static void Set_Pin_Input (GPIO_TypeDef *GPIOx, uint16_t GPIO_Pin);

void DHT11_Process(DHT11_t* dht)
{
  switch (dht->state)
  {
      case DHT_STATE_START:
          Set_Pin_Output (dht->GPIOx, dht->GPIO_Pin);  // set the pin as output
          HAL_GPIO_WritePin (dht->GPIOx, dht->GPIO_Pin, 0);   // pull the pin low
          dht->timestamp = HAL_GetTick();
          dht->state = DHT_STATE_WAIT_FOR_INIT;
          break;


      case DHT_STATE_WAIT_FOR_INIT:
          if (HAL_GetTick() - dht->timestamp >= 18)
          {
              dht->state = DHT_STATE_GPIO_TO_INPUT;
          }
          break;


      case DHT_STATE_GPIO_TO_INPUT:
          Set_Pin_Input(dht->GPIOx, dht->GPIO_Pin);    // set as input
          dht->state = DHT_STATE_WAIT_FOR_LOW_RESPONSE;
          __HAL_TIM_SET_COUNTER(dht->htim, 0);
          __HAL_TIM_ENABLE(dht->htim);
          break;

      case DHT_STATE_WAIT_FOR_LOW_RESPONSE:
          if (__HAL_TIM_GET_COUNTER(dht->htim) >= DHT_LOW_RSP_TIME)
          {
              if (!(HAL_GPIO_ReadPin (dht->GPIOx, dht->GPIO_Pin)))
              {
                  __HAL_TIM_SET_COUNTER(dht->htim, 0);
                  dht->state = DHT_STATE_WAIT_FOR_HIGH_RESPONSE;
              }
          }
          else if(__HAL_TIM_GET_COUNTER(dht->htim) >= DHT_TIMEOUT)
          {
              //DHT_response = -1;
              dht->state = DHT_STATE_ERROR;
          }
          break;


      case DHT_STATE_WAIT_FOR_HIGH_RESPONSE:
          if (__HAL_TIM_GET_COUNTER(dht->htim) >= DHT_HIGH_RSP_TIME)
          {
              __HAL_TIM_DISABLE(dht->htim);
              //DHT_response = 1;
              dht->state = DHT_STATE_WAIT_FOR_DATA;

          }
          else if(__HAL_TIM_GET_COUNTER(dht->htim) >= DHT_TIMEOUT)
          {
              //DHT_response = -1;
              dht->state = DHT_STATE_ERROR;
          }
          break;


      case DHT_STATE_WAIT_FOR_DATA:
          if (HAL_GPIO_ReadPin (dht->GPIOx, dht->GPIO_Pin) == GPIO_PIN_RESET)
          {
              __HAL_TIM_DISABLE(dht->htim);
              __HAL_TIM_SET_COUNTER(dht->htim, 0);
              dht->state = DHT_STATE_READ_BIT_START;
          }
          break;

      case DHT_STATE_READ_BIT_START:
          if (HAL_GPIO_ReadPin(dht->GPIOx, dht->GPIO_Pin) == GPIO_PIN_SET)
          {
              __HAL_TIM_SET_COUNTER(dht->htim, 0);
              __HAL_TIM_ENABLE(dht->htim);
              dht->state = DHT_STATE_READ_BIT_DECISION;
          }
          break;
          // timeout

      case DHT_STATE_READ_BIT_DECISION:
          if (__HAL_TIM_GET_COUNTER(dht->htim) >= DHT_HIGH_PULSE_DURATION)
          {
              if (!(HAL_GPIO_ReadPin(dht->GPIOx, dht->GPIO_Pin)))
              {
                  dht->data[dht->byte_index] &= ~(1 << (7-dht->bit_index));
              }
              else
              {
                  dht->data[dht->byte_index] |= (1 << (7-dht->bit_index));
              }
              dht->state = DHT_STATE_READ_BIT_END;
          }
          break;


      case DHT_STATE_READ_BIT_END:
          if (!(HAL_GPIO_ReadPin(dht->GPIOx, dht->GPIO_Pin)))
          {
              dht->bit_index++;
              if (dht->bit_index < 8)
              {
                  __HAL_TIM_SET_COUNTER(dht->htim, 0);
                  dht->state = DHT_STATE_READ_BIT_START;
              }
              else
              {
                  dht->bit_index = 0;
                  dht->byte_index++;

                  if (dht->byte_index >= DHT_PARAMS_NUM-1)
                  {
                      dht->humidity = dht->data[0];
                      dht->temperature = dht->data[2];

                      dht->byte_index = 0;
                      dht->bit_index = 0;

                      dht->state = DHT_STATE_WAIT_FOR_NEXT_INIT;
                      dht->timestamp = HAL_GetTick();
                  }
                  else
                  {
                      dht->state = DHT_STATE_READ_BIT_START;
                  }

              }
          }
          break;


      case DHT_STATE_WAIT_FOR_NEXT_INIT:
          if (HAL_GetTick() - dht->timestamp >= 2000)
          {
              for(int n = 0; n < 5; n++) dht->data[n] = 0;
              dht->state = DHT_STATE_START;
          }
          break;
  }
}



















static void Set_Pin_Output (GPIO_TypeDef *GPIOx, uint16_t GPIO_Pin)
{
    GPIO_InitTypeDef GPIO_InitStruct = {0};
    GPIO_InitStruct.Pin = GPIO_Pin;
    GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
    HAL_GPIO_Init(GPIOx, &GPIO_InitStruct);
}
static void Set_Pin_Input (GPIO_TypeDef *GPIOx, uint16_t GPIO_Pin)
{
    GPIO_InitTypeDef GPIO_InitStruct = {0};
    GPIO_InitStruct.Pin = GPIO_Pin;
    GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
    GPIO_InitStruct.Pull = GPIO_PULLUP;
    HAL_GPIO_Init(GPIOx, &GPIO_InitStruct);
}
