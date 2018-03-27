

#ifndef FL_IMAGE_SURFACE_GUARD
#define FL_IMAGE_SURFACE_GUARD




typedef void* IMAGE_SURFACE;




extern "C" IMAGE_SURFACE new_fl_image_surface(int w, int h, int r);
extern "C" void free_fl_image_surface(IMAGE_SURFACE s);




extern "C" void fl_image_surface_draw(IMAGE_SURFACE s, void * w, int dx, int dy);
extern "C" void fl_image_surface_draw_decorated_window(IMAGE_SURFACE s, void * w, int dx, int dy);


extern "C" void * fl_image_surface_image(IMAGE_SURFACE s);


extern "C" void fl_image_surface_set_current(IMAGE_SURFACE s);


#endif

