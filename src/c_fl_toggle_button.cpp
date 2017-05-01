

#include <FL/Fl_Toggle_Button.H>
#include "c_fl_toggle_button.h"


typedef void (hook)(void*);
typedef hook* hook_p;




class My_Toggle_Button : public Fl_Toggle_Button {
    public:
        using Fl_Toggle_Button::Fl_Toggle_Button;
        friend void toggle_button_set_draw_hook(TOGGLEBUTTON b, void * d);
        friend void fl_toggle_button_draw(TOGGLEBUTTON b);
    protected:
        void draw();
        void real_draw();
        hook_p draw_hook;
};


void My_Toggle_Button::draw() {
    (*draw_hook)(this->user_data());
}


void My_Toggle_Button::real_draw() {
    Fl_Toggle_Button::draw();
}


void toggle_button_set_draw_hook(TOGGLEBUTTON b, void * d) {
    reinterpret_cast<My_Toggle_Button*>(b)->draw_hook = reinterpret_cast<hook_p>(d);
}


void fl_toggle_button_draw(TOGGLEBUTTON b) {
    reinterpret_cast<My_Toggle_Button*>(b)->real_draw();
}




TOGGLEBUTTON new_fl_toggle_button(int x, int y, int w, int h, char* label) {
    My_Toggle_Button *b = new My_Toggle_Button(x, y, w, h, label);
    return b;
}


void free_fl_toggle_button(TOGGLEBUTTON b) {
    delete reinterpret_cast<My_Toggle_Button*>(b);
}

