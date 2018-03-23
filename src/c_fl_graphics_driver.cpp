

#include <FL/Fl_Device.H>
#include <FL/Fl_Image.H>
#include "c_fl_graphics_driver.h"




unsigned int fl_graphics_driver_color(GRAPHICS_DRIVER g) {
    return reinterpret_cast<Fl_Graphics_Driver*>(g)->color();
}




int fl_graphics_driver_descent(GRAPHICS_DRIVER g) {
    return reinterpret_cast<Fl_Graphics_Driver*>(g)->descent();
}

int fl_graphics_driver_height(GRAPHICS_DRIVER g) {
    return reinterpret_cast<Fl_Graphics_Driver*>(g)->height();
}

double fl_graphics_driver_width(GRAPHICS_DRIVER g, unsigned int c) {
    return reinterpret_cast<Fl_Graphics_Driver*>(g)->width(c);
}

double fl_graphics_driver_width2(GRAPHICS_DRIVER g, const char * s, int l) {
    return reinterpret_cast<Fl_Graphics_Driver*>(g)->width(s,l);
}

int fl_graphics_driver_get_font(GRAPHICS_DRIVER g) {
    return reinterpret_cast<Fl_Graphics_Driver*>(g)->font();
}

int fl_graphics_driver_size(GRAPHICS_DRIVER g) {
    return reinterpret_cast<Fl_Graphics_Driver*>(g)->size();
}

void fl_graphics_driver_set_font(GRAPHICS_DRIVER g, int f, int s) {
    reinterpret_cast<Fl_Graphics_Driver*>(g)->font(f,s);
}




void fl_graphics_driver_draw_scaled(GRAPHICS_DRIVER g, void * i, int x, int y, int w, int h) {
    reinterpret_cast<Fl_Graphics_Driver*>(g)->draw_scaled(reinterpret_cast<Fl_Image*>(i),x,y,w,h);
}


