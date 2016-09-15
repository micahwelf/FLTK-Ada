

#ifndef FL_TEXT_BUFFER_GUARD
#define FL_TEXT_BUFFER_GUARD


typedef void* TEXTBUFFER;


extern "C" TEXTBUFFER new_fl_text_buffer(int rs, int pgs);
extern "C" void free_fl_text_buffer(TEXTBUFFER tb);


extern "C" void fl_text_buffer_add_modify_callback(TEXTBUFFER tb, void * cb, void * ud);
extern "C" void fl_text_buffer_add_predelete_callback(TEXTBUFFER tb, void * cb, void * ud);


#endif

