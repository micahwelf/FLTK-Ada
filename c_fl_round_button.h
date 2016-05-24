

#ifndef FL_ROUND_BUTTON_GUARD
#define FL_ROUND_BUTTON_GUARD


typedef void* my_fl_round_button;


extern "C" my_fl_round_button new_fl_round_button(int x, int y, int w, int h, char * label);
extern "C" void free_fl_round_button(my_fl_round_button b);


#endif

