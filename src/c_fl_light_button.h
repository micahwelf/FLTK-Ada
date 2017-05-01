

#ifndef FL_LIGHT_BUTTON_GUARD
#define FL_LIGHT_BUTTON_GUARD


typedef void* LIGHTBUTTON;


extern "C" void light_button_set_draw_hook(LIGHTBUTTON b, void * d);
extern "C" void fl_light_button_draw(LIGHTBUTTON b);

extern "C" LIGHTBUTTON new_fl_light_button(int x, int y, int w, int h, char* label);
extern "C" void free_fl_light_button(LIGHTBUTTON b);


#endif

