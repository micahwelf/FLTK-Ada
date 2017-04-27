

#include <FL/Fl_Radio_Button.H>
#include "c_fl_radio_button.h"


RADIOBUTTON new_fl_radio_button(int x, int y, int w, int h, char* label) {
    Fl_Radio_Button *b = new Fl_Radio_Button(x, y, w, h, label);
    return b;
}


void free_fl_radio_button(RADIOBUTTON b) {
    delete reinterpret_cast<Fl_Radio_Button*>(b);
}

