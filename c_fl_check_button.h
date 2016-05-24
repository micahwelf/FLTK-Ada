

#ifndef FL_CHECK_BUTTON_GUARD
#define FL_CHECK_BUTTON_GUARD


typedef void* my_fl_check_button;


extern "C" my_fl_check_button new_fl_check_button(int x, int y, int w, int h, char * label);
extern "C" void free_fl_check_button(my_fl_check_button b);


#endif

