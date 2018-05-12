

#ifndef FL_HORIZONTAL_SLIDER_GUARD
#define FL_HORIZONTAL_SLIDER_GUARD




typedef void* HORIZONTAL_SLIDER;




extern "C" void horizontal_slider_set_draw_hook(HORIZONTAL_SLIDER s, void * d);
extern "C" void fl_horizontal_slider_draw(HORIZONTAL_SLIDER s);
extern "C" void horizontal_slider_set_handle_hook(HORIZONTAL_SLIDER s, void * h);
extern "C" int fl_horizontal_slider_handle(HORIZONTAL_SLIDER s, int e);




extern "C" HORIZONTAL_SLIDER new_fl_horizontal_slider(int x, int y, int w, int h, char* label);
extern "C" void free_fl_horizontal_slider(HORIZONTAL_SLIDER s);


#endif

