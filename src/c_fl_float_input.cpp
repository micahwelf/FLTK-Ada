

#include <FL/Fl_Float_Input.H>
#include "c_fl_float_input.h"


typedef void (hook)(void*);
typedef hook* hook_p;




class My_Float_Input : public Fl_Float_Input {
    public:
        using Fl_Float_Input::Fl_Float_Input;
        friend void float_input_set_draw_hook(FLOAT_INPUT n, void * d);
        friend void fl_float_input_draw(FLOAT_INPUT n);
    protected:
        void draw();
        void real_draw();
        hook_p draw_hook;
};


void My_Float_Input::draw() {
    (*draw_hook)(this->user_data());
}


void My_Float_Input::real_draw() {
    Fl_Float_Input::draw();
}


void float_input_set_draw_hook(FLOAT_INPUT n, void * d) {
    reinterpret_cast<My_Float_Input*>(n)->draw_hook = reinterpret_cast<hook_p>(d);
}


void fl_float_input_draw(FLOAT_INPUT n) {
    reinterpret_cast<My_Float_Input*>(n)->real_draw();
}




FLOAT_INPUT new_fl_float_input(int x, int y, int w, int h, char* label) {
    My_Float_Input *i = new My_Float_Input(x, y, w, h, label);
    return i;
}


void free_fl_float_input(FLOAT_INPUT i) {
    delete reinterpret_cast<My_Float_Input*>(i);
}


