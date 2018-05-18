

#ifndef FL_XPM_IMAGE_GUARD
#define FL_XPM_IMAGE_GUARD




typedef void* XPM_IMAGE;




extern "C" XPM_IMAGE new_fl_xpm_image(const char * f);
extern "C" void free_fl_xpm_image(XPM_IMAGE j);


#endif

