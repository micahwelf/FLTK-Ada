

#ifndef FL_SHARED_IMAGE_GUARD
#define FL_SHARED_IMAGE_GUARD




typedef void* SHARED_IMAGE;




extern "C" SHARED_IMAGE fl_shared_image_get(const char * f, int w, int h);
extern "C" SHARED_IMAGE fl_shared_image_get2(void * r);
extern "C" SHARED_IMAGE fl_shared_image_find(const char * n, int w, int h);
extern "C" void release_fl_shared_image(SHARED_IMAGE i);
extern "C" SHARED_IMAGE fl_shared_image_copy(SHARED_IMAGE i, int w, int h);
extern "C" SHARED_IMAGE fl_shared_image_copy2(SHARED_IMAGE i);




extern "C" void fl_shared_image_color_average(SHARED_IMAGE i, int c, float b);
extern "C" void fl_shared_image_desaturate(SHARED_IMAGE i);


extern "C" const char * fl_shared_image_name(SHARED_IMAGE i);
extern "C" void fl_shared_image_reload(SHARED_IMAGE i);
extern "C" void fl_shared_image_uncache(SHARED_IMAGE i);


extern "C" void fl_shared_image_scaling_algorithm(int v);
extern "C" void fl_shared_image_scale(SHARED_IMAGE i, int w, int h, int p, int e);


extern "C" void fl_shared_image_draw(SHARED_IMAGE i, int x, int y, int w, int h, int cx, int cy);
extern "C" void fl_shared_image_draw2(SHARED_IMAGE i, int x, int y);


#endif

