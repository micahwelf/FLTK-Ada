

#include <FL/Fl_Toggle_Button.H>
#include "c_fl_toggle_button.h"


my_fl_toggle_button new_fl_toggle_button(int x, int y, int w, int h, char * label) {
    Fl_Toggle_Button *button = new Fl_Toggle_Button(x, y, w, h, label);
    return button;
}


void free_fl_toggle_button(my_fl_toggle_button b) {
    delete reinterpret_cast<Fl_Toggle_Button*>(b);
}

