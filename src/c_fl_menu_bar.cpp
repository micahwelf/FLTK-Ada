

#include <FL/Fl_Menu_Bar.H>
#include "c_fl_menu_bar.h"
#include "c_fl_type.h"




class My_Menu_Bar : public Fl_Menu_Bar {
    public:
        using Fl_Menu_Bar::Fl_Menu_Bar;
        friend void menu_bar_set_draw_hook(MENUBAR m, void * d);
        friend void fl_menu_bar_draw(MENUBAR m);
        friend void menu_bar_set_handle_hook(MENUBAR m, void * h);
        friend int fl_menu_bar_handle(MENUBAR m, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Menu_Bar::draw() {
    (*draw_hook)(this->user_data());
}

void My_Menu_Bar::real_draw() {
    Fl_Menu_Bar::draw();
}

int My_Menu_Bar::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Menu_Bar::real_handle(int e) {
    return Fl_Menu_Bar::handle(e);
}

void menu_bar_set_draw_hook(MENUBAR m, void * d) {
    reinterpret_cast<My_Menu_Bar*>(m)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_menu_bar_draw(MENUBAR m) {
    reinterpret_cast<My_Menu_Bar*>(m)->real_draw();
}

void menu_bar_set_handle_hook(MENUBAR m, void * h) {
    reinterpret_cast<My_Menu_Bar*>(m)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_menu_bar_handle(MENUBAR m, int e) {
    return reinterpret_cast<My_Menu_Bar*>(m)->real_handle(e);
}




MENUBAR new_fl_menu_bar(int x, int y, int w, int h, char* label) {
    My_Menu_Bar *m = new My_Menu_Bar(x, y, w, h, label);
    return m;
}

void free_fl_menu_bar(MENUBAR m) {
    delete reinterpret_cast<My_Menu_Bar*>(m);
}

