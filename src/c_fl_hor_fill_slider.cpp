

#include <FL/Fl_Hor_Fill_Slider.H>
#include "c_fl_hor_fill_slider.h"
#include "c_fl_type.h"




class My_Hor_Fill_Slider : public Fl_Hor_Fill_Slider {
    public:
        using Fl_Hor_Fill_Slider::Fl_Hor_Fill_Slider;
        friend void hor_fill_slider_set_draw_hook(HOR_FILL_SLIDER s, void * d);
        friend void fl_hor_fill_slider_draw(HOR_FILL_SLIDER s);
        friend void hor_fill_slider_set_handle_hook(HOR_FILL_SLIDER s, void * h);
        friend int fl_hor_fill_slider_handle(HOR_FILL_SLIDER s, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Hor_Fill_Slider::draw() {
    (*draw_hook)(this->user_data());
}

void My_Hor_Fill_Slider::real_draw() {
    Fl_Hor_Fill_Slider::draw();
}

int My_Hor_Fill_Slider::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Hor_Fill_Slider::real_handle(int e) {
    return Fl_Hor_Fill_Slider::handle(e);
}

void hor_fill_slider_set_draw_hook(HOR_FILL_SLIDER s, void * d) {
    reinterpret_cast<My_Hor_Fill_Slider*>(s)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_hor_fill_slider_draw(HOR_FILL_SLIDER s) {
    reinterpret_cast<My_Hor_Fill_Slider*>(s)->real_draw();
}

void hor_fill_slider_set_handle_hook(HOR_FILL_SLIDER s, void * h) {
    reinterpret_cast<My_Hor_Fill_Slider*>(s)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_hor_fill_slider_handle(HOR_FILL_SLIDER s, int e) {
    return reinterpret_cast<My_Hor_Fill_Slider*>(s)->real_handle(e);
}




HOR_FILL_SLIDER new_fl_hor_fill_slider(int x, int y, int w, int h, char* label) {
    My_Hor_Fill_Slider *s = new My_Hor_Fill_Slider(x, y, w, h, label);
    return s;
}

void free_fl_hor_fill_slider(HOR_FILL_SLIDER s) {
    delete reinterpret_cast<My_Hor_Fill_Slider*>(s);
}


