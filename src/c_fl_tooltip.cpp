

#include <FL/Fl_Tooltip.H>
#include <FL/Fl_Widget.H>
#include "c_fl_tooltip.h"




void * fl_tooltip_get_current(void) {
    return Fl_Tooltip::current();
}

void fl_tooltip_set_current(void * i) {
    Fl_Tooltip::current(reinterpret_cast<Fl_Widget*>(i));
}

int fl_tooltip_enabled(void) {
    return Fl_Tooltip::enabled();
}

void fl_tooltip_enable(int v) {
    Fl_Tooltip::enable(v);
}

void fl_tooltip_enter_area(void * i, int x, int y, int w, int h, const char * t) {
    Fl_Tooltip::enter_area(reinterpret_cast<Fl_Widget*>(i),x,y,w,h,t);
}




float fl_tooltip_get_delay(void) {
    return Fl_Tooltip::delay();
}

void fl_tooltip_set_delay(float v) {
    Fl_Tooltip::delay(v);
}

float fl_tooltip_get_hoverdelay(void) {
    return Fl_Tooltip::hoverdelay();
}

void fl_tooltip_set_hoverdelay(float v) {
    Fl_Tooltip::hoverdelay(v);
}




unsigned int fl_tooltip_get_color(void) {
    return Fl_Tooltip::color();
}

void fl_tooltip_set_color(unsigned int v) {
    Fl_Tooltip::color(v);
}

int fl_tooltip_get_margin_height(void) {
    return Fl_Tooltip::margin_height();
}

//void fl_tooltip_set_margin_height(int v) {
//    Fl_Tooltip::margin_height(v);
//}

int fl_tooltip_get_margin_width(void) {
    return Fl_Tooltip::margin_width();
}

//void fl_tooltip_set_margin_width(int v) {
//    Fl_Tooltip::margin_width(v);
//}

int fl_tooltip_get_wrap_width(void) {
    return Fl_Tooltip::wrap_width();
}

//void fl_tooltip_set_wrap_width(int v) {
//    Fl_Tooltip::wrap_width(v);
//}




unsigned int fl_tooltip_get_textcolor(void) {
    return Fl_Tooltip::textcolor();
}

void fl_tooltip_set_textcolor(unsigned int v) {
    Fl_Tooltip::textcolor(v);
}

int fl_tooltip_get_font(void) {
    return Fl_Tooltip::font();
}

void fl_tooltip_set_font(int v) {
    Fl_Tooltip::font(v);
}

int fl_tooltip_get_size(void) {
    return Fl_Tooltip::size();
}

void fl_tooltip_set_size(int v) {
    Fl_Tooltip::size(v);
}


