

#include <FL/Fl_Button.H>
#include "c_fl_button.h"


BUTTON new_fl_button(int x, int y, int w, int h, char* label) {
    Fl_Button *b = new Fl_Button(x, y, w, h, label);
    return b;
}


void free_fl_button(BUTTON b) {
    delete reinterpret_cast<Fl_Button*>(b);
}


int fl_button_get_state(BUTTON b) {
    return reinterpret_cast<Fl_Button*>(b)->value();
}


void fl_button_set_state(BUTTON b, int s) {
    reinterpret_cast<Fl_Button*>(b)->value(s);
}


void fl_button_set_only(BUTTON b) {
    reinterpret_cast<Fl_Button*>(b)->setonly();
}

