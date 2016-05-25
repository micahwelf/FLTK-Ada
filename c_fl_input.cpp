

#include <FL/Fl_Input.H>
#include "c_fl_input.h"


INPUT new_fl_input(int x, int y, int w, int h, char* label) {
    Fl_Input *i = new Fl_Input(x, y, w, h, label);
    return i;
}


void free_fl_input(INPUT i) {
    delete reinterpret_cast<Fl_Input*>(i);
}

