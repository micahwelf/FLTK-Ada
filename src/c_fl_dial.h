

#ifndef FL_DIAL_GUARD
#define FL_DIAL_GUARD




typedef void* DIAL;




extern "C" inline void dial_set_draw_hook(DIAL v, void * d);
extern "C" inline void fl_dial_draw(DIAL v);
extern "C" inline void dial_set_handle_hook(DIAL v, void * h);
extern "C" inline int fl_dial_handle(DIAL v, int e);




extern "C" inline DIAL new_fl_dial(int x, int y, int w, int h, char* label);
extern "C" inline void free_fl_dial(DIAL v);




extern "C" inline int fl_dial_get_type(DIAL v);
extern "C" inline void fl_dial_set_type(DIAL v, int t);


extern "C" inline int fl_dial_get_angle1(DIAL v);
extern "C" inline void fl_dial_set_angle1(DIAL v, int t);
extern "C" inline int fl_dial_get_angle2(DIAL v);
extern "C" inline void fl_dial_set_angle2(DIAL v, int t);
extern "C" inline void fl_dial_set_angles(DIAL v, int a, int b);


#endif

