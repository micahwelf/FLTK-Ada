

#include <FL/Fl_Repeat_Button.H>
#include "c_fl_repeat_button.h"


typedef void (hook)(void*);
typedef hook* hook_p;




class My_Repeat_Button : public Fl_Repeat_Button {
    public:
        using Fl_Repeat_Button::Fl_Repeat_Button;
        friend void repeat_button_set_draw_hook(REPEATBUTTON b, void * d);
        friend void fl_repeat_button_draw(REPEATBUTTON b);
    protected:
        void draw();
        void real_draw();
        hook_p draw_hook;
};


void My_Repeat_Button::draw() {
    (*draw_hook)(this->user_data());
}


void My_Repeat_Button::real_draw() {
    Fl_Repeat_Button::draw();
}


void repeat_button_set_draw_hook(REPEATBUTTON b, void * d) {
    reinterpret_cast<My_Repeat_Button*>(b)->draw_hook = reinterpret_cast<hook_p>(d);
}


void fl_repeat_button_draw(REPEATBUTTON b) {
    reinterpret_cast<My_Repeat_Button*>(b)->real_draw();
}




REPEATBUTTON new_fl_repeat_button(int x, int y, int w, int h, char* label) {
    My_Repeat_Button *b = new My_Repeat_Button(x, y, w, h, label);
    return b;
}


void free_fl_repeat_button(REPEATBUTTON b) {
    delete reinterpret_cast<My_Repeat_Button*>(b);
}

