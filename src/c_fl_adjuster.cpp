

#include <FL/Fl_Adjuster.H>
#include "c_fl_adjuster.h"
#include "c_fl_type.h"




class My_Adjuster : public Fl_Adjuster {
    public:
        using Fl_Adjuster::Fl_Adjuster;
        friend void adjuster_set_draw_hook(ADJUSTER a, void * d);
        friend void fl_adjuster_draw(ADJUSTER a);
        friend void adjuster_set_handle_hook(ADJUSTER a, void * h);
        friend int fl_adjuster_handle(ADJUSTER a, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Adjuster::draw() {
    (*draw_hook)(this->user_data());
}

void My_Adjuster::real_draw() {
    Fl_Adjuster::draw();
}

int My_Adjuster::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Adjuster::real_handle(int e) {
    return Fl_Adjuster::handle(e);
}

void adjuster_set_draw_hook(ADJUSTER a, void * d) {
    reinterpret_cast<My_Adjuster*>(a)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_adjuster_draw(ADJUSTER a) {
    reinterpret_cast<My_Adjuster*>(a)->real_draw();
}

void adjuster_set_handle_hook(ADJUSTER a, void * h) {
    reinterpret_cast<My_Adjuster*>(a)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_adjuster_handle(ADJUSTER a, int e) {
    return reinterpret_cast<My_Adjuster*>(a)->real_handle(e);
}




ADJUSTER new_fl_adjuster(int x, int y, int w, int h, char* label) {
    My_Adjuster *a = new My_Adjuster(x, y, w, h, label);
    return a;
}

void free_fl_adjuster(ADJUSTER a) {
    delete reinterpret_cast<My_Adjuster*>(a);
}




int fl_adjuster_is_soft(ADJUSTER a) {
    return reinterpret_cast<Fl_Adjuster*>(a)->soft();
}

void fl_adjuster_set_soft(ADJUSTER a, int t) {
    reinterpret_cast<Fl_Adjuster*>(a)->soft(t);
}

