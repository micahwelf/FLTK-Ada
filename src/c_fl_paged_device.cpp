

#include <FL/Fl_Paged_Device.H>
#include <FL/Fl_Widget.H>
#include <FL/Fl_Window.H>
#include "c_fl_paged_device.h"




class My_Paged_Device : public Fl_Paged_Device {
    public:
        using Fl_Paged_Device::Fl_Paged_Device;
        friend PAGED_DEVICE new_fl_paged_device(void);
};




PAGED_DEVICE new_fl_paged_device(void) {
    My_Paged_Device *p = new My_Paged_Device();
    return p;
}

void free_fl_paged_device(PAGED_DEVICE p) {
    delete reinterpret_cast<My_Paged_Device*>(p);
}




int fl_paged_device_start_job(PAGED_DEVICE p, int c) {
    return reinterpret_cast<Fl_Paged_Device*>(p)->start_job(c,0,0);
}

int fl_paged_device_start_job2(PAGED_DEVICE p, int c, int f, int t) {
    return reinterpret_cast<Fl_Paged_Device*>(p)->start_job(c,&f,&t);
}

void fl_paged_device_end_job(PAGED_DEVICE p) {
    reinterpret_cast<Fl_Paged_Device*>(p)->end_job();
}

int fl_paged_device_start_page(PAGED_DEVICE p) {
    return reinterpret_cast<Fl_Paged_Device*>(p)->start_page();
}

int fl_paged_device_end_page(PAGED_DEVICE p) {
    return reinterpret_cast<Fl_Paged_Device*>(p)->end_page();
}




void fl_paged_device_margins(PAGED_DEVICE p, int * l, int * t, int * r, int * b) {
    reinterpret_cast<Fl_Paged_Device*>(p)->margins(l,t,r,b);
}

int fl_paged_device_printable_rect(PAGED_DEVICE p, int * w, int * h) {
    return reinterpret_cast<Fl_Paged_Device*>(p)->printable_rect(w,h);
}

void fl_paged_device_get_origin(PAGED_DEVICE p, int * x, int * y) {
    reinterpret_cast<Fl_Paged_Device*>(p)->origin(x,y);
}

void fl_paged_device_set_origin(PAGED_DEVICE p, int x, int y) {
    reinterpret_cast<Fl_Paged_Device*>(p)->origin(x,y);
}

void fl_paged_device_rotate(PAGED_DEVICE p, float r) {
    reinterpret_cast<Fl_Paged_Device*>(p)->rotate(r);
}

void fl_paged_device_scale(PAGED_DEVICE p, float x, float y) {
    reinterpret_cast<Fl_Paged_Device*>(p)->scale(x,y);
}

void fl_paged_device_translate(PAGED_DEVICE p, int x, int y) {
    reinterpret_cast<Fl_Paged_Device*>(p)->translate(x,y);
}

void fl_paged_device_untranslate(PAGED_DEVICE p) {
    reinterpret_cast<Fl_Paged_Device*>(p)->untranslate();
}




void fl_paged_device_print_widget(PAGED_DEVICE p, void * i, int dx, int dy) {
    reinterpret_cast<Fl_Paged_Device*>(p)->print_widget(reinterpret_cast<Fl_Widget*>(i),dx,dy);
}

void fl_paged_device_print_window(PAGED_DEVICE p, void * i, int dx, int dy) {
    reinterpret_cast<Fl_Paged_Device*>(p)->print_window(reinterpret_cast<Fl_Window*>(i),dx,dy);
}

void fl_paged_device_print_window_part(PAGED_DEVICE p, void * i, int x, int y, int w, int h, int dx, int dy) {
    reinterpret_cast<Fl_Paged_Device*>(p)->print_window_part(reinterpret_cast<Fl_Window*>(i),x,y,w,h,dx,dy);
}


