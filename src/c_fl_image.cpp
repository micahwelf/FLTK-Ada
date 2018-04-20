

#include <FL/Fl_Image.H>
#include "c_fl_image.h"




class My_Image : public Fl_Image {
    public:
        using Fl_Image::Fl_Image;
        friend void fl_image_draw_empty(IMAGE i, int x, int y);
};




IMAGE new_fl_image(int w, int h, int d) {
    My_Image *i = new My_Image(w, h, d);
    return i;
}

void free_fl_image(IMAGE i) {
    delete reinterpret_cast<My_Image*>(i);
}




int fl_image_get_rgb_scaling() {
    return Fl_Image::RGB_scaling();
}

void fl_image_set_rgb_scaling(int t) {
    Fl_Image::RGB_scaling(static_cast<Fl_RGB_Scaling>(t));
}

IMAGE fl_image_copy(IMAGE i, int w, int h) {
    //  virtual so disable dispatch
    return reinterpret_cast<Fl_Image*>(i)->Fl_Image::copy(w, h);
}

IMAGE fl_image_copy2(IMAGE i) {
    return reinterpret_cast<Fl_Image*>(i)->copy();
}




void fl_image_color_average(IMAGE i, int c, float b) {
    //  virtual so disable dispatch
    reinterpret_cast<Fl_Image*>(i)->Fl_Image::color_average(c, b);
}

void fl_image_desaturate(IMAGE i) {
    //  virtual so disable dispatch
    reinterpret_cast<Fl_Image*>(i)->Fl_Image::desaturate();
}




void fl_image_inactive(IMAGE i) {
    reinterpret_cast<Fl_Image*>(i)->inactive();
}

int fl_image_fail(IMAGE i) {
    switch (reinterpret_cast<Fl_Image*>(i)->fail()) {
        case Fl_Image::ERR_NO_IMAGE:
            return 1;
        case Fl_Image::ERR_FILE_ACCESS:
            return 2;
        case Fl_Image::ERR_FORMAT:
            return 3;
        default:
            return 0;
    }
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




void fl_image_draw(IMAGE i, int x, int y) {
    reinterpret_cast<Fl_Image*>(i)->draw(x, y);
}

void fl_image_draw2(IMAGE i, int x, int y, int w, int h, int cx, int cy) {
    //  virtual so disable dispatch
    reinterpret_cast<Fl_Image*>(i)->Fl_Image::draw(x, y, w, h, cx, cy);
}

void fl_image_draw_empty(IMAGE i, int x, int y) {
    reinterpret_cast<My_Image*>(i)->draw_empty(x, y);
}

