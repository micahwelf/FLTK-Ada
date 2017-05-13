

#include <FL/Fl_Text_Editor.H>
#include "c_fl_text_editor.h"




typedef void (d_hook)(void*);
typedef d_hook* d_hook_p;


typedef int (h_hook)(void*,int);
typedef h_hook* h_hook_p;




class My_Text_Editor : public Fl_Text_Editor {
    public:
        using Fl_Text_Editor::Fl_Text_Editor;
        friend void text_editor_set_draw_hook(TEXTEDITOR te, void * d);
        friend void fl_text_editor_draw(TEXTEDITOR te);
        friend void text_editor_set_handle_hook(TEXTEDITOR te, void * h);
        friend int fl_text_editor_handle(TEXTEDITOR te, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};


void My_Text_Editor::draw() {
    (*draw_hook)(this->user_data());
}


void My_Text_Editor::real_draw() {
    Fl_Text_Editor::draw();
}


int My_Text_Editor::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}


int My_Text_Editor::real_handle(int e) {
    return Fl_Text_Editor::handle(e);
}


void text_editor_set_draw_hook(TEXTEDITOR te, void * d) {
    reinterpret_cast<My_Text_Editor*>(te)->draw_hook = reinterpret_cast<d_hook_p>(d);
}


void fl_text_editor_draw(TEXTEDITOR te) {
    reinterpret_cast<My_Text_Editor*>(te)->real_draw();
}


void text_editor_set_handle_hook(TEXTEDITOR te, void * h) {
    reinterpret_cast<My_Text_Editor*>(te)->handle_hook = reinterpret_cast<h_hook_p>(h);
}


int fl_text_editor_handle(TEXTEDITOR te, int e) {
    return reinterpret_cast<My_Text_Editor*>(te)->real_handle(e);
}




TEXTEDITOR new_fl_text_editor(int x, int y, int w, int h, char* label) {
    My_Text_Editor *te = new My_Text_Editor(x, y, w, h, label);
    return te;
}


void free_fl_text_editor(TEXTEDITOR te) {
    delete reinterpret_cast<My_Text_Editor*>(te);
}




void fl_text_editor_undo(TEXTEDITOR te) {
    Fl_Text_Editor::kf_undo(0, reinterpret_cast<Fl_Text_Editor*>(te));
}


void fl_text_editor_cut(TEXTEDITOR te) {
    Fl_Text_Editor::kf_cut(0, reinterpret_cast<Fl_Text_Editor*>(te));
}


void fl_text_editor_copy(TEXTEDITOR te) {
    Fl_Text_Editor::kf_copy(0, reinterpret_cast<Fl_Text_Editor*>(te));
}


void fl_text_editor_paste(TEXTEDITOR te) {
    Fl_Text_Editor::kf_paste(0, reinterpret_cast<Fl_Text_Editor*>(te));
}


void fl_text_editor_delete(TEXTEDITOR te) {
    Fl_Text_Editor::kf_delete(0, reinterpret_cast<Fl_Text_Editor*>(te));
}


void fl_text_editor_remove_key_binding(TEXTEDITOR te, unsigned int k, unsigned long m) {
    reinterpret_cast<Fl_Text_Editor*>(te)->remove_key_binding(k, m);
}

