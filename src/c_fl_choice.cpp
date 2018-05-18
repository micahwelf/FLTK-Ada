

#include <FL/Fl_Choice.H>
#include "c_fl_choice.h"
#include "c_fl_type.h"




class My_Choice : public Fl_Choice {
    public:
        using Fl_Choice::Fl_Choice;
        friend void choice_set_draw_hook(CHOICE n, void * d);
        friend void fl_choice_draw(CHOICE n);
        friend void choice_set_handle_hook(CHOICE n, void * h);
        friend int fl_choice_handle(CHOICE n, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Choice::draw() {
    (*draw_hook)(this->user_data());
}

void My_Choice::real_draw() {
    Fl_Choice::draw();
}

int My_Choice::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Choice::real_handle(int e) {
    return Fl_Choice::handle(e);
}

void choice_set_draw_hook(CHOICE n, void * d) {
    reinterpret_cast<My_Choice*>(n)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_choice_draw(CHOICE n) {
    reinterpret_cast<My_Choice*>(n)->real_draw();
}

void choice_set_handle_hook(CHOICE n, void * h) {
    reinterpret_cast<My_Choice*>(n)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_choice_handle(CHOICE n, int e) {
    return reinterpret_cast<My_Choice*>(n)->real_handle(e);
}




CHOICE new_fl_choice(int x, int y, int w, int h, char* label) {
    My_Choice *b = new My_Choice(x, y, w, h, label);
    return b;
}

void free_fl_choice(CHOICE b) {
    delete reinterpret_cast<My_Choice*>(b);
}




int fl_choice_value(CHOICE c) {
    return reinterpret_cast<Fl_Choice*>(c)->value();
}

int fl_choice_set_value(CHOICE c, int p) {
    return reinterpret_cast<Fl_Choice*>(c)->value(p);
}

int fl_choice_set_value2(CHOICE c, void * i) {
    return reinterpret_cast<Fl_Choice*>(c)->value(reinterpret_cast<Fl_Menu_Item*>(i));
}


