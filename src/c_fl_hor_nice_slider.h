

#ifndef FL_HOR_NICE_SLIDER_GUARD
#define FL_HOR_NICE_SLIDER_GUARD




typedef void* HOR_NICE_SLIDER;




extern "C" inline void hor_nice_slider_set_draw_hook(HOR_NICE_SLIDER s, void * d);
extern "C" inline void fl_hor_nice_slider_draw(HOR_NICE_SLIDER s);
extern "C" inline void hor_nice_slider_set_handle_hook(HOR_NICE_SLIDER s, void * h);
extern "C" inline int fl_hor_nice_slider_handle(HOR_NICE_SLIDER s, int e);




extern "C" inline HOR_NICE_SLIDER new_fl_hor_nice_slider(int x, int y, int w, int h, char* label);
extern "C" inline void free_fl_hor_nice_slider(HOR_NICE_SLIDER s);


#endif

