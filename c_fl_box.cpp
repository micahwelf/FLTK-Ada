

#include <FL/Fl_Box.H>
#include "c_fl_box.h"


my_fl_box new_fl_box(int x, int y, int w, int h, char * label) {
    Fl_Box *box = new Fl_Box(x, y, w, h, label);
    return box;
}


void free_fl_box(my_fl_box f) {
    delete reinterpret_cast<Fl_Box*>(f);
}

