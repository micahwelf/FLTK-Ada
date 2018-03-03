

#include <FL/Fl_Hor_Slider.H>
#include "c_fl_horizontal_slider.h"
#include "c_fl_type.h"




class My_Horizontal_Slider : public Fl_Hor_Slider {
    public:
        using Fl_Hor_Slider::Fl_Hor_Slider;
        friend void horizontal_slider_set_draw_hook(HORIZONTAL_SLIDER s, void * d);
        friend void fl_horizontal_slider_draw(HORIZONTAL_SLIDER s);
        friend void horizontal_slider_set_handle_hook(HORIZONTAL_SLIDER s, void * h);
        friend int fl_horizontal_slider_handle(HORIZONTAL_SLIDER s, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Horizontal_Slider::draw() {
    (*draw_hook)(this->user_data());
}

void My_Horizontal_Slider::real_draw() {
    Fl_Hor_Slider::draw();
}

int My_Horizontal_Slider::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Horizontal_Slider::real_handle(int e) {
    return Fl_Hor_Slider::handle(e);
}

void horizontal_slider_set_draw_hook(HORIZONTAL_SLIDER s, void * d) {
    reinterpret_cast<My_Horizontal_Slider*>(s)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_horizontal_slider_draw(HORIZONTAL_SLIDER s) {
    reinterpret_cast<My_Horizontal_Slider*>(s)->real_draw();
}

void horizontal_slider_set_handle_hook(HORIZONTAL_SLIDER s, void * h) {
    reinterpret_cast<My_Horizontal_Slider*>(s)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_horizontal_slider_handle(HORIZONTAL_SLIDER s, int e) {
    return reinterpret_cast<My_Horizontal_Slider*>(s)->real_handle(e);
}




HORIZONTAL_SLIDER new_fl_horizontal_slider(int x, int y, int w, int h, char* label) {
    My_Horizontal_Slider *s = new My_Horizontal_Slider(x, y, w, h, label);
    return s;
}

void free_fl_horizontal_slider(HORIZONTAL_SLIDER s) {
    delete reinterpret_cast<My_Horizontal_Slider*>(s);
}


