

#include <FL/Fl.H>
#include <FL/Fl_Widget.H>
#include <FL/Fl_Window.H>
#include "c_fl_event.h"




void fl_event_add_handler(void * f) {
    Fl::add_handler(reinterpret_cast<Fl_Event_Handler>(f));
}

void fl_event_set_event_dispatch(void * f) {
    Fl::event_dispatch(reinterpret_cast<Fl_Event_Dispatch>(f));
}

int fl_event_handle(int e, void * w) {
    return Fl::handle_(e, reinterpret_cast<Fl_Window*>(w));
}




void * fl_event_get_grab() {
    return Fl::grab();
}

void fl_event_set_grab(void * w) {
    Fl::grab(reinterpret_cast<Fl_Window*>(w));
}

void * fl_event_get_pushed() {
    return Fl::pushed();
}

void fl_event_set_pushed(void * w) {
    Fl::pushed(reinterpret_cast<Fl_Widget*>(w));
}

void * fl_event_get_belowmouse() {
    return Fl::belowmouse();
}

void fl_event_set_belowmouse(void * w) {
    Fl::belowmouse(reinterpret_cast<Fl_Widget*>(w));
}

void * fl_event_get_focus() {
    return Fl::focus();
}

void fl_event_set_focus(void * w) {
    Fl::focus(reinterpret_cast<Fl_Widget*>(w));
}




int fl_event_compose(int &d) {
    return Fl::compose(d);
}

void fl_event_compose_reset() {
    Fl::compose_reset();
}

const char * fl_event_text() {
    return Fl::event_text();
}

int fl_event_length() {
    return Fl::event_length();
}




int fl_event_get() {
    return Fl::event();
}

unsigned long fl_event_state() {
    return Fl::event_state();
}

int fl_event_check_state(unsigned long s) {
    return Fl::event_state(s);
}




int fl_event_x() {
    return Fl::event_x();
}

int fl_event_x_root() {
    return Fl::event_x_root();
}

int fl_event_y() {
    return Fl::event_y();
}

int fl_event_y_root() {
    return Fl::event_y_root();
}

int fl_event_dx() {
    return Fl::event_dx();
}

int fl_event_dy() {
    return Fl::event_dy();
}

void fl_event_get_mouse(int &x, int &y) {
    Fl::get_mouse(x, y);
}

int fl_event_is_click() {
    return Fl::event_is_click();
}

int fl_event_is_clicks() {
    return Fl::event_clicks();
}

void fl_event_set_clicks(int c) {
    Fl::event_clicks(c);
}

int fl_event_button() {
    return Fl::event_button();
}

int fl_event_button1() {
    return Fl::event_button1();
}

int fl_event_button2() {
    return Fl::event_button2();
}

int fl_event_button3() {
    return Fl::event_button3();
}

int fl_event_inside(int x, int y, int w, int h) {
    return Fl::event_inside(x, y, w, h);
}




unsigned long fl_event_key() {
    return Fl::event_key();
}

unsigned long fl_event_original_key() {
    return Fl::event_original_key();
}

int fl_event_key_during(unsigned long k) {
    return Fl::event_key(k);
}

int fl_event_get_key(unsigned long k) {
    return Fl::get_key(k);
}

int fl_event_ctrl() {
    return Fl::event_ctrl();
}

int fl_event_alt() {
    return Fl::event_alt();
}

int fl_event_command() {
    return Fl::event_command();
}

int fl_event_shift() {
    return Fl::event_shift();
}


