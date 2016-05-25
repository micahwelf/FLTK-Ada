

#include <FL/Fl_Widget.H>
#include "c_fl_widget.h"


int fl_widget_get_box(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->box();
}


void fl_widget_set_box(WIDGET w, int b) {
    reinterpret_cast<Fl_Widget*>(w)->box(static_cast<Fl_Boxtype>(b));
}


int fl_widget_get_label_font(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->labelfont();
}


void fl_widget_set_label_font(WIDGET w, int f) {
    reinterpret_cast<Fl_Widget*>(w)->labelfont(static_cast<Fl_Font>(f));
}


int fl_widget_get_label_size(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->labelsize();
}


void fl_widget_set_label_size(WIDGET w, int s) {
    reinterpret_cast<Fl_Widget*>(w)->labelsize(static_cast<Fl_Fontsize>(s));
}


int fl_widget_get_label_type(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->labeltype();
}


void fl_widget_set_label_type(WIDGET w, int l) {
    reinterpret_cast<Fl_Widget*>(w)->labeltype(static_cast<Fl_Labeltype>(l));
}

