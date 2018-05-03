

#include <FL/Fl_Menu_Item.H>
#include <FL/Fl_Widget.H>
#include "c_fl_menuitem.h"




void * new_fl_menu_item(char * t, void * c, unsigned long s, unsigned long f) {
    Fl_Menu_Item *mi = new Fl_Menu_Item;
    mi->callback(reinterpret_cast<Fl_Callback*>(c));
    mi->flags = static_cast<int>(f);
    mi->shortcut(static_cast<int>(s));
    mi->label(t);
    return mi;
}

void free_fl_menu_item(MENU_ITEM mi) {
    delete reinterpret_cast<Fl_Menu_Item*>(mi);
}




void * fl_menu_item_get_user_data(MENU_ITEM mi) {
    return reinterpret_cast<Fl_Menu_Item*>(mi)->user_data();
}

void fl_menu_item_set_user_data(MENU_ITEM mi, void * c) {
    reinterpret_cast<Fl_Menu_Item*>(mi)->user_data(c);
}

void fl_menu_item_do_callback(MENU_ITEM mi, void * w) {
    reinterpret_cast<Fl_Menu_Item*>(mi)->do_callback(reinterpret_cast<Fl_Widget*>(w));
}




int fl_menu_item_checkbox(MENU_ITEM mi) {
    return reinterpret_cast<Fl_Menu_Item*>(mi)->checkbox();
}

int fl_menu_item_radio(MENU_ITEM mi) {
    return reinterpret_cast<Fl_Menu_Item*>(mi)->radio();
}

int fl_menu_item_value(MENU_ITEM mi) {
    return reinterpret_cast<Fl_Menu_Item*>(mi)->value();
}

void fl_menu_item_set(MENU_ITEM mi) {
    reinterpret_cast<Fl_Menu_Item*>(mi)->set();
}

void fl_menu_item_clear(MENU_ITEM mi) {
    reinterpret_cast<Fl_Menu_Item*>(mi)->clear();
}

void fl_menu_item_setonly(MENU_ITEM mi) {
    reinterpret_cast<Fl_Menu_Item*>(mi)->setonly();
}




const char * fl_menu_item_get_label(MENU_ITEM mi) {
    return reinterpret_cast<Fl_Menu_Item*>(mi)->label();
}

void fl_menu_item_set_label(MENU_ITEM mi, const char *t) {
    reinterpret_cast<Fl_Menu_Item*>(mi)->label(t);
}

unsigned int fl_menu_item_get_labelcolor(MENU_ITEM mi) {
    return reinterpret_cast<Fl_Menu_Item*>(mi)->labelcolor();
}

void fl_menu_item_set_labelcolor(MENU_ITEM mi, unsigned int c) {
    reinterpret_cast<Fl_Menu_Item*>(mi)->labelcolor(c);
}

int fl_menu_item_get_labelfont(MENU_ITEM mi) {
    return reinterpret_cast<Fl_Menu_Item*>(mi)->labelfont();
}

void fl_menu_item_set_labelfont(MENU_ITEM mi, int f) {
    reinterpret_cast<Fl_Menu_Item*>(mi)->labelfont(f);
}

int fl_menu_item_get_labelsize(MENU_ITEM mi) {
    return reinterpret_cast<Fl_Menu_Item*>(mi)->labelsize();
}

void fl_menu_item_set_labelsize(MENU_ITEM mi, int s) {
    reinterpret_cast<Fl_Menu_Item*>(mi)->labelsize(s);
}

int fl_menu_item_get_labeltype(MENU_ITEM mi) {
    return reinterpret_cast<Fl_Menu_Item*>(mi)->labeltype();
}

void fl_menu_item_set_labeltype(MENU_ITEM mi, int t) {
    reinterpret_cast<Fl_Menu_Item*>(mi)->labeltype(static_cast<Fl_Labeltype>(t));
}




int fl_menu_item_get_shortcut(MENU_ITEM mi) {
    return reinterpret_cast<Fl_Menu_Item*>(mi)->shortcut();
}

void fl_menu_item_set_shortcut(MENU_ITEM mi, int s) {
    reinterpret_cast<Fl_Menu_Item*>(mi)->shortcut(s);
}




void fl_menu_item_activate(MENU_ITEM mi) {
    reinterpret_cast<Fl_Menu_Item*>(mi)->activate();
}

void fl_menu_item_deactivate(MENU_ITEM mi) {
    reinterpret_cast<Fl_Menu_Item*>(mi)->deactivate();
}

void fl_menu_item_show(MENU_ITEM mi) {
    reinterpret_cast<Fl_Menu_Item*>(mi)->show();
}

void fl_menu_item_hide(MENU_ITEM mi) {
    reinterpret_cast<Fl_Menu_Item*>(mi)->hide();
}

int fl_menu_item_active(MENU_ITEM mi) {
    return reinterpret_cast<Fl_Menu_Item*>(mi)->active();
}

int fl_menu_item_visible(MENU_ITEM mi) {
    return reinterpret_cast<Fl_Menu_Item*>(mi)->visible();
}

int fl_menu_item_activevisible(MENU_ITEM mi) {
    return reinterpret_cast<Fl_Menu_Item*>(mi)->activevisible();
}


