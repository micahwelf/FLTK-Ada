

#include <FL/Fl_Secret_Input.H>
#include "c_fl_secret_input.h"




typedef void (d_hook)(void*);
typedef d_hook* d_hook_p;


typedef int (h_hook)(void*,int);
typedef h_hook* h_hook_p;




class My_Secret_Input : public Fl_Secret_Input {
    public:
        using Fl_Secret_Input::Fl_Secret_Input;
        friend void secret_input_set_draw_hook(SECRET_INPUT i, void * d);
        friend void fl_secret_input_draw(SECRET_INPUT i);
        friend void secret_input_set_handle_hook(SECRET_INPUT i, void * h);
        friend int fl_secret_input_handle(SECRET_INPUT i, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};


void My_Secret_Input::draw() {
    (*draw_hook)(this->user_data());
}


void My_Secret_Input::real_draw() {
    Fl_Secret_Input::draw();
}


int My_Secret_Input::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}


int My_Secret_Input::real_handle(int e) {
    return Fl_Secret_Input::handle(e);
}


void secret_input_set_draw_hook(SECRET_INPUT i, void * d) {
    reinterpret_cast<My_Secret_Input*>(i)->draw_hook = reinterpret_cast<d_hook_p>(d);
}


void fl_secret_input_draw(SECRET_INPUT i) {
    reinterpret_cast<My_Secret_Input*>(i)->real_draw();
}


void secret_input_set_handle_hook(SECRET_INPUT i, void * h) {
    reinterpret_cast<My_Secret_Input*>(i)->handle_hook = reinterpret_cast<h_hook_p>(h);
}


int fl_secret_input_handle(SECRET_INPUT i, int e) {
    return reinterpret_cast<My_Secret_Input*>(i)->real_handle(e);
}




SECRET_INPUT new_fl_secret_input(int x, int y, int w, int h, char* label) {
    My_Secret_Input *i = new My_Secret_Input(x, y, w, h, label);
    return i;
}


void free_fl_secret_input(SECRET_INPUT i) {
    delete reinterpret_cast<My_Secret_Input*>(i);
}


