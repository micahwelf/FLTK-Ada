

#ifndef FL_STATIC_GUARD
#define FL_STATIC_GUARD




extern "C" inline void fl_static_add_awake_handler(void * h, void * f);
extern "C" inline void fl_static_get_awake_handler(void * &h, void * &f);


extern "C" inline void fl_static_add_check(void * h, void * f);
extern "C" inline int fl_static_has_check(void * h, void * f);
extern "C" inline void fl_static_remove_check(void * h, void * f);


extern "C" inline void fl_static_add_timeout(double s, void * h, void * f);
extern "C" inline int fl_static_has_timeout(void * h, void * f);
extern "C" inline void fl_static_remove_timeout(void * h, void * f);
extern "C" inline void fl_static_repeat_timeout(double s, void * h, void * f);


extern "C" inline void fl_static_add_clipboard_notify(void * h, void * f);


extern "C" inline void fl_static_add_fd(int d, void * h, void * f);
extern "C" inline void fl_static_add_fd2(int d, int m, void * h, void * f);
extern "C" inline void fl_static_remove_fd(int d);
extern "C" inline void fl_static_remove_fd2(int d, int m);


extern "C" inline void fl_static_add_idle(void * h, void * f);
extern "C" inline int fl_static_has_idle(void * h, void * f);
extern "C" inline void fl_static_remove_idle(void * h, void * f);


extern "C" inline void fl_static_get_color(unsigned int c, unsigned char &r, unsigned char &g, unsigned char &b);
extern "C" inline void fl_static_set_color(unsigned int c, unsigned char r, unsigned char g, unsigned char b);
extern "C" inline void fl_static_free_color(unsigned int c, int b);
extern "C" inline void fl_static_foreground(unsigned int r, unsigned int g, unsigned int b);
extern "C" inline void fl_static_background(unsigned int r, unsigned int g, unsigned int b);
extern "C" inline void fl_static_background2(unsigned int r, unsigned int g, unsigned int b);


extern "C" inline const char * fl_static_get_font(int f);
extern "C" inline const char * fl_static_get_font_name(int f);
extern "C" inline void fl_static_set_font(int t, int f);
extern "C" inline int fl_static_get_font_sizes(int f, int * &a);
extern "C" inline int fl_static_font_size_array_get(int * a, int i);
extern "C" inline int fl_static_set_fonts();


extern "C" inline int fl_static_box_dh(int b);
extern "C" inline int fl_static_box_dw(int b);
extern "C" inline int fl_static_box_dx(int b);
extern "C" inline int fl_static_box_dy(int b);
extern "C" inline void fl_static_set_boxtype(int t, int f);
extern "C" inline int fl_static_draw_box_active();


extern "C" inline void fl_static_copy(const char * t, int l, int k);
extern "C" inline void fl_static_paste(void * r, int s);
extern "C" inline void fl_static_selection(void * o, char * t, int l);


extern "C" inline void fl_static_dnd();
extern "C" inline int fl_static_get_dnd_text_ops();
extern "C" inline void fl_static_set_dnd_text_ops(int t);


extern "C" inline void fl_static_enable_im();
extern "C" inline void fl_static_disable_im();
extern "C" inline int fl_static_get_visible_focus();
extern "C" inline void fl_static_set_visible_focus(int f);


extern "C" inline void fl_static_default_atclose(void * w);
extern "C" inline void * fl_static_get_first_window();
extern "C" inline void fl_static_set_first_window(void * w);
extern "C" inline void * fl_static_next_window(void * w);
extern "C" inline void * fl_static_modal();


extern "C" inline void * fl_static_readqueue();
extern "C" inline void fl_static_do_widget_deletion();


extern "C" inline const char * fl_static_get_scheme();
extern "C" inline void fl_static_set_scheme(const char *n);
extern "C" inline int fl_static_is_scheme(const char *n);
extern "C" inline void fl_static_reload_scheme();


extern "C" inline int fl_static_get_option(int o);
extern "C" inline void fl_static_set_option(int o, int t);


extern "C" inline int fl_static_get_scrollbar_size();
extern "C" inline void fl_static_set_scrollbar_size(int s);


#endif

