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
            for (uint8_t i = 1; i < SENSOR_ROWS_LEN; i++)
            {
                update_disp_val(vars[i-1], &sensor_rows[i]);
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

void display_text_at_row(const char *text, const DisplayRow *row)
{
    uint16_t x_temp = (row->label_len)*LETTER_WIDTH;
    GUI_DrawRectangle(x_temp, row->y_pos, SCREEN_WIDTH, row->y_pos + FONT_SIZE, WHITE, DRAW_FULL, DOT_PIXEL_1X1);
    GUI_DisString_EN(x_temp, row->y_pos, (char*) text, &Font24, WHITE, BLACK);
}

void show_wifi(bool state)
{
    display_text_at_row(state ? "YES" : "NO", &sensor_rows[ROW_WIFI]);
}

void update_disp_val(uint32_t value, const DisplayRow *row)
{
    char buff[16];
    sprintf(buff, "%" PRIu32 " ", value);
    display_text_at_row(buff, row);
}

void check_alarm(void)
{
    if (hum >= 60)
    {
        if (HAL_GetTick() - last_tick_time >= 10000)
        {
            HAL_GPIO_TogglePin(BUZZER_GPIO_Port, BUZZER_Pin);
            last_tick_time = HAL_GetTick();
            buzzer_active = true;
        }
    }
    else
    {
        if (buzzer_active)
        {
            HAL_GPIO_WritePin(BUZZER_GPIO_Port, BUZZER_Pin, 0);
            buzzer_active = false;
        }
    }
}
