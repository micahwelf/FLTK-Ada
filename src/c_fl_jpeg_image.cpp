

#include <FL/Fl_JPEG_Image.H>
#include "c_fl_jpeg_image.h"




JPEG_IMAGE new_fl_jpeg_image(const char * f) {
    Fl_JPEG_Image *j = new Fl_JPEG_Image(f);
    return j;
}

void free_fl_jpeg_image(JPEG_IMAGE j) {
    delete reinterpret_cast<Fl_JPEG_Image*>(j);
}

