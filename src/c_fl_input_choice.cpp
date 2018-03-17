

#include <FL/Fl_Input_Choice.H>
#include "c_fl_input_choice.h"
#include "c_fl_type.h"




class My_Input_Choice : public Fl_Input_Choice {
    public:
        using Fl_Input_Choice::Fl_Input_Choice;
        friend void input_choice_set_draw_hook(INPUT_CHOICE n, void * d);
        friend void fl_input_choice_draw(INPUT_CHOICE n);
        friend void input_choice_set_handle_hook(INPUT_CHOICE n, void * h);
        friend int fl_input_choice_handle(INPUT_CHOICE n, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Input_Choice::draw() {
    (*draw_hook)(this->user_data());
}

void My_Input_Choice::real_draw() {
    Fl_Input_Choice::draw();
}

int My_Input_Choice::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Input_Choice::real_handle(int e) {
    return Fl_Input_Choice::handle(e);
}

void input_choice_set_draw_hook(INPUT_CHOICE n, void * d) {
    reinterpret_cast<My_Input_Choice*>(n)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_input_choice_draw(INPUT_CHOICE n) {
    reinterpret_cast<My_Input_Choice*>(n)->real_draw();
}

void input_choice_set_handle_hook(INPUT_CHOICE n, void * h) {
    reinterpret_cast<My_Input_Choice*>(n)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_input_choice_handle(INPUT_CHOICE n, int e) {
    return reinterpret_cast<My_Input_Choice*>(n)->real_handle(e);
}




INPUT_CHOICE new_fl_input_choice(int x, int y, int w, int h, char* label) {
    My_Input_Choice *n = new My_Input_Choice(x, y, w, h, label);
    return n;
}

void free_fl_input_choice(INPUT_CHOICE n) {
    delete reinterpret_cast<My_Input_Choice*>(n);
}




void * fl_input_choice_input(INPUT_CHOICE n) {
    return reinterpret_cast<My_Input_Choice*>(n)->input();
}

void * fl_input_choice_menubutton(INPUT_CHOICE n) {
    return reinterpret_cast<My_Input_Choice*>(n)->menubutton();
}




int fl_input_choice_changed(INPUT_CHOICE n) {
    return reinterpret_cast<My_Input_Choice*>(n)->changed();
}

void fl_input_choice_clear_changed(INPUT_CHOICE n) {
    reinterpret_cast<My_Input_Choice*>(n)->clear_changed();
}

int fl_input_choice_get_down_box(INPUT_CHOICE n) {
    return reinterpret_cast<My_Input_Choice*>(n)->down_box();
}

void fl_input_choice_set_down_box(INPUT_CHOICE n, int t) {
    reinterpret_cast<My_Input_Choice*>(n)->down_box(static_cast<Fl_Boxtype>(t));
}

unsigned int fl_input_choice_get_textcolor(INPUT_CHOICE n) {
    return reinterpret_cast<My_Input_Choice*>(n)->textcolor();
}

void fl_input_choice_set_textcolor(INPUT_CHOICE n, unsigned int t) {
    reinterpret_cast<My_Input_Choice*>(n)->textcolor(t);
}

int fl_input_choice_get_textfont(INPUT_CHOICE n) {
    return reinterpret_cast<My_Input_Choice*>(n)->textfont();
}

void fl_input_choice_set_textfont(INPUT_CHOICE n, int t) {
    reinterpret_cast<My_Input_Choice*>(n)->textfont(t);
}

int fl_input_choice_get_textsize(INPUT_CHOICE n) {
    return reinterpret_cast<My_Input_Choice*>(n)->textsize();
}

void fl_input_choice_set_textsize(INPUT_CHOICE n, int t) {
    reinterpret_cast<My_Input_Choice*>(n)->textsize(t);
}

const char * fl_input_choice_get_value(INPUT_CHOICE n) {
    return reinterpret_cast<My_Input_Choice*>(n)->value();
}

void fl_input_choice_set_value(INPUT_CHOICE n, const char * t) {
    reinterpret_cast<My_Input_Choice*>(n)->value(t);
}

void fl_input_choice_set_value2(INPUT_CHOICE n, int t) {
    reinterpret_cast<My_Input_Choice*>(n)->value(t);
}


