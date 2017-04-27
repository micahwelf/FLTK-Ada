

#ifndef FL_IMAGE_GUARD
#define FL_IMAGE_GUARD


typedef void* IMAGE;


extern "C" IMAGE new_fl_image(int w, int h, int d);
extern "C" void free_fl_image(IMAGE i);


extern "C" int fl_image_w(IMAGE i);
extern "C" int fl_image_h(IMAGE i);
extern "C" int fl_image_d(IMAGE i);


#endif

