

#ifndef FL_XBM_IMAGE_GUARD
#define FL_XBM_IMAGE_GUARD


typedef void* XBM_IMAGE;


extern "C" XBM_IMAGE new_fl_xbm_image(const char * f);
extern "C" void free_fl_xbm_image(XBM_IMAGE b);


#endif

