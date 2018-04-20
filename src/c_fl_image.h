

#ifndef FL_IMAGE_GUARD
#define FL_IMAGE_GUARD




typedef void* IMAGE;




extern "C" inline IMAGE new_fl_image(int w, int h, int d);
extern "C" inline void free_fl_image(IMAGE i);


extern "C" inline int fl_image_get_rgb_scaling();
extern "C" inline void fl_image_set_rgb_scaling(int t);
extern "C" inline IMAGE fl_image_copy(IMAGE i, int w, int h);
extern "C" inline IMAGE fl_image_copy2(IMAGE i);




extern "C" inline void fl_image_color_average(IMAGE i, int c, float b);
extern "C" inline void fl_image_desaturate(IMAGE i);


extern "C" inline void fl_image_inactive(IMAGE i);
extern "C" inline int fl_image_fail(IMAGE i);


extern "C" inline int fl_image_w(IMAGE i);
extern "C" inline int fl_image_h(IMAGE i);
extern "C" inline int fl_image_d(IMAGE i);


extern "C" inline void fl_image_draw(IMAGE i, int x, int y);
extern "C" inline void fl_image_draw2(IMAGE i, int x, int y, int w, int h, int cx, int cy);
extern "C" inline void fl_image_draw_empty(IMAGE i, int x, int y);


#endif

