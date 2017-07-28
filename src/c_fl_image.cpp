

#include <FL/Fl_Image.H>
#include "c_fl_image.h"




class My_Image : public Fl_Image {
    public:
        friend void fl_image_draw_empty(IMAGE i, int x, int y);
};




IMAGE new_fl_image(int w, int h, int d) {
    Fl_Image *i = new Fl_Image(w, h, d);
    return i;
}

void free_fl_image(IMAGE i) {
    delete reinterpret_cast<Fl_Image*>(i);
}

IMAGE fl_image_copy(IMAGE i, int w, int h) {
    return reinterpret_cast<Fl_Image*>(i)->copy(w, h);
}

IMAGE fl_image_copy2(IMAGE i) {
    return reinterpret_cast<Fl_Image*>(i)->copy();
}




void fl_image_color_average(IMAGE i, int c, float b) {
    reinterpret_cast<Fl_Image*>(i)->color_average(c, b);
}

void fl_image_desaturate(IMAGE i) {
    reinterpret_cast<Fl_Image*>(i)->desaturate();
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
    reinterpret_cast<Fl_Image*>(i)->draw(x, y, w, h, cx, cy);
}

void fl_image_draw_empty(IMAGE i, int x, int y) {
    reinterpret_cast<My_Image*>(i)->draw_empty(x, y);
}

