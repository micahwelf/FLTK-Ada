

#include <FL/Fl_Menu_.H>
#include "c_fl_menu.h"
#include "c_fl_type.h"




class My_Menu : public Fl_Menu_ {
    public:
        using Fl_Menu_::Fl_Menu_;
        friend void menu_set_draw_hook(MENU m, void * d);
        friend void menu_set_handle_hook(MENU m, void * h);
    protected:
        void draw();
        int handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};


void My_Menu::draw() {
    (*draw_hook)(this->user_data());
}


int My_Menu::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}


void menu_set_draw_hook(MENU m, void * d) {
    reinterpret_cast<My_Menu*>(m)->draw_hook = reinterpret_cast<d_hook_p>(d);
}


void menu_set_handle_hook(MENU m, void * h) {
    reinterpret_cast<My_Menu*>(m)->handle_hook = reinterpret_cast<h_hook_p>(h);
}




MENU new_fl_menu(int x, int y, int w, int h, char* label) {
    My_Menu *m = new My_Menu(x, y, w, h, label);
    return m;
}


void free_fl_menu(MENU m) {
    delete reinterpret_cast<My_Menu*>(m);
}




int fl_menu_add(MENU m, const char * t, unsigned long s, void * c, void * u, unsigned long f) {
    return reinterpret_cast<Fl_Menu_*>(m)->add(t, s, reinterpret_cast<Fl_Callback_p>(c), u, f);
}


const void * fl_menu_find_item(MENU m, const char * t) {
    return reinterpret_cast<Fl_Menu_*>(m)->find_item(t);
}


const void * fl_menu_mvalue(MENU m) {
    return reinterpret_cast<Fl_Menu_*>(m)->mvalue();
}

