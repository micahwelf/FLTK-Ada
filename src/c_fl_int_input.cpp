

#include <FL/Fl_Int_Input.H>
#include "c_fl_int_input.h"


typedef void (hook)(void*);
typedef hook* hook_p;




class My_Int_Input : public Fl_Int_Input {
    public:
        using Fl_Int_Input::Fl_Int_Input;
        friend void int_input_set_draw_hook(INT_INPUT n, void * d);
        friend void fl_int_input_draw(INT_INPUT n);
    protected:
        void draw();
        void real_draw();
        hook_p draw_hook;
};


void My_Int_Input::draw() {
    (*draw_hook)(this->user_data());
}


void My_Int_Input::real_draw() {
    Fl_Int_Input::draw();
}


void int_input_set_draw_hook(INT_INPUT n, void * d) {
    reinterpret_cast<My_Int_Input*>(n)->draw_hook = reinterpret_cast<hook_p>(d);
}


void fl_int_input_draw(INT_INPUT n) {
    reinterpret_cast<My_Int_Input*>(n)->real_draw();
}




INT_INPUT new_fl_int_input(int x, int y, int w, int h, char* label) {
    My_Int_Input *i = new My_Int_Input(x, y, w, h, label);
    return i;
}


void free_fl_int_input(INT_INPUT i) {
    delete reinterpret_cast<My_Int_Input*>(i);
}


