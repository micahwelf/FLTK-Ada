

#include <FL/Fl_Counter.H>
#include "c_fl_counter.h"
#include "c_fl_type.h"




class My_Counter : public Fl_Counter {
    public:
        using Fl_Counter::Fl_Counter;
        friend void counter_set_draw_hook(COUNTER c, void * d);
        friend void fl_counter_draw(COUNTER c);
        friend void counter_set_handle_hook(COUNTER c, void * h);
        friend int fl_counter_handle(COUNTER c, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Counter::draw() {
    (*draw_hook)(this->user_data());
}

void My_Counter::real_draw() {
    Fl_Counter::draw();
}

int My_Counter::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Counter::real_handle(int e) {
    return Fl_Counter::handle(e);
}

void counter_set_draw_hook(COUNTER c, void * d) {
    reinterpret_cast<My_Counter*>(c)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_counter_draw(COUNTER c) {
    reinterpret_cast<My_Counter*>(c)->real_draw();
}

void counter_set_handle_hook(COUNTER c, void * h) {
    reinterpret_cast<My_Counter*>(c)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_counter_handle(COUNTER c, int e) {
    return reinterpret_cast<My_Counter*>(c)->real_handle(e);
}




COUNTER new_fl_counter(int x, int y, int w, int h, char* label) {
    My_Counter *c = new My_Counter(x, y, w, h, label);
    return c;
}

void free_fl_counter(COUNTER c) {
    delete reinterpret_cast<My_Counter*>(c);
}




double fl_counter_get_step(COUNTER c) {
    return reinterpret_cast<My_Counter*>(c)->step();
}

void fl_counter_set_step(COUNTER c, double t) {
    reinterpret_cast<My_Counter*>(c)->step(t);
}

void fl_counter_set_lstep(COUNTER c, double t) {
    reinterpret_cast<My_Counter*>(c)->lstep(t);
}




unsigned int fl_counter_get_textcolor(COUNTER c) {
    return reinterpret_cast<My_Counter*>(c)->textcolor();
}

void fl_counter_set_textcolor(COUNTER c, unsigned int t) {
    reinterpret_cast<My_Counter*>(c)->textcolor(t);
}

int fl_counter_get_textfont(COUNTER c) {
    return reinterpret_cast<My_Counter*>(c)->textfont();
}

void fl_counter_set_textfont(COUNTER c, int t) {
    reinterpret_cast<My_Counter*>(c)->textfont(t);
}

int fl_counter_get_textsize(COUNTER c) {
    return reinterpret_cast<My_Counter*>(c)->textsize();
}

void fl_counter_set_textsize(COUNTER c, int t) {
    reinterpret_cast<My_Counter*>(c)->textsize(t);
}

