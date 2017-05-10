

#ifndef FL_MULTILINE_OUTPUT_GUARD
#define FL_MULTILINE_OUTPUT_GUARD


typedef void* MULTILINE_OUTPUT;


extern "C" void multiline_output_set_draw_hook(MULTILINE_OUTPUT n, void * d);
extern "C" void fl_multiline_output_draw(MULTILINE_OUTPUT n);

extern "C" MULTILINE_OUTPUT new_fl_multiline_output(int x, int y, int w, int h, char* label);
extern "C" void free_fl_multiline_output(MULTILINE_OUTPUT i);


#endif

