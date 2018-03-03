

#include <FL/Fl_Line_Dial.H>
#include "c_fl_line_dial.h"
#include "c_fl_type.h"




class My_Line_Dial : public Fl_Line_Dial {
    public:
        using Fl_Line_Dial::Fl_Line_Dial;
        friend void line_dial_set_draw_hook(LINE_DIAL v, void * d);
        friend void fl_line_dial_draw(LINE_DIAL v);
        friend void line_dial_set_handle_hook(LINE_DIAL v, void * h);
        friend int fl_line_dial_handle(LINE_DIAL v, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Line_Dial::draw() {
    (*draw_hook)(this->user_data());
}

void My_Line_Dial::real_draw() {
    Fl_Line_Dial::draw();
}

int My_Line_Dial::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Line_Dial::real_handle(int e) {
    return Fl_Line_Dial::handle(e);
}

void line_dial_set_draw_hook(LINE_DIAL v, void * d) {
    reinterpret_cast<My_Line_Dial*>(v)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_line_dial_draw(LINE_DIAL v) {
    reinterpret_cast<My_Line_Dial*>(v)->real_draw();
}

void line_dial_set_handle_hook(LINE_DIAL v, void * h) {
    reinterpret_cast<My_Line_Dial*>(v)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_line_dial_handle(LINE_DIAL v, int e) {
    return reinterpret_cast<My_Line_Dial*>(v)->real_handle(e);
}




LINE_DIAL new_fl_line_dial(int x, int y, int w, int h, char* label) {
    My_Line_Dial *v = new My_Line_Dial(x, y, w, h, label);
    return v;
}

void free_fl_line_dial(LINE_DIAL v) {
    delete reinterpret_cast<My_Line_Dial*>(v);
}


