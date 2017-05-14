

#include <FL/Fl_Round_Button.H>
#include "c_fl_round_button.h"
#include "c_fl_type.h"




class My_Round_Button : public Fl_Round_Button {
    public:
        using Fl_Round_Button::Fl_Round_Button;
        friend void round_button_set_draw_hook(ROUNDBUTTON b, void * d);
        friend void fl_round_button_draw(ROUNDBUTTON b);
        friend void round_button_set_handle_hook(ROUNDBUTTON b, void * h);
        friend int fl_round_button_handle(ROUNDBUTTON b, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};


void My_Round_Button::draw() {
    (*draw_hook)(this->user_data());
}


void My_Round_Button::real_draw() {
    Fl_Round_Button::draw();
}


int My_Round_Button::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}


int My_Round_Button::real_handle(int e) {
    return Fl_Round_Button::handle(e);
}


void round_button_set_draw_hook(ROUNDBUTTON b, void * d) {
    reinterpret_cast<My_Round_Button*>(b)->draw_hook = reinterpret_cast<d_hook_p>(d);
}


void fl_round_button_draw(ROUNDBUTTON b) {
    reinterpret_cast<My_Round_Button*>(b)->real_draw();
}


void round_button_set_handle_hook(ROUNDBUTTON b, void * h) {
    reinterpret_cast<My_Round_Button*>(b)->handle_hook = reinterpret_cast<h_hook_p>(h);
}


int fl_round_button_handle(ROUNDBUTTON b, int e) {
    return reinterpret_cast<My_Round_Button*>(b)->real_handle(e);
}




ROUNDBUTTON new_fl_round_button(int x, int y, int w, int h, char* label) {
    My_Round_Button *b = new My_Round_Button(x, y, w, h, label);
    return b;
}


void free_fl_round_button(ROUNDBUTTON b) {
    delete reinterpret_cast<My_Round_Button*>(b);
}

