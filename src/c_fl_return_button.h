

#ifndef FL_RETURN_BUTTON_GUARD
#define FL_RETURN_BUTTON_GUARD


typedef void* RETURNBUTTON;


extern "C" RETURNBUTTON new_fl_return_button(int x, int y, int w, int h, char* label);
extern "C" void free_fl_return_button(RETURNBUTTON b);


#endif

