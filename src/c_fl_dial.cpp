

#include <FL/Fl_Dial.H>
#include "c_fl_dial.h"
#include "c_fl_type.h"




class My_Dial : public Fl_Dial {
    public:
        using Fl_Dial::Fl_Dial;
        friend void dial_set_draw_hook(DIAL v, void * d);
        friend void fl_dial_draw(DIAL v);
        friend void dial_set_handle_hook(DIAL v, void * h);
        friend int fl_dial_handle(DIAL v, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Dial::draw() {
    (*draw_hook)(this->user_data());
}

void My_Dial::real_draw() {
    Fl_Dial::draw();
}

int My_Dial::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Dial::real_handle(int e) {
    return Fl_Dial::handle(e);
}

void dial_set_draw_hook(DIAL v, void * d) {
    reinterpret_cast<My_Dial*>(v)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_dial_draw(DIAL v) {
    reinterpret_cast<My_Dial*>(v)->real_draw();
}

void dial_set_handle_hook(DIAL v, void * h) {
    reinterpret_cast<My_Dial*>(v)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_dial_handle(DIAL v, int e) {
    return reinterpret_cast<My_Dial*>(v)->real_handle(e);
}




DIAL new_fl_dial(int x, int y, int w, int h, char* label) {
    My_Dial *v = new My_Dial(x, y, w, h, label);
    return v;
}

void free_fl_dial(DIAL v) {
    delete reinterpret_cast<My_Dial*>(v);
}




int fl_dial_get_type(DIAL v) {
    return reinterpret_cast<Fl_Dial*>(v)->type();
}

void fl_dial_set_type(DIAL v, int t) {
    reinterpret_cast<Fl_Dial*>(v)->type(t);
}




int fl_dial_get_angle1(DIAL v) {
    return reinterpret_cast<Fl_Dial*>(v)->angle1();
}

void fl_dial_set_angle1(DIAL v, int t) {
    reinterpret_cast<Fl_Dial*>(v)->angle1(t);
}

int fl_dial_get_angle2(DIAL v) {
    return reinterpret_cast<Fl_Dial*>(v)->angle2();
}

void fl_dial_set_angle2(DIAL v, int t) {
    reinterpret_cast<Fl_Dial*>(v)->angle2(t);
}

void fl_dial_set_angles(DIAL v, int a, int b) {
    reinterpret_cast<Fl_Dial*>(v)->angles(a,b);
}

