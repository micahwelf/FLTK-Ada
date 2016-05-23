

#include <FL/Fl_Window.H>
#include "c_fl_window.h"


my_fl_window new_fl_window(int x, int y, int w, int h, char * label) {
    Fl_Window *window = new Fl_Window(x, y, w, h, label);
    return window;
}


my_fl_window new_fl_window2(int w, int h) {
    Fl_Window *window = new Fl_Window(w, h);
    return window;
}


void free_fl_window(my_fl_window f) {
    delete reinterpret_cast<Fl_Window*>(f);
}


void fl_window_show(my_fl_window f) {
    reinterpret_cast<Fl_Window*>(f)->show();
}

