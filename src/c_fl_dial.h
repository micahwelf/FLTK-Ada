

#ifndef FL_DIAL_GUARD
#define FL_DIAL_GUARD




typedef void* DIAL;




extern "C" void dial_set_draw_hook(DIAL v, void * d);
extern "C" void fl_dial_draw(DIAL v);
extern "C" void dial_set_handle_hook(DIAL v, void * h);
extern "C" int fl_dial_handle(DIAL v, int e);




extern "C" DIAL new_fl_dial(int x, int y, int w, int h, char* label);
extern "C" void free_fl_dial(DIAL v);




extern "C" int fl_dial_get_angle1(DIAL v);
extern "C" void fl_dial_set_angle1(DIAL v, int t);
extern "C" int fl_dial_get_angle2(DIAL v);
extern "C" void fl_dial_set_angle2(DIAL v, int t);
extern "C" void fl_dial_set_angles(DIAL v, int a, int b);


#endif

