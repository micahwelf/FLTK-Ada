

#ifndef FL_DOUBLE_WINDOW_GUARD
#define FL_DOUBLE_WINDOW_GUARD


typedef void* my_fl_double_window;


extern "C" my_fl_double_window new_fl_double_window(int x, int y, int w, int h, char * label);
extern "C" my_fl_double_window new_fl_double_window2(int w, int h);
extern "C" void free_fl_double_window(my_fl_double_window f);

extern "C" void fl_double_window_show(my_fl_double_window f);


#endif

