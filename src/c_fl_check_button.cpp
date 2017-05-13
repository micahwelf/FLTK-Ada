

#include <FL/Fl_Check_Button.H>
#include "c_fl_check_button.h"




typedef void (d_hook)(void*);
typedef d_hook* d_hook_p;


typedef int (h_hook)(void*,int);
typedef h_hook* h_hook_p;




class My_Check_Button : public Fl_Check_Button {
    public:
        using Fl_Check_Button::Fl_Check_Button;
        friend void check_button_set_draw_hook(CHECKBUTTON b, void * d);
        friend void fl_check_button_draw(CHECKBUTTON b);
        friend void check_button_set_handle_hook(CHECKBUTTON b, void * h);
        friend int fl_check_button_handle(CHECKBUTTON b, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};


void My_Check_Button::draw() {
    (*draw_hook)(this->user_data());
}


void My_Check_Button::real_draw() {
    Fl_Check_Button::draw();
}


int My_Check_Button::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}


int My_Check_Button::real_handle(int e) {
    return Fl_Check_Button::handle(e);
}


void check_button_set_draw_hook(CHECKBUTTON b, void * d) {
    reinterpret_cast<My_Check_Button*>(b)->draw_hook = reinterpret_cast<d_hook_p>(d);
}


void fl_check_button_draw(CHECKBUTTON b) {
    reinterpret_cast<My_Check_Button*>(b)->real_draw();
}


void check_button_set_handle_hook(CHECKBUTTON b, void * h) {
    reinterpret_cast<My_Check_Button*>(b)->handle_hook = reinterpret_cast<h_hook_p>(h);
}


int fl_check_button_handle(CHECKBUTTON b, int e) {
    return reinterpret_cast<My_Check_Button*>(b)->real_handle(e);
}




CHECKBUTTON new_fl_check_button(int x, int y, int w, int h, char* label) {
    My_Check_Button *b = new My_Check_Button(x, y, w, h, label);
    return b;
}


void free_fl_check_button(CHECKBUTTON b) {
    delete reinterpret_cast<My_Check_Button*>(b);
}

