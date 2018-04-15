

#ifndef FL_LIGHT_BUTTON_GUARD
#define FL_LIGHT_BUTTON_GUARD




typedef void* LIGHTBUTTON;




extern "C" inline void light_button_set_draw_hook(LIGHTBUTTON b, void * d);
extern "C" inline void fl_light_button_draw(LIGHTBUTTON b);
extern "C" inline void light_button_set_handle_hook(LIGHTBUTTON b, void * h);
extern "C" inline int fl_light_button_handle(LIGHTBUTTON b, int e);




extern "C" inline LIGHTBUTTON new_fl_light_button(int x, int y, int w, int h, char* label);
extern "C" inline void free_fl_light_button(LIGHTBUTTON b);


#endif

