

#include <FL/Fl_Menu_Window.H>
#include "c_fl_menu_window.h"


MENUWINDOW new_fl_menu_window(int x, int y, int w, int h, char* label) {
    Fl_Menu_Window *m = new Fl_Menu_Window(x, y, w, h, label);
    return m;
}


MENUWINDOW new_fl_menu_window2(int w, int h) {
    Fl_Menu_Window *m = new Fl_Menu_Window(w, h);
    return m;
}


void free_fl_menu_window(MENUWINDOW m) {
    delete reinterpret_cast<Fl_Menu_Window*>(m);
}


void fl_menu_window_show(MENUWINDOW m) {
    reinterpret_cast<Fl_Menu_Window*>(m)->show();
}


void fl_menu_window_hide(MENUWINDOW m) {
    reinterpret_cast<Fl_Menu_Window*>(m)->hide();
}


void fl_menu_window_flush(MENUWINDOW m) {
    reinterpret_cast<Fl_Menu_Window*>(m)->flush();
}


void fl_menu_window_set_overlay(MENUWINDOW m) {
    reinterpret_cast<Fl_Menu_Window*>(m)->set_overlay();
}


void fl_menu_window_clear_overlay(MENUWINDOW m) {
    reinterpret_cast<Fl_Menu_Window*>(m)->clear_overlay();
}


unsigned int fl_menu_window_overlay(MENUWINDOW m) {
    return reinterpret_cast<Fl_Menu_Window*>(m)->overlay();
}

