

#ifndef FL_CHECK_BUTTON_GUARD
#define FL_CHECK_BUTTON_GUARD




typedef void* CHECKBUTTON;




extern "C" inline void check_button_set_draw_hook(CHECKBUTTON b, void * d);
extern "C" inline void fl_check_button_draw(CHECKBUTTON b);
extern "C" inline void check_button_set_handle_hook(CHECKBUTTON b, void * h);
extern "C" inline int fl_check_button_handle(CHECKBUTTON b, int e);




extern "C" inline CHECKBUTTON new_fl_check_button(int x, int y, int w, int h, char* label);
extern "C" inline void free_fl_check_button(CHECKBUTTON b);


#endif

