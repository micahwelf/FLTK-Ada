

#ifndef FL_TEXT_EDITOR_GUARD
#define FL_TEXT_EDITOR_GUARD


typedef void* TEXTEDITOR;




extern "C" void text_editor_set_draw_hook(TEXTEDITOR te, void * d);
extern "C" void fl_text_editor_draw(TEXTEDITOR te);
extern "C" void text_editor_set_handle_hook(TEXTEDITOR te, void * h);
extern "C" int fl_text_editor_handle(TEXTEDITOR te, int e);




extern "C" TEXTEDITOR new_fl_text_editor(int x, int y, int w, int h, char* label);
extern "C" void free_fl_text_editor(TEXTEDITOR te);




extern "C" void fl_text_editor_undo(TEXTEDITOR te);
extern "C" void fl_text_editor_cut(TEXTEDITOR te);
extern "C" void fl_text_editor_copy(TEXTEDITOR te);
extern "C" void fl_text_editor_paste(TEXTEDITOR te);
extern "C" void fl_text_editor_delete(TEXTEDITOR te);


extern "C" void fl_text_editor_backspace(TEXTEDITOR te);
extern "C" void fl_text_editor_home(TEXTEDITOR te);
extern "C" void fl_text_editor_end(TEXTEDITOR te);
extern "C" void fl_text_editor_insert(TEXTEDITOR te);
extern "C" void fl_text_editor_page_down(TEXTEDITOR te);
extern "C" void fl_text_editor_page_up(TEXTEDITOR te);
extern "C" void fl_text_editor_down(TEXTEDITOR te);
extern "C" void fl_text_editor_left(TEXTEDITOR te);
extern "C" void fl_text_editor_right(TEXTEDITOR te);
extern "C" void fl_text_editor_up(TEXTEDITOR te);


extern "C" void fl_text_editor_remove_key_binding(TEXTEDITOR te, unsigned int k, unsigned long m);


extern "C" int fl_text_editor_get_insert_mode(TEXTEDITOR te);
extern "C" void fl_text_editor_set_insert_mode(TEXTEDITOR te, int i);


//extern "C" int fl_text_editor_get_tab_nav(TEXTEDITOR te);
//extern "C" void fl_text_editor_set_tab_nav(TEXTEDITOR te, int t);


#endif

