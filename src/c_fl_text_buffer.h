

#ifndef FL_TEXT_BUFFER_GUARD
#define FL_TEXT_BUFFER_GUARD




typedef void* TEXTBUFFER;




extern "C" inline TEXTBUFFER new_fl_text_buffer(int rs, int pgs);
extern "C" inline void free_fl_text_buffer(TEXTBUFFER tb);




extern "C" inline void fl_text_buffer_add_modify_callback(TEXTBUFFER tb, void * cb, void * ud);
extern "C" inline void fl_text_buffer_add_predelete_callback(TEXTBUFFER tb, void * cb, void * ud);
extern "C" inline void fl_text_buffer_call_modify_callbacks(TEXTBUFFER tb);
extern "C" inline void fl_text_buffer_call_predelete_callbacks(TEXTBUFFER tb);


extern "C" inline int fl_text_buffer_loadfile(TEXTBUFFER tb, char * n, int b);
extern "C" inline int fl_text_buffer_appendfile(TEXTBUFFER tb, char * n, int b);
extern "C" inline int fl_text_buffer_insertfile(TEXTBUFFER tb, char * n, int p, int b);
extern "C" inline int fl_text_buffer_outputfile(TEXTBUFFER tb, char * n, int f, int t, int b);
extern "C" inline int fl_text_buffer_savefile(TEXTBUFFER tb, char * n, int b);


extern "C" inline void fl_text_buffer_insert(TEXTBUFFER tb, int p, const char * item);
extern "C" inline void fl_text_buffer_append(TEXTBUFFER tb, const char * item);
extern "C" inline void fl_text_buffer_replace(TEXTBUFFER tb, int s, int f, const char * text);
extern "C" inline void fl_text_buffer_remove(TEXTBUFFER tb, int s, int f);
extern "C" inline char * fl_text_buffer_get_text(TEXTBUFFER tb);
extern "C" inline void fl_text_buffer_set_text(TEXTBUFFER tb, char * t);
extern "C" inline char fl_text_buffer_byte_at(TEXTBUFFER tb, int p);
extern "C" inline unsigned int fl_text_buffer_char_at(TEXTBUFFER tb, int p);
extern "C" inline char * fl_text_buffer_text_range(TEXTBUFFER tb, int s, int f);
extern "C" inline int fl_text_buffer_next_char(TEXTBUFFER tb, int p);
extern "C" inline int fl_text_buffer_prev_char(TEXTBUFFER tb, int p);


extern "C" inline int fl_text_buffer_count_displayed_characters(TEXTBUFFER tb, int s, int f);
extern "C" inline int fl_text_buffer_count_lines(TEXTBUFFER tb, int s, int f);
extern "C" inline int fl_text_buffer_length(TEXTBUFFER tb);
extern "C" inline int fl_text_buffer_get_tab_distance(TEXTBUFFER tb);
extern "C" inline void fl_text_buffer_set_tab_distance(TEXTBUFFER tb, int t);


extern "C" inline int fl_text_buffer_selection_position(TEXTBUFFER tb, int * s, int * e);
extern "C" inline int fl_text_buffer_secondary_selection_position(TEXTBUFFER tb, int * s, int * e);
extern "C" inline void fl_text_buffer_select(TEXTBUFFER tb, int s, int e);
extern "C" inline void fl_text_buffer_secondary_select(TEXTBUFFER tb, int s, int e);
extern "C" inline int fl_text_buffer_selected(TEXTBUFFER tb);
extern "C" inline int fl_text_buffer_secondary_selected(TEXTBUFFER tb);
extern "C" inline char * fl_text_buffer_selection_text(TEXTBUFFER tb);
extern "C" inline char * fl_text_buffer_secondary_selection_text(TEXTBUFFER tb);
extern "C" inline void fl_text_buffer_replace_selection(TEXTBUFFER tb, char * t);
extern "C" inline void fl_text_buffer_replace_secondary_selection(TEXTBUFFER tb, char * t);
extern "C" inline void fl_text_buffer_remove_selection(TEXTBUFFER tb);
extern "C" inline void fl_text_buffer_remove_secondary_selection(TEXTBUFFER tb);
extern "C" inline void fl_text_buffer_unselect(TEXTBUFFER tb);
extern "C" inline void fl_text_buffer_secondary_unselect(TEXTBUFFER tb);


extern "C" inline void fl_text_buffer_highlight(TEXTBUFFER tb, int f, int t);
extern "C" inline char * fl_text_buffer_highlight_text(TEXTBUFFER tb);
extern "C" inline void fl_text_buffer_unhighlight(TEXTBUFFER tb);


extern "C" inline int fl_text_buffer_findchar_forward(TEXTBUFFER tb, int start, unsigned int item, int * found);
extern "C" inline int fl_text_buffer_findchar_backward(TEXTBUFFER tb, int start, unsigned int item, int * found);
extern "C" inline int fl_text_buffer_search_forward(TEXTBUFFER tb, int start, const char * item, int * found, int mcase);
extern "C" inline int fl_text_buffer_search_backward(TEXTBUFFER tb, int start, const char * item, int * found, int mcase);


extern "C" inline int fl_text_buffer_word_start(TEXTBUFFER tb, int p);
extern "C" inline int fl_text_buffer_word_end(TEXTBUFFER tb, int p);
extern "C" inline int fl_text_buffer_line_start(TEXTBUFFER tb, int p);
extern "C" inline int fl_text_buffer_line_end(TEXTBUFFER tb, int p);
extern "C" inline char * fl_text_buffer_line_text(TEXTBUFFER tb, int p);
extern "C" inline int fl_text_buffer_skip_lines(TEXTBUFFER tb, int s, int l);
extern "C" inline int fl_text_buffer_rewind_lines(TEXTBUFFER tb, int s, int l);
extern "C" inline int fl_text_buffer_skip_displayed_characters(TEXTBUFFER tb, int s, int n);


extern "C" inline void fl_text_buffer_canundo(TEXTBUFFER tb, char f);
extern "C" inline void fl_text_buffer_copy(TEXTBUFFER tb, TEXTBUFFER tb2, int s, int f, int i);
extern "C" inline int fl_text_buffer_utf8_align(TEXTBUFFER tb, int p);


#endif

