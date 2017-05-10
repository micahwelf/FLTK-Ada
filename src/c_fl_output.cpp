

#include <FL/Fl_Output.H>
#include "c_fl_output.h"


typedef void (hook)(void*);
typedef hook* hook_p;




class My_Output : public Fl_Output {
    public:
        using Fl_Output::Fl_Output;
        friend void output_set_draw_hook(OUTPUTT n, void * d);
        friend void fl_output_draw(OUTPUTT n);
    protected:
        void draw();
        void real_draw();
        hook_p draw_hook;
};


void My_Output::draw() {
    (*draw_hook)(this->user_data());
}


void My_Output::real_draw() {
    Fl_Output::draw();
}


void output_set_draw_hook(OUTPUTT n, void * d) {
    reinterpret_cast<My_Output*>(n)->draw_hook = reinterpret_cast<hook_p>(d);
}


void fl_output_draw(OUTPUTT n) {
    reinterpret_cast<My_Output*>(n)->real_draw();
}




OUTPUTT new_fl_output(int x, int y, int w, int h, char* label) {
    My_Output *i = new My_Output(x, y, w, h, label);
    return i;
}


void free_fl_output(OUTPUTT i) {
    delete reinterpret_cast<My_Output*>(i);
}


