#include "operational_variables.h"
#include <stdio.h>
#include <stdbool.h>





void get_wifi_status(char* outStatus)
{
    sprintf(outStatus, "WiFi: No Connection!");
}



void get_temperature(char* outTemp)
{
    float temp = 22.5;
    sprintf(outTemp, "Temp: %.1f C", temp);
}



void get_humidity(char* outHumidity)
{
    int hum = 45;
    sprintf(outHumidity, "Hum: %d %%", hum);
}

void get_pressure(char* outPressure)
{
    int press = 10;
    sprintf(outPressure, "Press: %d", press);
}

void get_light_intensity(char* outLight)
{
    int light = 80;
    sprintf(outLight, "Light: %d lx", light);
}
