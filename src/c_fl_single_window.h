

#ifndef FL_SINGLE_WINDOW_GUARD
#define FL_SINGLE_WINDOW_GUARD




typedef void* SINGLEWINDOW;




extern "C" void single_window_set_draw_hook(SINGLEWINDOW n, void * d);
extern "C" void fl_single_window_draw(SINGLEWINDOW n);
extern "C" void single_window_set_handle_hook(SINGLEWINDOW n, void * h);
extern "C" int fl_single_window_handle(SINGLEWINDOW n, int e);




extern "C" SINGLEWINDOW new_fl_single_window(int x, int y, int w, int h, char* label);
extern "C" SINGLEWINDOW new_fl_single_window2(int x, int y, char* label);
extern "C" void free_fl_single_window(SINGLEWINDOW w);




extern "C" void fl_single_window_show(SINGLEWINDOW w);
extern "C" void fl_single_window_flush(SINGLEWINDOW w);


#endif

