

#ifndef FL_VALUATOR_GUARD
#define FL_VALUATOR_GUARD




typedef void* VALUATOR;




extern "C" void valuator_set_draw_hook(VALUATOR v, void * d);
extern "C" void valuator_set_handle_hook(VALUATOR v, void * h);
extern "C" int fl_valuator_handle(VALUATOR v, int e);




extern "C" VALUATOR new_fl_valuator(int x, int y, int w, int h, char* label);
extern "C" void free_fl_valuator(VALUATOR v);




extern "C" double fl_valuator_clamp(VALUATOR v, double a);
extern "C" double fl_valuator_round(VALUATOR v, double a);
extern "C" double fl_valuator_increment(VALUATOR v, double a, int s);




extern "C" double fl_valuator_get_minimum(VALUATOR v);
extern "C" void fl_valuator_set_minimum(VALUATOR v, double t);
extern "C" double fl_valuator_get_maximum(VALUATOR v);
extern "C" void fl_valuator_set_maximum(VALUATOR v, double t);
extern "C" double fl_valuator_get_value(VALUATOR v);
extern "C" void fl_valuator_set_value(VALUATOR v, double t);
extern "C" void fl_valuator_bounds(VALUATOR v, double a, double b);
extern "C" void fl_valuator_precision(VALUATOR v, int s);
extern "C" void fl_valuator_range(VALUATOR v, double a, double b);


#endif

