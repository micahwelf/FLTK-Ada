

#ifndef FL_OUTPUT_GUARD
#define FL_OUTPUT_GUARD




//  using just "OUTPUT" doesn't compile for some reason
//  some sort of name clash?
typedef void* OUTPUTT;




extern "C" inline void output_set_draw_hook(OUTPUTT i, void * d);
extern "C" inline void fl_output_draw(OUTPUTT i);
extern "C" inline void output_set_handle_hook(OUTPUTT i, void * h);
extern "C" inline int fl_output_handle(OUTPUTT i, int e);




extern "C" inline OUTPUTT new_fl_output(int x, int y, int w, int h, char* label);
extern "C" inline void free_fl_output(OUTPUTT i);


#endif

