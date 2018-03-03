

#ifndef FL_FILL_DIAL_GUARD
#define FL_FILL_DIAL_GUARD




typedef void* FILL_DIAL;




extern "C" void fill_dial_set_draw_hook(FILL_DIAL v, void * d);
extern "C" void fl_fill_dial_draw(FILL_DIAL v);
extern "C" void fill_dial_set_handle_hook(FILL_DIAL v, void * h);
extern "C" int fl_fill_dial_handle(FILL_DIAL v, int e);




extern "C" FILL_DIAL new_fl_fill_dial(int x, int y, int w, int h, char* label);
extern "C" void free_fl_fill_dial(FILL_DIAL v);


#endif

