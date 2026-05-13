#include <stdio.h>
#include <stdbool.h>
#include <inttypes.h>
#include "LCD_GUI.h"
#include "auxiliary_functions.h"

void analyze_mess(void)
{
    if (rx_byte == '$')
    {
        rx_mess[j + 1] = '\0';
        // hum external for buzzer
        int temp;
        int l_v, l_g;
        int p;
        int var_num = sscanf((char*)rx_mess, " T%d|H%d|P%d|L_V%d|L_G%d", &temp, &hum, &p, &l_v, &l_g);
        uint32_t vars[] = {temp, hum, p, l_v, l_g};

        if (var_num == 5)
        {
            char buff[16];

            for (uint8_t i = 1; i < SENSOR_ROWS_LEN; i++)
            {
                sprintf(buff, "%" PRIu32 " ", vars[i-1]);
                int x_temp = (sensor_rows[i].label_len)*LETTER_WIDTH;
                GUI_DrawRectangle(x_temp, sensor_rows[i].y_pos, SCREEN_WIDTH, sensor_rows[i].y_pos + FONT_SIZE, WHITE, DRAW_FULL, DOT_PIXEL_1X1);
                GUI_DisString_EN(x_temp, sensor_rows[i].y_pos, buff, &Font24, WHITE, BLACK);
            }

        }
        j = -1;
    }
    else
    {
        if (j == -1 && (rx_byte == '\r' || rx_byte == '\n')) return;
        if (j < MESS_SIZE - 1)
        {
            rx_mess[++j] = rx_byte;
        }
    }
}

void show_wifi(bool state)
{
    char buff[4];
    if (state)
    {
        sprintf(buff, "YES");
    }
    else
    {
        sprintf(buff, "NO!");
    }


    int x_temp = (sensor_rows[0].label_len)*LETTER_WIDTH;
    GUI_DrawRectangle(x_temp, sensor_rows[0].y_pos, SCREEN_WIDTH, sensor_rows[0].y_pos + FONT_SIZE, WHITE, DRAW_FULL, DOT_PIXEL_1X1);
    GUI_DisString_EN(x_temp, sensor_rows[0].y_pos, buff, &Font24, WHITE, BLACK);
}

