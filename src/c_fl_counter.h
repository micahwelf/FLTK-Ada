

#ifndef FL_COUNTER_GUARD
#define FL_COUNTER_GUARD




typedef void* COUNTER;




extern "C" void counter_set_draw_hook(COUNTER c, void * d);
extern "C" void fl_counter_draw(COUNTER c);
extern "C" void counter_set_handle_hook(COUNTER c, void * h);
extern "C" int fl_counter_handle(COUNTER c, int e);




extern "C" COUNTER new_fl_counter(int x, int y, int w, int h, char* label);
extern "C" void free_fl_counter(COUNTER c);




extern "C" double fl_counter_get_step(COUNTER c);
extern "C" void fl_counter_set_step(COUNTER c, double t);
extern "C" void fl_counter_set_lstep(COUNTER c, double t);


extern "C" unsigned int fl_counter_get_textcolor(COUNTER c);
extern "C" void fl_counter_set_textcolor(COUNTER c, unsigned int t);
extern "C" int fl_counter_get_textfont(COUNTER c);
extern "C" void fl_counter_set_textfont(COUNTER c, int t);
extern "C" int fl_counter_get_textsize(COUNTER c);
extern "C" void fl_counter_set_textsize(COUNTER c, int t);


#endif

