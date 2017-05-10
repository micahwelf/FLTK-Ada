

#ifndef FL_OUTPUT_GUARD
#define FL_OUTPUT_GUARD


//  using just "OUTPUT" doesn't compile for some reason
typedef void* OUTPUTT;


extern "C" void output_set_draw_hook(OUTPUTT n, void * d);
extern "C" void fl_output_draw(OUTPUTT n);

extern "C" OUTPUTT new_fl_output(int x, int y, int w, int h, char* label);
extern "C" void free_fl_output(OUTPUTT i);


#endif

