

#include <FL/Fl_Menu_.H>
#include <FL/Fl_Menu_Item.H>
#include "c_fl_menu.h"


int fl_menu_add(MENU m, const char * t, unsigned long s, void * c, void * u, unsigned long f) {
    return reinterpret_cast<Fl_Menu_*>(m)->add(t, s, reinterpret_cast<Fl_Callback_p>(c), u, f);
}


const void * fl_menu_mvalue(MENU m) {
    return reinterpret_cast<Fl_Menu_*>(m)->mvalue();
}




int fl_menuitem_value(void * mi) {
    return reinterpret_cast<Fl_Menu_Item*>(mi)->value();
}

