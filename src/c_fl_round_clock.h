

#ifndef FL_ROUND_CLOCK_GUARD
#define FL_ROUND_CLOCK_GUARD




typedef void* ROUND_CLOCK;




extern "C" void round_clock_set_draw_hook(ROUND_CLOCK c, void * d);
extern "C" void fl_round_clock_draw(ROUND_CLOCK c);
extern "C" void round_clock_set_handle_hook(ROUND_CLOCK c, void * h);
extern "C" int fl_round_clock_handle(ROUND_CLOCK c, int e);




extern "C" ROUND_CLOCK new_fl_round_clock(int x, int y, int w, int h, char* label);
extern "C" void free_fl_round_clock(ROUND_CLOCK c);




extern "C" void fl_round_clock_draw2(ROUND_CLOCK c, int x, int y, int w, int h);


#endif

