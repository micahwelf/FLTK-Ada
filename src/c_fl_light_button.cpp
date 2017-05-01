

#include <FL/Fl_Light_Button.H>
#include "c_fl_light_button.h"


typedef void (hook)(void*);
typedef hook* hook_p;




class My_Light_Button : public Fl_Light_Button {
    public:
        using Fl_Light_Button::Fl_Light_Button;
        friend void light_button_set_draw_hook(LIGHTBUTTON b, void * d);
        friend void fl_light_button_draw(LIGHTBUTTON b);
    protected:
        void draw();
        void real_draw();
        hook_p draw_hook;
};


void My_Light_Button::draw() {
    (*draw_hook)(this->user_data());
}


void My_Light_Button::real_draw() {
    Fl_Light_Button::draw();
}


void light_button_set_draw_hook(LIGHTBUTTON b, void * d) {
    reinterpret_cast<My_Light_Button*>(b)->draw_hook = reinterpret_cast<hook_p>(d);
}


void fl_light_button_draw(LIGHTBUTTON b) {
    reinterpret_cast<My_Light_Button*>(b)->real_draw();
}




LIGHTBUTTON new_fl_light_button(int x, int y, int w, int h, char* label) {
    My_Light_Button *b = new My_Light_Button(x, y, w, h, label);
    return b;
}


void free_fl_light_button(LIGHTBUTTON b) {
    delete reinterpret_cast<My_Light_Button*>(b);
}

