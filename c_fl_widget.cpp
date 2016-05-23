

#include <FL/Fl_Widget.H>
#include "c_fl_widget.h"


int fl_widget_get_box(my_fl_widget w) {
    return reinterpret_cast<Fl_Widget*>(w)->box();
}


void fl_widget_set_box(my_fl_widget w, int b) {
    reinterpret_cast<Fl_Widget*>(w)->box(static_cast<Fl_Boxtype>(b));
}


int fl_widget_get_label_font(my_fl_widget w) {
    return reinterpret_cast<Fl_Widget*>(w)->labelfont();
}


void fl_widget_set_label_font(my_fl_widget w, int f) {
    reinterpret_cast<Fl_Widget*>(w)->labelfont(static_cast<Fl_Font>(f));
}

