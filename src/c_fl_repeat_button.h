

#ifndef FL_REPEAT_BUTTON_GUARD
#define FL_REPEAT_BUTTON_GUARD


typedef void* REPEATBUTTON;


extern "C" void repeat_button_set_draw_hook(REPEATBUTTON b, void * d);
extern "C" void fl_repeat_button_draw(REPEATBUTTON b);

extern "C" REPEATBUTTON new_fl_repeat_button(int x, int y, int w, int h, char* label);
extern "C" void free_fl_repeat_button(REPEATBUTTON b);


#endif

