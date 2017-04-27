

#include <FL/Fl_Round_Button.H>
#include "c_fl_round_button.h"


ROUNDBUTTON new_fl_round_button(int x, int y, int w, int h, char* label) {
    Fl_Round_Button *b = new Fl_Round_Button(x, y, w, h, label);
    return b;
}


void free_fl_round_button(ROUNDBUTTON b) {
    delete reinterpret_cast<Fl_Round_Button*>(b);
}

