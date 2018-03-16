

#include <FL/Fl_Hor_Value_Slider.H>
#include "c_fl_hor_value_slider.h"
#include "c_fl_type.h"




class My_Hor_Value_Slider : public Fl_Hor_Value_Slider {
    public:
        using Fl_Hor_Value_Slider::Fl_Hor_Value_Slider;
        friend void hor_value_slider_set_draw_hook(HOR_VALUE_SLIDER s, void * d);
        friend void fl_hor_value_slider_draw(HOR_VALUE_SLIDER s);
        friend void hor_value_slider_set_handle_hook(HOR_VALUE_SLIDER s, void * h);
        friend int fl_hor_value_slider_handle(HOR_VALUE_SLIDER s, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Hor_Value_Slider::draw() {
    (*draw_hook)(this->user_data());
}

void My_Hor_Value_Slider::real_draw() {
    Fl_Hor_Value_Slider::draw();
}

int My_Hor_Value_Slider::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Hor_Value_Slider::real_handle(int e) {
    return Fl_Hor_Value_Slider::handle(e);
}

void hor_value_slider_set_draw_hook(HOR_VALUE_SLIDER s, void * d) {
    reinterpret_cast<My_Hor_Value_Slider*>(s)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_hor_value_slider_draw(HOR_VALUE_SLIDER s) {
    reinterpret_cast<My_Hor_Value_Slider*>(s)->real_draw();
}

void hor_value_slider_set_handle_hook(HOR_VALUE_SLIDER s, void * h) {
    reinterpret_cast<My_Hor_Value_Slider*>(s)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_hor_value_slider_handle(HOR_VALUE_SLIDER s, int e) {
    return reinterpret_cast<My_Hor_Value_Slider*>(s)->real_handle(e);
}




HOR_VALUE_SLIDER new_fl_hor_value_slider(int x, int y, int w, int h, char* label) {
    My_Hor_Value_Slider *s = new My_Hor_Value_Slider(x, y, w, h, label);
    return s;
}

void free_fl_hor_value_slider(HOR_VALUE_SLIDER s) {
    delete reinterpret_cast<My_Hor_Value_Slider*>(s);
}




unsigned int fl_hor_value_slider_get_textcolor(HOR_VALUE_SLIDER s) {
    return reinterpret_cast<My_Hor_Value_Slider*>(s)->textcolor();
}

void fl_hor_value_slider_set_textcolor(HOR_VALUE_SLIDER s, unsigned int t) {
    reinterpret_cast<My_Hor_Value_Slider*>(s)->textcolor(t);
}

int fl_hor_value_slider_get_textfont(HOR_VALUE_SLIDER s) {
    return reinterpret_cast<My_Hor_Value_Slider*>(s)->textfont();
}

void fl_hor_value_slider_set_textfont(HOR_VALUE_SLIDER s, int t) {
    reinterpret_cast<My_Hor_Value_Slider*>(s)->textfont(t);
}

int fl_hor_value_slider_get_textsize(HOR_VALUE_SLIDER s) {
    return reinterpret_cast<My_Hor_Value_Slider*>(s)->textsize();
}

void fl_hor_value_slider_set_textsize(HOR_VALUE_SLIDER s, int t) {
    reinterpret_cast<My_Hor_Value_Slider*>(s)->textsize(t);
}

