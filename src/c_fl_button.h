

#ifndef FL_BUTTON_GUARD
#define FL_BUTTON_GUARD




typedef void* BUTTON;




extern "C" inline void button_set_draw_hook(BUTTON b, void * d);
extern "C" inline void fl_button_draw(BUTTON b);
extern "C" inline void button_set_handle_hook(BUTTON b, void * h);
extern "C" inline int fl_button_handle(BUTTON b, int e);




extern "C" inline BUTTON new_fl_button(int x, int y, int w, int h, char* label);
extern "C" inline void free_fl_button(BUTTON b);




extern "C" inline int fl_button_get_state(BUTTON b);
extern "C" inline void fl_button_set_state(BUTTON b, int s);
extern "C" inline void fl_button_set_only(BUTTON b);


extern "C" inline int fl_button_get_down_box(BUTTON b);
extern "C" inline void fl_button_set_down_box(BUTTON b, int t);
extern "C" inline int fl_button_get_shortcut(BUTTON b);
extern "C" inline void fl_button_set_shortcut(BUTTON b, int k);


#endif

