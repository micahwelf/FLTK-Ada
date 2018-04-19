

#ifndef FL_SINGLE_WINDOW_GUARD
#define FL_SINGLE_WINDOW_GUARD




typedef void* SINGLEWINDOW;




extern "C" inline void single_window_set_draw_hook(SINGLEWINDOW n, void * d);
extern "C" inline void fl_single_window_draw(SINGLEWINDOW n);
extern "C" inline void single_window_set_handle_hook(SINGLEWINDOW n, void * h);
extern "C" inline int fl_single_window_handle(SINGLEWINDOW n, int e);




extern "C" inline SINGLEWINDOW new_fl_single_window(int x, int y, int w, int h, char* label);
extern "C" inline SINGLEWINDOW new_fl_single_window2(int x, int y, char* label);
extern "C" inline void free_fl_single_window(SINGLEWINDOW w);




extern "C" inline void fl_single_window_show(SINGLEWINDOW w);
extern "C" inline void fl_single_window_flush(SINGLEWINDOW w);


#endif

