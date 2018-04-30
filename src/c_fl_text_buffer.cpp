

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




int fl_text_buffer_loadfile(TEXTBUFFER tb, char * n, int b) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->loadfile(n,b);
}

int fl_text_buffer_appendfile(TEXTBUFFER tb, char * n, int b) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->appendfile(n,b);
}

int fl_text_buffer_insertfile(TEXTBUFFER tb, char * n, int p, int b) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->insertfile(n,p,b);
}

int fl_text_buffer_outputfile(TEXTBUFFER tb, char * n, int f, int t, int b) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->outputfile(n,f,t,b);
}

int fl_text_buffer_savefile(TEXTBUFFER tb, char * n, int b) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->savefile(n,b);
}




void fl_text_buffer_insert(TEXTBUFFER tb, int p, const char * item) {
    reinterpret_cast<Fl_Text_Buffer*>(tb)->insert(p, item);
}

void fl_text_buffer_append(TEXTBUFFER tb, const char * item) {
    reinterpret_cast<Fl_Text_Buffer*>(tb)->append(item);
}

void fl_text_buffer_replace(TEXTBUFFER tb, int s, int f, const char * text) {
    reinterpret_cast<Fl_Text_Buffer*>(tb)->replace(s, f, text);
}

void fl_text_buffer_remove(TEXTBUFFER tb, int s, int f) {
    reinterpret_cast<Fl_Text_Buffer*>(tb)->remove(s, f);
}

char * fl_text_buffer_get_text(TEXTBUFFER tb) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->text();
}

void fl_text_buffer_set_text(TEXTBUFFER tb, char * t) {
    reinterpret_cast<Fl_Text_Buffer*>(tb)->text(t);
}

char fl_text_buffer_byte_at(TEXTBUFFER tb, int p) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->byte_at(p);
}

unsigned int fl_text_buffer_char_at(TEXTBUFFER tb, int p) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->char_at(p);
}

char * fl_text_buffer_text_range(TEXTBUFFER tb, int s, int f) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->text_range(s, f);
}

int fl_text_buffer_next_char(TEXTBUFFER tb, int p) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->next_char(p);
}

int fl_text_buffer_prev_char(TEXTBUFFER tb, int p) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->prev_char(p);
}




int fl_text_buffer_count_displayed_characters(TEXTBUFFER tb, int s, int f) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->count_displayed_characters(s,f);
}

int fl_text_buffer_count_lines(TEXTBUFFER tb, int s, int f) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->count_lines(s,f);
}

int fl_text_buffer_length(TEXTBUFFER tb) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->length();
}

int fl_text_buffer_get_tab_distance(TEXTBUFFER tb) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->tab_distance();
}

void fl_text_buffer_set_tab_distance(TEXTBUFFER tb, int t) {
    reinterpret_cast<Fl_Text_Buffer*>(tb)->tab_distance(t);
}




int fl_text_buffer_selection_position(TEXTBUFFER tb, int * s, int * e) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->selection_position(s, e);
}

int fl_text_buffer_secondary_selection_position(TEXTBUFFER tb, int * s, int * e) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->secondary_selection_position(s,e);
}

void fl_text_buffer_select(TEXTBUFFER tb, int s, int e) {
    reinterpret_cast<Fl_Text_Buffer*>(tb)->select(s, e);
}

void fl_text_buffer_secondary_select(TEXTBUFFER tb, int s, int e) {
    reinterpret_cast<Fl_Text_Buffer*>(tb)->secondary_select(s,e);
}

int fl_text_buffer_selected(TEXTBUFFER tb) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->selected();
}

int fl_text_buffer_secondary_selected(TEXTBUFFER tb) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->secondary_selected();
}

char * fl_text_buffer_selection_text(TEXTBUFFER tb) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->selection_text();
}

char * fl_text_buffer_secondary_selection_text(TEXTBUFFER tb) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->secondary_selection_text();
}

void fl_text_buffer_replace_selection(TEXTBUFFER tb, char * t) {
    reinterpret_cast<Fl_Text_Buffer*>(tb)->replace_selection(t);
}

void fl_text_buffer_replace_secondary_selection(TEXTBUFFER tb, char * t) {
    reinterpret_cast<Fl_Text_Buffer*>(tb)->replace_secondary_selection(t);
}

void fl_text_buffer_remove_selection(TEXTBUFFER tb) {
    reinterpret_cast<Fl_Text_Buffer*>(tb)->remove_selection();
}

void fl_text_buffer_remove_secondary_selection(TEXTBUFFER tb) {
    reinterpret_cast<Fl_Text_Buffer*>(tb)->remove_secondary_selection();
}

void fl_text_buffer_unselect(TEXTBUFFER tb) {
    reinterpret_cast<Fl_Text_Buffer*>(tb)->unselect();
}

void fl_text_buffer_secondary_unselect(TEXTBUFFER tb) {
    reinterpret_cast<Fl_Text_Buffer*>(tb)->secondary_unselect();
}




void fl_text_buffer_highlight(TEXTBUFFER tb, int f, int t) {
    reinterpret_cast<Fl_Text_Buffer*>(tb)->highlight(f,t);
}

char * fl_text_buffer_highlight_text(TEXTBUFFER tb) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->highlight_text();
}

void fl_text_buffer_unhighlight(TEXTBUFFER tb) {
    reinterpret_cast<Fl_Text_Buffer*>(tb)->unhighlight();
}




int fl_text_buffer_findchar_forward(TEXTBUFFER tb, int start, unsigned int item, int * found) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->findchar_forward(start, item, found);
}

int fl_text_buffer_findchar_backward(TEXTBUFFER tb, int start, unsigned int item, int * found) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->findchar_backward(start, item, found);
}

int fl_text_buffer_search_forward(TEXTBUFFER tb, int start, const char * item, int * found, int mcase) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->search_forward(start, item, found, mcase);
}

int fl_text_buffer_search_backward(TEXTBUFFER tb, int start, const char * item, int * found, int mcase) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->search_backward(start, item, found, mcase);
}




int fl_text_buffer_word_start(TEXTBUFFER tb, int p) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->word_start(p);
}

int fl_text_buffer_word_end(TEXTBUFFER tb, int p) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->word_end(p);
}

int fl_text_buffer_line_start(TEXTBUFFER tb, int p) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->line_start(p);
}

int fl_text_buffer_line_end(TEXTBUFFER tb, int p) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->line_end(p);
}

char * fl_text_buffer_line_text(TEXTBUFFER tb, int p) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->line_text(p);
}

int fl_text_buffer_skip_lines(TEXTBUFFER tb, int s, int l) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->skip_lines(s, l);
}

int fl_text_buffer_rewind_lines(TEXTBUFFER tb, int s, int l) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->rewind_lines(s, l);
}

int fl_text_buffer_skip_displayed_characters(TEXTBUFFER tb, int s, int n) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->skip_displayed_characters(s,n);
}




void fl_text_buffer_canundo(TEXTBUFFER tb, char f) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->canUndo(f);
}

void fl_text_buffer_copy(TEXTBUFFER tb, TEXTBUFFER tb2, int s, int f, int i) {
    reinterpret_cast<Fl_Text_Buffer*>(tb)->copy(reinterpret_cast<Fl_Text_Buffer*>(tb2),s,f,i);
}

int fl_text_buffer_utf8_align(TEXTBUFFER tb, int p) {
    return reinterpret_cast<Fl_Text_Buffer*>(tb)->utf8_align(p);
}


