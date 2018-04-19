

#ifndef FL_MENU_WINDOW_GUARD
#define FL_MENU_WINDOW_GUARD




typedef void* MENUWINDOW;




extern "C" inline void menu_window_set_draw_hook(MENUWINDOW n, void * d);
extern "C" inline void fl_menu_window_draw(MENUWINDOW n);
extern "C" inline void menu_window_set_handle_hook(MENUWINDOW n, void * h);
extern "C" inline int fl_menu_window_handle(MENUWINDOW n, int e);




extern "C" inline MENUWINDOW new_fl_menu_window(int x, int y, int w, int h, char* label);
extern "C" inline MENUWINDOW new_fl_menu_window2(int w, int h, char* label);
extern "C" inline void free_fl_menu_window(MENUWINDOW m);




extern "C" inline void fl_menu_window_show(MENUWINDOW m);
extern "C" inline void fl_menu_window_hide(MENUWINDOW m);
extern "C" inline void fl_menu_window_flush(MENUWINDOW m);


extern "C" inline void fl_menu_window_set_overlay(MENUWINDOW m);
extern "C" inline void fl_menu_window_clear_overlay(MENUWINDOW m);
extern "C" inline unsigned int fl_menu_window_overlay(MENUWINDOW m);


#endif

