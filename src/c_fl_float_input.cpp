

#include <FL/Fl_Float_Input.H>
#include "c_fl_float_input.h"
#include "c_fl_type.h"




class My_Float_Input : public Fl_Float_Input {
    public:
        using Fl_Float_Input::Fl_Float_Input;
        friend void float_input_set_draw_hook(FLOAT_INPUT i, void * d);
        friend void fl_float_input_draw(FLOAT_INPUT i);
        friend void float_input_set_handle_hook(FLOAT_INPUT i, void * h);
        friend int fl_float_input_handle(FLOAT_INPUT i, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};


void My_Float_Input::draw() {
    (*draw_hook)(this->user_data());
}


void My_Float_Input::real_draw() {
    Fl_Float_Input::draw();
}


int My_Float_Input::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}


int My_Float_Input::real_handle(int e) {
    return Fl_Float_Input::handle(e);
}


void float_input_set_draw_hook(FLOAT_INPUT i, void * d) {
    reinterpret_cast<My_Float_Input*>(i)->draw_hook = reinterpret_cast<d_hook_p>(d);
}


void fl_float_input_draw(FLOAT_INPUT i) {
    reinterpret_cast<My_Float_Input*>(i)->real_draw();
}


void float_input_set_handle_hook(FLOAT_INPUT i, void * h) {
    reinterpret_cast<My_Float_Input*>(i)->handle_hook = reinterpret_cast<h_hook_p>(h);
}


int fl_float_input_handle(FLOAT_INPUT i, int e) {
    return reinterpret_cast<My_Float_Input*>(i)->real_handle(e);
}




FLOAT_INPUT new_fl_float_input(int x, int y, int w, int h, char* label) {
    My_Float_Input *i = new My_Float_Input(x, y, w, h, label);
    return i;
}


void free_fl_float_input(FLOAT_INPUT i) {
    delete reinterpret_cast<My_Float_Input*>(i);
}


