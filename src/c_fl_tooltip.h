

#ifndef FL_TOOLTIP_GUARD
#define FL_TOOLTIP_GUARD




extern "C" void * fl_tooltip_get_current(void);
extern "C" void fl_tooltip_set_current(void * i);
extern "C" int fl_tooltip_enabled(void);
extern "C" void fl_tooltip_enable(int v);
extern "C" void fl_tooltip_enter_area(void * i, int x, int y, int w, int h, const char * t);


extern "C" float fl_tooltip_get_delay(void);
extern "C" void fl_tooltip_set_delay(float v);
extern "C" float fl_tooltip_get_hoverdelay(void);
extern "C" void fl_tooltip_set_hoverdelay(float v);


extern "C" unsigned int fl_tooltip_get_color(void);
extern "C" void fl_tooltip_set_color(unsigned int v);
extern "C" int fl_tooltip_get_margin_height(void);
//extern "C" void fl_tooltip_set_margin_height(int v);
extern "C" int fl_tooltip_get_margin_width(void);
//extern "C" void fl_tooltip_set_margin_width(int v);
extern "C" int fl_tooltip_get_wrap_width(void);
//extern "C" void fl_tooltip_set_wrap_width(int v);


extern "C" unsigned int fl_tooltip_get_textcolor(void);
extern "C" void fl_tooltip_set_textcolor(unsigned int v);
extern "C" int fl_tooltip_get_font(void);
extern "C" void fl_tooltip_set_font(int v);
extern "C" int fl_tooltip_get_size(void);
extern "C" void fl_tooltip_set_size(int v);


#endif

