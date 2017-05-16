

#include <FL/Fl_Bitmap.H>
#include "c_fl_bitmap.h"


void free_fl_bitmap(BITMAP b) {
    delete reinterpret_cast<Fl_Bitmap*>(b);
}


BITMAP fl_bitmap_copy(BITMAP b, int w, int h) {
    return reinterpret_cast<Fl_Bitmap*>(b)->copy(w, h);
}


BITMAP fl_bitmap_copy2(BITMAP b) {
    return reinterpret_cast<Fl_Bitmap*>(b)->copy();
}

