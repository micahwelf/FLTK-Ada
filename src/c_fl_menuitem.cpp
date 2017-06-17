

#include <FL/Fl_Menu_Item.H>
#include "c_fl_menuitem.h"




int fl_menuitem_value(MENUITEM mi) {
    return reinterpret_cast<Fl_Menu_Item*>(mi)->value();
}




void fl_menuitem_activate(MENUITEM mi) {
    reinterpret_cast<Fl_Menu_Item*>(mi)->activate();
}

void fl_menuitem_deactivate(MENUITEM mi) {
    reinterpret_cast<Fl_Menu_Item*>(mi)->deactivate();
}

