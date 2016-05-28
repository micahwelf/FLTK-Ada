

#ifndef FL_TEXT_EDITOR_GUARD
#define FL_TEXT_EDITOR_GUARD


typedef void* TEXTEDITOR;


extern "C" TEXTEDITOR new_fl_text_editor(int x, int y, int w, int h, char* label);
extern "C" void free_fl_text_editor(TEXTEDITOR te);


#endif

