

#include <FL/Fl_Single_Window.H>
#include "c_fl_single_window.h"


SINGLEWINDOW new_fl_single_window(int x, int y, int w, int h, char* label) {
    Fl_Single_Window *sw = new Fl_Single_Window(x, y, w, h, label);
    return sw;
}


SINGLEWINDOW new_fl_single_window2(int x, int y) {
    Fl_Single_Window *sw = new Fl_Single_Window(x, y);
    return sw;
}


void free_fl_single_window(SINGLEWINDOW w) {
    delete reinterpret_cast<Fl_Single_Window*>(w);
}


void fl_single_window_show(SINGLEWINDOW w) {
    reinterpret_cast<Fl_Single_Window*>(w)->show();
}


void fl_single_window_flush(SINGLEWINDOW w) {
    reinterpret_cast<Fl_Single_Window*>(w)->flush();
}

