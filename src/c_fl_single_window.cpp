

#include <FL/Fl_Single_Window.H>
#include "c_fl_single_window.h"


typedef void (hook)(void*);
typedef hook* hook_p;




class My_Single_Window : public Fl_Single_Window {
    public:
        using Fl_Single_Window::Fl_Single_Window;
        friend void single_window_set_draw_hook(SINGLEWINDOW n, void * d);
        friend void fl_single_window_draw(SINGLEWINDOW n);
    protected:
        void draw();
        void real_draw();
        hook_p draw_hook;
};


void My_Single_Window::draw() {
    (*draw_hook)(this->user_data());
}


void My_Single_Window::real_draw() {
    Fl_Single_Window::draw();
}


void single_window_set_draw_hook(SINGLEWINDOW n, void * d) {
    reinterpret_cast<My_Single_Window*>(n)->draw_hook = reinterpret_cast<hook_p>(d);
}


void fl_single_window_draw(SINGLEWINDOW n) {
    reinterpret_cast<My_Single_Window*>(n)->real_draw();
}




SINGLEWINDOW new_fl_single_window(int x, int y, int w, int h, char* label) {
    My_Single_Window *sw = new My_Single_Window(x, y, w, h, label);
    return sw;
}


SINGLEWINDOW new_fl_single_window2(int x, int y) {
    My_Single_Window *sw = new My_Single_Window(x, y);
    return sw;
}


void free_fl_single_window(SINGLEWINDOW w) {
    delete reinterpret_cast<My_Single_Window*>(w);
}




void fl_single_window_show(SINGLEWINDOW w) {
    reinterpret_cast<Fl_Single_Window*>(w)->show();
}


void fl_single_window_flush(SINGLEWINDOW w) {
    reinterpret_cast<Fl_Single_Window*>(w)->flush();
}

