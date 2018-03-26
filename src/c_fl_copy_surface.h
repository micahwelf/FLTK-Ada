

#ifndef FL_COPY_SURFACE_GUARD
#define CL_COPY_SURFACE_GUARD




typedef void* COPY_SURFACE;




extern "C" COPY_SURFACE new_fl_copy_surface(int w, int h);
extern "C" void free_fl_copy_surface(COPY_SURFACE c);




extern "C" int fl_copy_surface_get_w(COPY_SURFACE c);
extern "C" int fl_copy_surface_get_h(COPY_SURFACE c);


extern "C" void fl_copy_surface_draw(COPY_SURFACE c, void * w, int dx, int dy);
extern "C" void fl_copy_surface_draw_decorated_window(COPY_SURFACE c, void * w, int dx, int dy);


extern "C" void fl_copy_surface_set_current(COPY_SURFACE c);


#endif

