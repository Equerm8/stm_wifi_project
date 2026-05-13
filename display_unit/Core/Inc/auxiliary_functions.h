#ifndef AUXILIARY_FUNCTIONS_h
#define AUXILIARY_FUNCTIONS_h

#include "main.h"

void analyze_mess(void);
void display_text_at_row(const char *text, const DisplayRow *row);
void show_wifi(bool state);
void update_disp_val(uint32_t value, const DisplayRow *row);

#endif
