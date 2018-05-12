

#ifndef FL_SCREEN_GUARD
#define FL_SCREEN_GUARD




extern "C" int fl_screen_x();
extern "C" int fl_screen_y();
extern "C" int fl_screen_w();
extern "C" int fl_screen_h();


extern "C" int fl_screen_count();
extern "C" void fl_screen_dpi(float &h, float &v, int n);


extern "C" int fl_screen_num(int x, int y);
extern "C" int fl_screen_num2(int x, int y, int w, int h);


extern "C" void fl_screen_work_area(int &x, int &y, int &w, int &h, int px, int py);
extern "C" void fl_screen_work_area2(int &x, int &y, int &w, int &h, int n);
extern "C" void fl_screen_work_area3(int &x, int &y, int &w, int &h);


extern "C" void fl_screen_xywh(int &x, int &y, int &w, int &h, int px, int py);
extern "C" void fl_screen_xywh2(int &x, int &y, int &w, int &h, int n);
extern "C" void fl_screen_xywh3(int &x, int &y, int &w, int &h);
extern "C" void fl_screen_xywh4(int &x, int &y, int &w, int &h, int px, int py, int pw, int ph);


#endif

