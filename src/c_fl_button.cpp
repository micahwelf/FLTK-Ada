

#include <FL/Fl_Button.H>
#include "c_fl_button.h"


typedef void (hook)(void*);
typedef hook* hook_p;




class My_Button : public Fl_Button {
    public:
        using Fl_Button::Fl_Button;
        friend void button_set_draw_hook(BUTTON b, void * d);
        friend void fl_button_draw(BUTTON b);
    protected:
        void draw();
        void real_draw();
        hook_p draw_hook;
};


void My_Button::draw() {
    (*draw_hook)(this->user_data());
}


void My_Button::real_draw() {
    Fl_Button::draw();
}


void button_set_draw_hook(BUTTON b, void * d) {
    reinterpret_cast<My_Button*>(b)->draw_hook = reinterpret_cast<hook_p>(d);
}


void fl_button_draw(BUTTON b) {
    reinterpret_cast<My_Button*>(b)->real_draw();
}




BUTTON new_fl_button(int x, int y, int w, int h, char* label) {
    My_Button *b = new My_Button(x, y, w, h, label);
    return b;
}


void free_fl_button(BUTTON b) {
    delete reinterpret_cast<My_Button*>(b);
}




int fl_button_get_state(BUTTON b) {
    return reinterpret_cast<Fl_Button*>(b)->value();
}


void fl_button_set_state(BUTTON b, int s) {
    reinterpret_cast<Fl_Button*>(b)->value(s);
}


void fl_button_set_only(BUTTON b) {
    reinterpret_cast<Fl_Button*>(b)->setonly();
}

