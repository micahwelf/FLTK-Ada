

#ifndef FL_TEXT_EDITOR_GUARD
#define FL_TEXT_EDITOR_GUARD


typedef void* TEXTEDITOR;




extern "C" void text_editor_set_draw_hook(TEXTEDITOR te, void * d);
extern "C" void fl_text_editor_draw(TEXTEDITOR te);
extern "C" void text_editor_set_handle_hook(TEXTEDITOR te, void * h);
extern "C" int fl_text_editor_handle(TEXTEDITOR te, int e);




extern "C" TEXTEDITOR new_fl_text_editor(int x, int y, int w, int h, char* label);
extern "C" void free_fl_text_editor(TEXTEDITOR te);




extern "C" void fl_text_editor_default(TEXTEDITOR te, int k);


extern "C" void fl_text_editor_undo(TEXTEDITOR te);
extern "C" void fl_text_editor_cut(TEXTEDITOR te);
extern "C" void fl_text_editor_copy(TEXTEDITOR te);
extern "C" void fl_text_editor_paste(TEXTEDITOR te);
extern "C" void fl_text_editor_delete(TEXTEDITOR te);
extern "C" void fl_text_editor_select_all(TEXTEDITOR te);


extern "C" void fl_text_editor_backspace(TEXTEDITOR te);
extern "C" void fl_text_editor_insert(TEXTEDITOR te);
extern "C" void fl_text_editor_enter(TEXTEDITOR te);
extern "C" void fl_text_editor_ignore(TEXTEDITOR te);


extern "C" void fl_text_editor_home(TEXTEDITOR te);
extern "C" void fl_text_editor_end(TEXTEDITOR te);
extern "C" void fl_text_editor_page_down(TEXTEDITOR te);
extern "C" void fl_text_editor_page_up(TEXTEDITOR te);
extern "C" void fl_text_editor_down(TEXTEDITOR te);
extern "C" void fl_text_editor_left(TEXTEDITOR te);
extern "C" void fl_text_editor_right(TEXTEDITOR te);
extern "C" void fl_text_editor_up(TEXTEDITOR te);


extern "C" void fl_text_editor_shift_home(TEXTEDITOR te);
extern "C" void fl_text_editor_shift_end(TEXTEDITOR te);
extern "C" void fl_text_editor_shift_page_down(TEXTEDITOR te);
extern "C" void fl_text_editor_shift_page_up(TEXTEDITOR te);
extern "C" void fl_text_editor_shift_down(TEXTEDITOR te);
extern "C" void fl_text_editor_shift_left(TEXTEDITOR te);
extern "C" void fl_text_editor_shift_right(TEXTEDITOR te);
extern "C" void fl_text_editor_shift_up(TEXTEDITOR te);


extern "C" void fl_text_editor_ctrl_home(TEXTEDITOR te);
extern "C" void fl_text_editor_ctrl_end(TEXTEDITOR te);
extern "C" void fl_text_editor_ctrl_page_down(TEXTEDITOR te);
extern "C" void fl_text_editor_ctrl_page_up(TEXTEDITOR te);
extern "C" void fl_text_editor_ctrl_down(TEXTEDITOR te);
extern "C" void fl_text_editor_ctrl_left(TEXTEDITOR te);
extern "C" void fl_text_editor_ctrl_right(TEXTEDITOR te);
extern "C" void fl_text_editor_ctrl_up(TEXTEDITOR te);


extern "C" void fl_text_editor_ctrl_shift_home(TEXTEDITOR te);
extern "C" void fl_text_editor_ctrl_shift_end(TEXTEDITOR te);
extern "C" void fl_text_editor_ctrl_shift_page_down(TEXTEDITOR te);
extern "C" void fl_text_editor_ctrl_shift_page_up(TEXTEDITOR te);
extern "C" void fl_text_editor_ctrl_shift_down(TEXTEDITOR te);
extern "C" void fl_text_editor_ctrl_shift_left(TEXTEDITOR te);
extern "C" void fl_text_editor_ctrl_shift_right(TEXTEDITOR te);
extern "C" void fl_text_editor_ctrl_shift_up(TEXTEDITOR te);


extern "C" void fl_text_editor_add_key_binding(TEXTEDITOR te, int k, int s, void * f);
extern "C" void fl_text_editor_remove_key_binding(TEXTEDITOR te, int k, int s);
extern "C" void fl_text_editor_remove_all_key_bindings(TEXTEDITOR te);
extern "C" void fl_text_editor_set_default_key_function(TEXTEDITOR te, void * f);


extern "C" int fl_text_editor_get_insert_mode(TEXTEDITOR te);
extern "C" void fl_text_editor_set_insert_mode(TEXTEDITOR te, int i);


//extern "C" int fl_text_editor_get_tab_nav(TEXTEDITOR te);
//extern "C" void fl_text_editor_set_tab_nav(TEXTEDITOR te, int t);


#endif

