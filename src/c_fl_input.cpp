

#include <FL/Fl_Input.H>
#include "c_fl_input.h"


typedef void (hook)(void*);
typedef hook* hook_p;




class My_Input : public Fl_Input {
    public:
        using Fl_Input::Fl_Input;
        friend void input_set_draw_hook(INPUT n, void * d);
        friend void fl_input_draw(INPUT n);
    protected:
        void draw();
        void real_draw();
        hook_p draw_hook;
};


void My_Input::draw() {
    (*draw_hook)(this->user_data());
}


void My_Input::real_draw() {
    Fl_Input::draw();
}


void input_set_draw_hook(INPUT n, void * d) {
    reinterpret_cast<My_Input*>(n)->draw_hook = reinterpret_cast<hook_p>(d);
}


void fl_input_draw(INPUT n) {
    reinterpret_cast<My_Input*>(n)->real_draw();
}




INPUT new_fl_input(int x, int y, int w, int h, char* label) {
    My_Input *i = new My_Input(x, y, w, h, label);
    return i;
}


void free_fl_input(INPUT i) {
    delete reinterpret_cast<My_Input*>(i);
}




const char * fl_input_get_value(INPUT i) {
    return reinterpret_cast<My_Input*>(i)->value();
}

