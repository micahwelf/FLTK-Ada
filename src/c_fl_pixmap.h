

#ifndef FL_PIXMAP_GUARD
#define FL_PIXMAP_GUARD




typedef void* PIXMAP;




extern "C" void free_fl_pixmap(PIXMAP b);
extern "C" PIXMAP fl_pixmap_copy(PIXMAP b, int w, int h);
extern "C" PIXMAP fl_pixmap_copy2(PIXMAP b);


extern "C" void fl_pixmap_color_average(PIXMAP p, int c, float b);
extern "C" void fl_pixmap_desaturate(PIXMAP p);


extern "C" void fl_pixmap_draw2(PIXMAP b, int x, int y);
extern "C" void fl_pixmap_draw(PIXMAP b, int x, int y, int w, int h, int cx, int cy);


#endif

