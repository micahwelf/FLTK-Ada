

#ifndef FL_SCREEN_GUARD
#define FL_SCREEN_GUARD


extern "C" int fl_screen_x();
extern "C" int fl_screen_y();
extern "C" int fl_screen_w();
extern "C" int fl_screen_h();


extern "C" int fl_screen_count();
extern "C" void fl_screen_dpi(float &h, float &v, int n);


#endif

