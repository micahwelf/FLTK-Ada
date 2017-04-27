

#include <FL/Fl_Double_Window.H>
#include "c_fl_double_window.h"


DOUBLEWINDOW new_fl_double_window(int x, int y, int w, int h, char* label) {
    Fl_Double_Window *d = new Fl_Double_Window(x, y, w, h, label);
    return d;
}


DOUBLEWINDOW new_fl_double_window2(int w, int h) {
    Fl_Double_Window *d = new Fl_Double_Window(w, h);
    return d;
}


void free_fl_double_window(DOUBLEWINDOW d) {
    delete reinterpret_cast<Fl_Double_Window*>(d);
}


void fl_double_window_show(DOUBLEWINDOW d) {
    reinterpret_cast<Fl_Double_Window*>(d)->show();
}


void fl_double_window_hide(DOUBLEWINDOW d) {
    reinterpret_cast<Fl_Double_Window*>(d)->hide();
}

