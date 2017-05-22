

#include <FL/Fl_Widget.H>
#include <FL/Fl_Image.H>
#include "c_fl_widget.h"
#include "c_fl_type.h"




class My_Widget : public Fl_Widget {
    public:
        using Fl_Widget::Fl_Widget;
        friend void widget_set_draw_hook(WIDGET w, void * d);
        friend void widget_set_handle_hook(WIDGET w, void * h);
        friend WIDGET new_fl_widget(int x, int y, int w, int h, char* label);
    protected:
        void draw();
        int handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};


void My_Widget::draw() {
    (*draw_hook)(this->user_data());
}


int My_Widget::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}


void widget_set_draw_hook(WIDGET w, void * d) {
    reinterpret_cast<My_Widget*>(w)->draw_hook = reinterpret_cast<d_hook_p>(d);
}


void widget_set_handle_hook(WIDGET w, void * h) {
    reinterpret_cast<My_Widget*>(w)->handle_hook = reinterpret_cast<h_hook_p>(h);
}




WIDGET new_fl_widget(int x, int y, int w, int h, char* label) {
    My_Widget *wd = new My_Widget(x, y, w, h, label);
    return wd;
}


void free_fl_widget(WIDGET w) {
    delete reinterpret_cast<My_Widget*>(w);
}




void * fl_widget_get_user_data(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->user_data();
}


void fl_widget_set_user_data(WIDGET w, void * d) {
    reinterpret_cast<Fl_Widget*>(w)->user_data(d);
}




void fl_widget_activate(WIDGET w) {
    reinterpret_cast<Fl_Widget*>(w)->activate();
}


void fl_widget_deactivate(WIDGET w) {
    reinterpret_cast<Fl_Widget*>(w)->deactivate();
}


int fl_widget_active(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->active();
}


int fl_widget_active_r(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->active_r();
}




void * fl_widget_get_parent(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->parent();
}




int fl_widget_get_box(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->box();
}


void fl_widget_set_box(WIDGET w, int b) {
    reinterpret_cast<Fl_Widget*>(w)->box(static_cast<Fl_Boxtype>(b));
}


const char* fl_widget_get_label(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->label();
}


void fl_widget_set_label(WIDGET w, const char* t) {
    reinterpret_cast<Fl_Widget*>(w)->copy_label(t);
}


int fl_widget_get_label_font(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->labelfont();
}


void fl_widget_set_label_font(WIDGET w, int f) {
    reinterpret_cast<Fl_Widget*>(w)->labelfont(static_cast<Fl_Font>(f));
}


int fl_widget_get_label_size(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->labelsize();
}


void fl_widget_set_label_size(WIDGET w, int s) {
    reinterpret_cast<Fl_Widget*>(w)->labelsize(static_cast<Fl_Fontsize>(s));
}


int fl_widget_get_label_type(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->labeltype();
}


void fl_widget_set_label_type(WIDGET w, int l) {
    reinterpret_cast<Fl_Widget*>(w)->labeltype(static_cast<Fl_Labeltype>(l));
}




void fl_widget_set_callback(WIDGET w, void * cb) {
    reinterpret_cast<Fl_Widget*>(w)->callback(reinterpret_cast<Fl_Callback_p>(cb));
}




int fl_widget_get_x(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->x();
}


int fl_widget_get_y(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->y();
}


int fl_widget_get_w(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->w();
}


int fl_widget_get_h(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->h();
}


void fl_widget_size(WIDGET w, int d, int h) {
    reinterpret_cast<Fl_Widget*>(w)->size(d, h);
}


void fl_widget_position(WIDGET w, int x, int y) {
    reinterpret_cast<Fl_Widget*>(w)->position(x, y);
}




void fl_widget_set_image(WIDGET w, void * img) {
    reinterpret_cast<Fl_Widget*>(w)->image(reinterpret_cast<Fl_Image*>(img));
}

