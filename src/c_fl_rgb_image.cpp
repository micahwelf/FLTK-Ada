

#include <FL/Fl_RGB_Image.H>
#include "c_fl_rgb_image.h"




void free_fl_rgb_image(RGB_IMAGE i) {
    delete reinterpret_cast<Fl_RGB_Image*>(i);
}

RGB_IMAGE fl_rgb_image_copy(RGB_IMAGE i, int w, int h) {
    //  virtual so disable dispatch
    return reinterpret_cast<Fl_RGB_Image*>(i)->Fl_RGB_Image::copy(w, h);
}

RGB_IMAGE fl_rgb_image_copy2(RGB_IMAGE i) {
    return reinterpret_cast<Fl_RGB_Image*>(i)->copy();
}




void fl_rgb_image_color_average(RGB_IMAGE i, int c, float b) {
    //  virtual so disable dispatch
    reinterpret_cast<Fl_RGB_Image*>(i)->Fl_RGB_Image::color_average(c, b);
}

void fl_rgb_image_desaturate(RGB_IMAGE i) {
    //  virtual so disable dispatch
    reinterpret_cast<Fl_RGB_Image*>(i)->Fl_RGB_Image::desaturate();
}




void fl_rgb_image_draw2(RGB_IMAGE i, int x, int y) {
    reinterpret_cast<Fl_RGB_Image*>(i)->draw(x, y);
}

void fl_rgb_image_draw(RGB_IMAGE i, int x, int y, int w, int h, int cx, int cy) {
    //  virtual so disable dispatch
    reinterpret_cast<Fl_RGB_Image*>(i)->Fl_RGB_Image::draw(x, y, w, h, cx, cy);
}


