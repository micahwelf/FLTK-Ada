

#include <FL/Fl_Scroll.H>
#include "c_fl_scroll.h"
#include "c_fl_type.h"




class My_Scroll : public Fl_Scroll {
    public:
        using Fl_Scroll::Fl_Scroll;
        friend void scroll_set_draw_hook(SCROLL s, void * d);
        friend void fl_scroll_draw(SCROLL s);
        friend void scroll_set_handle_hook(SCROLL s, void * h);
        friend int fl_scroll_handle(SCROLL s, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};


void My_Scroll::draw() {
    (*draw_hook)(this->user_data());
}


void My_Scroll::real_draw() {
    Fl_Scroll::draw();
}


int My_Scroll::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}


int My_Scroll::real_handle(int e) {
    return Fl_Scroll::handle(e);
}


void scroll_set_draw_hook(SCROLL s, void * d) {
    reinterpret_cast<My_Scroll*>(s)->draw_hook = reinterpret_cast<d_hook_p>(d);
}


void fl_scroll_draw(SCROLL s) {
    reinterpret_cast<My_Scroll*>(s)->real_draw();
}


void scroll_set_handle_hook(SCROLL s, void * h) {
    reinterpret_cast<My_Scroll*>(s)->handle_hook = reinterpret_cast<h_hook_p>(h);
}


int fl_scroll_handle(SCROLL s, int e) {
    return reinterpret_cast<My_Scroll*>(s)->real_handle(e);
}




SCROLL new_fl_scroll(int x, int y, int w, int h, char* label) {
    My_Scroll *s = new My_Scroll(x, y, w, h, label);
    return s;
}


void free_fl_scroll(SCROLL s) {
    delete reinterpret_cast<My_Scroll*>(s);
}




void fl_scroll_to(SCROLL s, int x, int y) {
    reinterpret_cast<Fl_Scroll*>(s)->scroll_to(x, y);
}


int fl_scroll_get_size(SCROLL s) {
    return reinterpret_cast<Fl_Scroll*>(s)->scrollbar_size();
}


void fl_scroll_set_size(SCROLL s, int t) {
    reinterpret_cast<Fl_Scroll*>(s)->scrollbar_size(t);
}


int fl_scroll_xposition(SCROLL s) {
    return reinterpret_cast<Fl_Scroll*>(s)->xposition();
}


int fl_scroll_yposition(SCROLL s) {
    return reinterpret_cast<Fl_Scroll*>(s)->yposition();
}


void fl_scroll_set_type(SCROLL s, int t) {
    reinterpret_cast<Fl_Scroll*>(s)->type(t);
}

