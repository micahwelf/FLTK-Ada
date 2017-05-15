

#ifndef FL_PNM_IMAGE_GUARD
#define FL_PNM_IMAGE_GUARD


typedef void* PNM_IMAGE;


extern "C" PNM_IMAGE new_fl_pnm_image(const char * f);
extern "C" void free_fl_pnm_image(PNM_IMAGE p);


#endif

