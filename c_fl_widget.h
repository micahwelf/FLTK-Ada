

#ifndef FL_WIDGET_GUARD
#define FL_WIDGET_GUARD


typedef void* my_fl_widget;


extern "C" int fl_widget_get_box(my_fl_widget w);
extern "C" void fl_widget_set_box(my_fl_widget w, int b);
extern "C" int fl_widget_get_label_font(my_fl_widget w);
extern "C" void fl_widget_set_label_font(my_fl_widget w, int f);
extern "C" int fl_widget_get_label_size(my_fl_widget w);
extern "C" void fl_widget_set_label_size(my_fl_widget w, int s);
extern "C" int fl_widget_get_label_type(my_fl_widget w);
extern "C" void fl_widget_set_label_type(my_fl_widget w, int l);


#endif

