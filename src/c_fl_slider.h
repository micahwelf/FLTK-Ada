

#ifndef FL_SLIDER_GUARD
#define FL_SLIDER_GUARD




typedef void* SLIDER;




extern "C" inline void slider_set_draw_hook(SLIDER s, void * d);
extern "C" inline void fl_slider_draw(SLIDER s);
extern "C" inline void slider_set_handle_hook(SLIDER s, void * h);
extern "C" inline int fl_slider_handle(SLIDER s, int e);




extern "C" inline SLIDER new_fl_slider(int x, int y, int w, int h, char* label);
extern "C" inline void free_fl_slider(SLIDER s);




extern "C" inline int fl_slider_get_type(SLIDER s);
extern "C" inline void fl_slider_set_type(SLIDER s, int t);


extern "C" inline void fl_slider_set_bounds(SLIDER s, double a, double b);
extern "C" inline int fl_slider_get_slider(SLIDER s);
extern "C" inline void fl_slider_set_slider(SLIDER s, int t);
extern "C" inline float fl_slider_get_slider_size(SLIDER s);
extern "C" inline void fl_slider_set_slider_size(SLIDER s, float t);
extern "C" inline int fl_slider_scrollvalue(SLIDER s, int p, int z, int f, int t);


#endif

