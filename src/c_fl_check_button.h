

#ifndef FL_CHECK_BUTTON_GUARD
#define FL_CHECK_BUTTON_GUARD


typedef void* CHECKBUTTON;


extern "C" void check_button_set_draw_hook(CHECKBUTTON b, void * d);
extern "C" void fl_check_button_draw(CHECKBUTTON b);

extern "C" CHECKBUTTON new_fl_check_button(int x, int y, int w, int h, char* label);
extern "C" void free_fl_check_button(CHECKBUTTON b);


#endif

