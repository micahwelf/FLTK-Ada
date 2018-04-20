

#ifndef FL_HOR_FILL_SLIDER_GUARD
#define FL_HOR_FILL_SLIDER_GUARD




typedef void* HOR_FILL_SLIDER;




extern "C" inline void hor_fill_slider_set_draw_hook(HOR_FILL_SLIDER s, void * d);
extern "C" inline void fl_hor_fill_slider_draw(HOR_FILL_SLIDER s);
extern "C" inline void hor_fill_slider_set_handle_hook(HOR_FILL_SLIDER s, void * h);
extern "C" inline int fl_hor_fill_slider_handle(HOR_FILL_SLIDER s, int e);




extern "C" inline HOR_FILL_SLIDER new_fl_hor_fill_slider(int x, int y, int w, int h, char* label);
extern "C" inline void free_fl_hor_fill_slider(HOR_FILL_SLIDER s);


#endif

