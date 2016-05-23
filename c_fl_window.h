

#ifndef FL_WINDOW_GUARD
#define FL_WINDOW_GUARD


typedef void* my_fl_window;


extern "C" my_fl_window new_fl_window(int x, int y, int w, int h, char * label);
extern "C" my_fl_window new_fl_window2(int w, int h);
extern "C" void free_fl_window(my_fl_window f);

extern "C" void fl_window_show(my_fl_window f);


#endif

