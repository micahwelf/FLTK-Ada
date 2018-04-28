

#ifndef FL_SCREEN_GUARD
#define FL_SCREEN_GUARD




extern "C" inline int fl_screen_x();
extern "C" inline int fl_screen_y();
extern "C" inline int fl_screen_w();
extern "C" inline int fl_screen_h();


extern "C" inline int fl_screen_count();
extern "C" inline void fl_screen_dpi(float &h, float &v, int n);


extern "C" inline int fl_screen_num(int x, int y);
extern "C" inline int fl_screen_num2(int x, int y, int w, int h);


extern "C" inline void fl_screen_work_area(int &x, int &y, int &w, int &h, int px, int py);
extern "C" inline void fl_screen_work_area2(int &x, int &y, int &w, int &h, int n);
extern "C" inline void fl_screen_work_area3(int &x, int &y, int &w, int &h);


extern "C" inline void fl_screen_xywh(int &x, int &y, int &w, int &h, int px, int py);
extern "C" inline void fl_screen_xywh2(int &x, int &y, int &w, int &h, int n);
extern "C" inline void fl_screen_xywh3(int &x, int &y, int &w, int &h);
extern "C" inline void fl_screen_xywh4(int &x, int &y, int &w, int &h, int px, int py, int pw, int ph);


#endif

