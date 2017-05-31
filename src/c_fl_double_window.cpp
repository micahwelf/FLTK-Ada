

#include <FL/Fl_Double_Window.H>
#include "c_fl_double_window.h"
#include "c_fl_type.h"




class My_Double_Window : public Fl_Double_Window {
    public:
        using Fl_Double_Window::Fl_Double_Window;
        friend void double_window_set_draw_hook(DOUBLEWINDOW n, void * d);
        friend void fl_double_window_draw(DOUBLEWINDOW n);
        friend void double_window_set_handle_hook(DOUBLEWINDOW n, void * h);
        friend int fl_double_window_handle(DOUBLEWINDOW n, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};


void My_Double_Window::draw() {
    (*draw_hook)(this->user_data());
}


void My_Double_Window::real_draw() {
    Fl_Double_Window::draw();
}


int My_Double_Window::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}


int My_Double_Window::real_handle(int e) {
    return Fl_Double_Window::handle(e);
}


void double_window_set_draw_hook(DOUBLEWINDOW n, void * d) {
    reinterpret_cast<My_Double_Window*>(n)->draw_hook = reinterpret_cast<d_hook_p>(d);
}


void fl_double_window_draw(DOUBLEWINDOW n) {
    reinterpret_cast<My_Double_Window*>(n)->real_draw();
}


void double_window_set_handle_hook(DOUBLEWINDOW n, void * h) {
    reinterpret_cast<My_Double_Window*>(n)->handle_hook = reinterpret_cast<h_hook_p>(h);
}


int fl_double_window_handle(DOUBLEWINDOW n, int e) {
    return reinterpret_cast<My_Double_Window*>(n)->real_handle(e);
}




DOUBLEWINDOW new_fl_double_window(int x, int y, int w, int h, char* label) {
    My_Double_Window *d = new My_Double_Window(x, y, w, h, label);
    return d;
}


DOUBLEWINDOW new_fl_double_window2(int w, int h) {
    My_Double_Window *d = new My_Double_Window(w, h);
    return d;
}


void free_fl_double_window(DOUBLEWINDOW d) {
    delete reinterpret_cast<My_Double_Window*>(d);
}




void fl_double_window_show(DOUBLEWINDOW d) {
    reinterpret_cast<Fl_Double_Window*>(d)->show();
}


void fl_double_window_hide(DOUBLEWINDOW d) {
    reinterpret_cast<Fl_Double_Window*>(d)->hide();
}


void fl_double_window_flush(DOUBLEWINDOW d) {
    reinterpret_cast<Fl_Double_Window*>(d)->flush();
}

