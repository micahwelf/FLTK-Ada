

#include <FL/Fl_Repeat_Button.H>
#include "c_fl_repeat_button.h"


REPEATBUTTON new_fl_repeat_button(int x, int y, int w, int h, char* label) {
    Fl_Repeat_Button *b = new Fl_Repeat_Button(x, y, w, h, label);
    return b;
}


void free_fl_repeat_button(REPEATBUTTON b) {
    delete reinterpret_cast<Fl_Repeat_Button*>(b);
}

