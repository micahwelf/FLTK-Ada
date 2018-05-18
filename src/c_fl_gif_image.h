

#ifndef FL_GIF_IMAGE_GUARD
#define FL_GIF_IMAGE_GUARD




typedef void* GIF_IMAGE;




extern "C" GIF_IMAGE new_fl_gif_image(const char * f);
extern "C" void free_fl_gif_image(GIF_IMAGE j);


#endif

