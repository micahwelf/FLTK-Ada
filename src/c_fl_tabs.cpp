

#include <FL/Fl_Tabs.H>
#include "c_fl_tabs.h"
#include "c_fl_type.h"




class My_Tabs : public Fl_Tabs {
    public:
        using Fl_Tabs::Fl_Tabs;
        friend void tabs_set_draw_hook(TABS t, void * d);
        friend void fl_tabs_draw(TABS t);
        friend void tabs_set_handle_hook(TABS t, void * h);
        friend int fl_tabs_handle(TABS t, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Tabs::draw() {
    (*draw_hook)(this->user_data());
}

void My_Tabs::real_draw() {
    Fl_Tabs::draw();
}

int My_Tabs::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Tabs::real_handle(int e) {
    return Fl_Tabs::handle(e);
}

void tabs_set_draw_hook(TABS t, void * d) {
    reinterpret_cast<My_Tabs*>(t)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_tabs_draw(TABS t) {
    reinterpret_cast<My_Tabs*>(t)->real_draw();
}

void tabs_set_handle_hook(TABS t, void * h) {
    reinterpret_cast<My_Tabs*>(t)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_tabs_handle(TABS t, int e) {
    return reinterpret_cast<My_Tabs*>(t)->real_handle(e);
}




TABS new_fl_tabs(int x, int y, int w, int h, char* label) {
    My_Tabs *t = new My_Tabs(x, y, w, h, label);
    return t;
}

void free_fl_tabs(TABS t) {
    delete reinterpret_cast<My_Tabs*>(t);
}




void fl_tabs_client_area(TABS t, int * x, int * y, int * w, int * h, int i) {
    reinterpret_cast<Fl_Tabs*>(t)->client_area(*x,*y,*w,*h,i);
}




void * fl_tabs_get_push(TABS t) {
    return reinterpret_cast<Fl_Tabs*>(t)->push();
}

void fl_tabs_set_push(TABS t, void * w) {
    reinterpret_cast<Fl_Tabs*>(t)->push(reinterpret_cast<Fl_Widget*>(w));
}

void * fl_tabs_get_value(TABS t) {
    return reinterpret_cast<Fl_Tabs*>(t)->value();
}

void fl_tabs_set_value(TABS t, void * w) {
    reinterpret_cast<Fl_Tabs*>(t)->value(reinterpret_cast<Fl_Widget*>(w));
}

void * fl_tabs_which(TABS t, int x, int y) {
    return reinterpret_cast<Fl_Tabs*>(t)->which(x,y);
}

