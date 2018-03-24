

#ifndef FL_SURFACE_GUARD
#define FL_SURFACE_GUARD




typedef void* SURFACE;




extern "C" SURFACE new_fl_surface(void * g);
extern "C" void free_fl_surface(SURFACE s);




extern "C" void fl_surface_set_current(SURFACE s);
extern "C" SURFACE fl_surface_get_surface(void);


#endif

