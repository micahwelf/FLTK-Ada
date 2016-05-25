

#include <FL/Fl_Radio_Light_Button.H>
#include "c_fl_radio_light_button.h"


RADIOLIGHTBUTTON new_fl_radio_light_button(int x, int y, int w, int h, char* label) {
    Fl_Radio_Light_Button *b = new Fl_Radio_Light_Button(x, y, w, h, label);
    return b;
}


void free_fl_radio_light_button(RADIOLIGHTBUTTON b) {
    delete reinterpret_cast<Fl_Radio_Light_Button*>(b);
}

