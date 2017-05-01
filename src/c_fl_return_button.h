

#ifndef FL_RETURN_BUTTON_GUARD
#define FL_RETURN_BUTTON_GUARD


typedef void* RETURNBUTTON;


extern "C" void return_button_set_draw_hook(RETURNBUTTON b, void * d);
extern "C" void fl_return_button_draw(RETURNBUTTON b);

extern "C" RETURNBUTTON new_fl_return_button(int x, int y, int w, int h, char* label);
extern "C" void free_fl_return_button(RETURNBUTTON b);


#endif

