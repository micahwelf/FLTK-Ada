

#include <FL/Fl_File_Input.H>
#include "c_fl_file_input.h"
#include "c_fl_type.h"




class My_File_Input : public Fl_File_Input {
    public:
        using Fl_File_Input::Fl_File_Input;
        friend void file_input_set_draw_hook(FILE_INPUT i, void * d);
        friend void fl_file_input_draw(FILE_INPUT i);
        friend void file_input_set_handle_hook(FILE_INPUT i, void * h);
        friend int fl_file_input_handle(FILE_INPUT i, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};


void My_File_Input::draw() {
    (*draw_hook)(this->user_data());
}


void My_File_Input::real_draw() {
    Fl_File_Input::draw();
}


int My_File_Input::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}


int My_File_Input::real_handle(int e) {
    return Fl_File_Input::handle(e);
}


void file_input_set_draw_hook(FILE_INPUT i, void * d) {
    reinterpret_cast<My_File_Input*>(i)->draw_hook = reinterpret_cast<d_hook_p>(d);
}


void fl_file_input_draw(FILE_INPUT i) {
    reinterpret_cast<My_File_Input*>(i)->real_draw();
}


void file_input_set_handle_hook(FILE_INPUT i, void * h) {
    reinterpret_cast<My_File_Input*>(i)->handle_hook = reinterpret_cast<h_hook_p>(h);
}


int fl_file_input_handle(FILE_INPUT i, int e) {
    return reinterpret_cast<My_File_Input*>(i)->real_handle(e);
}




FILE_INPUT new_fl_file_input(int x, int y, int w, int h, char* label) {
    My_File_Input *i = new My_File_Input(x, y, w, h, label);
    return i;
}


void free_fl_file_input(FILE_INPUT i) {
    delete reinterpret_cast<My_File_Input*>(i);
}


