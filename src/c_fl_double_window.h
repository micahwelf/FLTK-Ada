

#ifndef FL_DOUBLE_WINDOW_GUARD
#define FL_DOUBLE_WINDOW_GUARD




typedef void* DOUBLEWINDOW;




extern "C" inline void double_window_set_draw_hook(DOUBLEWINDOW n, void * d);
extern "C" inline void fl_double_window_draw(DOUBLEWINDOW n);
extern "C" inline void double_window_set_handle_hook(DOUBLEWINDOW n, void * h);
extern "C" inline int fl_double_window_handle(DOUBLEWINDOW n, int e);




extern "C" inline DOUBLEWINDOW new_fl_double_window(int x, int y, int w, int h, char* label);
extern "C" inline DOUBLEWINDOW new_fl_double_window2(int w, int h);
extern "C" inline void free_fl_double_window(DOUBLEWINDOW d);




extern "C" inline void fl_double_window_show(DOUBLEWINDOW d);
extern "C" inline void fl_double_window_hide(DOUBLEWINDOW d);
extern "C" inline void fl_double_window_flush(DOUBLEWINDOW d);


#endif

