

#ifndef FL_CHECK_BUTTON_GUARD
#define FL_CHECK_BUTTON_GUARD


typedef void* CHECKBUTTON;


extern "C" CHECKBUTTON new_fl_check_button(int x, int y, int w, int h, char* label);
extern "C" void free_fl_check_button(CHECKBUTTON b);


#endif

