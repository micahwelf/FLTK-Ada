

#ifndef FL_TEXT_BUFFER_GUARD
#define FL_TEXT_BUFFER_GUARD




typedef void* TEXTBUFFER;




extern "C" TEXTBUFFER new_fl_text_buffer(int rs, int pgs);
extern "C" void free_fl_text_buffer(TEXTBUFFER tb);




extern "C" void fl_text_buffer_add_modify_callback(TEXTBUFFER tb, void * cb, void * ud);
extern "C" void fl_text_buffer_add_predelete_callback(TEXTBUFFER tb, void * cb, void * ud);
extern "C" void fl_text_buffer_call_modify_callbacks(TEXTBUFFER tb);
extern "C" void fl_text_buffer_call_predelete_callbacks(TEXTBUFFER tb);


extern "C" int fl_text_buffer_loadfile(TEXTBUFFER tb, char * n);
extern "C" int fl_text_buffer_savefile(TEXTBUFFER tb, char * n);


extern "C" void fl_text_buffer_insert(TEXTBUFFER tb, int p, const char * item);
extern "C" void fl_text_buffer_remove(TEXTBUFFER tb, int s, int f);
extern "C" unsigned int fl_text_buffer_char_at(TEXTBUFFER tb, int p);
extern "C" char * fl_text_buffer_text_range(TEXTBUFFER tb, int s, int f);
extern "C" int fl_text_buffer_length(TEXTBUFFER tb);


extern "C" int fl_text_buffer_selection_position(TEXTBUFFER tb, int * s, int * e);
extern "C" void fl_text_buffer_select(TEXTBUFFER tb, int s, int e);
extern "C" int fl_text_buffer_selected(TEXTBUFFER tb);
extern "C" void fl_text_buffer_remove_selection(TEXTBUFFER tb);


extern "C" int fl_text_buffer_search_forward(TEXTBUFFER tb, int start, const char * item, int * found, int mcase);
extern "C" int fl_text_buffer_search_backward(TEXTBUFFER tb, int start, const char * item, int * found, int mcase);
extern "C" int fl_text_buffer_skip_lines(TEXTBUFFER tb, int s, int l);
extern "C" int fl_text_buffer_rewind_lines(TEXTBUFFER tb, int s, int l);


#endif

