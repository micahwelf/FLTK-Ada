

#ifndef FL_SCROLL_GUARD
#define FL_SCROLL_GUARD




typedef void* SCROLL;




extern "C" inline void scroll_set_draw_hook(SCROLL s, void * d);
extern "C" inline void fl_scroll_draw(SCROLL s);
extern "C" inline void scroll_set_handle_hook(SCROLL s, void * h);
extern "C" inline int fl_scroll_handle(SCROLL s, int e);




extern "C" inline SCROLL new_fl_scroll(int x, int y, int w, int h, char* label);
extern "C" inline void free_fl_scroll(SCROLL s);




extern "C" inline void fl_scroll_clear(SCROLL s);


extern "C" inline void fl_scroll_to(SCROLL s, int x, int y);
extern "C" inline void fl_scroll_set_type(SCROLL s, int t);


extern "C" inline int fl_scroll_get_size(SCROLL s);
extern "C" inline void fl_scroll_set_size(SCROLL s, int t);
extern "C" inline int fl_scroll_xposition(SCROLL s);
extern "C" inline int fl_scroll_yposition(SCROLL s);


#endif

