

#ifndef FL_TEXT_DISPLAY_GUARD
#define FL_TEXT_DISPLAY_GUARD

#include "c_fl_text_buffer.h"




typedef void* TEXTDISPLAY;




extern "C" inline void text_display_set_draw_hook(TEXTDISPLAY td, void * d);
extern "C" inline void fl_text_display_draw(TEXTDISPLAY td);
extern "C" inline void text_display_set_handle_hook(TEXTDISPLAY td, void * h);
extern "C" inline int fl_text_display_handle(TEXTDISPLAY td, int e);




extern "C" inline TEXTDISPLAY new_fl_text_display(int x, int y, int w, int h, char* label);
extern "C" inline void free_fl_text_display(TEXTDISPLAY td);




extern "C" inline TEXTBUFFER fl_text_display_get_buffer(TEXTDISPLAY td);
extern "C" inline void fl_text_display_set_buffer(TEXTDISPLAY td, TEXTBUFFER tb);


extern "C" inline void fl_text_display_highlight_data(TEXTDISPLAY td, TEXTBUFFER tb, void * st, int len);
extern "C" inline void fl_text_display_highlight_data2(TEXTDISPLAY td, TEXTBUFFER tb, void * st, int len, char us, void * cb, void * a);


extern "C" inline double fl_text_display_col_to_x(TEXTDISPLAY td, double c);
extern "C" inline double fl_text_display_x_to_col(TEXTDISPLAY td, double x);
extern "C" inline int fl_text_display_in_selection(TEXTDISPLAY td, int x, int y);
extern "C" inline int fl_text_display_position_to_xy(TEXTDISPLAY td, int p, int * x, int * y);


extern "C" inline unsigned int fl_text_display_get_cursor_color(TEXTDISPLAY td);
extern "C" inline void fl_text_display_set_cursor_color(TEXTDISPLAY td, unsigned int c);
extern "C" inline void fl_text_display_set_cursor_style(TEXTDISPLAY td, int s);
extern "C" inline void fl_text_display_hide_cursor(TEXTDISPLAY td);
extern "C" inline void fl_text_display_show_cursor(TEXTDISPLAY td);


extern "C" inline unsigned int fl_text_display_get_text_color(TEXTDISPLAY td);
extern "C" inline void fl_text_display_set_text_color(TEXTDISPLAY td, unsigned int c);
extern "C" inline int fl_text_display_get_text_font(TEXTDISPLAY td);
extern "C" inline void fl_text_display_set_text_font(TEXTDISPLAY td, int f);
extern "C" inline int fl_text_display_get_text_size(TEXTDISPLAY td);
extern "C" inline void fl_text_display_set_text_size(TEXTDISPLAY td, int s);


extern "C" inline void fl_text_display_insert(TEXTDISPLAY td, char * i);
extern "C" inline void fl_text_display_overstrike(TEXTDISPLAY td, char * t);
extern "C" inline int fl_text_display_get_insert_pos(TEXTDISPLAY td);
extern "C" inline void fl_text_display_set_insert_pos(TEXTDISPLAY td, int p);
extern "C" inline void fl_text_display_show_insert_pos(TEXTDISPLAY td);


extern "C" inline int fl_text_display_word_start(TEXTDISPLAY td, int p);
extern "C" inline int fl_text_display_word_end(TEXTDISPLAY td, int p);
extern "C" inline void fl_text_display_next_word(TEXTDISPLAY td);
extern "C" inline void fl_text_display_previous_word(TEXTDISPLAY td);
extern "C" inline void fl_text_display_wrap_mode(TEXTDISPLAY td, int w, int m);


extern "C" inline int fl_text_display_line_start(TEXTDISPLAY td, int s);
extern "C" inline int fl_text_display_line_end(TEXTDISPLAY td, int s, int p);
extern "C" inline int fl_text_display_count_lines(TEXTDISPLAY td, int s, int f, int p);
extern "C" inline int fl_text_display_skip_lines(TEXTDISPLAY td, int s, int l, int p);
extern "C" inline int fl_text_display_rewind_lines(TEXTDISPLAY td, int s, int l);


extern "C" inline unsigned int fl_text_display_get_linenumber_align(TEXTDISPLAY td);
extern "C" inline void fl_text_display_set_linenumber_align(TEXTDISPLAY td, unsigned int a);
extern "C" inline unsigned int fl_text_display_get_linenumber_bgcolor(TEXTDISPLAY td);
extern "C" inline void fl_text_display_set_linenumber_bgcolor(TEXTDISPLAY td, unsigned int c);
extern "C" inline unsigned int fl_text_display_get_linenumber_fgcolor(TEXTDISPLAY td);
extern "C" inline void fl_text_display_set_linenumber_fgcolor(TEXTDISPLAY td, unsigned int c);
extern "C" inline int fl_text_display_get_linenumber_font(TEXTDISPLAY td);
extern "C" inline void fl_text_display_set_linenumber_font(TEXTDISPLAY td, int f);
extern "C" inline int fl_text_display_get_linenumber_size(TEXTDISPLAY td);
extern "C" inline void fl_text_display_set_linenumber_size(TEXTDISPLAY td, int s);
extern "C" inline int fl_text_display_get_linenumber_width(TEXTDISPLAY td);
extern "C" inline void fl_text_display_set_linenumber_width(TEXTDISPLAY td, int w);


extern "C" inline int fl_text_display_move_down(TEXTDISPLAY td);
extern "C" inline int fl_text_display_move_left(TEXTDISPLAY td);
extern "C" inline int fl_text_display_move_right(TEXTDISPLAY td);
extern "C" inline int fl_text_display_move_up(TEXTDISPLAY td);


extern "C" inline void fl_text_display_scroll(TEXTDISPLAY td, int l);
extern "C" inline unsigned int fl_text_display_get_scrollbar_align(TEXTDISPLAY td);
extern "C" inline void fl_text_display_set_scrollbar_align(TEXTDISPLAY td, unsigned int a);
extern "C" inline int fl_text_display_get_scrollbar_width(TEXTDISPLAY td);
extern "C" inline void fl_text_display_set_scrollbar_width(TEXTDISPLAY td, int w);


extern "C" inline void fl_text_display_redisplay_range(TEXTDISPLAY td, int s, int f);


#endif

