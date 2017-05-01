

#include <FL/Fl_Radio_Button.H>
#include "c_fl_radio_button.h"


typedef void (hook)(void*);
typedef hook* hook_p;




class My_Radio_Button : public Fl_Radio_Button {
    public:
        using Fl_Radio_Button::Fl_Radio_Button;
        friend void radio_button_set_draw_hook(RADIOBUTTON b, void * d);
        friend void fl_radio_button_draw(RADIOBUTTON b);
    protected:
        void draw();
        void real_draw();
        hook_p draw_hook;
};


void My_Radio_Button::draw() {
    (*draw_hook)(this->user_data());
}


void My_Radio_Button::real_draw() {
    Fl_Radio_Button::draw();
}


void radio_button_set_draw_hook(RADIOBUTTON b, void * d) {
    reinterpret_cast<My_Radio_Button*>(b)->draw_hook = reinterpret_cast<hook_p>(d);
}


void fl_radio_button_draw(RADIOBUTTON b) {
    reinterpret_cast<My_Radio_Button*>(b)->real_draw();
}




RADIOBUTTON new_fl_radio_button(int x, int y, int w, int h, char* label) {
    My_Radio_Button *b = new My_Radio_Button(x, y, w, h, label);
    return b;
}


void free_fl_radio_button(RADIOBUTTON b) {
    delete reinterpret_cast<My_Radio_Button*>(b);
}

