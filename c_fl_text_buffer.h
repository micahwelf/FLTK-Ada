

#ifndef FL_TEXT_BUFFER_GUARD
#define FL_TEXT_BUFFER_GUARD


typedef void* TEXTBUFFER;


extern "C" TEXTBUFFER new_fl_text_buffer(int rs, int pgs);
extern "C" void free_fl_text_buffer(TEXTBUFFER tb);


#endif

