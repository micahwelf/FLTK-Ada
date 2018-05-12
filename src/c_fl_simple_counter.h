

#ifndef FL_SIMPLE_COUNTER_GUARD
#define FL_SIMPLE_COUNTER_GUARD




typedef void* SIMPLE_COUNTER;




extern "C" void simple_counter_set_draw_hook(SIMPLE_COUNTER c, void * d);
extern "C" void fl_simple_counter_draw(SIMPLE_COUNTER c);
extern "C" void simple_counter_set_handle_hook(SIMPLE_COUNTER c, void * h);
extern "C" int fl_simple_counter_handle(SIMPLE_COUNTER c, int e);




extern "C" SIMPLE_COUNTER new_fl_simple_counter(int x, int y, int w, int h, char* label);
extern "C" void free_fl_simple_counter(SIMPLE_COUNTER c);


#endif

