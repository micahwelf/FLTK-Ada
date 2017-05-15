

#include <FL/Fl_BMP_Image.H>
#include "c_fl_bmp_image.h"


BMP_IMAGE new_fl_bmp_image(const char * f) {
    Fl_BMP_Image *b = new Fl_BMP_Image(f);
    return b;
}


void free_fl_bmp_image(BMP_IMAGE b) {
    delete reinterpret_cast<Fl_BMP_Image*>(b);
}

