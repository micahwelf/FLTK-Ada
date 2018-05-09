

#ifndef FL_GRAPHICS_DRIVER_GUARD
#define FL_GRAPHICS_DRIVER_GUARD




typedef void* GRAPHICS_DRIVER;




extern "C" inline unsigned int fl_graphics_driver_color(GRAPHICS_DRIVER g);


extern "C" inline int fl_graphics_driver_descent(GRAPHICS_DRIVER g);
extern "C" inline int fl_graphics_driver_height(GRAPHICS_DRIVER g);
extern "C" inline double fl_graphics_driver_width(GRAPHICS_DRIVER g, unsigned int c);
extern "C" inline double fl_graphics_driver_width2(GRAPHICS_DRIVER g, const char * s, int l);
extern "C" inline int fl_graphics_driver_get_font(GRAPHICS_DRIVER g);
extern "C" inline int fl_graphics_driver_size(GRAPHICS_DRIVER g);
extern "C" inline void fl_graphics_driver_set_font(GRAPHICS_DRIVER g, int f, int s);


extern "C" inline void fl_graphics_driver_draw_scaled(GRAPHICS_DRIVER g, void * i, int x, int y, int w, int h);


#endif

