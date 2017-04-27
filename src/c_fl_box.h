

#ifndef FL_BOX_GUARD
#define FL_BOX_GUARD


typedef void* BOX;


extern "C" BOX new_fl_box(int x, int y, int w, int h, char * label);
extern "C" void free_fl_box(BOX b);


#endif

