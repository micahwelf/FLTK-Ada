

#include <FL/Fl_Bitmap.H>
#include "c_fl_bitmap.h"




void free_fl_bitmap(BITMAP b) {
    delete reinterpret_cast<Fl_Bitmap*>(b);
}

BITMAP fl_bitmap_copy(BITMAP b, int w, int h) {
    return reinterpret_cast<Fl_Bitmap*>(b)->Fl_Bitmap::copy(w, h);
}

BITMAP fl_bitmap_copy2(BITMAP b) {
    return reinterpret_cast<Fl_Bitmap*>(b)->copy();
}




void fl_bitmap_draw2(BITMAP b, int x, int y) {
    reinterpret_cast<Fl_Bitmap*>(b)->draw(x, y);
}

void fl_bitmap_draw(BITMAP b, int x, int y, int w, int h, int cx, int cy) {
    reinterpret_cast<Fl_Bitmap*>(b)->Fl_Bitmap::draw(x, y, w, h, cx, cy);
}

