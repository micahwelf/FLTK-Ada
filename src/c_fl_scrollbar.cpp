

#include <FL/Fl_Scrollbar.H>
#include "c_fl_scrollbar.h"
#include "c_fl_type.h"




class My_Scrollbar : public Fl_Scrollbar {
    public:
        using Fl_Scrollbar::Fl_Scrollbar;
        friend void scrollbar_set_draw_hook(SCROLLBAR s, void * d);
        friend void fl_scrollbar_draw(SCROLLBAR s);
        friend void scrollbar_set_handle_hook(SCROLLBAR s, void * h);
        friend int fl_scrollbar_handle(SCROLLBAR s, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Scrollbar::draw() {
    (*draw_hook)(this->user_data());
}

void My_Scrollbar::real_draw() {
    Fl_Scrollbar::draw();
}

int My_Scrollbar::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Scrollbar::real_handle(int e) {
    return Fl_Scrollbar::handle(e);
}

void scrollbar_set_draw_hook(SCROLLBAR s, void * d) {
    reinterpret_cast<My_Scrollbar*>(s)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_scrollbar_draw(SCROLLBAR s) {
    reinterpret_cast<My_Scrollbar*>(s)->real_draw();
}

void scrollbar_set_handle_hook(SCROLLBAR s, void * h) {
    reinterpret_cast<My_Scrollbar*>(s)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_scrollbar_handle(SCROLLBAR s, int e) {
    return reinterpret_cast<My_Scrollbar*>(s)->real_handle(e);
}




SCROLLBAR new_fl_scrollbar(int x, int y, int w, int h, char* label) {
    My_Scrollbar *s = new My_Scrollbar(x, y, w, h, label);
    return s;
}

void free_fl_scrollbar(SCROLLBAR s) {
    delete reinterpret_cast<My_Scrollbar*>(s);
}




int fl_scrollbar_get_linesize(SCROLLBAR s) {
    return reinterpret_cast<My_Scrollbar*>(s)->linesize();
}

void fl_scrollbar_set_linesize(SCROLLBAR s, int t) {
    reinterpret_cast<My_Scrollbar*>(s)->linesize(t);
}

int fl_scrollbar_get_value(SCROLLBAR s) {
    return reinterpret_cast<My_Scrollbar*>(s)->value();
}

void fl_scrollbar_set_value(SCROLLBAR s, int t) {
    reinterpret_cast<My_Scrollbar*>(s)->value(t);
}

void fl_scrollbar_set_value2(SCROLLBAR s, int p, int w, int f, int t) {
    reinterpret_cast<My_Scrollbar*>(s)->value(p,w,f,t);
}

