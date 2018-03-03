

#include <FL/Fl_Hor_Nice_Slider.H>
#include "c_fl_hor_nice_slider.h"
#include "c_fl_type.h"




class My_Hor_Nice_Slider : public Fl_Hor_Nice_Slider {
    public:
        using Fl_Hor_Nice_Slider::Fl_Hor_Nice_Slider;
        friend void hor_nice_slider_set_draw_hook(HOR_NICE_SLIDER s, void * d);
        friend void fl_hor_nice_slider_draw(HOR_NICE_SLIDER s);
        friend void hor_nice_slider_set_handle_hook(HOR_NICE_SLIDER s, void * h);
        friend int fl_hor_nice_slider_handle(HOR_NICE_SLIDER s, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Hor_Nice_Slider::draw() {
    (*draw_hook)(this->user_data());
}

void My_Hor_Nice_Slider::real_draw() {
    Fl_Hor_Nice_Slider::draw();
}

int My_Hor_Nice_Slider::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Hor_Nice_Slider::real_handle(int e) {
    return Fl_Hor_Nice_Slider::handle(e);
}

void hor_nice_slider_set_draw_hook(HOR_NICE_SLIDER s, void * d) {
    reinterpret_cast<My_Hor_Nice_Slider*>(s)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_hor_nice_slider_draw(HOR_NICE_SLIDER s) {
    reinterpret_cast<My_Hor_Nice_Slider*>(s)->real_draw();
}

void hor_nice_slider_set_handle_hook(HOR_NICE_SLIDER s, void * h) {
    reinterpret_cast<My_Hor_Nice_Slider*>(s)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_hor_nice_slider_handle(HOR_NICE_SLIDER s, int e) {
    return reinterpret_cast<My_Hor_Nice_Slider*>(s)->real_handle(e);
}




HOR_NICE_SLIDER new_fl_hor_nice_slider(int x, int y, int w, int h, char* label) {
    My_Hor_Nice_Slider *s = new My_Hor_Nice_Slider(x, y, w, h, label);
    return s;
}

void free_fl_hor_nice_slider(HOR_NICE_SLIDER s) {
    delete reinterpret_cast<My_Hor_Nice_Slider*>(s);
}


