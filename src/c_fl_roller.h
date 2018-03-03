

#ifndef FL_ROLLER_GUARD
#define FL_ROLLER_GUARD




typedef void* ROLLER;




extern "C" void roller_set_draw_hook(ROLLER r, void * d);
extern "C" void fl_roller_draw(ROLLER r);
extern "C" void roller_set_handle_hook(ROLLER r, void * h);
extern "C" int fl_roller_handle(ROLLER r, int e);




extern "C" ROLLER new_fl_roller(int x, int y, int w, int h, char* label);
extern "C" void free_fl_roller(ROLLER r);


#endif

