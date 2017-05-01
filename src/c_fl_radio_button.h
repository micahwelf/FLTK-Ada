

#ifndef FL_RADIO_BUTTON_GUARD
#define FL_RADIO_BUTTON_GUARD


typedef void* RADIOBUTTON;


extern "C" void radio_button_set_draw_hook(RADIOBUTTON b, void * d);
extern "C" void fl_radio_button_draw(RADIOBUTTON b);

extern "C" RADIOBUTTON new_fl_radio_button(int x, int y, int w, int h, char* label);
extern "C" void free_fl_radio_button(RADIOBUTTON b);


#endif

