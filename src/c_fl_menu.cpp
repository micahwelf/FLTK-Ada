

#include <FL/Fl_Menu_.H>
#include <FL/Fl_Menu_Item.H>
#include "c_fl_menu.h"


typedef void (hook)(void*);
typedef hook* hook_p;




class My_Menu : public Fl_Menu_ {
    public:
        using Fl_Menu_::Fl_Menu_;
        friend void menu_set_draw_hook(MENU m, void * d);
        friend void fl_menu_draw(MENU m);
    protected:
        void draw();
        void real_draw();
        hook_p draw_hook;
};


void My_Menu::draw() {
    (*draw_hook)(this->user_data());
}


void My_Menu::real_draw() {
    //Fl_Menu_::draw();
}


void menu_set_draw_hook(MENU m, void * d) {
    reinterpret_cast<My_Menu*>(m)->draw_hook = reinterpret_cast<hook_p>(d);
}


void fl_menu_draw(MENU m) {
    reinterpret_cast<My_Menu*>(m)->real_draw();
}




MENU new_fl_menu(int x, int y, int w, int h, char* label) {
    My_Menu *m = new My_Menu(x, y, w, h, label);
    return m;
}


void free_fl_menu(MENU m) {
    delete reinterpret_cast<My_Menu*>(m);
}




int fl_menu_add(MENU m, const char * t, unsigned long s, void * c, void * u, unsigned long f) {
    return reinterpret_cast<My_Menu*>(m)->add(t, s, reinterpret_cast<Fl_Callback_p>(c), u, f);
}


const void * fl_menu_find_item(MENU m, const char * t) {
    return reinterpret_cast<My_Menu*>(m)->find_item(t);
}


const void * fl_menu_mvalue(MENU m) {
    return reinterpret_cast<My_Menu*>(m)->mvalue();
}




int fl_menuitem_value(void * mi) {
    return reinterpret_cast<Fl_Menu_Item*>(mi)->value();
}


void fl_menuitem_activate(void * mi) {
    reinterpret_cast<Fl_Menu_Item*>(mi)->activate();
}


void fl_menuitem_deactivate(void * mi) {
    reinterpret_cast<Fl_Menu_Item*>(mi)->deactivate();
}

