

#include <FL/Fl_Window.H>
#include "c_fl_window.h"


WINDOW new_fl_window(int x, int y, int w, int h, char* label) {
    Fl_Window *n = new Fl_Window(x, y, w, h, label);
    return n;
}


WINDOW new_fl_window2(int w, int h) {
    Fl_Window *n = new Fl_Window(w, h);
    return n;
}


void free_fl_window(WINDOW n) {
    delete reinterpret_cast<Fl_Window*>(n);
}


void fl_window_show(WINDOW n) {
    reinterpret_cast<Fl_Window*>(n)->show();
}

