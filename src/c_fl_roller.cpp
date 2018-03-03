

#include <FL/Fl_Roller.H>
#include "c_fl_roller.h"
#include "c_fl_type.h"




class My_Roller : public Fl_Roller {
    public:
        using Fl_Roller::Fl_Roller;
        friend void roller_set_draw_hook(ROLLER r, void * d);
        friend void fl_roller_draw(ROLLER r);
        friend void roller_set_handle_hook(ROLLER r, void * h);
        friend int fl_roller_handle(ROLLER r, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Roller::draw() {
    (*draw_hook)(this->user_data());
}

void My_Roller::real_draw() {
    Fl_Roller::draw();
}

int My_Roller::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Roller::real_handle(int e) {
    return Fl_Roller::handle(e);
}

void roller_set_draw_hook(ROLLER r, void * d) {
    reinterpret_cast<My_Roller*>(r)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_roller_draw(ROLLER r) {
    reinterpret_cast<My_Roller*>(r)->real_draw();
}

void roller_set_handle_hook(ROLLER r, void * h) {
    reinterpret_cast<My_Roller*>(r)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_roller_handle(ROLLER r, int e) {
    return reinterpret_cast<My_Roller*>(r)->real_handle(e);
}




ROLLER new_fl_roller(int x, int y, int w, int h, char* label) {
    My_Roller *r = new My_Roller(x, y, w, h, label);
    return r;
}

void free_fl_roller(ROLLER r) {
    delete reinterpret_cast<My_Roller*>(r);
}


