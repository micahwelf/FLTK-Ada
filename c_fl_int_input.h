

#ifndef FL_INT_INPUT_GUARD
#define FL_INT_INPUT_GUARD


typedef void* INT_INPUT;


extern "C" INT_INPUT new_fl_int_input(int x, int y, int w, int h, char* label);
extern "C" void free_fl_int_input(INT_INPUT i);


extern "C" const char * fl_int_input_get_value(INT_INPUT i);


#endif

