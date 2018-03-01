

#ifndef FL_CLOCK_GUARD
#define FL_CLOCK_GUARD




typedef void* CLOCK;




extern "C" void clock_set_draw_hook(CLOCK c, void * d);
extern "C" void fl_clock_draw(CLOCK c);
extern "C" void clock_set_handle_hook(CLOCK c, void * h);
extern "C" int fl_clock_handle(CLOCK c, int e);




extern "C" CLOCK new_fl_clock(int x, int y, int w, int h, char* label);
extern "C" void free_fl_clock(CLOCK c);


#endif

