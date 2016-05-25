

#ifndef FL_TEXT_DISPLAY_GUARD
#define FL_TEXT_DISPLAY_GUARD


typedef void* TEXTDISPLAY;


extern "C" TEXTDISPLAY new_fl_text_display(int x, int y, int w, int h, char* label);
extern "C" void free_fl_text_display(TEXTDISPLAY td);

extern "C" int fl_text_display_get_text_color(TEXTDISPLAY td);
extern "C" void fl_text_display_set_text_color(TEXTDISPLAY td, int c);
extern "C" int fl_text_display_get_text_font(TEXTDISPLAY td);
extern "C" void fl_text_display_set_text_font(TEXTDISPLAY td, int f);
extern "C" int fl_text_display_get_text_size(TEXTDISPLAY td);
extern "C" void fl_text_display_set_text_size(TEXTDISPLAY td, int s);


#endif

