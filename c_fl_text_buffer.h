

#ifndef FL_TEXT_BUFFER_GUARD
#define FL_TEXT_BUFFER_GUARD


typedef void* TEXTBUFFER;


extern "C" TEXTBUFFER new_fl_text_buffer(int rs, int pgs);
extern "C" void free_fl_text_buffer(TEXTBUFFER tb);


extern "C" void fl_text_buffer_add_modify_callback(TEXTBUFFER tb, void * cb, void * ud);
extern "C" void fl_text_buffer_add_predelete_callback(TEXTBUFFER tb, void * cb, void * ud);
extern "C" void fl_text_buffer_call_modify_callbacks(TEXTBUFFER tb);
extern "C" void fl_text_buffer_call_predelete_callbacks(TEXTBUFFER tb);
extern "C" int fl_text_buffer_length(TEXTBUFFER tb);
extern "C" int fl_text_buffer_loadfile(TEXTBUFFER tb, char * n);
extern "C" void fl_text_buffer_remove_selection(TEXTBUFFER tb);
extern "C" int fl_text_buffer_savefile(TEXTBUFFER tb, char * n);
extern "C" int fl_text_buffer_search_forward(TEXTBUFFER tb, int start, const char * item, int * found, int mcase);
extern "C" void fl_text_buffer_select(TEXTBUFFER tb, int s, int e);


#endif

