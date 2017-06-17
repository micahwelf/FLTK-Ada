

#ifndef FL_WIDGET_GUARD
#define FL_WIDGET_GUARD




typedef void* WIDGET;




extern "C" void widget_set_draw_hook(WIDGET w, void * d);
extern "C" void widget_set_handle_hook(WIDGET w, void * h);




extern "C" WIDGET new_fl_widget(int x, int y, int w, int h, char* label);
extern "C" void free_fl_widget(WIDGET w);




extern "C" void * fl_widget_get_user_data(WIDGET w);
extern "C" void fl_widget_set_user_data(WIDGET w, void * d);


extern "C" void fl_widget_activate(WIDGET w);
extern "C" void fl_widget_deactivate(WIDGET w);
extern "C" int fl_widget_active(WIDGET w);
extern "C" int fl_widget_active_r(WIDGET w);
extern "C" void fl_widget_clear_active(WIDGET w);


extern "C" unsigned int fl_widget_changed(WIDGET w);
extern "C" void fl_widget_clear_changed(WIDGET w);


extern "C" void * fl_widget_get_parent(WIDGET w);
extern "C" int fl_widget_contains(WIDGET w, WIDGET i);


extern "C" unsigned int fl_widget_get_align(WIDGET w);
extern "C" void fl_widget_set_align(WIDGET w, unsigned int a);
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
extern "C" void fl_widget_set_callback(WIDGET w, void * cb);


extern "C" int fl_widget_get_x(WIDGET w);
extern "C" int fl_widget_get_y(WIDGET w);
extern "C" int fl_widget_get_w(WIDGET w);
extern "C" int fl_widget_get_h(WIDGET w);
extern "C" void fl_widget_size(WIDGET w, int d, int h);
extern "C" void fl_widget_position(WIDGET w, int x, int y);


extern "C" void fl_widget_set_image(WIDGET w, void * img);


#endif

