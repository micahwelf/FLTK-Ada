

#ifndef FL_BOX_GUARD
#define FL_BOX_GUARD


typedef void* BOX;


extern "C" void box_set_draw_hook(BOX n, void * d);
extern "C" void fl_box_draw(BOX n);

extern "C" BOX new_fl_box(int x, int y, int w, int h, char * label);
extern "C" void free_fl_box(BOX b);


#endif

