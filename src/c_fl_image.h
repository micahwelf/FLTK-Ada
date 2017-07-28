

#ifndef FL_IMAGE_GUARD
#define FL_IMAGE_GUARD




typedef void* IMAGE;




extern "C" IMAGE new_fl_image(int w, int h, int d);
extern "C" void free_fl_image(IMAGE i);
extern "C" IMAGE fl_image_copy(IMAGE i, int w, int h);
extern "C" IMAGE fl_image_copy2(IMAGE i);




extern "C" void fl_image_color_average(IMAGE i, int c, float b);
extern "C" void fl_image_desaturate(IMAGE i);


extern "C" void fl_image_inactive(IMAGE i);
extern "C" int fl_image_fail(IMAGE i);


extern "C" int fl_image_w(IMAGE i);
extern "C" int fl_image_h(IMAGE i);
extern "C" int fl_image_d(IMAGE i);


extern "C" void fl_image_draw(IMAGE i, int x, int y);
extern "C" void fl_image_draw2(IMAGE i, int x, int y, int w, int h, int cx, int cy);
extern "C" void fl_image_draw_empty(IMAGE i, int x, int y);


#endif

