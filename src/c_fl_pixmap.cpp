

#include <FL/Fl_Pixmap.H>
#include "c_fl_pixmap.h"




void free_fl_pixmap(PIXMAP b) {
    delete reinterpret_cast<Fl_Pixmap*>(b);
}

PIXMAP fl_pixmap_copy(PIXMAP b, int w, int h) {
    return reinterpret_cast<Fl_Pixmap*>(b)->Fl_Pixmap::copy(w, h);
}

PIXMAP fl_pixmap_copy2(PIXMAP b) {
    return reinterpret_cast<Fl_Pixmap*>(b)->copy();
}




void fl_pixmap_color_average(PIXMAP p, int c, float b) {
    //  virtual so disable dispatch
    reinterpret_cast<Fl_Pixmap*>(p)->Fl_Pixmap::color_average(c, b);
}

void fl_pixmap_desaturate(PIXMAP p) {
    //  virtual so disable dispatch
    reinterpret_cast<Fl_Pixmap*>(p)->Fl_Pixmap::desaturate();
}




void fl_pixmap_draw2(PIXMAP b, int x, int y) {
    reinterpret_cast<Fl_Pixmap*>(b)->draw(x, y);
}

void fl_pixmap_draw(PIXMAP b, int x, int y, int w, int h, int cx, int cy) {
    reinterpret_cast<Fl_Pixmap*>(b)->Fl_Pixmap::draw(x, y, w, h, cx, cy);
}

