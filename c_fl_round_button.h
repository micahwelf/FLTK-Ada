

#ifndef FL_ROUND_BUTTON_GUARD
#define FL_ROUND_BUTTON_GUARD


typedef void* ROUNDBUTTON;


extern "C" ROUNDBUTTON new_fl_round_button(int x, int y, int w, int h, char* label);
extern "C" void free_fl_round_button(ROUNDBUTTON b);


#endif

