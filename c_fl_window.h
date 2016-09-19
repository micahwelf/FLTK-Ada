

#ifndef FL_WINDOW_GUARD
#define FL_WINDOW_GUARD


typedef void* WINDOW;


extern "C" WINDOW new_fl_window(int x, int y, int w, int h, char* label);
extern "C" WINDOW new_fl_window2(int w, int h);
extern "C" void free_fl_window(WINDOW n);

extern "C" void fl_window_show(WINDOW n);
extern "C" void fl_window_hide(WINDOW n);
extern "C" void fl_window_set_label(WINDOW n, char* text);


#endif

