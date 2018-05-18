

#include <FL/Fl_GIF_Image.H>
#include "c_fl_gif_image.h"




GIF_IMAGE new_fl_gif_image(const char * f) {
    Fl_GIF_Image *j = new Fl_GIF_Image(f);
    return j;
}

void free_fl_gif_image(GIF_IMAGE j) {
    delete reinterpret_cast<Fl_GIF_Image*>(j);
}

