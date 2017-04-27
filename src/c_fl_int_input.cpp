

#include <FL/Fl_Int_Input.H>
#include "c_fl_int_input.h"


INT_INPUT new_fl_int_input(int x, int y, int w, int h, char* label) {
    Fl_Int_Input *i = new Fl_Int_Input(x, y, w, h, label);
    return i;
}


void free_fl_int_input(INT_INPUT i) {
    delete reinterpret_cast<Fl_Int_Input*>(i);
}


const char * fl_int_input_get_value(INT_INPUT i) {
    return reinterpret_cast<Fl_Int_Input*>(i)->value();
}

