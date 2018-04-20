

#ifndef FL_VALUE_SLIDER_GUARD
#define FL_VALUE_SLIDER_GUARD




typedef void* VALUE_SLIDER;




extern "C" inline void value_slider_set_draw_hook(VALUE_SLIDER s, void * d);
extern "C" inline void fl_value_slider_draw(VALUE_SLIDER s);
extern "C" inline void value_slider_set_handle_hook(VALUE_SLIDER s, void * h);
extern "C" inline int fl_value_slider_handle(VALUE_SLIDER s, int e);




extern "C" inline VALUE_SLIDER new_fl_value_slider(int x, int y, int w, int h, char* label);
extern "C" inline void free_fl_value_slider(VALUE_SLIDER s);




extern "C" inline unsigned int fl_value_slider_get_textcolor(VALUE_SLIDER s);
extern "C" inline void fl_value_slider_set_textcolor(VALUE_SLIDER s, unsigned int t);
extern "C" inline int fl_value_slider_get_textfont(VALUE_SLIDER s);
extern "C" inline void fl_value_slider_set_textfont(VALUE_SLIDER s, int t);
extern "C" inline int fl_value_slider_get_textsize(VALUE_SLIDER s);
extern "C" inline void fl_value_slider_set_textsize(VALUE_SLIDER s, int t);


#endif

