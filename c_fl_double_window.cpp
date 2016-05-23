

#include <FL/Fl_Double_Window.H>
#include "c_fl_double_window.h"


my_fl_double_window new_fl_double_window(int x, int y, int w, int h, char * label) {
    Fl_Double_Window *window = new Fl_Double_Window(x, y, w, h, label);
    return window;
}


my_fl_double_window new_fl_double_window2(int w, int h) {
    Fl_Double_Window *window = new Fl_Double_Window(w, h);
    return window;
}


void free_fl_double_window(my_fl_double_window f) {
    delete reinterpret_cast<Fl_Double_Window*>(f);
}


void fl_double_window_show(my_fl_double_window f) {
    reinterpret_cast<Fl_Double_Window*>(f)->show();
}

