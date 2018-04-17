

#ifndef FL_MULTILINE_OUTPUT_GUARD
#define FL_MULTILINE_OUTPUT_GUARD




typedef void* MULTILINE_OUTPUT;




extern "C" inline void multiline_output_set_draw_hook(MULTILINE_OUTPUT i, void * d);
extern "C" inline void fl_multiline_output_draw(MULTILINE_OUTPUT i);
extern "C" inline void multiline_output_set_handle_hook(MULTILINE_OUTPUT i, void * h);
extern "C" inline int fl_multiline_output_handle(MULTILINE_OUTPUT i, int e);




extern "C" inline MULTILINE_OUTPUT new_fl_multiline_output(int x, int y, int w, int h, char* label);
extern "C" inline void free_fl_multiline_output(MULTILINE_OUTPUT i);


#endif

