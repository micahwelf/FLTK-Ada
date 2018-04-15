

#ifndef FL_RADIO_BUTTON_GUARD
#define FL_RADIO_BUTTON_GUARD




typedef void* RADIOBUTTON;




extern "C" inline void radio_button_set_draw_hook(RADIOBUTTON b, void * d);
extern "C" inline void fl_radio_button_draw(RADIOBUTTON b);
extern "C" inline void radio_button_set_handle_hook(RADIOBUTTON b, void * h);
extern "C" inline int fl_radio_button_handle(RADIOBUTTON b, int e);




extern "C" inline RADIOBUTTON new_fl_radio_button(int x, int y, int w, int h, char* label);
extern "C" inline void free_fl_radio_button(RADIOBUTTON b);


#endif

