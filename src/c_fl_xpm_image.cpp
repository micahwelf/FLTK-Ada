

#include <FL/Fl_XPM_Image.H>
#include "c_fl_xpm_image.h"




XPM_IMAGE new_fl_xpm_image(const char * f) {
    Fl_XPM_Image *j = new Fl_XPM_Image(f);
    return j;
}

void free_fl_xpm_image(XPM_IMAGE j) {
    delete reinterpret_cast<Fl_XPM_Image*>(j);
}

