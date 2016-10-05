

#ifndef FL_PNG_IMAGE_GUARD
#define FL_PNG_IMAGE_GUARD


typedef void* PNG_IMAGE;


extern "C" PNG_IMAGE new_fl_png_image(const char * f);
extern "C" void free_fl_png_image(PNG_IMAGE p);


#endif

