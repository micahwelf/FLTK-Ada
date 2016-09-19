

#include <FL/fl_ask.H>
#include <FL/Fl_File_Chooser.H>
#include <FL/Fl_Color_Chooser.H>
#include "c_fl_popup.h"


void popup_fl_alert(const char * m) {
    fl_alert(m);
}


int popup_fl_choice(const char * m, const char * a, const char * b, const char * c) {
    return fl_choice(m, a, b, c);
}


char * popup_fl_file_chooser(const char * m, const char * p, const char * d, int r) {
    return fl_file_chooser(m, p, d, r);
}


const char * popup_fl_input(const char * m, const char * d) {
    return fl_input(m, d);
}


void popup_fl_message(const char * m) {
    fl_message(m);
}

