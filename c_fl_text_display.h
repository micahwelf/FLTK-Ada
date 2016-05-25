

#ifndef FL_TEXT_DISPLAY_GUARD
#define FL_TEXT_DISPLAY_GUARD


typedef void* my_fl_text_display;


extern "C" my_fl_text_display new_fl_text_display(int x, int y, int w, int h, char * label);
extern "C" void free_fl_text_display(my_fl_text_display td);

extern "C" int fl_text_display_get_text_color(my_fl_text_display td);
extern "C" void fl_text_display_set_text_color(my_fl_text_display td, int c);
extern "C" int fl_text_display_get_text_font(my_fl_text_display td);
extern "C" void fl_text_display_set_text_font(my_fl_text_display td, int f);
extern "C" int fl_text_display_get_text_size(my_fl_text_display td);
extern "C" void fl_text_display_set_text_size(my_fl_text_display td, int s);


#endif

