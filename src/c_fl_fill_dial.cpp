

#include <FL/Fl_Fill_Dial.H>
#include "c_fl_fill_dial.h"
#include "c_fl_type.h"




class My_Fill_Dial : public Fl_Fill_Dial {
    public:
        using Fl_Fill_Dial::Fl_Fill_Dial;
        friend void fill_dial_set_draw_hook(FILL_DIAL v, void * d);
        friend void fl_fill_dial_draw(FILL_DIAL v);
        friend void fill_dial_set_handle_hook(FILL_DIAL v, void * h);
        friend int fl_fill_dial_handle(FILL_DIAL v, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Fill_Dial::draw() {
    (*draw_hook)(this->user_data());
}

void My_Fill_Dial::real_draw() {
    Fl_Fill_Dial::draw();
}

int My_Fill_Dial::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Fill_Dial::real_handle(int e) {
    return Fl_Fill_Dial::handle(e);
}

void fill_dial_set_draw_hook(FILL_DIAL v, void * d) {
    reinterpret_cast<My_Fill_Dial*>(v)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_fill_dial_draw(FILL_DIAL v) {
    reinterpret_cast<My_Fill_Dial*>(v)->real_draw();
}

void fill_dial_set_handle_hook(FILL_DIAL v, void * h) {
    reinterpret_cast<My_Fill_Dial*>(v)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_fill_dial_handle(FILL_DIAL v, int e) {
    return reinterpret_cast<My_Fill_Dial*>(v)->real_handle(e);
}




FILL_DIAL new_fl_fill_dial(int x, int y, int w, int h, char* label) {
    My_Fill_Dial *v = new My_Fill_Dial(x, y, w, h, label);
    return v;
}

void free_fl_fill_dial(FILL_DIAL v) {
    delete reinterpret_cast<My_Fill_Dial*>(v);
}


