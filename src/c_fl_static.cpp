

#include <FL/Fl.H>
#include <FL/Fl_Widget.H>
#include <FL/Fl_Window.H>
#include "c_fl_static.h"




void fl_static_add_awake_handler(void * h, void * f) {
    Fl::add_awake_handler_(reinterpret_cast<Fl_Awake_Handler>(h),f);
}

void fl_static_get_awake_handler(void * &h, void * &f) {
    Fl::get_awake_handler_(reinterpret_cast<Fl_Awake_Handler&>(h),f);
}




void fl_static_add_check(void * h, void * f) {
    Fl::add_check(reinterpret_cast<Fl_Timeout_Handler>(h),f);
}

int fl_static_has_check(void * h, void * f) {
    return Fl::has_check(reinterpret_cast<Fl_Timeout_Handler>(h),f);
}

void fl_static_remove_check(void * h, void * f) {
    Fl::remove_check(reinterpret_cast<Fl_Timeout_Handler>(h),f);
}




void fl_static_add_timeout(double s, void * h, void * f) {
    Fl::add_timeout(s,reinterpret_cast<Fl_Timeout_Handler>(h),f);
}

int fl_static_has_timeout(void * h, void * f) {
    return Fl::has_timeout(reinterpret_cast<Fl_Timeout_Handler>(h),f);
}

void fl_static_remove_timeout(void * h, void * f) {
    Fl::remove_timeout(reinterpret_cast<Fl_Timeout_Handler>(h),f);
}

void fl_static_repeat_timeout(double s, void * h, void * f) {
    Fl::repeat_timeout(s,reinterpret_cast<Fl_Timeout_Handler>(h),f);
}




void fl_static_add_clipboard_notify(void * h, void * f) {
    Fl::add_clipboard_notify(reinterpret_cast<Fl_Clipboard_Notify_Handler>(h),f);
}




void fl_static_add_fd(int d, void * h, void * f) {
    Fl::add_fd(d,reinterpret_cast<Fl_FD_Handler>(h),f);
}

void fl_static_add_fd2(int d, int m, void * h, void * f) {
    Fl::add_fd(d,m,reinterpret_cast<Fl_FD_Handler>(h),f);
}

void fl_static_remove_fd(int d) {
    Fl::remove_fd(d);
}

void fl_static_remove_fd2(int d, int m) {
    Fl::remove_fd(d,m);
}




void fl_static_add_idle(void * h, void * f) {
    Fl::add_idle(reinterpret_cast<Fl_Idle_Handler>(h),f);
}

int fl_static_has_idle(void * h, void * f) {
    return Fl::has_idle(reinterpret_cast<Fl_Idle_Handler>(h),f);
}

void fl_static_remove_idle(void * h, void * f) {
    Fl::remove_idle(reinterpret_cast<Fl_Idle_Handler>(h),f);
}




void fl_static_get_color(unsigned int c, unsigned char &r, unsigned char &g, unsigned char &b) {
    Fl::get_color(c,r,g,b);
}

void fl_static_set_color(unsigned int c, unsigned char r, unsigned char g, unsigned char b) {
    Fl::set_color(c,r,g,b);
}

void fl_static_free_color(unsigned int c, int b) {
    Fl::free_color(c,b);
}

void fl_static_foreground(unsigned int r, unsigned int g, unsigned int b) {
    Fl::foreground(r,g,b);
}

void fl_static_background(unsigned int r, unsigned int g, unsigned int b) {
    Fl::background(r,g,b);
}

void fl_static_background2(unsigned int r, unsigned int g, unsigned int b) {
    Fl::background2(r,g,b);
}




const char * fl_static_get_font(int f) {
    return Fl::get_font(f);
}

const char * fl_static_get_font_name(int f) {
    return Fl::get_font_name(f);
}

void fl_static_set_font(int t, int f) {
    Fl::set_font(t,f);
}

int fl_static_get_font_sizes(int f, int * &a) {
    return Fl::get_font_sizes(static_cast<Fl_Font>(f),a);
}

int fl_static_font_size_array_get(int * a, int i) {
    return *(a+((i-1)*sizeof(int)));
}

int fl_static_set_fonts() {
    return Fl::set_fonts();
}




int fl_static_box_dh(int b) {
    return Fl::box_dh(static_cast<Fl_Boxtype>(b));
}

int fl_static_box_dw(int b) {
    return Fl::box_dw(static_cast<Fl_Boxtype>(b));
}

int fl_static_box_dx(int b) {
    return Fl::box_dx(static_cast<Fl_Boxtype>(b));
}

int fl_static_box_dy(int b) {
    return Fl::box_dy(static_cast<Fl_Boxtype>(b));
}

void fl_static_set_boxtype(int t, int f) {
    Fl::set_boxtype(static_cast<Fl_Boxtype>(t),static_cast<Fl_Boxtype>(f));
}

int fl_static_draw_box_active() {
    return Fl::draw_box_active();
}




void fl_static_copy(const char * t, int l, int k) {
    Fl::copy(t,l,k);
}

void fl_static_paste(void * r, int s) {
    Fl::paste(reinterpret_cast<Fl_Widget&>(r),s);
}

void fl_static_selection(void * o, char * t, int l) {
    Fl::selection(reinterpret_cast<Fl_Widget&>(o),t,l);
}




void fl_static_dnd() {
    Fl::dnd();
}

int fl_static_get_dnd_text_ops() {
    return Fl::dnd_text_ops();
}

void fl_static_set_dnd_text_ops(int t) {
    Fl::dnd_text_ops(t);
}




void fl_static_enable_im() {
    Fl::enable_im();
}

void fl_static_disable_im() {
    Fl::disable_im();
}

int fl_static_get_visible_focus() {
    return Fl::visible_focus();
}

void fl_static_set_visible_focus(int f) {
    Fl::visible_focus(f);
}




void fl_static_default_atclose(void * w) {
    Fl::default_atclose(reinterpret_cast<Fl_Window*>(w), 0);
}

void * fl_static_get_first_window() {
    return Fl::first_window();
}

void fl_static_set_first_window(void * w) {
    Fl::first_window(reinterpret_cast<Fl_Window*>(w));
}

void * fl_static_next_window(void * w) {
    return Fl::next_window(reinterpret_cast<Fl_Window*>(w));
}

void * fl_static_modal() {
    return Fl::modal();
}




void * fl_static_readqueue() {
    return Fl::readqueue();
}

void fl_static_do_widget_deletion() {
    Fl::do_widget_deletion();
}




const char * fl_static_get_scheme() {
    return Fl::scheme();
}

void fl_static_set_scheme(const char *n) {
    Fl::scheme(n);
}

int fl_static_is_scheme(const char *n) {
    return Fl::is_scheme(n);
}

void fl_static_reload_scheme() {
    Fl::reload_scheme();
}




int fl_static_get_option(int o) {
    return Fl::option(static_cast<Fl::Fl_Option>(o));
}

void fl_static_set_option(int o, int t) {
    Fl::option(static_cast<Fl::Fl_Option>(o),t);
}




int fl_static_get_scrollbar_size() {
    return Fl::scrollbar_size();
}

void fl_static_set_scrollbar_size(int s) {
    Fl::scrollbar_size(s);
}


