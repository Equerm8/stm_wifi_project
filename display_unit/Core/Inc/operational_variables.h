#ifndef __OPERATIONAL_VARIABLES_H
#define __OPERATIONAL_VARIABLES_H

#include <stdint.h>
#include <stdbool.h>

void get_wifi_status(char* outStatus);
void get_temperature(char* outTemp);
void get_humidity(char* outHumidity);
void get_pressure(char* outPressure);
void get_light_intensity(char* outLight);





#endif
