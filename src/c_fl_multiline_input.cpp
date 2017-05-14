

#include <FL/Fl_Multiline_Input.H>
#include "c_fl_multiline_input.h"




typedef void (d_hook)(void*);
typedef d_hook* d_hook_p;


typedef int (h_hook)(void*,int);
typedef h_hook* h_hook_p;




class My_Multiline_Input : public Fl_Multiline_Input {
    public:
        using Fl_Multiline_Input::Fl_Multiline_Input;
        friend void multiline_input_set_draw_hook(MULTILINE_INPUT i, void * d);
        friend void fl_multiline_input_draw(MULTILINE_INPUT i);
        friend void multiline_input_set_handle_hook(MULTILINE_INPUT i, void * h);
        friend int fl_multiline_input_handle(MULTILINE_INPUT i, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};


void My_Multiline_Input::draw() {
    (*draw_hook)(this->user_data());
}


void My_Multiline_Input::real_draw() {
    Fl_Multiline_Input::draw();
}


int My_Multiline_Input::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}


int My_Multiline_Input::real_handle(int e) {
    return Fl_Multiline_Input::handle(e);
}


void multiline_input_set_draw_hook(MULTILINE_INPUT i, void * d) {
    reinterpret_cast<My_Multiline_Input*>(i)->draw_hook = reinterpret_cast<d_hook_p>(d);
}


void fl_multiline_input_draw(MULTILINE_INPUT i) {
    reinterpret_cast<My_Multiline_Input*>(i)->real_draw();
}


void multiline_input_set_handle_hook(MULTILINE_INPUT i, void * h) {
    reinterpret_cast<My_Multiline_Input*>(i)->handle_hook = reinterpret_cast<h_hook_p>(h);
}


int fl_multiline_input_handle(MULTILINE_INPUT i, int e) {
    return reinterpret_cast<My_Multiline_Input*>(i)->real_handle(e);
}




MULTILINE_INPUT new_fl_multiline_input(int x, int y, int w, int h, char* label) {
    My_Multiline_Input *i = new My_Multiline_Input(x, y, w, h, label);
    return i;
}


void free_fl_multiline_input(MULTILINE_INPUT i) {
    delete reinterpret_cast<My_Multiline_Input*>(i);
}


