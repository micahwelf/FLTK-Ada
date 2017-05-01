

#include <FL/Fl_Round_Button.H>
#include "c_fl_round_button.h"


typedef void (hook)(void*);
typedef hook* hook_p;




class My_Round_Button : public Fl_Round_Button {
    public:
        using Fl_Round_Button::Fl_Round_Button;
        friend void round_button_set_draw_hook(ROUNDBUTTON b, void * d);
        friend void fl_round_button_draw(ROUNDBUTTON b);
    protected:
        void draw();
        void real_draw();
        hook_p draw_hook;
};


void My_Round_Button::draw() {
    (*draw_hook)(this->user_data());
}


void My_Round_Button::real_draw() {
    Fl_Round_Button::draw();
}


void round_button_set_draw_hook(ROUNDBUTTON b, void * d) {
    reinterpret_cast<My_Round_Button*>(b)->draw_hook = reinterpret_cast<hook_p>(d);
}


void fl_round_button_draw(ROUNDBUTTON b) {
    reinterpret_cast<My_Round_Button*>(b)->real_draw();
}




ROUNDBUTTON new_fl_round_button(int x, int y, int w, int h, char* label) {
    My_Round_Button *b = new My_Round_Button(x, y, w, h, label);
    return b;
}


void free_fl_round_button(ROUNDBUTTON b) {
    delete reinterpret_cast<My_Round_Button*>(b);
}

