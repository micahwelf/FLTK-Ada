

#include <FL/fl_ask.H>
#include <FL/Fl_File_Chooser.H>
#include <FL/Fl_Color_Chooser.H>
#include "c_fl_dialog.h"


void dialog_fl_alert(const char * m) {
    fl_alert(m);
}

//int dialog_fl_ask(const char * m) {
//    return fl_ask(m);
//}

void dialog_fl_beep(int b) {
    fl_beep(b);
}

int dialog_fl_choice(const char * m, const char * a, const char * b, const char * c) {
    return fl_choice(m, a, b, c);
}

const char * dialog_fl_input(const char * m, const char * d) {
    return fl_input(m, d);
}

void dialog_fl_message(const char * m) {
    fl_message(m);
}

const char * dialog_fl_password(const char * m, const char * d) {
    return fl_password(m, d);
}




int dialog_fl_color_chooser(const char * n, double & r, double & g, double & b, int m) {
    return fl_color_chooser(n, r, g, b, m);
}

int dialog_fl_color_chooser2(const char * n, uchar & r, uchar & g, uchar & b, int m) {
    return fl_color_chooser(n, r, g, b, m);
}

char * dialog_fl_dir_chooser(const char * m, const char * d, int r) {
    return fl_dir_chooser(m, d, r);
}

char * dialog_fl_file_chooser(const char * m, const char * p, const char * d, int r) {
    return fl_file_chooser(m, p, d, r);
}




int dialog_fl_get_message_hotspot(void) {
    return fl_message_hotspot();
}

void dialog_fl_set_message_hotspot(int v) {
    fl_message_hotspot(v);
}

void dialog_fl_message_font(int f, int s) {
    fl_message_font(f, s);
}

void * dialog_fl_message_icon(void) {
    return fl_message_icon();
}

void dialog_fl_message_title(const char * t) {
    fl_message_title(t);
}

void dialog_fl_message_title_default(const char * t) {
    fl_message_title_default(t);
}


