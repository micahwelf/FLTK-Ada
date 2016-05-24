

#ifndef FL_REPEAT_BUTTON_GUARD
#define FL_REPEAT_BUTTON_GUARD


typedef void* my_fl_repeat_button;


extern "C" my_fl_repeat_button new_fl_repeat_button(int x, int y, int w, int h, char * label);
extern "C" void free_fl_repeat_button(my_fl_repeat_button b);


#endif

