

#include <FL/Fl_Return_Button.H>
#include "c_fl_return_button.h"


my_fl_return_button new_fl_return_button(int x, int y, int w, int h, char * label) {
    Fl_Return_Button *button = new Fl_Return_Button(x, y, w, h, label);
    return button;
}


void free_fl_return_button(my_fl_return_button b) {
    delete reinterpret_cast<Fl_Return_Button*>(b);
}

