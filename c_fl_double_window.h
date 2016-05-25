

#ifndef FL_DOUBLE_WINDOW_GUARD
#define FL_DOUBLE_WINDOW_GUARD


typedef void* DOUBLEWINDOW;


extern "C" DOUBLEWINDOW new_fl_double_window(int x, int y, int w, int h, char* label);
extern "C" DOUBLEWINDOW new_fl_double_window2(int w, int h);
extern "C" void free_fl_double_window(DOUBLEWINDOW d);

extern "C" void fl_double_window_show(DOUBLEWINDOW d);


#endif

