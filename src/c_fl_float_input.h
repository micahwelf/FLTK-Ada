

#ifndef FL_FLOAT_INPUT_GUARD
#define FL_FLOAT_INPUT_GUARD




typedef void* FLOAT_INPUT;




extern "C" inline void float_input_set_draw_hook(FLOAT_INPUT i, void * d);
extern "C" inline void fl_float_input_draw(FLOAT_INPUT i);
extern "C" inline void float_input_set_handle_hook(FLOAT_INPUT i, void * h);
extern "C" inline int fl_float_input_handle(FLOAT_INPUT i, int e);




extern "C" inline FLOAT_INPUT new_fl_float_input(int x, int y, int w, int h, char* label);
extern "C" inline void free_fl_float_input(FLOAT_INPUT i);


#endif

