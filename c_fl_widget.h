

#ifndef FL_WIDGET_GUARD
#define FL_WIDGET_GUARD


typedef void* WIDGET;


extern "C" int fl_widget_get_box(WIDGET w);
extern "C" void fl_widget_set_box(WIDGET w, int b);
extern "C" const char* fl_widget_get_label(WIDGET w);
extern "C" void fl_widget_set_label(WIDGET w, const char* t);
extern "C" int fl_widget_get_label_font(WIDGET w);
extern "C" void fl_widget_set_label_font(WIDGET w, int f);
extern "C" int fl_widget_get_label_size(WIDGET w);
extern "C" void fl_widget_set_label_size(WIDGET w, int s);
extern "C" int fl_widget_get_label_type(WIDGET w);
extern "C" void fl_widget_set_label_type(WIDGET w, int l);


#endif

