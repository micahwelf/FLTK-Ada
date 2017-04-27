

#ifndef FL_LIGHT_BUTTON_GUARD
#define FL_LIGHT_BUTTON_GUARD


typedef void* LIGHTBUTTON;


extern "C" LIGHTBUTTON new_fl_light_button(int x, int y, int w, int h, char* label);
extern "C" void free_fl_light_button(LIGHTBUTTON b);


#endif

