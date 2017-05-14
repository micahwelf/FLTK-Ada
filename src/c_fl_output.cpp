

#include <FL/Fl_Output.H>
#include "c_fl_output.h"
#include "c_fl_type.h"




class My_Output : public Fl_Output {
    public:
        using Fl_Output::Fl_Output;
        friend void output_set_draw_hook(OUTPUTT i, void * d);
        friend void fl_output_draw(OUTPUTT i);
        friend void output_set_handle_hook(OUTPUTT i, void * h);
        friend int fl_output_handle(OUTPUTT i, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};


void My_Output::draw() {
    (*draw_hook)(this->user_data());
}


void My_Output::real_draw() {
    Fl_Output::draw();
}


int My_Output::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}


int My_Output::real_handle(int e) {
    return Fl_Output::handle(e);
}


void output_set_draw_hook(OUTPUTT i, void * d) {
    reinterpret_cast<My_Output*>(i)->draw_hook = reinterpret_cast<d_hook_p>(d);
}


void fl_output_draw(OUTPUTT i) {
    reinterpret_cast<My_Output*>(i)->real_draw();
}


void output_set_handle_hook(OUTPUTT i, void * h) {
    reinterpret_cast<My_Output*>(i)->handle_hook = reinterpret_cast<h_hook_p>(h);
}


int fl_output_handle(OUTPUTT i, int e) {
    return reinterpret_cast<My_Output*>(i)->real_handle(e);
}




OUTPUTT new_fl_output(int x, int y, int w, int h, char* label) {
    My_Output *i = new My_Output(x, y, w, h, label);
    return i;
}


void free_fl_output(OUTPUTT i) {
    delete reinterpret_cast<My_Output*>(i);
}


