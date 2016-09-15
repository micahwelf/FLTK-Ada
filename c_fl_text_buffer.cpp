

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

