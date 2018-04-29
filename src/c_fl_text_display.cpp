

#include <FL/Fl_Text_Display.H>
#include <FL/Fl_Text_Buffer.H>
#include "c_fl_text_display.h"
#include "c_fl_text_buffer.h"
#include "c_fl_type.h"




class My_Text_Display : public Fl_Text_Display {
    public:
        using Fl_Text_Display::Fl_Text_Display;
        friend void text_display_set_draw_hook(TEXTDISPLAY td, void * d);
        friend void fl_text_display_draw(TEXTDISPLAY td);
        friend void text_display_set_handle_hook(TEXTDISPLAY td, void * h);
        friend int fl_text_display_handle(TEXTDISPLAY td, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Text_Display::draw() {
    (*draw_hook)(this->user_data());
}

void My_Text_Display::real_draw() {
    Fl_Text_Display::draw();
}

int My_Text_Display::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Text_Display::real_handle(int e) {
    return Fl_Text_Display::handle(e);
}

void text_display_set_draw_hook(TEXTDISPLAY td, void * d) {
    reinterpret_cast<My_Text_Display*>(td)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_text_display_draw(TEXTDISPLAY td) {
    reinterpret_cast<My_Text_Display*>(td)->real_draw();
}

void text_display_set_handle_hook(TEXTDISPLAY td, void * h) {
    reinterpret_cast<My_Text_Display*>(td)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_text_display_handle(TEXTDISPLAY td, int e) {
    return reinterpret_cast<My_Text_Display*>(td)->real_handle(e);
}




TEXTDISPLAY new_fl_text_display(int x, int y, int w, int h, char*  label) {
    My_Text_Display *td = new My_Text_Display(x, y, w, h, label);
    return td;
}

void free_fl_text_display(TEXTDISPLAY td) {
    delete reinterpret_cast<My_Text_Display*>(td);
}




// this actually never gets called, since an access to the text_buffer
// object is stored on the Ada side of things
TEXTBUFFER fl_text_display_get_buffer(TEXTDISPLAY td) {
    return reinterpret_cast<Fl_Text_Display*>(td)->buffer();
}

void fl_text_display_set_buffer(TEXTDISPLAY td, TEXTBUFFER tb) {
    reinterpret_cast<Fl_Text_Display*>(td)->buffer(reinterpret_cast<Fl_Text_Buffer*>(tb));
}




void fl_text_display_highlight_data(TEXTDISPLAY td, TEXTBUFFER tb, void * st, int len) {
    reinterpret_cast<Fl_Text_Display*>(td)->highlight_data
        (reinterpret_cast<Fl_Text_Buffer*>(tb), reinterpret_cast<Fl_Text_Display::Style_Table_Entry*>(st), len, 0, 0, 0);
}

void fl_text_display_highlight_data2(TEXTDISPLAY td, TEXTBUFFER tb, void * st, int len, char us, void * cb, void * a) {
    reinterpret_cast<Fl_Text_Display*>(td)->highlight_data
       (reinterpret_cast<Fl_Text_Buffer*>(tb), reinterpret_cast<Fl_Text_Display::Style_Table_Entry*>(st), len,
        us, reinterpret_cast<Fl_Text_Display::Unfinished_Style_Cb>(cb), a);
}




double fl_text_display_col_to_x(TEXTDISPLAY td, double c) {
    return reinterpret_cast<Fl_Text_Display*>(td)->col_to_x(c);
}

double fl_text_display_x_to_col(TEXTDISPLAY td, double x) {
    return reinterpret_cast<Fl_Text_Display*>(td)->x_to_col(x);
}

int fl_text_display_in_selection(TEXTDISPLAY td, int x, int y) {
    return reinterpret_cast<Fl_Text_Display*>(td)->in_selection(x, y);
}

int fl_text_display_position_to_xy(TEXTDISPLAY td, int p, int * x, int * y) {
    return reinterpret_cast<Fl_Text_Display*>(td)->position_to_xy(p, x, y);
}




unsigned int fl_text_display_get_cursor_color(TEXTDISPLAY td) {
    return reinterpret_cast<Fl_Text_Display*>(td)->cursor_color();
}

void fl_text_display_set_cursor_color(TEXTDISPLAY td, unsigned int c) {
    reinterpret_cast<Fl_Text_Display*>(td)->cursor_color(c);
}

void fl_text_display_set_cursor_style(TEXTDISPLAY td, int s) {
    reinterpret_cast<Fl_Text_Display*>(td)->cursor_style(s);
}

void fl_text_display_hide_cursor(TEXTDISPLAY td) {
    reinterpret_cast<Fl_Text_Display*>(td)->hide_cursor();
}

void fl_text_display_show_cursor(TEXTDISPLAY td) {
    reinterpret_cast<Fl_Text_Display*>(td)->show_cursor();
}




unsigned int fl_text_display_get_text_color(TEXTDISPLAY td) {
    return reinterpret_cast<Fl_Text_Display*>(td)->textcolor();
}

void fl_text_display_set_text_color(TEXTDISPLAY td, unsigned int c) {
    reinterpret_cast<Fl_Text_Display*>(td)->textcolor(static_cast<Fl_Color>(c));
}

int fl_text_display_get_text_font(TEXTDISPLAY td) {
    return reinterpret_cast<Fl_Text_Display*>(td)->textfont();
}

void fl_text_display_set_text_font(TEXTDISPLAY td, int f) {
    reinterpret_cast<Fl_Text_Display*>(td)->textfont(static_cast<Fl_Font>(f));
}

int fl_text_display_get_text_size(TEXTDISPLAY td) {
    return reinterpret_cast<Fl_Text_Display*>(td)->textsize();
}

void fl_text_display_set_text_size(TEXTDISPLAY td, int s) {
    reinterpret_cast<Fl_Text_Display*>(td)->textsize(static_cast<Fl_Fontsize>(s));
}




void fl_text_display_insert(TEXTDISPLAY td, char * i) {
    reinterpret_cast<Fl_Text_Display*>(td)->insert(i);
}

void fl_text_display_overstrike(TEXTDISPLAY td, char * t) {
    reinterpret_cast<Fl_Text_Display*>(td)->overstrike(t);
}

int fl_text_display_get_insert_pos(TEXTDISPLAY td) {
    return reinterpret_cast<Fl_Text_Display*>(td)->insert_position();
}

void fl_text_display_set_insert_pos(TEXTDISPLAY td, int p) {
    reinterpret_cast<Fl_Text_Display*>(td)->insert_position(p);
}

void fl_text_display_show_insert_pos(TEXTDISPLAY td) {
    reinterpret_cast<Fl_Text_Display*>(td)->show_insert_position();
}




int fl_text_display_word_start(TEXTDISPLAY td, int p) {
    return reinterpret_cast<Fl_Text_Display*>(td)->word_start(p);
}

int fl_text_display_word_end(TEXTDISPLAY td, int p) {
    return reinterpret_cast<Fl_Text_Display*>(td)->word_end(p);
}

void fl_text_display_next_word(TEXTDISPLAY td) {
    reinterpret_cast<Fl_Text_Display*>(td)->next_word();
}

void fl_text_display_previous_word(TEXTDISPLAY td) {
    reinterpret_cast<Fl_Text_Display*>(td)->previous_word();
}

void fl_text_display_wrap_mode(TEXTDISPLAY td, int w, int m) {
    reinterpret_cast<Fl_Text_Display*>(td)->wrap_mode(w, m);
}




int fl_text_display_line_start(TEXTDISPLAY td, int s) {
    return reinterpret_cast<Fl_Text_Display*>(td)->line_start(s);
}

int fl_text_display_line_end(TEXTDISPLAY td, int s, int p) {
    return reinterpret_cast<Fl_Text_Display*>(td)->line_end(s, p);
}

int fl_text_display_count_lines(TEXTDISPLAY td, int s, int f, int p) {
    return reinterpret_cast<Fl_Text_Display*>(td)->count_lines(s, f, p);
}

int fl_text_display_skip_lines(TEXTDISPLAY td, int s, int l, int p) {
    return reinterpret_cast<Fl_Text_Display*>(td)->skip_lines(s, l, p);
}

int fl_text_display_rewind_lines(TEXTDISPLAY td, int s, int l) {
    return reinterpret_cast<Fl_Text_Display*>(td)->rewind_lines(s, l);
}




unsigned int fl_text_display_get_linenumber_align(TEXTDISPLAY td) {
    return reinterpret_cast<Fl_Text_Display*>(td)->linenumber_align();
}

void fl_text_display_set_linenumber_align(TEXTDISPLAY td, unsigned int a) {
    reinterpret_cast<Fl_Text_Display*>(td)->linenumber_align(a);
}

unsigned int fl_text_display_get_linenumber_bgcolor(TEXTDISPLAY td) {
    return reinterpret_cast<Fl_Text_Display*>(td)->linenumber_bgcolor();
}

void fl_text_display_set_linenumber_bgcolor(TEXTDISPLAY td, unsigned int c) {
    reinterpret_cast<Fl_Text_Display*>(td)->linenumber_bgcolor(c);
}

unsigned int fl_text_display_get_linenumber_fgcolor(TEXTDISPLAY td) {
    return reinterpret_cast<Fl_Text_Display*>(td)->linenumber_fgcolor();
}

void fl_text_display_set_linenumber_fgcolor(TEXTDISPLAY td, unsigned int c) {
    reinterpret_cast<Fl_Text_Display*>(td)->linenumber_fgcolor(c);
}

int fl_text_display_get_linenumber_font(TEXTDISPLAY td) {
    return reinterpret_cast<Fl_Text_Display*>(td)->linenumber_font();
}

void fl_text_display_set_linenumber_font(TEXTDISPLAY td, int f) {
    reinterpret_cast<Fl_Text_Display*>(td)->linenumber_font(f);
}

int fl_text_display_get_linenumber_size(TEXTDISPLAY td) {
    return reinterpret_cast<Fl_Text_Display*>(td)->linenumber_size();
}

void fl_text_display_set_linenumber_size(TEXTDISPLAY td, int s) {
    reinterpret_cast<Fl_Text_Display*>(td)->linenumber_size(s);
}

int fl_text_display_get_linenumber_width(TEXTDISPLAY td) {
    return reinterpret_cast<Fl_Text_Display*>(td)->linenumber_width();
}

void fl_text_display_set_linenumber_width(TEXTDISPLAY td, int w) {
    reinterpret_cast<Fl_Text_Display*>(td)->linenumber_width(w);
}




int fl_text_display_move_down(TEXTDISPLAY td) {
    return reinterpret_cast<Fl_Text_Display*>(td)->move_down();
}

int fl_text_display_move_left(TEXTDISPLAY td) {
    return reinterpret_cast<Fl_Text_Display*>(td)->move_left();
}

int fl_text_display_move_right(TEXTDISPLAY td) {
    return reinterpret_cast<Fl_Text_Display*>(td)->move_right();
}

int fl_text_display_move_up(TEXTDISPLAY td) {
    return reinterpret_cast<Fl_Text_Display*>(td)->move_up();
}




void fl_text_display_scroll(TEXTDISPLAY td, int l) {
    reinterpret_cast<Fl_Text_Display*>(td)->scroll(l, 1);
}

unsigned int fl_text_display_get_scrollbar_align(TEXTDISPLAY td) {
    return reinterpret_cast<Fl_Text_Display*>(td)->scrollbar_align();
}

void fl_text_display_set_scrollbar_align(TEXTDISPLAY td, unsigned int a) {
    reinterpret_cast<Fl_Text_Display*>(td)->scrollbar_align(a);
}

int fl_text_display_get_scrollbar_width(TEXTDISPLAY td) {
    return reinterpret_cast<Fl_Text_Display*>(td)->scrollbar_width();
}

void fl_text_display_set_scrollbar_width(TEXTDISPLAY td, int w) {
    reinterpret_cast<Fl_Text_Display*>(td)->scrollbar_width(w);
}




void fl_text_display_redisplay_range(TEXTDISPLAY td, int s, int f) {
    reinterpret_cast<Fl_Text_Display*>(td)->redisplay_range(s,f);
}


