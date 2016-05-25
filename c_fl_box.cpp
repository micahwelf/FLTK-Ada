

#include <FL/Fl_Box.H>
#include "c_fl_box.h"


BOX new_fl_box(int x, int y, int w, int h, char* label) {
    Fl_Box *b = new Fl_Box(x, y, w, h, label);
    return b;
}


void free_fl_box(BOX b) {
    delete reinterpret_cast<Fl_Box*>(b);
}

