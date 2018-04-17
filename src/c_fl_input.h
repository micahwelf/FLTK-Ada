

#ifndef FL_INPUT_GUARD
#define FL_INPUT_GUARD




typedef void* INPUT;




extern "C" inline void input_set_draw_hook(INPUT n, void * d);
extern "C" inline void fl_input_draw(INPUT n);
extern "C" inline void input_set_handle_hook(INPUT i, void * h);
extern "C" inline int fl_input_handle(INPUT i, int e);




extern "C" inline INPUT new_fl_input(int x, int y, int w, int h, char* label);
extern "C" inline void free_fl_input(INPUT i);




extern "C" inline int fl_input_copy(INPUT i);
extern "C" inline int fl_input_cut(INPUT i);
extern "C" inline int fl_input_cut2(INPUT i, int b);
extern "C" inline int fl_input_cut3(INPUT i, int a, int b);
extern "C" inline int fl_input_copy_cuts(INPUT i);
extern "C" inline int fl_input_undo(INPUT i);


extern "C" inline int fl_input_get_readonly(INPUT i);
extern "C" inline void fl_input_set_readonly(INPUT i, int t);
extern "C" inline int fl_input_get_tab_nav(INPUT i);
extern "C" inline void fl_input_set_tab_nav(INPUT i, int t);
extern "C" inline int fl_input_get_wrap(INPUT i);
extern "C" inline void fl_input_set_wrap(INPUT i, int t);


extern "C" inline int fl_input_get_input_type(INPUT i);
extern "C" inline void fl_input_set_input_type(INPUT i, int t);
extern "C" inline unsigned long fl_input_get_shortcut(INPUT i);
extern "C" inline void fl_input_set_shortcut(INPUT i, unsigned long t);
extern "C" inline int fl_input_get_mark(INPUT i);
extern "C" inline int fl_input_set_mark(INPUT i, int t);
extern "C" inline int fl_input_get_position(INPUT i);
extern "C" inline int fl_input_set_position(INPUT i, int t);


extern "C" inline unsigned int fl_input_index(INPUT i, int p);
extern "C" inline int fl_input_insert(INPUT i, const char * s, int l);
extern "C" inline int fl_input_replace(INPUT i, int b, int e, const char * s, int l);
extern "C" inline const char * fl_input_get_value(INPUT i);
extern "C" inline void fl_input_set_value(INPUT i, char * s, int len);


extern "C" inline int fl_input_get_maximum_size(INPUT i);
extern "C" inline void fl_input_set_maximum_size(INPUT i, int t);
extern "C" inline int fl_input_get_size(INPUT i);


extern "C" inline unsigned int fl_input_get_cursor_color(INPUT i);
extern "C" inline void fl_input_set_cursor_color(INPUT i, unsigned int t);
extern "C" inline unsigned int fl_input_get_textcolor(INPUT i);
extern "C" inline void fl_input_set_textcolor(INPUT i, unsigned int t);
extern "C" inline int fl_input_get_textfont(INPUT i);
extern "C" inline void fl_input_set_textfont(INPUT i, int t);
extern "C" inline int fl_input_get_textsize(INPUT i);
extern "C" inline void fl_input_set_textsize(INPUT i, int t);


extern "C" inline void fl_input_set_size(INPUT i, int w, int h);


#endif

