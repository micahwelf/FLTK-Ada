

#ifndef FL_INT_INPUT_GUARD
#define FL_INT_INPUT_GUARD


typedef void* INT_INPUT;


extern "C" void int_input_set_draw_hook(INT_INPUT n, void * d);
extern "C" void fl_int_input_draw(INT_INPUT n);

extern "C" INT_INPUT new_fl_int_input(int x, int y, int w, int h, char* label);
extern "C" void free_fl_int_input(INT_INPUT i);


#endif

