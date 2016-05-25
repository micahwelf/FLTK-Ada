

#include <FL/Fl_Return_Button.H>
#include "c_fl_return_button.h"


RETURNBUTTON new_fl_return_button(int x, int y, int w, int h, char* label) {
    Fl_Return_Button *b = new Fl_Return_Button(x, y, w, h, label);
    return b;
}


void free_fl_return_button(RETURNBUTTON b) {
    delete reinterpret_cast<Fl_Return_Button*>(b);
}

