

#include <FL/Fl_PNM_Image.H>
#include "c_fl_pnm_image.h"


PNM_IMAGE new_fl_pnm_image(const char * f) {
    Fl_PNM_Image *p = new Fl_PNM_Image(f);
    return p;
}


void free_fl_pnm_image(PNM_IMAGE p) {
    delete reinterpret_cast<Fl_PNM_Image*>(p);
}

