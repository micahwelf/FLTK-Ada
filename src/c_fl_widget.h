

#ifndef FL_WIDGET_GUARD
#define FL_WIDGET_GUARD




typedef void* WIDGET;




extern "C" inline void widget_set_draw_hook(WIDGET w, void * d);
extern "C" inline void widget_set_handle_hook(WIDGET w, void * h);




extern "C" inline WIDGET new_fl_widget(int x, int y, int w, int h, char* label);
extern "C" inline void free_fl_widget(WIDGET w);




extern "C" inline void * fl_widget_get_user_data(WIDGET w);
extern "C" inline void fl_widget_set_user_data(WIDGET w, void * d);


extern "C" inline void fl_widget_activate(WIDGET w);
extern "C" inline void fl_widget_deactivate(WIDGET w);
extern "C" inline int fl_widget_active(WIDGET w);
extern "C" inline int fl_widget_active_r(WIDGET w);
extern "C" inline void fl_widget_set_active(WIDGET w);
extern "C" inline void fl_widget_clear_active(WIDGET w);


extern "C" inline unsigned int fl_widget_changed(WIDGET w);
extern "C" inline void fl_widget_set_changed(WIDGET w);
extern "C" inline void fl_widget_clear_changed(WIDGET w);
extern "C" inline int fl_widget_output(WIDGET w);
extern "C" inline void fl_widget_set_output(WIDGET w);
extern "C" inline void fl_widget_clear_output(WIDGET w);
extern "C" inline int fl_widget_visible(WIDGET w);
extern "C" inline int fl_widget_visible_r(WIDGET w);
extern "C" inline void fl_widget_set_visible(WIDGET w);
extern "C" inline void fl_widget_clear_visible(WIDGET w);


extern "C" inline int fl_widget_get_visible_focus(WIDGET w);
extern "C" inline void fl_widget_set_visible_focus(WIDGET w, int f);
extern "C" inline int fl_widget_take_focus(WIDGET w);
extern "C" inline int fl_widget_takesevents(WIDGET w);


extern "C" inline unsigned int fl_widget_get_color(WIDGET w);
extern "C" inline void fl_widget_set_color(WIDGET w, unsigned int b);
extern "C" inline unsigned int fl_widget_get_selection_color(WIDGET w);
extern "C" inline void fl_widget_set_selection_color(WIDGET w, unsigned int c);


extern "C" inline void * fl_widget_get_parent(WIDGET w);
extern "C" inline int fl_widget_contains(WIDGET w, WIDGET i);
extern "C" inline int fl_widget_inside(WIDGET w, WIDGET p);
extern "C" inline void * fl_widget_window(WIDGET w);
extern "C" inline void * fl_widget_top_window(WIDGET w);
extern "C" inline void * fl_widget_top_window_offset(WIDGET w, int &x, int &y);


extern "C" inline unsigned int fl_widget_get_align(WIDGET w);
extern "C" inline void fl_widget_set_align(WIDGET w, unsigned int a);
extern "C" inline int fl_widget_get_box(WIDGET w);
extern "C" inline void fl_widget_set_box(WIDGET w, int b);
extern "C" inline const char * fl_widget_tooltip(WIDGET w);
extern "C" inline void fl_widget_copy_tooltip(WIDGET w, const char * t);


extern "C" inline const char* fl_widget_get_label(WIDGET w);
extern "C" inline void fl_widget_set_label(WIDGET w, const char* t);
extern "C" inline unsigned int fl_widget_get_labelcolor(WIDGET w);
extern "C" inline void fl_widget_set_labelcolor(WIDGET w, unsigned int v);
extern "C" inline int fl_widget_get_labelfont(WIDGET w);
extern "C" inline void fl_widget_set_labelfont(WIDGET w, int f);
extern "C" inline int fl_widget_get_labelsize(WIDGET w);
extern "C" inline void fl_widget_set_labelsize(WIDGET w, int s);
extern "C" inline int fl_widget_get_labeltype(WIDGET w);
extern "C" inline void fl_widget_set_labeltype(WIDGET w, int l);
extern "C" inline void fl_widget_measure_label(WIDGET w, int &d, int &h);


extern "C" inline void fl_widget_set_callback(WIDGET w, void * cb);
extern "C" inline unsigned int fl_widget_get_when(WIDGET w);
extern "C" inline void fl_widget_set_when(WIDGET w, unsigned int c);


extern "C" inline int fl_widget_get_x(WIDGET w);
extern "C" inline int fl_widget_get_y(WIDGET w);
extern "C" inline int fl_widget_get_w(WIDGET w);
extern "C" inline int fl_widget_get_h(WIDGET w);
extern "C" inline void fl_widget_size(WIDGET w, int d, int h);
extern "C" inline void fl_widget_position(WIDGET w, int x, int y);


extern "C" inline void fl_widget_set_image(WIDGET w, void * img);
extern "C" inline void fl_widget_set_deimage(WIDGET w, void * img);


extern "C" inline int fl_widget_damage(WIDGET w);
extern "C" inline void fl_widget_set_damage(WIDGET w, int t);
extern "C" inline void fl_widget_set_damage2(WIDGET w, int t, int x, int y, int d, int h);
extern "C" inline void fl_widget_draw_label(WIDGET w, int x, int y, int d, int h, unsigned int a);
extern "C" inline void fl_widget_redraw(WIDGET w);
extern "C" inline void fl_widget_redraw_label(WIDGET w);


#endif

