

#include <FL/Fl_Input.H>
#include "c_fl_input.h"


my_fl_input new_fl_input(int x, int y, int w, int h, char * label) {
    Fl_Input *input = new Fl_Input(x, y, w, h, label);
    return input;
}


void free_fl_input(my_fl_input f) {
    delete reinterpret_cast<Fl_Input*>(f);
}

