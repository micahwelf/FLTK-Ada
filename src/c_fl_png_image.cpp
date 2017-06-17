

#include <FL/Fl_PNG_Image.H>
#include "c_fl_png_image.h"




PNG_IMAGE new_fl_png_image(const char * f) {
    Fl_PNG_Image *p = new Fl_PNG_Image(f);
    return p;
}

void free_fl_png_image(PNG_IMAGE p) {
    delete reinterpret_cast<Fl_PNG_Image*>(p);
}

