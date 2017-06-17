

#include <FL/Fl_Toggle_Button.H>
#include "c_fl_toggle_button.h"
#include "c_fl_type.h"




class My_Toggle_Button : public Fl_Toggle_Button {
    public:
        using Fl_Toggle_Button::Fl_Toggle_Button;
        friend void toggle_button_set_draw_hook(TOGGLEBUTTON b, void * d);
        friend void fl_toggle_button_draw(TOGGLEBUTTON b);
        friend void toggle_button_set_handle_hook(TOGGLEBUTTON b, void * h);
        friend int fl_toggle_button_handle(TOGGLEBUTTON b, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Toggle_Button::draw() {
    (*draw_hook)(this->user_data());
}

void My_Toggle_Button::real_draw() {
    Fl_Toggle_Button::draw();
}

int My_Toggle_Button::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Toggle_Button::real_handle(int e) {
    return Fl_Toggle_Button::handle(e);
}

void toggle_button_set_draw_hook(TOGGLEBUTTON b, void * d) {
    reinterpret_cast<My_Toggle_Button*>(b)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_toggle_button_draw(TOGGLEBUTTON b) {
    reinterpret_cast<My_Toggle_Button*>(b)->real_draw();
}

void toggle_button_set_handle_hook(TOGGLEBUTTON b, void * h) {
    reinterpret_cast<My_Toggle_Button*>(b)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_toggle_button_handle(TOGGLEBUTTON b, int e) {
    return reinterpret_cast<My_Toggle_Button*>(b)->real_handle(e);
}




TOGGLEBUTTON new_fl_toggle_button(int x, int y, int w, int h, char* label) {
    My_Toggle_Button *b = new My_Toggle_Button(x, y, w, h, label);
    return b;
}

void free_fl_toggle_button(TOGGLEBUTTON b) {
    delete reinterpret_cast<My_Toggle_Button*>(b);
}

