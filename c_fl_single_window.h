

#ifndef FL_SINGLE_WINDOW_GUARD
#define FL_SINGLE_WINDOW_GUARD


typedef void* SINGLEWINDOW;


extern "C" SINGLEWINDOW new_fl_single_window(int x, int y, int w, int h, char* label);
extern "C" SINGLEWINDOW new_fl_single_window2(int x, int y);
extern "C" void free_fl_single_window(SINGLEWINDOW w);

extern "C" void fl_single_window_show(SINGLEWINDOW w);
extern "C" void fl_single_window_flush(SINGLEWINDOW w);


#endif

