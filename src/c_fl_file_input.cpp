

#include <FL/Fl_File_Input.H>
#include "c_fl_file_input.h"


typedef void (hook)(void*);
typedef hook* hook_p;




class My_File_Input : public Fl_File_Input {
    public:
        using Fl_File_Input::Fl_File_Input;
        friend void file_input_set_draw_hook(FILE_INPUT n, void * d);
        friend void fl_file_input_draw(FILE_INPUT n);
    protected:
        void draw();
        void real_draw();
        hook_p draw_hook;
};


void My_File_Input::draw() {
    (*draw_hook)(this->user_data());
}


void My_File_Input::real_draw() {
    Fl_File_Input::draw();
}


void file_input_set_draw_hook(FILE_INPUT n, void * d) {
    reinterpret_cast<My_File_Input*>(n)->draw_hook = reinterpret_cast<hook_p>(d);
}


void fl_file_input_draw(FILE_INPUT n) {
    reinterpret_cast<My_File_Input*>(n)->real_draw();
}




FILE_INPUT new_fl_file_input(int x, int y, int w, int h, char* label) {
    My_File_Input *i = new My_File_Input(x, y, w, h, label);
    return i;
}


void free_fl_file_input(FILE_INPUT i) {
    delete reinterpret_cast<My_File_Input*>(i);
}


