

#include <FL/Fl_Value_Slider.H>
#include "c_fl_value_slider.h"
#include "c_fl_type.h"




class My_Value_Slider : public Fl_Value_Slider {
    public:
        using Fl_Value_Slider::Fl_Value_Slider;
        friend void value_slider_set_draw_hook(VALUE_SLIDER s, void * d);
        friend void fl_value_slider_draw(VALUE_SLIDER s);
        friend void value_slider_set_handle_hook(VALUE_SLIDER s, void * h);
        friend int fl_value_slider_handle(VALUE_SLIDER s, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Value_Slider::draw() {
    (*draw_hook)(this->user_data());
}

void My_Value_Slider::real_draw() {
    Fl_Value_Slider::draw();
}

int My_Value_Slider::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Value_Slider::real_handle(int e) {
    return Fl_Value_Slider::handle(e);
}

void value_slider_set_draw_hook(VALUE_SLIDER s, void * d) {
    reinterpret_cast<My_Value_Slider*>(s)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_value_slider_draw(VALUE_SLIDER s) {
    reinterpret_cast<My_Value_Slider*>(s)->real_draw();
}

void value_slider_set_handle_hook(VALUE_SLIDER s, void * h) {
    reinterpret_cast<My_Value_Slider*>(s)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_value_slider_handle(VALUE_SLIDER s, int e) {
    return reinterpret_cast<My_Value_Slider*>(s)->real_handle(e);
}




VALUE_SLIDER new_fl_value_slider(int x, int y, int w, int h, char* label) {
    My_Value_Slider *s = new My_Value_Slider(x, y, w, h, label);
    return s;
}

void free_fl_value_slider(VALUE_SLIDER s) {
    delete reinterpret_cast<My_Value_Slider*>(s);
}




unsigned int fl_value_slider_get_textcolor(VALUE_SLIDER s) {
    return reinterpret_cast<My_Value_Slider*>(s)->textcolor();
}

void fl_value_slider_set_textcolor(VALUE_SLIDER s, unsigned int t) {
    reinterpret_cast<My_Value_Slider*>(s)->textcolor(t);
}

int fl_value_slider_get_textfont(VALUE_SLIDER s) {
    return reinterpret_cast<My_Value_Slider*>(s)->textfont();
}

void fl_value_slider_set_textfont(VALUE_SLIDER s, int t) {
    reinterpret_cast<My_Value_Slider*>(s)->textfont(t);
}

int fl_value_slider_get_textsize(VALUE_SLIDER s) {
    return reinterpret_cast<My_Value_Slider*>(s)->textsize();
}

void fl_value_slider_set_textsize(VALUE_SLIDER s, int t) {
    reinterpret_cast<My_Value_Slider*>(s)->textsize(t);
}

