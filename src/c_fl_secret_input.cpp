

#include <FL/Fl_Secret_Input.H>
#include "c_fl_secret_input.h"


typedef void (hook)(void*);
typedef hook* hook_p;




class My_Secret_Input : public Fl_Secret_Input {
    public:
        using Fl_Secret_Input::Fl_Secret_Input;
        friend void secret_input_set_draw_hook(SECRET_INPUT n, void * d);
        friend void fl_secret_input_draw(SECRET_INPUT n);
    protected:
        void draw();
        void real_draw();
        hook_p draw_hook;
};


void My_Secret_Input::draw() {
    (*draw_hook)(this->user_data());
}


void My_Secret_Input::real_draw() {
    Fl_Secret_Input::draw();
}


void secret_input_set_draw_hook(SECRET_INPUT n, void * d) {
    reinterpret_cast<My_Secret_Input*>(n)->draw_hook = reinterpret_cast<hook_p>(d);
}


void fl_secret_input_draw(SECRET_INPUT n) {
    reinterpret_cast<My_Secret_Input*>(n)->real_draw();
}




SECRET_INPUT new_fl_secret_input(int x, int y, int w, int h, char* label) {
    My_Secret_Input *i = new My_Secret_Input(x, y, w, h, label);
    return i;
}


void free_fl_secret_input(SECRET_INPUT i) {
    delete reinterpret_cast<My_Secret_Input*>(i);
}


