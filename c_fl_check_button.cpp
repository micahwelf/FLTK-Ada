

#include <FL/Fl_Check_Button.H>
#include "c_fl_check_button.h"


CHECKBUTTON new_fl_check_button(int x, int y, int w, int h, char* label) {
    Fl_Check_Button *b = new Fl_Check_Button(x, y, w, h, label);
    return b;
}


void free_fl_check_button(CHECKBUTTON b) {
    delete reinterpret_cast<Fl_Check_Button*>(b);
}

