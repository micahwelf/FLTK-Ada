

#ifndef FL_ROUND_BUTTON_GUARD
#define FL_ROUND_BUTTON_GUARD


typedef void* ROUNDBUTTON;


extern "C" void round_button_set_draw_hook(ROUNDBUTTON b, void * d);
extern "C" void fl_round_button_draw(ROUNDBUTTON b);
extern "C" void round_button_set_handle_hook(ROUNDBUTTON b, void * h);
extern "C" int fl_round_button_handle(ROUNDBUTTON b, int e);

extern "C" ROUNDBUTTON new_fl_round_button(int x, int y, int w, int h, char* label);
extern "C" void free_fl_round_button(ROUNDBUTTON b);


#endif

