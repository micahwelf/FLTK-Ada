

#include <FL/Fl_Menu_Bar.H>
#include "c_fl_menu_bar.h"


typedef void (hook)(void*);
typedef hook* hook_p;




class My_Menu_Bar : public Fl_Menu_Bar {
    public:
        using Fl_Menu_Bar::Fl_Menu_Bar;
        friend void menu_bar_set_draw_hook(MENUBAR m, void * d);
        friend void fl_menu_bar_draw(MENUBAR m);
    protected:
        void draw();
        void real_draw();
        hook_p draw_hook;
};


void My_Menu_Bar::draw() {
    (*draw_hook)(this->user_data());
}


void My_Menu_Bar::real_draw() {
    Fl_Menu_Bar::draw();
}


void menu_bar_set_draw_hook(MENUBAR m, void * d) {
    reinterpret_cast<My_Menu_Bar*>(m)->draw_hook = reinterpret_cast<hook_p>(d);
}


void fl_menu_bar_draw(MENUBAR m) {
    reinterpret_cast<My_Menu_Bar*>(m)->real_draw();
}




MENUBAR new_fl_menu_bar(int x, int y, int w, int h, char* label) {
    My_Menu_Bar *m = new My_Menu_Bar(x, y, w, h, label);
    return m;
}


void free_fl_menu_bar(MENUBAR m) {
    delete reinterpret_cast<My_Menu_Bar*>(m);
}

