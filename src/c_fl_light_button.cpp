

#include <FL/Fl_Light_Button.H>
#include "c_fl_light_button.h"
#include "c_fl_type.h"




class My_Light_Button : public Fl_Light_Button {
    public:
        using Fl_Light_Button::Fl_Light_Button;
        friend void light_button_set_draw_hook(LIGHTBUTTON b, void * d);
        friend void fl_light_button_draw(LIGHTBUTTON b);
        friend void light_button_set_handle_hook(LIGHTBUTTON b, void * h);
        friend int fl_light_button_handle(LIGHTBUTTON b, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};


void My_Light_Button::draw() {
    (*draw_hook)(this->user_data());
}


void My_Light_Button::real_draw() {
    Fl_Light_Button::draw();
}


int My_Light_Button::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}


int My_Light_Button::real_handle(int e) {
    return Fl_Light_Button::handle(e);
}


void light_button_set_draw_hook(LIGHTBUTTON b, void * d) {
    reinterpret_cast<My_Light_Button*>(b)->draw_hook = reinterpret_cast<d_hook_p>(d);
}


void fl_light_button_draw(LIGHTBUTTON b) {
    reinterpret_cast<My_Light_Button*>(b)->real_draw();
}


void light_button_set_handle_hook(LIGHTBUTTON b, void * h) {
    reinterpret_cast<My_Light_Button*>(b)->handle_hook = reinterpret_cast<h_hook_p>(h);
}


int fl_light_button_handle(LIGHTBUTTON b, int e) {
    return reinterpret_cast<My_Light_Button*>(b)->real_handle(e);
}




LIGHTBUTTON new_fl_light_button(int x, int y, int w, int h, char* label) {
    My_Light_Button *b = new My_Light_Button(x, y, w, h, label);
    return b;
}


void free_fl_light_button(LIGHTBUTTON b) {
    delete reinterpret_cast<My_Light_Button*>(b);
}

