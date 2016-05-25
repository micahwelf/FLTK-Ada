

#include <FL/Fl_Toggle_Button.H>
#include "c_fl_toggle_button.h"


TOGGLEBUTTON new_fl_toggle_button(int x, int y, int w, int h, char* label) {
    Fl_Toggle_Button *b = new Fl_Toggle_Button(x, y, w, h, label);
    return b;
}


void free_fl_toggle_button(TOGGLEBUTTON b) {
    delete reinterpret_cast<Fl_Toggle_Button*>(b);
}

