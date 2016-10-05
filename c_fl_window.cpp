

#include <FL/Fl_Window.H>
#include <FL/Fl_RGB_Image.H>
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


void fl_window_hide(WINDOW n) {
    reinterpret_cast<Fl_Window*>(n)->hide();
}


void fl_window_set_label(WINDOW n, char* text) {
    reinterpret_cast<Fl_Window*>(n)->copy_label(text);
}


void fl_window_size_range(WINDOW n, int lw, int lh, int hw, int hh, int dw, int dh, int a) {
    reinterpret_cast<Fl_Window*>(n)->size_range(lw, lh, hw, hh, dw, dh, a);
}


void fl_window_set_icon(WINDOW n, void * img) {
    reinterpret_cast<Fl_Window*>(n)->icon(reinterpret_cast<Fl_RGB_Image*>(img));
}


void fl_window_set_modal(WINDOW n) {
    reinterpret_cast<Fl_Window*>(n)->set_modal();
}


void fl_window_set_non_modal(WINDOW n) {
    reinterpret_cast<Fl_Window*>(n)->set_non_modal();
}

