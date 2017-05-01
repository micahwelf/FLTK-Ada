

#ifndef FL_TEXT_EDITOR_GUARD
#define FL_TEXT_EDITOR_GUARD


typedef void* TEXTEDITOR;


extern "C" void text_editor_set_draw_hook(TEXTEDITOR te, void * d);
extern "C" void fl_text_editor_draw(TEXTEDITOR te);


extern "C" TEXTEDITOR new_fl_text_editor(int x, int y, int w, int h, char* label);
extern "C" void free_fl_text_editor(TEXTEDITOR te);


extern "C" void fl_text_editor_undo(TEXTEDITOR te);
extern "C" void fl_text_editor_cut(TEXTEDITOR te);
extern "C" void fl_text_editor_copy(TEXTEDITOR te);
extern "C" void fl_text_editor_paste(TEXTEDITOR te);
extern "C" void fl_text_editor_delete(TEXTEDITOR te);
extern "C" void fl_text_editor_remove_key_binding(TEXTEDITOR te, unsigned int k, unsigned long m);


#endif

