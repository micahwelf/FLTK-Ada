

#include <FL/Fl_Color_Chooser.H>
#include "c_fl_color_chooser.h"
#include "c_fl_type.h"




class My_Color_Chooser : public Fl_Color_Chooser {
    public:
        using Fl_Color_Chooser::Fl_Color_Chooser;
        friend void color_chooser_set_draw_hook(COLOR_CHOOSER n, void * d);
        friend void fl_color_chooser_draw(COLOR_CHOOSER n);
        friend void color_chooser_set_handle_hook(COLOR_CHOOSER n, void * h);
        friend int fl_color_chooser_handle(COLOR_CHOOSER n, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Color_Chooser::draw() {
    (*draw_hook)(this->user_data());
}

void My_Color_Chooser::real_draw() {
    Fl_Color_Chooser::draw();
}

int My_Color_Chooser::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Color_Chooser::real_handle(int e) {
    return Fl_Color_Chooser::handle(e);
}

void color_chooser_set_draw_hook(COLOR_CHOOSER n, void * d) {
    reinterpret_cast<My_Color_Chooser*>(n)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_color_chooser_draw(COLOR_CHOOSER n) {
    reinterpret_cast<My_Color_Chooser*>(n)->real_draw();
}

void color_chooser_set_handle_hook(COLOR_CHOOSER n, void * h) {
    reinterpret_cast<My_Color_Chooser*>(n)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_color_chooser_handle(COLOR_CHOOSER n, int e) {
    return reinterpret_cast<My_Color_Chooser*>(n)->real_handle(e);
}




COLOR_CHOOSER new_fl_color_chooser(int x, int y, int w, int h, char* label) {
    My_Color_Chooser *n = new My_Color_Chooser(x, y, w, h, label);
    return n;
}

void free_fl_color_chooser(COLOR_CHOOSER n) {
    delete reinterpret_cast<My_Color_Chooser*>(n);
}




double fl_color_chooser_r(COLOR_CHOOSER n) {
    return reinterpret_cast<My_Color_Chooser*>(n)->r();
}

double fl_color_chooser_g(COLOR_CHOOSER n) {
    return reinterpret_cast<My_Color_Chooser*>(n)->g();
}

double fl_color_chooser_b(COLOR_CHOOSER n) {
    return reinterpret_cast<My_Color_Chooser*>(n)->b();
}

int fl_color_chooser_rgb(COLOR_CHOOSER n, int r, int g, int b) {
    return reinterpret_cast<My_Color_Chooser*>(n)->rgb(r,g,b);
}




double fl_color_chooser_hue(COLOR_CHOOSER n) {
    return reinterpret_cast<My_Color_Chooser*>(n)->hue();
}

double fl_color_chooser_saturation(COLOR_CHOOSER n) {
    return reinterpret_cast<My_Color_Chooser*>(n)->saturation();
}

double fl_color_chooser_value(COLOR_CHOOSER n) {
    return reinterpret_cast<My_Color_Chooser*>(n)->value();
}

int fl_color_chooser_hsv(COLOR_CHOOSER n, int h, int s, int v) {
    return reinterpret_cast<My_Color_Chooser*>(n)->hsv(h,s,v);
}




int fl_color_chooser_get_mode(COLOR_CHOOSER n) {
    return reinterpret_cast<My_Color_Chooser*>(n)->mode();
}

void fl_color_chooser_set_mode(COLOR_CHOOSER n, int m) {
    reinterpret_cast<My_Color_Chooser*>(n)->mode(m);
}


