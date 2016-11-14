

#include <FL/Fl_Menu_Button.H>
#include "c_fl_menu_button.h"


MENUBUTTON new_fl_menu_button(int x, int y, int w, int h, char* label) {
    Fl_Menu_Button *m = new Fl_Menu_Button(x, y, w, h, label);
    return m;
}


void free_fl_menu_button(MENUBUTTON m) {
    delete reinterpret_cast<Fl_Menu_Button*>(m);
}


void fl_menu_button_type(MENUBUTTON m, unsigned int t) {
    reinterpret_cast<Fl_Menu_Button*>(m)->type(t);
}

