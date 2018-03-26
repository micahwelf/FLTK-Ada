

#include <FL/Fl_Printer.H>
#include <FL/Fl_Widget.H>
#include <FL/Fl_Window.H>
#include "c_fl_printer.h"




PRINTER new_fl_printer(void) {
    Fl_Printer *p = new Fl_Printer();
    return p;
}

void free_fl_printer(PRINTER p) {
    delete reinterpret_cast<Fl_Printer*>(p);
}




int fl_printer_start_job(PRINTER p, int c) {
    return reinterpret_cast<Fl_Printer*>(p)->start_job(c,0,0);
}

int fl_printer_start_job2(PRINTER p, int c, int f, int t) {
    return reinterpret_cast<Fl_Printer*>(p)->start_job(c,&f,&t);
}

void fl_printer_end_job(PRINTER p) {
    reinterpret_cast<Fl_Printer*>(p)->end_job();
}

int fl_printer_start_page(PRINTER p) {
    return reinterpret_cast<Fl_Printer*>(p)->start_page();
}

int fl_printer_end_page(PRINTER p) {
    return reinterpret_cast<Fl_Printer*>(p)->end_page();
}




void fl_printer_margins(PRINTER p, int * l, int * t, int * r, int * b) {
    reinterpret_cast<Fl_Printer*>(p)->margins(l,t,r,b);
}

int fl_printer_printable_rect(PRINTER p, int * w, int * h) {
    return reinterpret_cast<Fl_Printer*>(p)->printable_rect(w,h);
}

void fl_printer_get_origin(PRINTER p, int * x, int * y) {
    reinterpret_cast<Fl_Printer*>(p)->origin(x,y);
}

void fl_printer_set_origin(PRINTER p, int x, int y) {
    reinterpret_cast<Fl_Printer*>(p)->origin(x,y);
}

void fl_printer_rotate(PRINTER p, float r) {
    reinterpret_cast<Fl_Printer*>(p)->rotate(r);
}

void fl_printer_scale(PRINTER p, float x, float y) {
    reinterpret_cast<Fl_Printer*>(p)->scale(x,y);
}

void fl_printer_translate(PRINTER p, int x, int y) {
    reinterpret_cast<Fl_Printer*>(p)->translate(x,y);
}

void fl_printer_untranslate(PRINTER p) {
    reinterpret_cast<Fl_Printer*>(p)->untranslate();
}




void fl_printer_print_widget(PRINTER p, void * i, int dx, int dy) {
    reinterpret_cast<Fl_Printer*>(p)->print_widget(reinterpret_cast<Fl_Widget*>(i),dx,dy);
}

void fl_printer_print_window_part(PRINTER p, void * i, int x, int y, int w, int h, int dx, int dy) {
    reinterpret_cast<Fl_Printer*>(p)->print_window_part(reinterpret_cast<Fl_Window*>(i),x,y,w,h,dx,dy);
}




void fl_printer_set_current(PRINTER p) {
    reinterpret_cast<Fl_Printer*>(p)->set_current();
}


