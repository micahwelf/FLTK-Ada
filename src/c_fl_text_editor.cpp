

#include <FL/Fl_Text_Editor.H>
#include "c_fl_text_editor.h"
#include "c_fl_type.h"




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




void fl_text_editor_default(TEXTEDITOR te, int k) {
    Fl_Text_Editor::kf_default(k, reinterpret_cast<Fl_Text_Editor*>(te));
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

void fl_text_editor_select_all(TEXTEDITOR te) {
    Fl_Text_Editor::kf_select_all(0, reinterpret_cast<Fl_Text_Editor*>(te));
}




void fl_text_editor_backspace(TEXTEDITOR te) {
    Fl_Text_Editor::kf_backspace(0, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_insert(TEXTEDITOR te) {
    Fl_Text_Editor::kf_insert(0, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_enter(TEXTEDITOR te) {
    Fl_Text_Editor::kf_enter(0, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_ignore(TEXTEDITOR te) {
    Fl_Text_Editor::kf_ignore(0, reinterpret_cast<Fl_Text_Editor*>(te));
}




void fl_text_editor_home(TEXTEDITOR te) {
    Fl_Text_Editor::kf_home(0, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_end(TEXTEDITOR te) {
    Fl_Text_Editor::kf_end(0, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_page_down(TEXTEDITOR te) {
    Fl_Text_Editor::kf_page_down(0, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_page_up(TEXTEDITOR te) {
    Fl_Text_Editor::kf_page_up(0, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_down(TEXTEDITOR te) {
    Fl_Text_Editor::kf_down(0, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_left(TEXTEDITOR te) {
    Fl_Text_Editor::kf_left(0, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_right(TEXTEDITOR te) {
    Fl_Text_Editor::kf_right(0, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_up(TEXTEDITOR te) {
    Fl_Text_Editor::kf_up(0, reinterpret_cast<Fl_Text_Editor*>(te));
}




void fl_text_editor_shift_home(TEXTEDITOR te) {
    Fl_Text_Editor::kf_shift_move(FL_Home, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_shift_end(TEXTEDITOR te) {
    Fl_Text_Editor::kf_shift_move(FL_End, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_shift_page_down(TEXTEDITOR te) {
    Fl_Text_Editor::kf_shift_move(FL_Page_Down, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_shift_page_up(TEXTEDITOR te) {
    Fl_Text_Editor::kf_shift_move(FL_Page_Up, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_shift_down(TEXTEDITOR te) {
    Fl_Text_Editor::kf_shift_move(FL_Down, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_shift_left(TEXTEDITOR te) {
    Fl_Text_Editor::kf_shift_move(FL_Left, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_shift_right(TEXTEDITOR te) {
    Fl_Text_Editor::kf_shift_move(FL_Right, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_shift_up(TEXTEDITOR te) {
    Fl_Text_Editor::kf_shift_move(FL_Up, reinterpret_cast<Fl_Text_Editor*>(te));
}




void fl_text_editor_ctrl_home(TEXTEDITOR te) {
    Fl_Text_Editor::kf_ctrl_move(FL_Home, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_ctrl_end(TEXTEDITOR te) {
    Fl_Text_Editor::kf_ctrl_move(FL_End, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_ctrl_page_down(TEXTEDITOR te) {
    Fl_Text_Editor::kf_ctrl_move(FL_Page_Down, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_ctrl_page_up(TEXTEDITOR te) {
    Fl_Text_Editor::kf_ctrl_move(FL_Page_Up, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_ctrl_down(TEXTEDITOR te) {
    Fl_Text_Editor::kf_ctrl_move(FL_Down, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_ctrl_left(TEXTEDITOR te) {
    Fl_Text_Editor::kf_ctrl_move(FL_Left, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_ctrl_right(TEXTEDITOR te) {
    Fl_Text_Editor::kf_ctrl_move(FL_Right, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_ctrl_up(TEXTEDITOR te) {
    Fl_Text_Editor::kf_ctrl_move(FL_Up, reinterpret_cast<Fl_Text_Editor*>(te));
}




void fl_text_editor_ctrl_shift_home(TEXTEDITOR te) {
    Fl_Text_Editor::kf_c_s_move(FL_Home, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_ctrl_shift_end(TEXTEDITOR te) {
    Fl_Text_Editor::kf_c_s_move(FL_End, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_ctrl_shift_page_down(TEXTEDITOR te) {
    Fl_Text_Editor::kf_c_s_move(FL_Page_Down, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_ctrl_shift_page_up(TEXTEDITOR te) {
    Fl_Text_Editor::kf_c_s_move(FL_Page_Up, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_ctrl_shift_down(TEXTEDITOR te) {
    Fl_Text_Editor::kf_c_s_move(FL_Down, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_ctrl_shift_left(TEXTEDITOR te) {
    Fl_Text_Editor::kf_c_s_move(FL_Left, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_ctrl_shift_right(TEXTEDITOR te) {
    Fl_Text_Editor::kf_c_s_move(FL_Right, reinterpret_cast<Fl_Text_Editor*>(te));
}

void fl_text_editor_ctrl_shift_up(TEXTEDITOR te) {
    Fl_Text_Editor::kf_c_s_move(FL_Up, reinterpret_cast<Fl_Text_Editor*>(te));
}




void fl_text_editor_remove_key_binding(TEXTEDITOR te, unsigned int k, unsigned long m) {
    reinterpret_cast<Fl_Text_Editor*>(te)->remove_key_binding(k, m);
}




int fl_text_editor_get_insert_mode(TEXTEDITOR te) {
    return reinterpret_cast<Fl_Text_Editor*>(te)->insert_mode();
}

void fl_text_editor_set_insert_mode(TEXTEDITOR te, int i) {
    reinterpret_cast<Fl_Text_Editor*>(te)->insert_mode(i);
}




//int fl_text_editor_get_tab_nav(TEXTEDITOR te) {
//    return reinterpret_cast<Fl_Text_Editor*>(te)->tab_nav();
//}

//void fl_text_editor_set_tab_nav(TEXTEDITOR te, int t) {
//    reinterpret_cast<Fl_Text_Editor*>(te)->tab_nav(t);
//}

