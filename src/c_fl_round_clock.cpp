

#include <FL/Fl_Round_Clock.H>
#include "c_fl_round_clock.h"
#include "c_fl_type.h"




class My_Round_Clock : public Fl_Round_Clock {
    public:
        using Fl_Round_Clock::Fl_Round_Clock;
        friend void round_clock_set_draw_hook(ROUND_CLOCK c, void * d);
        friend void fl_round_clock_draw(ROUND_CLOCK c);
        friend void round_clock_set_handle_hook(ROUND_CLOCK c, void * h);
        friend int fl_round_clock_handle(ROUND_CLOCK c, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Round_Clock::draw() {
    (*draw_hook)(this->user_data());
}

void My_Round_Clock::real_draw() {
    Fl_Round_Clock::draw();
}

int My_Round_Clock::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Round_Clock::real_handle(int e) {
    return Fl_Round_Clock::handle(e);
}

void round_clock_set_draw_hook(ROUND_CLOCK c, void * d) {
    reinterpret_cast<My_Round_Clock*>(c)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_round_clock_draw(ROUND_CLOCK c) {
    reinterpret_cast<My_Round_Clock*>(c)->real_draw();
}

void round_clock_set_handle_hook(ROUND_CLOCK c, void * h) {
    reinterpret_cast<My_Round_Clock*>(c)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_round_clock_handle(ROUND_CLOCK c, int e) {
    return reinterpret_cast<My_Round_Clock*>(c)->real_handle(e);
}




ROUND_CLOCK new_fl_round_clock(int x, int y, int w, int h, char* label) {
    My_Round_Clock *c = new My_Round_Clock(x, y, w, h, label);
    return c;
}

void free_fl_round_clock(ROUND_CLOCK c) {
    delete reinterpret_cast<My_Round_Clock*>(c);
}


