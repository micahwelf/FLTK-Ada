

#include <FL/Fl_Menu_Window.H>
#include "c_fl_menu_window.h"


typedef void (hook)(void*);
typedef hook* hook_p;




class My_Menu_Window : public Fl_Menu_Window {
    public:
        using Fl_Menu_Window::Fl_Menu_Window;
        friend void menu_window_set_draw_hook(MENUWINDOW n, void * d);
        friend void fl_menu_window_draw(MENUWINDOW n);
    protected:
        void draw();
        void real_draw();
        hook_p draw_hook;
};


void My_Menu_Window::draw() {
    (*draw_hook)(this->user_data());
}


void My_Menu_Window::real_draw() {
    Fl_Menu_Window::draw();
}


void menu_window_set_draw_hook(MENUWINDOW n, void * d) {
    reinterpret_cast<My_Menu_Window*>(n)->draw_hook = reinterpret_cast<hook_p>(d);
}


void fl_menu_window_draw(MENUWINDOW n) {
    reinterpret_cast<My_Menu_Window*>(n)->real_draw();
}




MENUWINDOW new_fl_menu_window(int x, int y, int w, int h, char* label) {
    My_Menu_Window *m = new My_Menu_Window(x, y, w, h, label);
    return m;
}


MENUWINDOW new_fl_menu_window2(int w, int h) {
    My_Menu_Window *m = new My_Menu_Window(w, h);
    return m;
}


void free_fl_menu_window(MENUWINDOW m) {
    delete reinterpret_cast<My_Menu_Window*>(m);
}




void fl_menu_window_show(MENUWINDOW m) {
    reinterpret_cast<My_Menu_Window*>(m)->show();
}


void fl_menu_window_hide(MENUWINDOW m) {
    reinterpret_cast<My_Menu_Window*>(m)->hide();
}


void fl_menu_window_flush(MENUWINDOW m) {
    reinterpret_cast<My_Menu_Window*>(m)->flush();
}


void fl_menu_window_set_overlay(MENUWINDOW m) {
    reinterpret_cast<My_Menu_Window*>(m)->set_overlay();
}


void fl_menu_window_clear_overlay(MENUWINDOW m) {
    reinterpret_cast<My_Menu_Window*>(m)->clear_overlay();
}


unsigned int fl_menu_window_overlay(MENUWINDOW m) {
    return reinterpret_cast<My_Menu_Window*>(m)->overlay();
}

