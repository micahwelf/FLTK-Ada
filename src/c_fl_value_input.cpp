

#include <FL/Fl_Value_Input.H>
#include "c_fl_value_input.h"
#include "c_fl_type.h"




class My_Value_Input : public Fl_Value_Input {
    public:
        using Fl_Value_Input::Fl_Value_Input;
        friend void value_input_set_draw_hook(VALUE_INPUT a, void * d);
        friend void fl_value_input_draw(VALUE_INPUT a);
        friend void value_input_set_handle_hook(VALUE_INPUT a, void * h);
        friend int fl_value_input_handle(VALUE_INPUT a, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Value_Input::draw() {
    (*draw_hook)(this->user_data());
}

void My_Value_Input::real_draw() {
    Fl_Value_Input::draw();
}

int My_Value_Input::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Value_Input::real_handle(int e) {
    return Fl_Value_Input::handle(e);
}

void value_input_set_draw_hook(VALUE_INPUT a, void * d) {
    reinterpret_cast<My_Value_Input*>(a)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_value_input_draw(VALUE_INPUT a) {
    reinterpret_cast<My_Value_Input*>(a)->real_draw();
}

void value_input_set_handle_hook(VALUE_INPUT a, void * h) {
    reinterpret_cast<My_Value_Input*>(a)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_value_input_handle(VALUE_INPUT a, int e) {
    return reinterpret_cast<My_Value_Input*>(a)->real_handle(e);
}




VALUE_INPUT new_fl_value_input(int x, int y, int w, int h, char* label) {
    My_Value_Input *a = new My_Value_Input(x, y, w, h, label);
    return a;
}

void free_fl_value_input(VALUE_INPUT a) {
    delete reinterpret_cast<My_Value_Input*>(a);
}




void * fl_value_input_get_input(VALUE_INPUT v) {
    return &(reinterpret_cast<Fl_Value_Input*>(v)->input);
}




unsigned int fl_value_input_get_cursor_color(VALUE_INPUT v) {
    return reinterpret_cast<Fl_Value_Input*>(v)->cursor_color();
}

void fl_value_input_set_cursor_color(VALUE_INPUT v, unsigned int c) {
    reinterpret_cast<Fl_Value_Input*>(v)->cursor_color(c);
}




int fl_value_input_get_shortcut(VALUE_INPUT v) {
    return reinterpret_cast<Fl_Value_Input*>(v)->Fl_Value_Input::shortcut();
}

void fl_value_input_set_shortcut(VALUE_INPUT v, int k) {
    reinterpret_cast<Fl_Value_Input*>(v)->Fl_Value_Input::shortcut(k);
}




int fl_value_input_is_soft(VALUE_INPUT a) {
    return reinterpret_cast<Fl_Value_Input*>(a)->soft();
}

void fl_value_input_set_soft(VALUE_INPUT a, int t) {
    reinterpret_cast<Fl_Value_Input*>(a)->soft(t);
}




unsigned int fl_value_input_get_text_color(VALUE_INPUT v) {
    return reinterpret_cast<Fl_Value_Input*>(v)->textcolor();
}

void fl_value_input_set_text_color(VALUE_INPUT v, unsigned int c) {
    reinterpret_cast<Fl_Value_Input*>(v)->textcolor(static_cast<Fl_Color>(c));
}

int fl_value_input_get_text_font(VALUE_INPUT v) {
    return reinterpret_cast<Fl_Value_Input*>(v)->textfont();
}

void fl_value_input_set_text_font(VALUE_INPUT v, int f) {
    reinterpret_cast<Fl_Value_Input*>(v)->textfont(static_cast<Fl_Font>(f));
}

int fl_value_input_get_text_size(VALUE_INPUT v) {
    return reinterpret_cast<Fl_Value_Input*>(v)->textsize();
}

void fl_value_input_set_text_size(VALUE_INPUT v, int s) {
    reinterpret_cast<Fl_Value_Input*>(v)->textsize(static_cast<Fl_Fontsize>(s));
}


