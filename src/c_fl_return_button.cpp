

#include <FL/Fl_Return_Button.H>
#include "c_fl_return_button.h"
#include "c_fl_type.h"




class My_Return_Button : public Fl_Return_Button {
    public:
        using Fl_Return_Button::Fl_Return_Button;
        friend void return_button_set_draw_hook(RETURNBUTTON b, void * d);
        friend void fl_return_button_draw(RETURNBUTTON b);
        friend void return_button_set_handle_hook(RETURNBUTTON b, void * h);
        friend int fl_return_button_handle(RETURNBUTTON b, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};


void My_Return_Button::draw() {
    (*draw_hook)(this->user_data());
}


void My_Return_Button::real_draw() {
    Fl_Return_Button::draw();
}


int My_Return_Button::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}


int My_Return_Button::real_handle(int e) {
    return Fl_Return_Button::handle(e);
}


void return_button_set_draw_hook(RETURNBUTTON b, void * d) {
    reinterpret_cast<My_Return_Button*>(b)->draw_hook = reinterpret_cast<d_hook_p>(d);
}


void fl_return_button_draw(RETURNBUTTON b) {
    reinterpret_cast<My_Return_Button*>(b)->real_draw();
}


void return_button_set_handle_hook(RETURNBUTTON b, void * h) {
    reinterpret_cast<My_Return_Button*>(b)->handle_hook = reinterpret_cast<h_hook_p>(h);
}


int fl_return_button_handle(RETURNBUTTON b, int e) {
    return reinterpret_cast<My_Return_Button*>(b)->real_handle(e);
}




RETURNBUTTON new_fl_return_button(int x, int y, int w, int h, char* label) {
    My_Return_Button *b = new My_Return_Button(x, y, w, h, label);
    return b;
}


void free_fl_return_button(RETURNBUTTON b) {
    delete reinterpret_cast<My_Return_Button*>(b);
}

