

#include <FL/Fl_Shared_Image.H>
#include <FL/Fl_RGB_Image.H>
#include "c_fl_shared_image.h"




SHARED_IMAGE fl_shared_image_get(const char * f, int w, int h) {
    return Fl_Shared_Image::get(f, w, h);
}

SHARED_IMAGE fl_shared_image_get2(void * r) {
    return Fl_Shared_Image::get(reinterpret_cast<Fl_RGB_Image*>(r), 0);
}

SHARED_IMAGE fl_shared_image_find(const char * n, int w, int h) {
    return Fl_Shared_Image::find(n, w, h);
}

void release_fl_shared_image(SHARED_IMAGE i) {
    reinterpret_cast<Fl_Shared_Image*>(i)->release();
}

SHARED_IMAGE fl_shared_image_copy(SHARED_IMAGE i, int w, int h) {
    //  virtual so disable dispatch
    return reinterpret_cast<Fl_Shared_Image*>(i)->Fl_Shared_Image::copy(w, h);
}

SHARED_IMAGE fl_shared_image_copy2(SHARED_IMAGE i) {
    return reinterpret_cast<Fl_Shared_Image*>(i)->copy();
}




void fl_shared_image_color_average(SHARED_IMAGE i, int c, float b) {
    //  virtual so disable dispatch
    reinterpret_cast<Fl_Shared_Image*>(i)->Fl_Shared_Image::color_average(c, b);
}

void fl_shared_image_desaturate(SHARED_IMAGE i) {
    //  virtual so disable dispatch
    reinterpret_cast<Fl_Shared_Image*>(i)->Fl_Shared_Image::desaturate();
}




const char * fl_shared_image_name(SHARED_IMAGE i) {
    return reinterpret_cast<Fl_Shared_Image*>(i)->name();
}

void fl_shared_image_reload(SHARED_IMAGE i) {
    reinterpret_cast<Fl_Shared_Image*>(i)->reload();
}




void fl_shared_image_scaling_algorithm(int v) {
    Fl_Shared_Image::scaling_algorithm(static_cast<Fl_RGB_Scaling>(v));
}

void fl_shared_image_scale(SHARED_IMAGE i, int w, int h, int p, int e) {
    reinterpret_cast<Fl_Shared_Image*>(i)->scale(w, h, p, e);
}




void fl_shared_image_draw(SHARED_IMAGE i, int x, int y, int w, int h, int cx, int cy) {
    //  virtual so disable dispatch
    reinterpret_cast<Fl_Shared_Image*>(i)->Fl_Shared_Image::draw(x, y, w, h, cx, cy);
}

void fl_shared_image_draw2(SHARED_IMAGE i, int x, int y) {
    reinterpret_cast<Fl_Shared_Image*>(i)->draw(x, y);
}


