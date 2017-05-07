

#include <FL/Fl_Text_Editor.H>
#include "c_fl_text_editor.h"


typedef void (hook)(void*);
typedef hook* hook_p;




class My_Text_Editor : public Fl_Text_Editor {
    public:
        using Fl_Text_Editor::Fl_Text_Editor;
        friend void text_editor_set_draw_hook(TEXTEDITOR te, void * d);
        friend void fl_text_editor_draw(TEXTEDITOR te);
    protected:
        void draw();
        void real_draw();
        hook_p draw_hook;
};


void My_Text_Editor::draw() {
    (*draw_hook)(this->user_data());
}


void My_Text_Editor::real_draw() {
    Fl_Text_Editor::draw();
}


void text_editor_set_draw_hook(TEXTEDITOR te, void * d) {
    reinterpret_cast<My_Text_Editor*>(te)->draw_hook = reinterpret_cast<hook_p>(d);
}


void fl_text_editor_draw(TEXTEDITOR te) {
    reinterpret_cast<My_Text_Editor*>(te)->real_draw();
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

