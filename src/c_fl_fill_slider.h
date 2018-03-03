

#ifndef FL_FILL_SLIDER_GUARD
#define FL_FILL_SLIDER_GUARD




typedef void* FILL_SLIDER;




extern "C" void fill_slider_set_draw_hook(FILL_SLIDER s, void * d);
extern "C" void fl_fill_slider_draw(FILL_SLIDER s);
extern "C" void fill_slider_set_handle_hook(FILL_SLIDER s, void * h);
extern "C" int fl_fill_slider_handle(FILL_SLIDER s, int e);




extern "C" FILL_SLIDER new_fl_fill_slider(int x, int y, int w, int h, char* label);
extern "C" void free_fl_fill_slider(FILL_SLIDER s);


#endif

