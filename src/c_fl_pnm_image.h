

#ifndef FL_PNM_IMAGE_GUARD
#define FL_PNM_IMAGE_GUARD




typedef void* PNM_IMAGE;




extern "C" inline PNM_IMAGE new_fl_pnm_image(const char * f);
extern "C" inline void free_fl_pnm_image(PNM_IMAGE p);


#endif

