

#include <FL/Fl_Repeat_Button.H>
#include "c_fl_repeat_button.h"
#include "c_fl_type.h"




class My_Repeat_Button : public Fl_Repeat_Button {
    public:
        using Fl_Repeat_Button::Fl_Repeat_Button;
        friend void repeat_button_set_draw_hook(REPEATBUTTON b, void * d);
        friend void fl_repeat_button_draw(REPEATBUTTON b);
        friend void repeat_button_set_handle_hook(REPEATBUTTON b, void * h);
        friend int fl_repeat_button_handle(REPEATBUTTON b, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};


void My_Repeat_Button::draw() {
    (*draw_hook)(this->user_data());
}


void My_Repeat_Button::real_draw() {
    Fl_Repeat_Button::draw();
}


int My_Repeat_Button::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}


int My_Repeat_Button::real_handle(int e) {
    return Fl_Repeat_Button::handle(e);
}


void repeat_button_set_draw_hook(REPEATBUTTON b, void * d) {
    reinterpret_cast<My_Repeat_Button*>(b)->draw_hook = reinterpret_cast<d_hook_p>(d);
}


void fl_repeat_button_draw(REPEATBUTTON b) {
    reinterpret_cast<My_Repeat_Button*>(b)->real_draw();
}


void repeat_button_set_handle_hook(REPEATBUTTON b, void * h) {
    reinterpret_cast<My_Repeat_Button*>(b)->handle_hook = reinterpret_cast<h_hook_p>(h);
}


int fl_repeat_button_handle(REPEATBUTTON b, int e) {
    return reinterpret_cast<My_Repeat_Button*>(b)->real_handle(e);
}




REPEATBUTTON new_fl_repeat_button(int x, int y, int w, int h, char* label) {
    My_Repeat_Button *b = new My_Repeat_Button(x, y, w, h, label);
    return b;
}


void free_fl_repeat_button(REPEATBUTTON b) {
    delete reinterpret_cast<My_Repeat_Button*>(b);
}

