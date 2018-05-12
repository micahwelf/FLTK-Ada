

#include <FL/Fl_Widget.H>
#include <FL/Fl_Image.H>
#include "c_fl_widget.h"
#include "c_fl_type.h"




class My_Widget : public Fl_Widget {
    public:
        using Fl_Widget::Fl_Widget;
        friend void widget_set_draw_hook(WIDGET w, void * d);
        friend void widget_set_handle_hook(WIDGET w, void * h);
        friend WIDGET new_fl_widget(int x, int y, int w, int h, char* label);
    protected:
        void draw();
        int handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Widget::draw() {
    (*draw_hook)(this->user_data());
}

int My_Widget::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

void widget_set_draw_hook(WIDGET w, void * d) {
    reinterpret_cast<My_Widget*>(w)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void widget_set_handle_hook(WIDGET w, void * h) {
    reinterpret_cast<My_Widget*>(w)->handle_hook = reinterpret_cast<h_hook_p>(h);
}




WIDGET new_fl_widget(int x, int y, int w, int h, char* label) {
    My_Widget *wd = new My_Widget(x, y, w, h, label);
    return wd;
}

void free_fl_widget(WIDGET w) {
    delete reinterpret_cast<My_Widget*>(w);
}




void * fl_widget_get_user_data(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->user_data();
}

void fl_widget_set_user_data(WIDGET w, void * d) {
    reinterpret_cast<Fl_Widget*>(w)->user_data(d);
}




void fl_widget_activate(WIDGET w) {
    reinterpret_cast<Fl_Widget*>(w)->activate();
}

void fl_widget_deactivate(WIDGET w) {
    reinterpret_cast<Fl_Widget*>(w)->deactivate();
}

int fl_widget_active(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->active();
}

int fl_widget_active_r(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->active_r();
}

void fl_widget_set_active(WIDGET w) {
    reinterpret_cast<Fl_Widget*>(w)->set_active();
}

void fl_widget_clear_active(WIDGET w) {
    reinterpret_cast<Fl_Widget*>(w)->clear_active();
}




unsigned int fl_widget_changed(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->changed();
}

void fl_widget_set_changed(WIDGET w) {
    reinterpret_cast<Fl_Widget*>(w)->set_changed();
}

void fl_widget_clear_changed(WIDGET w) {
    reinterpret_cast<Fl_Widget*>(w)->clear_changed();
}

int fl_widget_output(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->output();
}

void fl_widget_set_output(WIDGET w) {
    reinterpret_cast<Fl_Widget*>(w)->set_output();
}

void fl_widget_clear_output(WIDGET w) {
    reinterpret_cast<Fl_Widget*>(w)->clear_output();
}

int fl_widget_visible(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->visible();
}

int fl_widget_visible_r(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->visible_r();
}

void fl_widget_set_visible(WIDGET w) {
    reinterpret_cast<Fl_Widget*>(w)->set_visible();
}

void fl_widget_clear_visible(WIDGET w) {
    reinterpret_cast<Fl_Widget*>(w)->clear_visible();
}




int fl_widget_get_visible_focus(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->visible_focus();
}

void fl_widget_set_visible_focus(WIDGET w, int f) {
    reinterpret_cast<Fl_Widget*>(w)->visible_focus(f);
}

int fl_widget_take_focus(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->take_focus();
}

int fl_widget_takesevents(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->takesevents();
}




unsigned int fl_widget_get_color(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->color();
}

void fl_widget_set_color(WIDGET w, unsigned int b) {
    reinterpret_cast<Fl_Widget*>(w)->color(b);
}

unsigned int fl_widget_get_selection_color(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->selection_color();
}

void fl_widget_set_selection_color(WIDGET w, unsigned int c) {
    reinterpret_cast<Fl_Widget*>(w)->selection_color(c);
}




void * fl_widget_get_parent(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->parent();
}

int fl_widget_contains(WIDGET w, WIDGET i) {
    return reinterpret_cast<Fl_Widget*>(w)->contains(reinterpret_cast<Fl_Widget*>(i));
}

int fl_widget_inside(WIDGET w, WIDGET p) {
    return reinterpret_cast<Fl_Widget*>(w)->inside(reinterpret_cast<Fl_Widget*>(p));
}

void * fl_widget_window(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->window();
}

void * fl_widget_top_window(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->top_window();
}

void * fl_widget_top_window_offset(WIDGET w, int &x, int &y) {
    return reinterpret_cast<Fl_Widget*>(w)->top_window_offset(x,y);
}




unsigned int fl_widget_get_align(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->align();
}

void fl_widget_set_align(WIDGET w, unsigned int a) {
    reinterpret_cast<Fl_Widget*>(w)->align(a);
}

int fl_widget_get_box(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->box();
}

void fl_widget_set_box(WIDGET w, int b) {
    reinterpret_cast<Fl_Widget*>(w)->box(static_cast<Fl_Boxtype>(b));
}

const char * fl_widget_tooltip(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->tooltip();
}

void fl_widget_copy_tooltip(WIDGET w, const char * t) {
    reinterpret_cast<Fl_Widget*>(w)->copy_tooltip(t);
}




const char* fl_widget_get_label(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->label();
}

void fl_widget_set_label(WIDGET w, const char* t) {
    reinterpret_cast<Fl_Widget*>(w)->copy_label(t);
}

unsigned int fl_widget_get_labelcolor(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->labelcolor();
}

void fl_widget_set_labelcolor(WIDGET w, unsigned int v) {
    reinterpret_cast<Fl_Widget*>(w)->labelcolor(v);
}

int fl_widget_get_labelfont(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->labelfont();
}

void fl_widget_set_labelfont(WIDGET w, int f) {
    reinterpret_cast<Fl_Widget*>(w)->labelfont(static_cast<Fl_Font>(f));
}

int fl_widget_get_labelsize(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->labelsize();
}

void fl_widget_set_labelsize(WIDGET w, int s) {
    reinterpret_cast<Fl_Widget*>(w)->labelsize(static_cast<Fl_Fontsize>(s));
}

int fl_widget_get_labeltype(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->labeltype();
}

void fl_widget_set_labeltype(WIDGET w, int l) {
    reinterpret_cast<Fl_Widget*>(w)->labeltype(static_cast<Fl_Labeltype>(l));
}

void fl_widget_measure_label(WIDGET w, int &d, int &h) {
    reinterpret_cast<Fl_Widget*>(w)->measure_label(d,h);
}




void fl_widget_set_callback(WIDGET w, void * cb) {
    reinterpret_cast<Fl_Widget*>(w)->callback(reinterpret_cast<Fl_Callback_p>(cb));
}

unsigned int fl_widget_get_when(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->when();
}

void fl_widget_set_when(WIDGET w, unsigned int c) {
    reinterpret_cast<Fl_Widget*>(w)->when(c);
}




int fl_widget_get_x(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->x();
}

int fl_widget_get_y(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->y();
}

int fl_widget_get_w(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->w();
}

int fl_widget_get_h(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->h();
}

void fl_widget_size(WIDGET w, int d, int h) {
    reinterpret_cast<Fl_Widget*>(w)->size(d, h);
}

void fl_widget_position(WIDGET w, int x, int y) {
    reinterpret_cast<Fl_Widget*>(w)->position(x, y);
}




void fl_widget_set_image(WIDGET w, void * img) {
    reinterpret_cast<Fl_Widget*>(w)->image(reinterpret_cast<Fl_Image*>(img));
}

void fl_widget_set_deimage(WIDGET w, void * img) {
    reinterpret_cast<Fl_Widget*>(w)->deimage(reinterpret_cast<Fl_Image*>(img));
}




int fl_widget_damage(WIDGET w) {
    return reinterpret_cast<Fl_Widget*>(w)->damage();
}

void fl_widget_set_damage(WIDGET w, int t) {
    if (t != 0) {
        reinterpret_cast<Fl_Widget*>(w)->damage(0xff);
    } else {
        reinterpret_cast<Fl_Widget*>(w)->damage(0x00);
    }
}

void fl_widget_set_damage2(WIDGET w, int t, int x, int y, int d, int h) {
    if (t != 0) {
        reinterpret_cast<Fl_Widget*>(w)->damage(0xff,x,y,d,h);
    } else {
        reinterpret_cast<Fl_Widget*>(w)->damage(0x00,x,y,d,h);
    }
}

void fl_widget_draw_label(WIDGET w, int x, int y, int d, int h, unsigned int a) {
    reinterpret_cast<Fl_Widget*>(w)->draw_label(x,y,d,h,a);
}

void fl_widget_redraw(WIDGET w) {
    reinterpret_cast<Fl_Widget*>(w)->redraw();
}

void fl_widget_redraw_label(WIDGET w) {
    reinterpret_cast<Fl_Widget*>(w)->redraw_label();
}

