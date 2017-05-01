

#ifndef FL_RADIO_LIGHT_BUTTON_GUARD
#define FL_RADIO_LIGHT_BUTTON_GUARD


typedef void* RADIOLIGHTBUTTON;


extern "C" void radio_light_button_set_draw_hook(RADIOLIGHTBUTTON b, void * d);
extern "C" void fl_radio_light_button_draw(RADIOLIGHTBUTTON b);

extern "C" RADIOLIGHTBUTTON new_fl_radio_light_button(int x, int y, int w, int h, char* label);
extern "C" void free_fl_radio_light_button(RADIOLIGHTBUTTON b);


#endif

