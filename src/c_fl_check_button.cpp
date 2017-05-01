

#include <FL/Fl_Check_Button.H>
#include "c_fl_check_button.h"


typedef void (hook)(void*);
typedef hook* hook_p;




class My_Check_Button : public Fl_Check_Button {
    public:
        using Fl_Check_Button::Fl_Check_Button;
        friend void check_button_set_draw_hook(CHECKBUTTON b, void * d);
        friend void fl_check_button_draw(CHECKBUTTON b);
    protected:
        void draw();
        void real_draw();
        hook_p draw_hook;
};


void My_Check_Button::draw() {
    (*draw_hook)(this->user_data());
}


void My_Check_Button::real_draw() {
    Fl_Check_Button::draw();
}


void check_button_set_draw_hook(CHECKBUTTON b, void * d) {
    reinterpret_cast<My_Check_Button*>(b)->draw_hook = reinterpret_cast<hook_p>(d);
}


void fl_check_button_draw(CHECKBUTTON b) {
    reinterpret_cast<My_Check_Button*>(b)->real_draw();
}




CHECKBUTTON new_fl_check_button(int x, int y, int w, int h, char* label) {
    My_Check_Button *b = new My_Check_Button(x, y, w, h, label);
    return b;
}


void free_fl_check_button(CHECKBUTTON b) {
    delete reinterpret_cast<My_Check_Button*>(b);
}

