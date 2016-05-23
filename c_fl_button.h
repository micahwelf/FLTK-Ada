

#ifndef FL_BUTTON_GUARD
#define FL_BUTTON_GUARD


typedef void* my_fl_button;


extern "C" my_fl_button new_fl_button(int x, int y, int w, int h, char * label);
extern "C" void free_fl_button(my_fl_button f);


#endif

