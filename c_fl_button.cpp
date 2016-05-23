

#include <FL/Fl_Button.H>
#include "c_fl_button.h"


my_fl_button new_fl_button(int x, int y, int w, int h, char * label) {
    Fl_Button *button = new Fl_Button(x, y, w, h, label);
    return button;
}


void free_fl_button(my_fl_button f) {
    delete reinterpret_cast<Fl_Button*>(f);
}

