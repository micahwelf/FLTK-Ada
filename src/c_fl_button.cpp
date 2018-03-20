

#include <FL/Fl_Button.H>
#include "c_fl_button.h"
#include "c_fl_type.h"




class My_Button : public Fl_Button {
    public:
        using Fl_Button::Fl_Button;
        friend void button_set_draw_hook(BUTTON b, void * d);
        friend void fl_button_draw(BUTTON b);
        friend void button_set_handle_hook(BUTTON b, void * h);
        friend int fl_button_handle(BUTTON b, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Button::draw() {
    (*draw_hook)(this->user_data());
}

void My_Button::real_draw() {
    Fl_Button::draw();
}

int My_Button::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Button::real_handle(int e) {
    return Fl_Button::handle(e);
}

void button_set_draw_hook(BUTTON b, void * d) {
    reinterpret_cast<My_Button*>(b)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_button_draw(BUTTON b) {
    reinterpret_cast<My_Button*>(b)->real_draw();
}

void button_set_handle_hook(BUTTON b, void * h) {
    reinterpret_cast<My_Button*>(b)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_button_handle(BUTTON b, int e) {
    return reinterpret_cast<My_Button*>(b)->real_handle(e);
}




BUTTON new_fl_button(int x, int y, int w, int h, char* label) {
    My_Button *b = new My_Button(x, y, w, h, label);
    return b;
}

void free_fl_button(BUTTON b) {
    delete reinterpret_cast<My_Button*>(b);
}




int fl_button_get_state(BUTTON b) {
    return reinterpret_cast<Fl_Button*>(b)->value();
}

void fl_button_set_state(BUTTON b, int s) {
    reinterpret_cast<Fl_Button*>(b)->value(s);
}

void fl_button_set_only(BUTTON b) {
    reinterpret_cast<Fl_Button*>(b)->setonly();
}




int fl_button_get_down_box(BUTTON b) {
    return reinterpret_cast<Fl_Button*>(b)->down_box();
}

void fl_button_set_down_box(BUTTON b, int t) {
    reinterpret_cast<Fl_Button*>(b)->down_box(static_cast<Fl_Boxtype>(t));
}

int fl_button_get_shortcut(BUTTON b) {
    return reinterpret_cast<Fl_Button*>(b)->shortcut();
}

void fl_button_set_shortcut(BUTTON b, int k) {
    reinterpret_cast<Fl_Button*>(b)->shortcut(k);
}


