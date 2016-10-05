

#include <FL/Fl_Image.H>
#include "c_fl_image.h"


IMAGE new_fl_image(int w, int h, int d) {
    Fl_Image *i = new Fl_Image(w, h, d);
    return i;
}


void free_fl_image(IMAGE i) {
    delete reinterpret_cast<Fl_Image*>(i);
}




int fl_image_w(IMAGE i) {
    return reinterpret_cast<Fl_Image*>(i)->w();
}


int fl_image_h(IMAGE i) {
    return reinterpret_cast<Fl_Image*>(i)->h();
}


int fl_image_d(IMAGE i) {
    return reinterpret_cast<Fl_Image*>(i)->d();
}

