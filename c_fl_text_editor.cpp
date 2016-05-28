

#include <FL/Fl_Text_Editor.H>
#include "c_fl_text_editor.h"


TEXTEDITOR new_fl_text_editor(int x, int y, int w, int h, char* label) {
    Fl_Text_Editor *te = new Fl_Text_Editor(x, y, w, h, label);
    return te;
}


void free_fl_text_editor(TEXTEDITOR te) {
    delete reinterpret_cast<Fl_Text_Editor*>(te);
}

