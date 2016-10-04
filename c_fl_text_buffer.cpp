

#include <FL/Fl_Text_Buffer.H>
#include "c_fl_text_buffer.h"


TEXTBUFFER new_fl_text_buffer(int rs, int pgs) {
    Fl_Text_Buffer *tb = new Fl_Text_Buffer(rs, pgs);
    return tb;
}


void free_fl_text_buffer(TEXTBUFFER tb) {
    delete reinterpret_cast<Fl_Text_Buffer*>(tb);
}


void fl_text_buffer_add_modify_callback(TEXTBUFFER tb, void * cb, void * ud) {
    reinterpret_cast<Fl_Text_Buffer*>(tb)->add_modify_callback(reinterpret_cast<Fl_Text_Modify_Cb>(cb), ud);
}


void fl_text_buffer_add_predelete_callback(TEXTBUFFER tb, void * cb, void * ud) {
    reinterpret_cast<Fl_Text_Buffer*>(tb)->add_predelete_callback(reinterpret_cast<Fl_Text_Predelete_Cb>(cb), ud);
}


void fl_text_buffer_call_modify_callbacks(TEXTBUFFER tb) {
    reinterpret_cast<Fl_Text_Buffer*>(tb)->call_modify_callbacks();
}


void fl_text_buffer_call_predelete_callbacks(TEXTBUFFER tb) {
    reinterpret_cast<Fl_Text_Buffer*>(tb)->call_predelete_callbacks();
}


int fl_text_buffer_length(TEXTBUFFER tb) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->length();
}


int fl_text_buffer_loadfile(TEXTBUFFER tb, char * n) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->loadfile(n);
}


void fl_text_buffer_remove_selection(TEXTBUFFER tb) {
    reinterpret_cast<Fl_Text_Buffer*>(tb)->remove_selection();
}


int fl_text_buffer_savefile(TEXTBUFFER tb, char * n) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->savefile(n);
}


int fl_text_buffer_search_forward(TEXTBUFFER tb, int start, const char * item, int * found, int mcase) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->search_forward(start, item, found, mcase);
}


void fl_text_buffer_select(TEXTBUFFER tb, int s, int e) {
    reinterpret_cast<Fl_Text_Buffer*>(tb)->select(s, e);
}

