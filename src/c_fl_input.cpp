

#include <FL/Fl_Input.H>
#include "c_fl_input.h"
#include "c_fl_type.h"




class My_Input : public Fl_Input {
    public:
        using Fl_Input::Fl_Input;
        friend void input_set_draw_hook(INPUT i, void * d);
        friend void fl_input_draw(INPUT i);
        friend void input_set_handle_hook(INPUT i, void * h);
        friend int fl_input_handle(INPUT i, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Input::draw() {
    (*draw_hook)(this->user_data());
}

void My_Input::real_draw() {
    Fl_Input::draw();
}

int My_Input::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Input::real_handle(int e) {
    return Fl_Input::handle(e);
}

void input_set_draw_hook(INPUT i, void * d) {
    reinterpret_cast<My_Input*>(i)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_input_draw(INPUT i) {
    reinterpret_cast<My_Input*>(i)->real_draw();
}

void input_set_handle_hook(INPUT i, void * h) {
    reinterpret_cast<My_Input*>(i)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_input_handle(INPUT i, int e) {
    return reinterpret_cast<My_Input*>(i)->real_handle(e);
}




INPUT new_fl_input(int x, int y, int w, int h, char* label) {
    My_Input *i = new My_Input(x, y, w, h, label);
    return i;
}

void free_fl_input(INPUT i) {
    delete reinterpret_cast<My_Input*>(i);
}




int fl_input_copy(INPUT i) {
    return reinterpret_cast<Fl_Input*>(i)->copy(1);
}

int fl_input_cut(INPUT i) {
    return reinterpret_cast<Fl_Input*>(i)->cut();
}

int fl_input_cut2(INPUT i, int b) {
    return reinterpret_cast<Fl_Input*>(i)->cut(b);
}

int fl_input_cut3(INPUT i, int a, int b) {
    return reinterpret_cast<Fl_Input*>(i)->cut(a,b);
}

int fl_input_copy_cuts(INPUT i) {
    return reinterpret_cast<Fl_Input*>(i)->copy_cuts();
}




int fl_input_get_readonly(INPUT i) {
    return reinterpret_cast<Fl_Input*>(i)->readonly();
}

void fl_input_set_readonly(INPUT i, int t) {
    reinterpret_cast<Fl_Input*>(i)->readonly(t);
}




const char * fl_input_get_value(INPUT i) {
    return reinterpret_cast<Fl_Input*>(i)->value();
}

void fl_input_set_value(INPUT i, char * s, int len) {
    reinterpret_cast<Fl_Input*>(i)->value(s,len);
}




unsigned int fl_input_get_textcolor(INPUT i) {
    return reinterpret_cast<Fl_Input*>(i)->textcolor();
}

void fl_input_set_textcolor(INPUT i, unsigned int t) {
    reinterpret_cast<Fl_Input*>(i)->textcolor(t);
}

int fl_input_get_textfont(INPUT i) {
    return reinterpret_cast<Fl_Input*>(i)->textfont();
}

void fl_input_set_textfont(INPUT i, int t) {
    reinterpret_cast<Fl_Input*>(i)->textfont(t);
}

int fl_input_get_textsize(INPUT i) {
    return reinterpret_cast<Fl_Input*>(i)->textsize();
}

void fl_input_set_textsize(INPUT i, int t) {
    reinterpret_cast<Fl_Input*>(i)->textsize(t);
}


