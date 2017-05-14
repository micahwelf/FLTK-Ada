

#include <FL/Fl_Multiline_Output.H>
#include "c_fl_multiline_output.h"




typedef void (d_hook)(void*);
typedef d_hook* d_hook_p;


typedef int (h_hook)(void*,int);
typedef h_hook* h_hook_p;




class My_Multiline_Output : public Fl_Multiline_Output {
    public:
        using Fl_Multiline_Output::Fl_Multiline_Output;
        friend void multiline_output_set_draw_hook(MULTILINE_OUTPUT i, void * d);
        friend void fl_multiline_output_draw(MULTILINE_OUTPUT i);
        friend void multiline_output_set_handle_hook(MULTILINE_OUTPUT i, void * h);
        friend int fl_multiline_output_handle(MULTILINE_OUTPUT i, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};


void My_Multiline_Output::draw() {
    (*draw_hook)(this->user_data());
}


void My_Multiline_Output::real_draw() {
    Fl_Multiline_Output::draw();
}


int My_Multiline_Output::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}


int My_Multiline_Output::real_handle(int e) {
    return Fl_Multiline_Output::handle(e);
}


void multiline_output_set_draw_hook(MULTILINE_OUTPUT i, void * d) {
    reinterpret_cast<My_Multiline_Output*>(i)->draw_hook = reinterpret_cast<d_hook_p>(d);
}


void fl_multiline_output_draw(MULTILINE_OUTPUT i) {
    reinterpret_cast<My_Multiline_Output*>(i)->real_draw();
}


void multiline_output_set_handle_hook(MULTILINE_OUTPUT i, void * h) {
    reinterpret_cast<My_Multiline_Output*>(i)->handle_hook = reinterpret_cast<h_hook_p>(h);
}


int fl_multiline_output_handle(MULTILINE_OUTPUT i, int e) {
    return reinterpret_cast<My_Multiline_Output*>(i)->real_handle(e);
}




MULTILINE_OUTPUT new_fl_multiline_output(int x, int y, int w, int h, char* label) {
    My_Multiline_Output *i = new My_Multiline_Output(x, y, w, h, label);
    return i;
}


void free_fl_multiline_output(MULTILINE_OUTPUT i) {
    delete reinterpret_cast<My_Multiline_Output*>(i);
}


