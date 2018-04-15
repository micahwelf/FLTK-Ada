

#ifndef FL_REPEAT_BUTTON_GUARD
#define FL_REPEAT_BUTTON_GUARD




typedef void* REPEATBUTTON;




extern "C" inline void repeat_button_set_draw_hook(REPEATBUTTON b, void * d);
extern "C" inline void fl_repeat_button_draw(REPEATBUTTON b);
extern "C" inline void repeat_button_set_handle_hook(REPEATBUTTON b, void * h);
extern "C" inline int fl_repeat_button_handle(REPEATBUTTON b, int e);




extern "C" inline REPEATBUTTON new_fl_repeat_button(int x, int y, int w, int h, char* label);
extern "C" inline void free_fl_repeat_button(REPEATBUTTON b);


#endif

