

#ifndef FL_RGB_IMAGE_GUARD
#define FL_RGB_IMAGE_GUARD




typedef void* RGB_IMAGE;




extern "C" void free_fl_rgb_image(RGB_IMAGE i);
extern "C" RGB_IMAGE fl_rgb_image_copy(RGB_IMAGE i, int w, int h);
extern "C" RGB_IMAGE fl_rgb_image_copy2(RGB_IMAGE i);




extern "C" void fl_rgb_image_color_average(RGB_IMAGE i, int c, float b);
extern "C" void fl_rgb_image_desaturate(RGB_IMAGE i);


#endif

