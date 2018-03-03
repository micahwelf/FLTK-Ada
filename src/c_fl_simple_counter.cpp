

#include <FL/Fl_Simple_Counter.H>
#include "c_fl_simple_counter.h"
#include "c_fl_type.h"




class My_Simple_Counter : public Fl_Simple_Counter {
    public:
        using Fl_Simple_Counter::Fl_Simple_Counter;
        friend void simple_counter_set_draw_hook(SIMPLE_COUNTER c, void * d);
        friend void fl_simple_counter_draw(SIMPLE_COUNTER c);
        friend void simple_counter_set_handle_hook(SIMPLE_COUNTER c, void * h);
        friend int fl_simple_counter_handle(SIMPLE_COUNTER c, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Simple_Counter::draw() {
    (*draw_hook)(this->user_data());
}

void My_Simple_Counter::real_draw() {
    Fl_Simple_Counter::draw();
}

int My_Simple_Counter::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Simple_Counter::real_handle(int e) {
    return Fl_Simple_Counter::handle(e);
}

void simple_counter_set_draw_hook(SIMPLE_COUNTER c, void * d) {
    reinterpret_cast<My_Simple_Counter*>(c)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_simple_counter_draw(SIMPLE_COUNTER c) {
    reinterpret_cast<My_Simple_Counter*>(c)->real_draw();
}

void simple_counter_set_handle_hook(SIMPLE_COUNTER c, void * h) {
    reinterpret_cast<My_Simple_Counter*>(c)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_simple_counter_handle(SIMPLE_COUNTER c, int e) {
    return reinterpret_cast<My_Simple_Counter*>(c)->real_handle(e);
}




SIMPLE_COUNTER new_fl_simple_counter(int x, int y, int w, int h, char* label) {
    My_Simple_Counter *c = new My_Simple_Counter(x, y, w, h, label);
    return c;
}

void free_fl_simple_counter(SIMPLE_COUNTER c) {
    delete reinterpret_cast<My_Simple_Counter*>(c);
}


