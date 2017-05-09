

#include <FL/Fl_Multiline_Input.H>
#include "c_fl_multiline_input.h"


typedef void (hook)(void*);
typedef hook* hook_p;




class My_Multiline_Input : public Fl_Multiline_Input {
    public:
        using Fl_Multiline_Input::Fl_Multiline_Input;
        friend void multiline_input_set_draw_hook(MULTILINE_INPUT n, void * d);
        friend void fl_multiline_input_draw(MULTILINE_INPUT n);
    protected:
        void draw();
        void real_draw();
        hook_p draw_hook;
};


void My_Multiline_Input::draw() {
    (*draw_hook)(this->user_data());
}


void My_Multiline_Input::real_draw() {
    Fl_Multiline_Input::draw();
}


void multiline_input_set_draw_hook(MULTILINE_INPUT n, void * d) {
    reinterpret_cast<My_Multiline_Input*>(n)->draw_hook = reinterpret_cast<hook_p>(d);
}


void fl_multiline_input_draw(MULTILINE_INPUT n) {
    reinterpret_cast<My_Multiline_Input*>(n)->real_draw();
}




MULTILINE_INPUT new_fl_multiline_input(int x, int y, int w, int h, char* label) {
    My_Multiline_Input *i = new My_Multiline_Input(x, y, w, h, label);
    return i;
}


void free_fl_multiline_input(MULTILINE_INPUT i) {
    delete reinterpret_cast<My_Multiline_Input*>(i);
}


