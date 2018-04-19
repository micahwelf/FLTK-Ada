

#ifndef FL_LINE_DIAL_GUARD
#define FL_LINE_DIAL_GUARD




typedef void* LINE_DIAL;




extern "C" inline void line_dial_set_draw_hook(LINE_DIAL v, void * d);
extern "C" inline void fl_line_dial_draw(LINE_DIAL v);
extern "C" inline void line_dial_set_handle_hook(LINE_DIAL v, void * h);
extern "C" inline int fl_line_dial_handle(LINE_DIAL v, int e);




extern "C" inline LINE_DIAL new_fl_line_dial(int x, int y, int w, int h, char* label);
extern "C" inline void free_fl_line_dial(LINE_DIAL v);


#endif

