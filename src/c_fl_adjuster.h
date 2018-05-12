

#ifndef FL_ADJUSTER_GUARD
#define FL_ADJUSTER_GUARD




typedef void* ADJUSTER;




extern "C" void adjuster_set_draw_hook(ADJUSTER a, void * d);
extern "C" void fl_adjuster_draw(ADJUSTER a);
extern "C" void adjuster_set_handle_hook(ADJUSTER a, void * h);
extern "C" int fl_adjuster_handle(ADJUSTER a, int e);




extern "C" ADJUSTER new_fl_adjuster(int x, int y, int w, int h, char* label);
extern "C" void free_fl_adjuster(ADJUSTER a);




extern "C" int fl_adjuster_is_soft(ADJUSTER a);
extern "C" void fl_adjuster_set_soft(ADJUSTER a, int t);


#endif

