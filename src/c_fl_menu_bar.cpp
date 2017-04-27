

#include <FL/Fl_Menu_Bar.H>
#include "c_fl_menu_bar.h"


MENUBAR new_fl_menu_bar(int x, int y, int w, int h, char* label) {
    Fl_Menu_Bar *m = new Fl_Menu_Bar(x, y, w, h, label);
    return m;
}


void free_fl_menu_bar(MENUBAR m) {
    delete reinterpret_cast<Fl_Menu_Bar*>(m);
}

