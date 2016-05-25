

#include <FL/Fl_Text_Display.H>
#include "c_fl_text_display.h"


TEXTDISPLAY new_fl_text_display(int x, int y, int w, int h, char*  label) {
    Fl_Text_Display *td = new Fl_Text_Display(x, y, w, h, label);
    return td;
}


void free_fl_text_display(TEXTDISPLAY td) {
    delete reinterpret_cast<Fl_Text_Display*>(td);
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

