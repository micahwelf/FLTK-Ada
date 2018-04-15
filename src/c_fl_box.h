

#ifndef FL_BOX_GUARD
#define FL_BOX_GUARD




typedef void* BOX;




extern "C" inline void box_set_draw_hook(BOX n, void * d);
extern "C" inline void fl_box_draw(BOX n);
extern "C" inline void box_set_handle_hook(BOX n, void * h);
extern "C" inline int fl_box_handle(BOX n, int e);




extern "C" inline BOX new_fl_box(int x, int y, int w, int h, char * label);
extern "C" inline void free_fl_box(BOX b);


#endif

