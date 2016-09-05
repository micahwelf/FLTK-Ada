

#include <FL/Fl_Menu_Item.H>
#include "c_fl_menu_item.h"


MENUITEM new_fl_menu_item(char* label, void* c, unsigned long k, unsigned short f) {
    Fl_Menu_Item *m = new Fl_Menu_Item;
    m->add(label, k, reinterpret_cast<void (*)(Fl_Widget*,void*)>(c), 0, f);
    return m;
}


void free_fl_menu_item(MENUITEM m) {
    delete reinterpret_cast<Fl_Menu_Item*>(m);
}

