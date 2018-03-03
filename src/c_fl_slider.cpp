

#include <FL/Fl_Slider.H>
#include "c_fl_slider.h"
#include "c_fl_type.h"




class My_Slider : public Fl_Slider {
    public:
        using Fl_Slider::Fl_Slider;
        friend void slider_set_draw_hook(SLIDER s, void * d);
        friend void fl_slider_draw(SLIDER s);
        friend void slider_set_handle_hook(SLIDER s, void * h);
        friend int fl_slider_handle(SLIDER s, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Slider::draw() {
    (*draw_hook)(this->user_data());
}

void My_Slider::real_draw() {
    Fl_Slider::draw();
}

int My_Slider::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Slider::real_handle(int e) {
    return Fl_Slider::handle(e);
}

void slider_set_draw_hook(SLIDER s, void * d) {
    reinterpret_cast<My_Slider*>(s)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_slider_draw(SLIDER s) {
    reinterpret_cast<My_Slider*>(s)->real_draw();
}

void slider_set_handle_hook(SLIDER s, void * h) {
    reinterpret_cast<My_Slider*>(s)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_slider_handle(SLIDER s, int e) {
    return reinterpret_cast<My_Slider*>(s)->real_handle(e);
}




SLIDER new_fl_slider(int x, int y, int w, int h, char* label) {
    My_Slider *s = new My_Slider(x, y, w, h, label);
    return s;
}

void free_fl_slider(SLIDER s) {
    delete reinterpret_cast<My_Slider*>(s);
}




void fl_slider_set_bounds(SLIDER s, double a, double b) {
    reinterpret_cast<My_Slider*>(s)->bounds(a,b);
}

int fl_slider_get_slider(SLIDER s) {
    return reinterpret_cast<My_Slider*>(s)->slider();
}

void fl_slider_set_slider(SLIDER s, int t) {
    reinterpret_cast<My_Slider*>(s)->slider(static_cast<Fl_Boxtype>(t));
}

float fl_slider_get_slider_size(SLIDER s) {
    return reinterpret_cast<My_Slider*>(s)->slider_size();
}

void fl_slider_set_slider_size(SLIDER s, float t) {
    reinterpret_cast<My_Slider*>(s)->slider_size(t);
}

