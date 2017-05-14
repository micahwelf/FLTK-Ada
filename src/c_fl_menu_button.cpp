

#include <FL/Fl_Menu_Button.H>
#include "c_fl_menu_button.h"
#include "c_fl_type.h"




class My_Menu_Button : public Fl_Menu_Button {
    public:
        using Fl_Menu_Button::Fl_Menu_Button;
        friend void menu_button_set_draw_hook(MENUBUTTON m, void * d);
        friend void fl_menu_button_draw(MENUBUTTON m);
        friend void menu_button_set_handle_hook(MENUBUTTON m, void * h);
        friend int fl_menu_button_handle(MENUBUTTON m, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};


void My_Menu_Button::draw() {
    (*draw_hook)(this->user_data());
}


void My_Menu_Button::real_draw() {
    Fl_Menu_Button::draw();
}


int My_Menu_Button::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}


int My_Menu_Button::real_handle(int e) {
    return Fl_Menu_Button::handle(e);
}


void menu_button_set_draw_hook(MENUBUTTON m, void * d) {
    reinterpret_cast<My_Menu_Button*>(m)->draw_hook = reinterpret_cast<d_hook_p>(d);
}


void fl_menu_button_draw(MENUBUTTON m) {
    reinterpret_cast<My_Menu_Button*>(m)->real_draw();
}


void menu_button_set_handle_hook(MENUBUTTON m, void * h) {
    reinterpret_cast<My_Menu_Button*>(m)->handle_hook = reinterpret_cast<h_hook_p>(h);
}


int fl_menu_button_handle(MENUBUTTON m, int e) {
    return reinterpret_cast<My_Menu_Button*>(m)->real_handle(e);
}




MENUBUTTON new_fl_menu_button(int x, int y, int w, int h, char* label) {
    My_Menu_Button *m = new My_Menu_Button(x, y, w, h, label);
    return m;
}


void free_fl_menu_button(MENUBUTTON m) {
    delete reinterpret_cast<My_Menu_Button*>(m);
}




void fl_menu_button_type(MENUBUTTON m, unsigned int t) {
    reinterpret_cast<Fl_Menu_Button*>(m)->type(t);
}

