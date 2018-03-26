

#include <FL/Fl_Copy_Surface.H>
#include <FL/Fl_Widget.H>
#include <FL/Fl_Window.H>
#include "c_fl_copy_surface.h"




COPY_SURFACE new_fl_copy_surface(int w, int h) {
    Fl_Copy_Surface *c = new Fl_Copy_Surface(w,h);
    return c;
}

void free_fl_copy_surface(COPY_SURFACE c) {
    delete reinterpret_cast<Fl_Copy_Surface*>(c);
}




int fl_copy_surface_get_w(COPY_SURFACE c) {
    return reinterpret_cast<Fl_Copy_Surface*>(c)->w();
}

int fl_copy_surface_get_h(COPY_SURFACE c) {
    return reinterpret_cast<Fl_Copy_Surface*>(c)->h();
}




void fl_copy_surface_draw(COPY_SURFACE c, void * w, int dx, int dy) {
    reinterpret_cast<Fl_Copy_Surface*>(c)->draw(reinterpret_cast<Fl_Widget*>(w),dx,dy);
}

void fl_copy_surface_draw_decorated_window(COPY_SURFACE c, void * w, int dx, int dy) {
    reinterpret_cast<Fl_Copy_Surface*>(c)->draw_decorated_window(reinterpret_cast<Fl_Window*>(w),dx,dy);
}




void fl_copy_surface_set_current(COPY_SURFACE c) {
    reinterpret_cast<Fl_Copy_Surface*>(c)->set_current();
}


