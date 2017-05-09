

#ifndef FL_FLOAT_INPUT_GUARD
#define FL_FLOAT_INPUT_GUARD


typedef void* FLOAT_INPUT;


extern "C" void float_input_set_draw_hook(FLOAT_INPUT n, void * d);
extern "C" void fl_float_input_draw(FLOAT_INPUT n);

extern "C" FLOAT_INPUT new_fl_float_input(int x, int y, int w, int h, char* label);
extern "C" void free_fl_float_input(FLOAT_INPUT i);


#endif

