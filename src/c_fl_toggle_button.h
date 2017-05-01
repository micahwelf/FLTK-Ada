

#ifndef FL_TOGGLE_BUTTON_GUARD
#define FL_TOGGLE_BUTTON_GUARD


typedef void* TOGGLEBUTTON;


extern "C" void toggle_button_set_draw_hook(TOGGLEBUTTON b, void * d);
extern "C" void fl_toggle_button_draw(TOGGLEBUTTON b);

extern "C" TOGGLEBUTTON new_fl_toggle_button(int x, int y, int w, int h, char* label);
extern "C" void free_fl_toggle_button(TOGGLEBUTTON b);


#endif

