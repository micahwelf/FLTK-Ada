

#include <FL/Fl_Fill_Slider.H>
#include "c_fl_fill_slider.h"
#include "c_fl_type.h"




class My_Fill_Slider : public Fl_Fill_Slider {
    public:
        using Fl_Fill_Slider::Fl_Fill_Slider;
        friend void fill_slider_set_draw_hook(FILL_SLIDER s, void * d);
        friend void fl_fill_slider_draw(FILL_SLIDER s);
        friend void fill_slider_set_handle_hook(FILL_SLIDER s, void * h);
        friend int fl_fill_slider_handle(FILL_SLIDER s, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Fill_Slider::draw() {
    (*draw_hook)(this->user_data());
}

void My_Fill_Slider::real_draw() {
    Fl_Fill_Slider::draw();
}

int My_Fill_Slider::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Fill_Slider::real_handle(int e) {
    return Fl_Fill_Slider::handle(e);
}

void fill_slider_set_draw_hook(FILL_SLIDER s, void * d) {
    reinterpret_cast<My_Fill_Slider*>(s)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_fill_slider_draw(FILL_SLIDER s) {
    reinterpret_cast<My_Fill_Slider*>(s)->real_draw();
}

void fill_slider_set_handle_hook(FILL_SLIDER s, void * h) {
    reinterpret_cast<My_Fill_Slider*>(s)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_fill_slider_handle(FILL_SLIDER s, int e) {
    return reinterpret_cast<My_Fill_Slider*>(s)->real_handle(e);
}




FILL_SLIDER new_fl_fill_slider(int x, int y, int w, int h, char* label) {
    My_Fill_Slider *s = new My_Fill_Slider(x, y, w, h, label);
    return s;
}

void free_fl_fill_slider(FILL_SLIDER s) {
    delete reinterpret_cast<My_Fill_Slider*>(s);
}


