

#ifndef FL_RETURN_BUTTON_GUARD
#define FL_RETURN_BUTTON_GUARD


typedef void* my_fl_return_button;


extern "C" my_fl_return_button new_fl_return_button(int x, int y, int w, int h, char * label);
extern "C" void free_fl_return_button(my_fl_return_button b);


#endif

