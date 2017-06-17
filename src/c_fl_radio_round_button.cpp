

#include <FL/Fl_Radio_Round_Button.H>
#include "c_fl_radio_round_button.h"
#include "c_fl_type.h"




class My_Radio_Round_Button : public Fl_Radio_Round_Button {
    public:
        using Fl_Radio_Round_Button::Fl_Radio_Round_Button;
        friend void radio_round_button_set_draw_hook(RADIOROUNDBUTTON b, void * d);
        friend void fl_radio_round_button_draw(RADIOROUNDBUTTON b);
        friend void radio_round_button_set_handle_hook(RADIOROUNDBUTTON b, void * h);
        friend int fl_radio_round_button_handle(RADIOROUNDBUTTON b, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Radio_Round_Button::draw() {
    (*draw_hook)(this->user_data());
}

void My_Radio_Round_Button::real_draw() {
    Fl_Radio_Round_Button::draw();
}

int My_Radio_Round_Button::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Radio_Round_Button::real_handle(int e) {
    return Fl_Radio_Round_Button::handle(e);
}

void radio_round_button_set_draw_hook(RADIOROUNDBUTTON b, void * d) {
    reinterpret_cast<My_Radio_Round_Button*>(b)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_radio_round_button_draw(RADIOROUNDBUTTON b) {
    reinterpret_cast<My_Radio_Round_Button*>(b)->real_draw();
}

void radio_round_button_set_handle_hook(RADIOROUNDBUTTON b, void * h) {
    reinterpret_cast<My_Radio_Round_Button*>(b)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_radio_round_button_handle(RADIOROUNDBUTTON b, int e) {
    return reinterpret_cast<My_Radio_Round_Button*>(b)->real_handle(e);
}




RADIOROUNDBUTTON new_fl_radio_round_button(int x, int y, int w, int h, char* label) {
    My_Radio_Round_Button *b = new My_Radio_Round_Button(x, y, w, h, label);
    return b;
}

void free_fl_radio_round_button(RADIOROUNDBUTTON b) {
    delete reinterpret_cast<My_Radio_Round_Button*>(b);
}

