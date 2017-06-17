

#ifndef FL_BUTTON_GUARD
#define FL_BUTTON_GUARD




typedef void* BUTTON;




extern "C" void button_set_draw_hook(BUTTON b, void * d);
extern "C" void fl_button_draw(BUTTON b);
extern "C" void button_set_handle_hook(BUTTON b, void * h);
extern "C" int fl_button_handle(BUTTON b, int e);




extern "C" BUTTON new_fl_button(int x, int y, int w, int h, char* label);
extern "C" void free_fl_button(BUTTON b);




extern "C" int fl_button_get_state(BUTTON b);
extern "C" void fl_button_set_state(BUTTON b, int s);
extern "C" void fl_button_set_only(BUTTON b);


#endif

