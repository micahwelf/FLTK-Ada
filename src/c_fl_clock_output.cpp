

#include <FL/Fl_Clock.H>
#include "c_fl_clock_output.h"
#include "c_fl_type.h"




class My_Clock_Output : public Fl_Clock_Output {
    public:
        using Fl_Clock_Output::Fl_Clock_Output;
        friend void clock_output_set_draw_hook(CLOCK_OUTPUT c, void * d);
        friend void fl_clock_output_draw(CLOCK_OUTPUT c);
        friend void clock_output_set_handle_hook(CLOCK_OUTPUT c, void * h);
        friend int fl_clock_output_handle(CLOCK_OUTPUT c, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Clock_Output::draw() {
    (*draw_hook)(this->user_data());
}

void My_Clock_Output::real_draw() {
    Fl_Clock_Output::draw();
}

int My_Clock_Output::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Clock_Output::real_handle(int e) {
    return Fl_Clock_Output::handle(e);
}

void clock_output_set_draw_hook(CLOCK_OUTPUT c, void * d) {
    reinterpret_cast<My_Clock_Output*>(c)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_clock_output_draw(CLOCK_OUTPUT c) {
    reinterpret_cast<My_Clock_Output*>(c)->real_draw();
}

void clock_output_set_handle_hook(CLOCK_OUTPUT c, void * h) {
    reinterpret_cast<My_Clock_Output*>(c)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_clock_output_handle(CLOCK_OUTPUT c, int e) {
    return reinterpret_cast<My_Clock_Output*>(c)->real_handle(e);
}




CLOCK_OUTPUT new_fl_clock_output(int x, int y, int w, int h, char* label) {
    My_Clock_Output *c = new My_Clock_Output(x, y, w, h, label);
    return c;
}

void free_fl_clock_output(CLOCK_OUTPUT c) {
    delete reinterpret_cast<My_Clock_Output*>(c);
}




int fl_clock_output_get_hour(CLOCK_OUTPUT c) {
    return reinterpret_cast<My_Clock_Output*>(c)->hour();
}

int fl_clock_output_get_minute(CLOCK_OUTPUT c) {
    return reinterpret_cast<My_Clock_Output*>(c)->minute();
}

int fl_clock_output_get_second(CLOCK_OUTPUT c) {
    return reinterpret_cast<My_Clock_Output*>(c)->second();
}


ulong fl_clock_output_get_value(CLOCK_OUTPUT c) {
    return reinterpret_cast<My_Clock_Output*>(c)->value();
}

void fl_clock_output_set_value(CLOCK_OUTPUT c, ulong v) {
    reinterpret_cast<My_Clock_Output*>(c)->value(v);
}

void fl_clock_output_set_value2(CLOCK_OUTPUT c, int h, int m, int s) {
    reinterpret_cast<My_Clock_Output*>(c)->value(h,m,s);
}

