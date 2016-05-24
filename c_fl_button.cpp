

#include <FL/Fl_Button.H>
#include "c_fl_button.h"


my_fl_button new_fl_button(int x, int y, int w, int h, char * label) {
    Fl_Button *button = new Fl_Button(x, y, w, h, label);
    return button;
}


void free_fl_button(my_fl_button f) {
    delete reinterpret_cast<Fl_Button*>(f);
}


int fl_button_get_state(my_fl_button b) {
    return reinterpret_cast<Fl_Button*>(b)->value();
}


void fl_button_set_state(my_fl_button b, int s) {
    reinterpret_cast<Fl_Button*>(b)->value(s);
}


void fl_button_set_only(my_fl_button b) {
    reinterpret_cast<Fl_Button*>(b)->setonly();
}

