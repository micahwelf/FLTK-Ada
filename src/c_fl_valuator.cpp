

#include <FL/Fl_Valuator.H>
#include "c_fl_valuator.h"
#include "c_fl_type.h"




class My_Valuator : public Fl_Valuator {
    public:
        using Fl_Valuator::Fl_Valuator;
        friend void valuator_set_draw_hook(VALUATOR v, void * d);
        friend void valuator_set_handle_hook(VALUATOR v, void * h);
        friend int fl_valuator_handle(VALUATOR v, int e);
        friend VALUATOR new_fl_valuator(int x, int y, int w, int h, char* label);
    protected:
        void draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Valuator::draw() {
    (*draw_hook)(this->user_data());
}

int My_Valuator::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Valuator::real_handle(int e) {
    return Fl_Valuator::handle(e);
}

void valuator_set_draw_hook(VALUATOR v, void * d) {
    reinterpret_cast<My_Valuator*>(v)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void valuator_set_handle_hook(VALUATOR v, void * h) {
    reinterpret_cast<My_Valuator*>(v)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_valuator_handle(VALUATOR v, int e) {
    return reinterpret_cast<My_Valuator*>(v)->real_handle(e);
}




VALUATOR new_fl_valuator(int x, int y, int w, int h, char* label) {
    My_Valuator *v = new My_Valuator(x, y, w, h, label);
    return v;
}

void free_fl_valuator(VALUATOR v) {
    delete reinterpret_cast<My_Valuator*>(v);
}




double fl_valuator_clamp(VALUATOR v, double a) {
    return reinterpret_cast<My_Valuator*>(v)->clamp(a);
}

double fl_valuator_round(VALUATOR v, double a) {
    return reinterpret_cast<My_Valuator*>(v)->round(a);
}

double fl_valuator_increment(VALUATOR v, double a, int s) {
    return reinterpret_cast<My_Valuator*>(v)->increment(a,s);
}




double fl_valuator_get_minimum(VALUATOR v) {
    return reinterpret_cast<My_Valuator*>(v)->minimum();
}

void fl_valuator_set_minimum(VALUATOR v, double t) {
    reinterpret_cast<My_Valuator*>(v)->minimum(t);
}

double fl_valuator_get_maximum(VALUATOR v) {
    return reinterpret_cast<My_Valuator*>(v)->maximum();
}

void fl_valuator_set_maximum(VALUATOR v, double t) {
    reinterpret_cast<My_Valuator*>(v)->maximum(t);
}

double fl_valuator_get_value(VALUATOR v) {
    return reinterpret_cast<My_Valuator*>(v)->value();
}

void fl_valuator_set_value(VALUATOR v, double t) {
    reinterpret_cast<My_Valuator*>(v)->value(t);
}

void fl_valuator_bounds(VALUATOR v, double a, double b) {
    reinterpret_cast<My_Valuator*>(v)->bounds(a,b);
}

void fl_valuator_precision(VALUATOR v, int s) {
    reinterpret_cast<My_Valuator*>(v)->precision(s);
}

void fl_valuator_range(VALUATOR v, double a, double b) {
    reinterpret_cast<My_Valuator*>(v)->range(a,b);
}

