

#ifndef FL_NICE_SLIDER_GUARD
#define FL_NICE_SLIDER_GUARD




typedef void* NICE_SLIDER;




extern "C" inline void nice_slider_set_draw_hook(NICE_SLIDER s, void * d);
extern "C" inline void fl_nice_slider_draw(NICE_SLIDER s);
extern "C" inline void nice_slider_set_handle_hook(NICE_SLIDER s, void * h);
extern "C" inline int fl_nice_slider_handle(NICE_SLIDER s, int e);




extern "C" inline NICE_SLIDER new_fl_nice_slider(int x, int y, int w, int h, char* label);
extern "C" inline void free_fl_nice_slider(NICE_SLIDER s);


#endif

