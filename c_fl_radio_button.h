

#ifndef FL_RADIO_BUTTON_GUARD
#define FL_RADIO_BUTTON_GUARD


typedef void* my_fl_radio_button;


extern "C" my_fl_radio_button new_fl_radio_button(int x, int y, int w, int h, char * label);
extern "C" void free_fl_radio_button(my_fl_radio_button b);


#endif

