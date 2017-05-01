

#include <FL/Fl_Radio_Round_Button.H>
#include "c_fl_radio_round_button.h"


typedef void (hook)(void*);
typedef hook* hook_p;




class My_Radio_Round_Button : public Fl_Radio_Round_Button {
    public:
        using Fl_Radio_Round_Button::Fl_Radio_Round_Button;
        friend void radio_round_button_set_draw_hook(RADIOROUNDBUTTON b, void * d);
        friend void fl_radio_round_button_draw(RADIOROUNDBUTTON b);
    protected:
        void draw();
        void real_draw();
        hook_p draw_hook;
};


void My_Radio_Round_Button::draw() {
    (*draw_hook)(this->user_data());
}


void My_Radio_Round_Button::real_draw() {
    Fl_Radio_Round_Button::draw();
}


void radio_round_button_set_draw_hook(RADIOROUNDBUTTON b, void * d) {
    reinterpret_cast<My_Radio_Round_Button*>(b)->draw_hook = reinterpret_cast<hook_p>(d);
}


void fl_radio_round_button_draw(RADIOROUNDBUTTON b) {
    reinterpret_cast<My_Radio_Round_Button*>(b)->real_draw();
}




RADIOROUNDBUTTON new_fl_radio_round_button(int x, int y, int w, int h, char* label) {
    My_Radio_Round_Button *b = new My_Radio_Round_Button(x, y, w, h, label);
    return b;
}


void free_fl_radio_round_button(RADIOROUNDBUTTON b) {
    delete reinterpret_cast<My_Radio_Round_Button*>(b);
}

