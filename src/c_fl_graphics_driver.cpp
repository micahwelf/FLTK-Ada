

#include <FL/Fl_Device.H>
#include <FL/Fl_Image.H>
#include "c_fl_graphics_driver.h"




unsigned int fl_graphics_driver_color(GRAPHICS_DRIVER g) {
    return reinterpret_cast<Fl_Graphics_Driver*>(g)->color();
}




int fl_graphics_driver_descent(GRAPHICS_DRIVER g) {
    //  virtual so disable dispatch
    return reinterpret_cast<Fl_Graphics_Driver*>(g)->Fl_Graphics_Driver::descent();
}

int fl_graphics_driver_height(GRAPHICS_DRIVER g) {
    //  virtual so disable dispatch
    return reinterpret_cast<Fl_Graphics_Driver*>(g)->Fl_Graphics_Driver::height();
}

double fl_graphics_driver_width(GRAPHICS_DRIVER g, unsigned int c) {
    //  virtual so disable dispatch
    return reinterpret_cast<Fl_Graphics_Driver*>(g)->Fl_Graphics_Driver::width(c);
}

double fl_graphics_driver_width2(GRAPHICS_DRIVER g, const char * s, int l) {
    //  virtual so disable dispatch
    return reinterpret_cast<Fl_Graphics_Driver*>(g)->Fl_Graphics_Driver::width(s,l);
}

int fl_graphics_driver_get_font(GRAPHICS_DRIVER g) {
    return reinterpret_cast<Fl_Graphics_Driver*>(g)->font();
}

int fl_graphics_driver_size(GRAPHICS_DRIVER g) {
    return reinterpret_cast<Fl_Graphics_Driver*>(g)->size();
}

void fl_graphics_driver_set_font(GRAPHICS_DRIVER g, int f, int s) {
    //  virtual so disable dispatch
    reinterpret_cast<Fl_Graphics_Driver*>(g)->Fl_Graphics_Driver::font(f,s);
}




void fl_graphics_driver_draw_scaled(GRAPHICS_DRIVER g, void * i, int x, int y, int w, int h) {
    //  virtual so disable dispatch
    reinterpret_cast<Fl_Graphics_Driver*>(g)->Fl_Graphics_Driver::draw_scaled(reinterpret_cast<Fl_Image*>(i),x,y,w,h);
}


