

#include <FL/Fl_Value_Output.H>
#include "c_fl_value_output.h"
#include "c_fl_type.h"




class My_Value_Output : public Fl_Value_Output {
    public:
        using Fl_Value_Output::Fl_Value_Output;
        friend void value_output_set_draw_hook(VALUE_OUTPUT a, void * d);
        friend void fl_value_output_draw(VALUE_OUTPUT a);
        friend void value_output_set_handle_hook(VALUE_OUTPUT a, void * h);
        friend int fl_value_output_handle(VALUE_OUTPUT a, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Value_Output::draw() {
    (*draw_hook)(this->user_data());
}

void My_Value_Output::real_draw() {
    Fl_Value_Output::draw();
}

int My_Value_Output::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Value_Output::real_handle(int e) {
    return Fl_Value_Output::handle(e);
}

void value_output_set_draw_hook(VALUE_OUTPUT a, void * d) {
    reinterpret_cast<My_Value_Output*>(a)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_value_output_draw(VALUE_OUTPUT a) {
    reinterpret_cast<My_Value_Output*>(a)->real_draw();
}

void value_output_set_handle_hook(VALUE_OUTPUT a, void * h) {
    reinterpret_cast<My_Value_Output*>(a)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_value_output_handle(VALUE_OUTPUT a, int e) {
    return reinterpret_cast<My_Value_Output*>(a)->real_handle(e);
}




VALUE_OUTPUT new_fl_value_output(int x, int y, int w, int h, char* label) {
    My_Value_Output *a = new My_Value_Output(x, y, w, h, label);
    return a;
}

void free_fl_value_output(VALUE_OUTPUT a) {
    delete reinterpret_cast<My_Value_Output*>(a);
}




int fl_value_output_is_soft(VALUE_OUTPUT a) {
    return reinterpret_cast<Fl_Value_Output*>(a)->soft();
}

void fl_value_output_set_soft(VALUE_OUTPUT a, int t) {
    reinterpret_cast<Fl_Value_Output*>(a)->soft(t);
}




unsigned int fl_value_output_get_text_color(VALUE_OUTPUT v) {
    return reinterpret_cast<Fl_Value_Output*>(v)->textcolor();
}

void fl_value_output_set_text_color(VALUE_OUTPUT v, unsigned int c) {
    reinterpret_cast<Fl_Value_Output*>(v)->textcolor(static_cast<Fl_Color>(c));
}

int fl_value_output_get_text_font(VALUE_OUTPUT v) {
    return reinterpret_cast<Fl_Value_Output*>(v)->textfont();
}

void fl_value_output_set_text_font(VALUE_OUTPUT v, int f) {
    reinterpret_cast<Fl_Value_Output*>(v)->textfont(static_cast<Fl_Font>(f));
}

int fl_value_output_get_text_size(VALUE_OUTPUT v) {
    return reinterpret_cast<Fl_Value_Output*>(v)->textsize();
}

void fl_value_output_set_text_size(VALUE_OUTPUT v, int s) {
    reinterpret_cast<Fl_Value_Output*>(v)->textsize(static_cast<Fl_Fontsize>(s));
}


