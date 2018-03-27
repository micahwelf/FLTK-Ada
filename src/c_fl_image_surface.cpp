

#include <FL/Fl_Image_Surface.H>
#include <FL/Fl_Widget.H>
#include <FL/Fl_Window.H>
#include "c_fl_image_surface.h"




IMAGE_SURFACE new_fl_image_surface(int w, int h, int r) {
    Fl_Image_Surface *s = new Fl_Image_Surface(w,h,r);
    return s;
}

void free_fl_image_surface(IMAGE_SURFACE s) {
    delete reinterpret_cast<Fl_Image_Surface*>(s);
}




void fl_image_surface_draw(IMAGE_SURFACE s, void * w, int dx, int dy) {
    reinterpret_cast<Fl_Image_Surface*>(s)->draw(reinterpret_cast<Fl_Widget*>(w),dx,dy);
}

void fl_image_surface_draw_decorated_window(IMAGE_SURFACE s, void * w, int dx, int dy) {
    reinterpret_cast<Fl_Image_Surface*>(s)->draw_decorated_window(reinterpret_cast<Fl_Window*>(w),dx,dy);
}




void * fl_image_surface_image(IMAGE_SURFACE s) {
    return reinterpret_cast<Fl_Image_Surface*>(s)->image();
}




void fl_image_surface_set_current(IMAGE_SURFACE s) {
    reinterpret_cast<Fl_Image_Surface*>(s)->set_current();
}


