

#include <FL/Fl_Wizard.H>
#include "c_fl_wizard.h"
#include "c_fl_type.h"




class My_Wizard : public Fl_Wizard {
    public:
        using Fl_Wizard::Fl_Wizard;
        friend void wizard_set_draw_hook(WIZARD w, void * d);
        friend void fl_wizard_draw(WIZARD w);
        friend void wizard_set_handle_hook(WIZARD w, void * h);
        friend int fl_wizard_handle(WIZARD w, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Wizard::draw() {
    (*draw_hook)(this->user_data());
}

void My_Wizard::real_draw() {
    //Fl_Wizard::draw();

    // required because of Fl_Wizard::draw() being private
    // probably a bug in FLTK?
    Fl_Widget *kid = value();
    if (damage() & FL_DAMAGE_ALL) {
        if (kid) {
            draw_box(box(), x(), y(), w(), h(), kid->color());
            draw_child(*kid);
        } else {
            draw_box(box(), x(), y(), w(), h(), color());
        }
    } else if (kid) {
        update_child(*kid);
    }
}

int My_Wizard::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Wizard::real_handle(int e) {
    return Fl_Wizard::handle(e);
}

void wizard_set_draw_hook(WIZARD w, void * d) {
    reinterpret_cast<My_Wizard*>(w)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_wizard_draw(WIZARD w) {
    reinterpret_cast<My_Wizard*>(w)->real_draw();
}

void wizard_set_handle_hook(WIZARD w, void * h) {
    reinterpret_cast<My_Wizard*>(w)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_wizard_handle(WIZARD w, int e) {
    return reinterpret_cast<My_Wizard*>(w)->real_handle(e);
}




WIZARD new_fl_wizard(int x, int y, int w, int h, char* label) {
    My_Wizard *g = new My_Wizard(x, y, w, h, label);
    return g;
}

void free_fl_wizard(WIZARD w) {
    delete reinterpret_cast<My_Wizard*>(w);
}




void fl_wizard_next(WIZARD w) {
    reinterpret_cast<Fl_Wizard*>(w)->next();
}

void fl_wizard_prev(WIZARD w) {
    reinterpret_cast<Fl_Wizard*>(w)->prev();
}




void * fl_wizard_get_visible(WIZARD w) {
    return reinterpret_cast<Fl_Wizard*>(w)->value();
}

void fl_wizard_set_visible(WIZARD w, void * i) {
    reinterpret_cast<Fl_Wizard*>(w)->value(reinterpret_cast<Fl_Widget*>(i));
}


