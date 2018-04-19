

#ifndef FL_ROLLER_GUARD
#define FL_ROLLER_GUARD




typedef void* ROLLER;




extern "C" inline void roller_set_draw_hook(ROLLER r, void * d);
extern "C" inline void fl_roller_draw(ROLLER r);
extern "C" inline void roller_set_handle_hook(ROLLER r, void * h);
extern "C" inline int fl_roller_handle(ROLLER r, int e);




extern "C" inline ROLLER new_fl_roller(int x, int y, int w, int h, char* label);
extern "C" inline void free_fl_roller(ROLLER r);


#endif

