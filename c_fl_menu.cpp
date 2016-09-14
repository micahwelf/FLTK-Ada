

#include <FL/Fl_Menu_.H>
#include "c_fl_menu.h"


int fl_menu_add(MENU m, const char * t, unsigned long s, void * c, void * u, unsigned long f) {
    return reinterpret_cast<Fl_Menu_*>(m)->add(t, s, reinterpret_cast<Fl_Callback_p>(c), u, f);
}

