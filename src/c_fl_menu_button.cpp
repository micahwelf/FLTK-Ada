

#include <FL/Fl_Menu_Button.H>
#include "c_fl_menu_button.h"


typedef void (hook)(void*);
typedef hook* hook_p;




class My_Menu_Button : public Fl_Menu_Button {
    public:
        using Fl_Menu_Button::Fl_Menu_Button;
        friend void menu_button_set_draw_hook(MENUBUTTON m, void * d);
        friend void fl_menu_button_draw(MENUBUTTON m);
    protected:
        void draw();
        void real_draw();
        hook_p draw_hook;
};


void My_Menu_Button::draw() {
    (*draw_hook)(this->user_data());
}


void My_Menu_Button::real_draw() {
    Fl_Menu_Button::draw();
}


void menu_button_set_draw_hook(MENUBUTTON m, void * d) {
    reinterpret_cast<My_Menu_Button*>(m)->draw_hook = reinterpret_cast<hook_p>(d);
}


void fl_menu_button_draw(MENUBUTTON m) {
    reinterpret_cast<My_Menu_Button*>(m)->real_draw();
}




MENUBUTTON new_fl_menu_button(int x, int y, int w, int h, char* label) {
    My_Menu_Button *m = new My_Menu_Button(x, y, w, h, label);
    return m;
}


void free_fl_menu_button(MENUBUTTON m) {
    delete reinterpret_cast<My_Menu_Button*>(m);
}




void fl_menu_button_type(MENUBUTTON m, unsigned int t) {
    reinterpret_cast<My_Menu_Button*>(m)->type(t);
}

