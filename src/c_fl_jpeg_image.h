

#ifndef FL_JPEG_IMAGE_GUARD
#define FL_JPEG_IMAGE_GUARD




typedef void* JPEG_IMAGE;




extern "C" inline JPEG_IMAGE new_fl_jpeg_image(const char * f);
extern "C" inline void free_fl_jpeg_image(JPEG_IMAGE j);


#endif

