

#include <FL/Fl_Text_Display.H>
#include <FL/Fl_Text_Buffer.H>
#include "c_fl_text_display.h"
#include "c_fl_text_buffer.h"


TEXTDISPLAY new_fl_text_display(int x, int y, int w, int h, char*  label) {
    Fl_Text_Display *td = new Fl_Text_Display(x, y, w, h, label);
    return td;
}


void free_fl_text_display(TEXTDISPLAY td) {
    delete reinterpret_cast<Fl_Text_Display*>(td);
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

