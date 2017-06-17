

#include <FL/Fl_Radio_Light_Button.H>
#include "c_fl_radio_light_button.h"
#include "c_fl_type.h"




class My_Radio_Light_Button : public Fl_Radio_Light_Button {
    public:
        using Fl_Radio_Light_Button::Fl_Radio_Light_Button;
        friend void radio_light_button_set_draw_hook(RADIOLIGHTBUTTON b, void * d);
        friend void fl_radio_light_button_draw(RADIOLIGHTBUTTON b);
        friend void radio_light_button_set_handle_hook(RADIOLIGHTBUTTON b, void * h);
        friend int fl_radio_light_button_handle(RADIOLIGHTBUTTON b, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Radio_Light_Button::draw() {
    (*draw_hook)(this->user_data());
}

void My_Radio_Light_Button::real_draw() {
    Fl_Radio_Light_Button::draw();
}

int My_Radio_Light_Button::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Radio_Light_Button::real_handle(int e) {
    return Fl_Radio_Light_Button::handle(e);
}

void radio_light_button_set_draw_hook(RADIOLIGHTBUTTON b, void * d) {
    reinterpret_cast<My_Radio_Light_Button*>(b)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_radio_light_button_draw(RADIOLIGHTBUTTON b) {
    reinterpret_cast<My_Radio_Light_Button*>(b)->real_draw();
}

void radio_light_button_set_handle_hook(RADIOLIGHTBUTTON b, void * h) {
    reinterpret_cast<My_Radio_Light_Button*>(b)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_radio_light_button_handle(RADIOLIGHTBUTTON b, int e) {
    return reinterpret_cast<My_Radio_Light_Button*>(b)->real_handle(e);
}




RADIOLIGHTBUTTON new_fl_radio_light_button(int x, int y, int w, int h, char* label) {
    My_Radio_Light_Button *b = new My_Radio_Light_Button(x, y, w, h, label);
    return b;
}

void free_fl_radio_light_button(RADIOLIGHTBUTTON b) {
    delete reinterpret_cast<My_Radio_Light_Button*>(b);
}

