

#ifndef FL_BMP_IMAGE_GUARD
#define FL_BMP_IMAGE_GUARD




typedef void* BMP_IMAGE;




extern "C" BMP_IMAGE new_fl_bmp_image(const char * f);
extern "C" void free_fl_bmp_image(BMP_IMAGE b);


#endif

