

#ifndef FL_BITMAP_GUARD
#define FL_BITMAP_GUARD




typedef void* BITMAP;




extern "C" void free_fl_bitmap(BITMAP b);
extern "C" BITMAP fl_bitmap_copy(BITMAP b, int w, int h);
extern "C" BITMAP fl_bitmap_copy2(BITMAP b);


#endif

