

#include <FL/Fl_XBM_Image.H>
#include "c_fl_xbm_image.h"




XBM_IMAGE new_fl_xbm_image(const char * f) {
    Fl_XBM_Image *b = new Fl_XBM_Image(f);
    return b;
}

void free_fl_xbm_image(XBM_IMAGE b) {
    delete reinterpret_cast<Fl_XBM_Image*>(b);
}

