

#include <FL/Fl_Multiline_Output.H>
#include "c_fl_multiline_output.h"


typedef void (hook)(void*);
typedef hook* hook_p;




class My_Multiline_Output : public Fl_Multiline_Output {
    public:
        using Fl_Multiline_Output::Fl_Multiline_Output;
        friend void multiline_output_set_draw_hook(MULTILINE_OUTPUT n, void * d);
        friend void fl_multiline_output_draw(MULTILINE_OUTPUT n);
    protected:
        void draw();
        void real_draw();
        hook_p draw_hook;
};


void My_Multiline_Output::draw() {
    (*draw_hook)(this->user_data());
}


void My_Multiline_Output::real_draw() {
    Fl_Multiline_Output::draw();
}


void multiline_output_set_draw_hook(MULTILINE_OUTPUT n, void * d) {
    reinterpret_cast<My_Multiline_Output*>(n)->draw_hook = reinterpret_cast<hook_p>(d);
}


void fl_multiline_output_draw(MULTILINE_OUTPUT n) {
    reinterpret_cast<My_Multiline_Output*>(n)->real_draw();
}




MULTILINE_OUTPUT new_fl_multiline_output(int x, int y, int w, int h, char* label) {
    My_Multiline_Output *i = new My_Multiline_Output(x, y, w, h, label);
    return i;
}


void free_fl_multiline_output(MULTILINE_OUTPUT i) {
    delete reinterpret_cast<My_Multiline_Output*>(i);
}


