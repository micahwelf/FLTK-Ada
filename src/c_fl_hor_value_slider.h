

#ifndef FL_HOR_VALUE_SLIDER_GUARD
#define FL_HOR_VALUE_SLIDER_GUARD




typedef void* HOR_VALUE_SLIDER;




extern "C" void hor_value_slider_set_draw_hook(HOR_VALUE_SLIDER s, void * d);
extern "C" void fl_hor_value_slider_draw(HOR_VALUE_SLIDER s);
extern "C" void hor_value_slider_set_handle_hook(HOR_VALUE_SLIDER s, void * h);
extern "C" int fl_hor_value_slider_handle(HOR_VALUE_SLIDER s, int e);




extern "C" HOR_VALUE_SLIDER new_fl_hor_value_slider(int x, int y, int w, int h, char* label);
extern "C" void free_fl_hor_value_slider(HOR_VALUE_SLIDER s);


#endif

