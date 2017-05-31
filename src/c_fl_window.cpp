

#include <FL/Fl_Window.H>
#include <FL/Fl_RGB_Image.H>
#include "c_fl_window.h"
#include "c_fl_type.h"




class My_Window : public Fl_Window {
    public:
        using Fl_Window::Fl_Window;
        friend void window_set_draw_hook(WINDOW n, void * d);
        friend void fl_window_draw(WINDOW n);
        friend void window_set_handle_hook(WINDOW n, void * h);
        friend int fl_window_handle(WINDOW n, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};


void My_Window::draw() {
    (*draw_hook)(this->user_data());
}


void My_Window::real_draw() {
    Fl_Window::draw();
}


int My_Window::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}


int My_Window::real_handle(int e) {
    return Fl_Window::handle(e);
}


void window_set_draw_hook(WINDOW n, void * d) {
    reinterpret_cast<My_Window*>(n)->draw_hook = reinterpret_cast<d_hook_p>(d);
}


void fl_window_draw(WINDOW n) {
    reinterpret_cast<My_Window*>(n)->real_draw();
}


void window_set_handle_hook(WINDOW n, void * h) {
    reinterpret_cast<My_Window*>(n)->handle_hook = reinterpret_cast<h_hook_p>(h);
}


int fl_window_handle(WINDOW n, int e) {
    return reinterpret_cast<My_Window*>(n)->real_handle(e);
}




WINDOW new_fl_window(int x, int y, int w, int h, char* label) {
    My_Window *n = new My_Window(x, y, w, h, label);
    return n;
}


WINDOW new_fl_window2(int w, int h) {
    My_Window *n = new My_Window(w, h);
    return n;
}


void free_fl_window(WINDOW n) {
    delete reinterpret_cast<My_Window*>(n);
}




void fl_window_show(WINDOW n) {
    reinterpret_cast<Fl_Window*>(n)->show();
}


void fl_window_hide(WINDOW n) {
    reinterpret_cast<Fl_Window*>(n)->hide();
}


void fl_window_make_current(WINDOW n) {
    reinterpret_cast<Fl_Window*>(n)->make_current();
}


unsigned int fl_window_get_border(WINDOW n) {
    return reinterpret_cast<Fl_Window*>(n)->border();
}


void fl_window_set_border(WINDOW n, int b) {
    reinterpret_cast<Fl_Window*>(n)->border(b);
}


void fl_window_set_label(WINDOW n, char* text) {
    reinterpret_cast<Fl_Window*>(n)->copy_label(text);
}


void fl_window_size_range(WINDOW n, int lw, int lh, int hw, int hh, int dw, int dh, int a) {
    reinterpret_cast<Fl_Window*>(n)->size_range(lw, lh, hw, hh, dw, dh, a);
}


void fl_window_set_icon(WINDOW n, void * img) {
    reinterpret_cast<Fl_Window*>(n)->icon(reinterpret_cast<Fl_RGB_Image*>(img));
}


void fl_window_set_modal(WINDOW n) {
    reinterpret_cast<Fl_Window*>(n)->set_modal();
}


void fl_window_set_non_modal(WINDOW n) {
    reinterpret_cast<Fl_Window*>(n)->set_non_modal();
}


void fl_window_set_cursor(WINDOW n, int c) {
    reinterpret_cast<Fl_Window*>(n)->cursor(static_cast<Fl_Cursor>(c));
}


void fl_window_set_default_cursor(WINDOW n, int c) {
    reinterpret_cast<Fl_Window*>(n)->default_cursor(static_cast<Fl_Cursor>(c));
}




int fl_window_get_x_root(WINDOW n) {
    return reinterpret_cast<Fl_Window*>(n)->x_root();
}


int fl_window_get_y_root(WINDOW n) {
    return reinterpret_cast<Fl_Window*>(n)->y_root();
}


int fl_window_get_decorated_w(WINDOW n) {
    return reinterpret_cast<Fl_Window*>(n)->decorated_w();
}


int fl_window_get_decorated_h(WINDOW n) {
    return reinterpret_cast<Fl_Window*>(n)->decorated_h();
}

