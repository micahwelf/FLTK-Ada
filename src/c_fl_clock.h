

#ifndef FL_CLOCK_GUARD
#define FL_CLOCK_GUARD




typedef void* CLOCK;




extern "C" inline void clock_set_draw_hook(CLOCK c, void * d);
extern "C" inline void fl_clock_draw(CLOCK c);
extern "C" inline void clock_set_handle_hook(CLOCK c, void * h);
extern "C" inline int fl_clock_handle(CLOCK c, int e);




extern "C" inline CLOCK new_fl_clock(int x, int y, int w, int h, char* label);
extern "C" inline CLOCK new_fl_clock2(uchar k, int x, int y, int w, int h, char* label);
extern "C" inline void free_fl_clock(CLOCK c);




extern "C" inline void fl_clock_draw2(CLOCK c, int x, int y, int w, int h);


#endif

