

#include <FL/Fl_Radio_Round_Button.H>
#include "c_fl_radio_round_button.h"


RADIOROUNDBUTTON new_fl_radio_round_button(int x, int y, int w, int h, char* label) {
    Fl_Radio_Round_Button *b = new Fl_Radio_Round_Button(x, y, w, h, label);
    return b;
}


void free_fl_radio_round_button(RADIOROUNDBUTTON b) {
    delete reinterpret_cast<Fl_Radio_Round_Button*>(b);
}

