

#include <FL/Fl_Pack.H>
#include "c_fl_pack.h"
#include "c_fl_type.h"




class My_Pack : public Fl_Pack {
    public:
        using Fl_Pack::Fl_Pack;
        friend void pack_set_draw_hook(PACK n, void * d);
        friend void fl_pack_draw(PACK n);
        friend void pack_set_handle_hook(PACK n, void * h);
        friend int fl_pack_handle(PACK n, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Pack::draw() {
    (*draw_hook)(this->user_data());
}

void My_Pack::real_draw() {
    Fl_Pack::draw();
}

int My_Pack::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Pack::real_handle(int e) {
    return Fl_Pack::handle(e);
}

void pack_set_draw_hook(PACK n, void * d) {
    reinterpret_cast<My_Pack*>(n)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_pack_draw(PACK n) {
    reinterpret_cast<My_Pack*>(n)->real_draw();
}

void pack_set_handle_hook(PACK n, void * h) {
    reinterpret_cast<My_Pack*>(n)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_pack_handle(PACK n, int e) {
    return reinterpret_cast<My_Pack*>(n)->real_handle(e);
}




PACK new_fl_pack(int x, int y, int w, int h, char* label) {
    My_Pack *b = new My_Pack(x, y, w, h, label);
    return b;
}

void free_fl_pack(PACK p) {
    delete reinterpret_cast<My_Pack*>(p);
}




int fl_pack_get_spacing(PACK p) {
    return reinterpret_cast<Fl_Pack*>(p)->spacing();
}

void fl_pack_set_spacing(PACK p, int t) {
    reinterpret_cast<Fl_Pack*>(p)->spacing(t);
}


