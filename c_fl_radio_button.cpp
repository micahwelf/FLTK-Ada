

#include <FL/Fl_Radio_Button.H>
#include "c_fl_radio_button.h"


my_fl_radio_button new_fl_radio_button(int x, int y, int w, int h, char * label) {
    Fl_Radio_Button *button = new Fl_Radio_Button(x, y, w, h, label);
    return button;
}


void free_fl_radio_button(my_fl_radio_button b) {
    delete reinterpret_cast<Fl_Radio_Button*>(b);
}

