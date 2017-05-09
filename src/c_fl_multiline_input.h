

#ifndef FL_MULTILINE_INPUT_GUARD
#define FL_MULTILINE_INPUT_GUARD


typedef void* MULTILINE_INPUT;


extern "C" void multiline_input_set_draw_hook(MULTILINE_INPUT n, void * d);
extern "C" void fl_multiline_input_draw(MULTILINE_INPUT n);

extern "C" MULTILINE_INPUT new_fl_multiline_input(int x, int y, int w, int h, char* label);
extern "C" void free_fl_multiline_input(MULTILINE_INPUT i);


#endif

