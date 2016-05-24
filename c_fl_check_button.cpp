

#include <FL/Fl_Check_Button.H>
#include "c_fl_check_button.h"


my_fl_check_button new_fl_check_button(int x, int y, int w, int h, char * label) {
    Fl_Check_Button *button = new Fl_Check_Button(x, y, w, h, label);
    return button;
}


void free_fl_check_button(my_fl_check_button b) {
    delete reinterpret_cast<Fl_Check_Button*>(b);
}

