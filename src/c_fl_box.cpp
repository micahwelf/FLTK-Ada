

#include <FL/Fl_Box.H>
#include "c_fl_box.h"




typedef void (d_hook)(void*);
typedef d_hook* d_hook_p;


typedef int (h_hook)(void*,int);
typedef h_hook* h_hook_p;




class My_Box : public Fl_Box {
    public:
        using Fl_Box::Fl_Box;
        friend void box_set_draw_hook(BOX n, void * d);
        friend void fl_box_draw(BOX n);
        friend void box_set_handle_hook(BOX n, void * h);
        friend int fl_box_handle(BOX n, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};


void My_Box::draw() {
    (*draw_hook)(this->user_data());
}


void My_Box::real_draw() {
    Fl_Box::draw();
}


int My_Box::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}


int My_Box::real_handle(int e) {
    return Fl_Box::handle(e);
}


void box_set_draw_hook(BOX n, void * d) {
    reinterpret_cast<My_Box*>(n)->draw_hook = reinterpret_cast<d_hook_p>(d);
}


void fl_box_draw(BOX n) {
    reinterpret_cast<My_Box*>(n)->real_draw();
}


void box_set_handle_hook(BOX n, void * h) {
    reinterpret_cast<My_Box*>(n)->handle_hook = reinterpret_cast<h_hook_p>(h);
}


int fl_box_handle(BOX n, int e) {
    return reinterpret_cast<My_Box*>(n)->real_handle(e);
}




BOX new_fl_box(int x, int y, int w, int h, char* label) {
    My_Box *b = new My_Box(x, y, w, h, label);
    return b;
}


void free_fl_box(BOX b) {
    delete reinterpret_cast<My_Box*>(b);
}

