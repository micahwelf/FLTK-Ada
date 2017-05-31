

#ifndef FL_WINDOW_GUARD
#define FL_WINDOW_GUARD


typedef void* WINDOW;


extern "C" void window_set_draw_hook(WINDOW n, void * d);
extern "C" void fl_window_draw(WINDOW n);
extern "C" void window_set_handle_hook(WINDOW n, void * h);
extern "C" int fl_window_handle(WINDOW n, int e);


extern "C" WINDOW new_fl_window(int x, int y, int w, int h, char* label);
extern "C" WINDOW new_fl_window2(int w, int h);
extern "C" void free_fl_window(WINDOW n);


extern "C" void fl_window_show(WINDOW n);
extern "C" void fl_window_hide(WINDOW n);
extern "C" void fl_window_make_current(WINDOW n);
extern "C" unsigned int fl_window_get_border(WINDOW n);
extern "C" void fl_window_set_border(WINDOW n, int b);
extern "C" void fl_window_set_label(WINDOW n, char* text);
extern "C" void fl_window_size_range(WINDOW n, int lw, int lh, int hw, int hh, int dw, int dh, int a);
extern "C" void fl_window_set_icon(WINDOW n, void * img);
extern "C" void fl_window_set_modal(WINDOW n);
extern "C" void fl_window_set_non_modal(WINDOW n);
extern "C" void fl_window_set_cursor(WINDOW n, int c);
extern "C" void fl_window_set_default_cursor(WINDOW n, int c);


extern "C" int fl_window_get_x_root(WINDOW n);
extern "C" int fl_window_get_y_root(WINDOW n);
extern "C" int fl_window_get_decorated_w(WINDOW n);
extern "C" int fl_window_get_decorated_h(WINDOW n);


#endif

