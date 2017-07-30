

#include <FL/Fl.H>
#include "c_fl_screen.h"


int fl_screen_x() {
    return Fl::x();
}

int fl_screen_y() {
    return Fl::y();
}

int fl_screen_w() {
    return Fl::w();
}

int fl_screen_h() {
    return Fl::h();
}




int fl_screen_count() {
    return Fl::screen_count();
}

void fl_screen_dpi(float &h, float &v, int n) {
    Fl::screen_dpi(h, v, n);
}

