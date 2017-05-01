

#include <FL/Fl_Box.H>
#include "c_fl_box.h"


typedef void (hook)(void*);
typedef hook* hook_p;




class My_Box : public Fl_Box {
    public:
        using Fl_Box::Fl_Box;
        friend void box_set_draw_hook(BOX n, void * d);
        friend void fl_box_draw(BOX n);
    protected:
        void draw();
        void real_draw();
        hook_p draw_hook;
};


void My_Box::draw() {
    (*draw_hook)(this->user_data());
}


void My_Box::real_draw() {
    Fl_Box::draw();
}


void box_set_draw_hook(BOX n, void * d) {
    reinterpret_cast<My_Box*>(n)->draw_hook = reinterpret_cast<hook_p>(d);
}


void fl_box_draw(BOX n) {
    reinterpret_cast<My_Box*>(n)->real_draw();
}




BOX new_fl_box(int x, int y, int w, int h, char* label) {
    My_Box *b = new My_Box(x, y, w, h, label);
    return b;
}


void free_fl_box(BOX b) {
    delete reinterpret_cast<My_Box*>(b);
}

