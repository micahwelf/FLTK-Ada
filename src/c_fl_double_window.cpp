

#include <FL/Fl_Double_Window.H>
#include "c_fl_double_window.h"


typedef void (hook)(void*);
typedef hook* hook_p;




class My_Double_Window : public Fl_Double_Window {
    public:
        using Fl_Double_Window::Fl_Double_Window;
        friend void double_window_set_draw_hook(DOUBLEWINDOW n, void * d);
        friend void fl_double_window_draw(DOUBLEWINDOW n);
    protected:
        void draw();
        void real_draw();
        hook_p draw_hook;
};


void My_Double_Window::draw() {
    (*draw_hook)(this->user_data());
}


void My_Double_Window::real_draw() {
    Fl_Double_Window::draw();
}


void double_window_set_draw_hook(DOUBLEWINDOW n, void * d) {
    reinterpret_cast<My_Double_Window*>(n)->draw_hook = reinterpret_cast<hook_p>(d);
}


void fl_double_window_draw(DOUBLEWINDOW n) {
    reinterpret_cast<My_Double_Window*>(n)->real_draw();
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

