

#include <FL/Fl_Return_Button.H>
#include "c_fl_return_button.h"


typedef void (hook)(void*);
typedef hook* hook_p;




class My_Return_Button : public Fl_Return_Button {
    public:
        using Fl_Return_Button::Fl_Return_Button;
        friend void return_button_set_draw_hook(RETURNBUTTON b, void * d);
        friend void fl_return_button_draw(RETURNBUTTON b);
    protected:
        void draw();
        void real_draw();
        hook_p draw_hook;
};


void My_Return_Button::draw() {
    (*draw_hook)(this->user_data());
}


void My_Return_Button::real_draw() {
    Fl_Return_Button::draw();
}


void return_button_set_draw_hook(RETURNBUTTON b, void * d) {
    reinterpret_cast<My_Return_Button*>(b)->draw_hook = reinterpret_cast<hook_p>(d);
}


void fl_return_button_draw(RETURNBUTTON b) {
    reinterpret_cast<My_Return_Button*>(b)->real_draw();
}




RETURNBUTTON new_fl_return_button(int x, int y, int w, int h, char* label) {
    My_Return_Button *b = new My_Return_Button(x, y, w, h, label);
    return b;
}


void free_fl_return_button(RETURNBUTTON b) {
    delete reinterpret_cast<My_Return_Button*>(b);
}

