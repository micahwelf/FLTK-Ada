

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




int fl_screen_num(int x, int y) {
    return Fl::screen_num(x, y);
}


int fl_screen_num2(int x, int y, int w, int h) {
    return Fl::screen_num(x, y, w, h);
}




void fl_screen_work_area(int &x, int &y, int &w, int &h, int px, int py) {
    Fl::screen_work_area(x, y, w, h, px, py);
}

void fl_screen_work_area2(int &x, int &y, int &w, int &h, int n) {
    Fl::screen_work_area(x, y, w, h, n);
}

void fl_screen_work_area3(int &x, int &y, int &w, int &h) {
    Fl::screen_work_area(x, y, w, h);
}




void fl_screen_xywh(int &x, int &y, int &w, int &h, int px, int py) {
    Fl::screen_xywh(x, y, w, h, px, py);
}

void fl_screen_xywh2(int &x, int &y, int &w, int &h, int n) {
    Fl::screen_xywh(x, y, w, h, n);
}

void fl_screen_xywh3(int &x, int &y, int &w, int &h) {
    Fl::screen_xywh(x, y, w, h);
}

void fl_screen_xywh4(int &x, int &y, int &w, int &h, int px, int py, int pw, int ph) {
    Fl::screen_xywh(x, y, w, h, px, py, pw, ph);
}


