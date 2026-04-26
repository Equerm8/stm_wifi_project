#ifndef __DHT11_H
#define __DHT11_H


#include <stdint.h>
#include <stdio.h>
#include "stm32g0xx_hal.h"

#define UART_TIMEOUT 10
#define DHT_TIMEOUT 10000
#define DHT_LOW_RSP_TIME 40 // us
#define DHT_HIGH_RSP_TIME 80 // us
#define DHT_HIGH_PULSE_DURATION 40 // us
#define DHT_PARAMS_NUM 6

typedef struct {
    GPIO_TypeDef* GPIOx;
    uint16_t GPIO_Pin;
    TIM_HandleTypeDef* htim;
    
    uint8_t temperature;
    uint8_t humidity;
    
    uint8_t state;
    uint32_t timestamp;
    uint8_t data[5];
    uint8_t bit_index;
    uint8_t byte_index;
} DHT11_t;

typedef enum {
    DHT_STATE_START,
        DHT_STATE_WAIT_FOR_INIT,
        DHT_STATE_GPIO_TO_INPUT,
        DHT_STATE_WAIT_FOR_LOW_RESPONSE,
        DHT_STATE_WAIT_FOR_HIGH_RESPONSE,
        DHT_STATE_WAIT_FOR_DATA,
        DHT_STATE_READ_BIT_START,
        DHT_STATE_READ_BIT_DECISION,
        DHT_STATE_READ_BIT_END,
        DHT_STATE_WAIT_FOR_NEXT_INIT,
        DHT_STATE_ERROR
} DHT_State_t;

void DHT11_Process(DHT11_t* dht);

#endif
