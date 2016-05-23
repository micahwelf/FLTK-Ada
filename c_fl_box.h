

#ifndef FL_BOX_GUARD
#define FL_BOX_GUARD


typedef void* my_fl_box;


extern "C" my_fl_box new_fl_box(int x, int y, int w, int h, char * label);
extern "C" void free_fl_box(my_fl_box f);


#endif

