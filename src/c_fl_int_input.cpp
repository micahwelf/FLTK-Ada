

#include <FL/Fl_Int_Input.H>
#include "c_fl_int_input.h"
#include "c_fl_type.h"




class My_Int_Input : public Fl_Int_Input {
    public:
        using Fl_Int_Input::Fl_Int_Input;
        friend void int_input_set_draw_hook(INT_INPUT i, void * d);
        friend void fl_int_input_draw(INT_INPUT i);
        friend void int_input_set_handle_hook(INT_INPUT i, void * h);
        friend int fl_int_input_handle(INT_INPUT i, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Int_Input::draw() {
    (*draw_hook)(this->user_data());
}

void My_Int_Input::real_draw() {
    Fl_Int_Input::draw();
}

int My_Int_Input::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Int_Input::real_handle(int e) {
    return Fl_Int_Input::handle(e);
}

void int_input_set_draw_hook(INT_INPUT i, void * d) {
    reinterpret_cast<My_Int_Input*>(i)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_int_input_draw(INT_INPUT i) {
    reinterpret_cast<My_Int_Input*>(i)->real_draw();
}

void int_input_set_handle_hook(INT_INPUT i, void * h) {
    reinterpret_cast<My_Int_Input*>(i)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_int_input_handle(INT_INPUT i, int e) {
    return reinterpret_cast<My_Int_Input*>(i)->real_handle(e);
}




INT_INPUT new_fl_int_input(int x, int y, int w, int h, char* label) {
    My_Int_Input *i = new My_Int_Input(x, y, w, h, label);
    return i;
}

void free_fl_int_input(INT_INPUT i) {
    delete reinterpret_cast<My_Int_Input*>(i);
}


