

#ifndef FL_SURFACE_GUARD
#define FL_SURFACE_GUARD




typedef void* SURFACE;




extern "C" inline SURFACE new_fl_surface(void * g);
extern "C" inline void free_fl_surface(SURFACE s);




extern "C" inline void fl_surface_set_current(SURFACE s);
extern "C" inline SURFACE fl_surface_get_surface(void);


#endif

