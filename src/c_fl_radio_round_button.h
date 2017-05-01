

#ifndef FL_RADIO_ROUND_BUTTON_GUARD
#define FL_RADIO_ROUND_BUTTON_GUARD


typedef void* RADIOROUNDBUTTON;


extern "C" void radio_round_button_set_draw_hook(RADIOROUNDBUTTON b, void * d);
extern "C" void fl_radio_round_button_draw(RADIOROUNDBUTTON b);

extern "C" RADIOROUNDBUTTON new_fl_radio_round_button(int x, int y, int w, int h, char* label);
extern "C" void free_fl_radio_round_button(RADIOROUNDBUTTON b);


#endif

