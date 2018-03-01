

#include <FL/Fl_Clock.H>
#include "c_fl_clock.h"
#include "c_fl_type.h"




class My_Clock : public Fl_Clock {
    public:
        using Fl_Clock::Fl_Clock;
        friend void clock_set_draw_hook(CLOCK c, void * d);
        friend void fl_clock_draw(CLOCK c);
        friend void clock_set_handle_hook(CLOCK c, void * h);
        friend int fl_clock_handle(CLOCK c, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Clock::draw() {
    (*draw_hook)(this->user_data());
}

void My_Clock::real_draw() {
    Fl_Clock::draw();
}

int My_Clock::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Clock::real_handle(int e) {
    return Fl_Clock::handle(e);
}

void clock_set_draw_hook(CLOCK c, void * d) {
    reinterpret_cast<My_Clock*>(c)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_clock_draw(CLOCK c) {
    reinterpret_cast<My_Clock*>(c)->real_draw();
}

void clock_set_handle_hook(CLOCK c, void * h) {
    reinterpret_cast<My_Clock*>(c)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_clock_handle(CLOCK c, int e) {
    return reinterpret_cast<My_Clock*>(c)->real_handle(e);
}




CLOCK new_fl_clock(int x, int y, int w, int h, char* label) {
    My_Clock *c = new My_Clock(x, y, w, h, label);
    return c;
}

void free_fl_clock(CLOCK c) {
    delete reinterpret_cast<My_Clock*>(c);
}




int fl_clock_get_hour(CLOCK c) {
    return reinterpret_cast<My_Clock*>(c)->hour();
}

int fl_clock_get_minute(CLOCK c) {
    return reinterpret_cast<My_Clock*>(c)->minute();
}

int fl_clock_get_second(CLOCK c) {
    return reinterpret_cast<My_Clock*>(c)->second();
}


ulong fl_clock_get_value(CLOCK c) {
    return reinterpret_cast<My_Clock*>(c)->value();
}

void fl_clock_set_value(CLOCK c, ulong v) {
    reinterpret_cast<My_Clock*>(c)->value(v);
}

void fl_clock_set_value2(CLOCK c, int h, int m, int s) {
    reinterpret_cast<My_Clock*>(c)->value(h,m,s);
}

