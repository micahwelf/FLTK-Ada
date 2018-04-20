

#ifndef FL_PNG_IMAGE_GUARD
#define FL_PNG_IMAGE_GUARD




typedef void* PNG_IMAGE;




extern "C" inline PNG_IMAGE new_fl_png_image(const char * f);
extern "C" inline void free_fl_png_image(PNG_IMAGE p);


#endif

