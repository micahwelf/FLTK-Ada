

#ifndef FL_TEXT_DISPLAY_GUARD
#define FL_TEXT_DISPLAY_GUARD

#include "c_fl_text_buffer.h"


typedef void* TEXTDISPLAY;


extern "C" TEXTDISPLAY new_fl_text_display(int x, int y, int w, int h, char* label);
extern "C" void free_fl_text_display(TEXTDISPLAY td);

extern "C" TEXTBUFFER fl_text_display_get_buffer(TEXTDISPLAY td);
extern "C" void fl_text_display_set_buffer(TEXTDISPLAY td, TEXTBUFFER tb);
extern "C" int fl_text_display_get_text_color(TEXTDISPLAY td);
extern "C" void fl_text_display_set_text_color(TEXTDISPLAY td, int c);
extern "C" int fl_text_display_get_text_font(TEXTDISPLAY td);
extern "C" void fl_text_display_set_text_font(TEXTDISPLAY td, int f);
extern "C" int fl_text_display_get_text_size(TEXTDISPLAY td);
extern "C" void fl_text_display_set_text_size(TEXTDISPLAY td, int s);
extern "C" int fl_text_display_get_insert_pos(TEXTDISPLAY td);
extern "C" void fl_text_display_set_insert_pos(TEXTDISPLAY td, int p);
extern "C" void fl_text_display_show_insert_pos(TEXTDISPLAY td);
extern "C" void fl_text_display_next_word(TEXTDISPLAY td);
extern "C" void fl_text_display_previous_word(TEXTDISPLAY td);
extern "C" void fl_text_display_wrap_mode(TEXTDISPLAY td, int w, int m);


#endif

