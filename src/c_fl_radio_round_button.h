

#ifndef FL_RADIO_ROUND_BUTTON_GUARD
#define FL_RADIO_ROUND_BUTTON_GUARD




typedef void* RADIOROUNDBUTTON;




extern "C" inline void radio_round_button_set_draw_hook(RADIOROUNDBUTTON b, void * d);
extern "C" inline void fl_radio_round_button_draw(RADIOROUNDBUTTON b);
extern "C" inline void radio_round_button_set_handle_hook(RADIOROUNDBUTTON b, void * h);
extern "C" inline int fl_radio_round_button_handle(RADIOROUNDBUTTON b, int e);




extern "C" inline RADIOROUNDBUTTON new_fl_radio_round_button(int x, int y, int w, int h, char* label);
extern "C" inline void free_fl_radio_round_button(RADIOROUNDBUTTON b);


#endif

