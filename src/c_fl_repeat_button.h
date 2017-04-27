

#ifndef FL_REPEAT_BUTTON_GUARD
#define FL_REPEAT_BUTTON_GUARD


typedef void* REPEATBUTTON;


extern "C" REPEATBUTTON new_fl_repeat_button(int x, int y, int w, int h, char* label);
extern "C" void free_fl_repeat_button(REPEATBUTTON b);


#endif

