

#include <FL/Fl_Round_Button.H>
#include "c_fl_round_button.h"


my_fl_round_button new_fl_round_button(int x, int y, int w, int h, char * label) {
    Fl_Round_Button *button = new Fl_Round_Button(x, y, w, h, label);
    return button;
}


void free_fl_round_button(my_fl_round_button b) {
    delete reinterpret_cast<Fl_Round_Button*>(b);
}

