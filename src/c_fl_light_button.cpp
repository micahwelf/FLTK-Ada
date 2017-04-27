

#include <FL/Fl_Light_Button.H>
#include "c_fl_light_button.h"


LIGHTBUTTON new_fl_light_button(int x, int y, int w, int h, char* label) {
    Fl_Light_Button *b = new Fl_Light_Button(x, y, w, h, label);
    return b;
}


void free_fl_light_button(LIGHTBUTTON b) {
    delete reinterpret_cast<Fl_Light_Button*>(b);
}

