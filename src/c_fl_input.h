

#ifndef FL_INPUT_GUARD
#define FL_INPUT_GUARD


typedef void* INPUT;


extern "C" void input_set_draw_hook(INPUT n, void * d);
extern "C" void fl_input_draw(INPUT n);

extern "C" INPUT new_fl_input(int x, int y, int w, int h, char* label);
extern "C" void free_fl_input(INPUT i);


extern "C" const char * fl_input_get_value(INPUT i);


#endif

