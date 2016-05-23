

#ifndef FL_INPUT_GUARD
#define FL_INPUT_GUARD


typedef void* my_fl_input;


extern "C" my_fl_input new_fl_input(int x, int y, int w, int h, char * label);
extern "C" void free_fl_input(my_fl_input f);


#endif

