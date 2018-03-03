

#ifndef FL_HOR_NICE_SLIDER_GUARD
#define FL_HOR_NICE_SLIDER_GUARD




typedef void* HOR_NICE_SLIDER;




extern "C" void hor_nice_slider_set_draw_hook(HOR_NICE_SLIDER s, void * d);
extern "C" void fl_hor_nice_slider_draw(HOR_NICE_SLIDER s);
extern "C" void hor_nice_slider_set_handle_hook(HOR_NICE_SLIDER s, void * h);
extern "C" int fl_hor_nice_slider_handle(HOR_NICE_SLIDER s, int e);




extern "C" HOR_NICE_SLIDER new_fl_hor_nice_slider(int x, int y, int w, int h, char* label);
extern "C" void free_fl_hor_nice_slider(HOR_NICE_SLIDER s);


#endif

