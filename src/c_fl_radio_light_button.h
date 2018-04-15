

#ifndef FL_RADIO_LIGHT_BUTTON_GUARD
#define FL_RADIO_LIGHT_BUTTON_GUARD




typedef void* RADIOLIGHTBUTTON;




extern "C" inline void radio_light_button_set_draw_hook(RADIOLIGHTBUTTON b, void * d);
extern "C" inline void fl_radio_light_button_draw(RADIOLIGHTBUTTON b);
extern "C" inline void radio_light_button_set_handle_hook(RADIOLIGHTBUTTON b, void * h);
extern "C" inline int fl_radio_light_button_handle(RADIOLIGHTBUTTON b, int e);




extern "C" inline RADIOLIGHTBUTTON new_fl_radio_light_button(int x, int y, int w, int h, char* label);
extern "C" inline void free_fl_radio_light_button(RADIOLIGHTBUTTON b);


#endif

