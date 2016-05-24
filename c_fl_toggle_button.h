

#ifndef FL_TOGGLE_BUTTON_GUARD
#define FL_TOGGLE_BUTTON_GUARD


typedef void* my_fl_toggle_button;


extern "C" my_fl_toggle_button new_fl_toggle_button(int x, int y, int w, int h, char * label);
extern "C" void free_fl_toggle_button(my_fl_toggle_button b);


#endif

