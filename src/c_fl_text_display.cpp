

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


int fl_text_display_get_text_color(TEXTDISPLAY td) {
    return reinterpret_cast<Fl_Text_Display*>(td)->textcolor();
}


void fl_text_display_set_text_color(TEXTDISPLAY td, int c) {
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


int fl_text_display_get_insert_pos(TEXTDISPLAY td) {
    return reinterpret_cast<Fl_Text_Display*>(td)->insert_position();
}


void fl_text_display_set_insert_pos(TEXTDISPLAY td, int p) {
    reinterpret_cast<Fl_Text_Display*>(td)->insert_position(p);
}


void fl_text_display_show_insert_pos(TEXTDISPLAY td) {
    reinterpret_cast<Fl_Text_Display*>(td)->show_insert_position();
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


int fl_text_display_skip_lines(TEXTDISPLAY td, int s, int l, int p) {
    return reinterpret_cast<Fl_Text_Display*>(td)->skip_lines(s, l, p);
}


int fl_text_display_rewind_lines(TEXTDISPLAY td, int s, int l) {
    return reinterpret_cast<Fl_Text_Display*>(td)->rewind_lines(s, l);
}


void fl_text_display_linenumber_width(TEXTDISPLAY td, int w) {
    reinterpret_cast<Fl_Text_Display*>(td)->linenumber_width(w);
}

