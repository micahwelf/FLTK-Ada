

#ifndef FL_POPUP_GUARD
#define FL_POPUP_GUARD


extern "C" void popup_fl_alert(const char * m);
extern "C" int popup_fl_choice(const char * m, const char * a, const char * b, const char * c);
extern "C" char * popup_fl_file_chooser(const char * m, const char * p, const char * d, int r);
extern "C" const char * popup_fl_input(const char * m, const char * d);
extern "C" void popup_fl_message(const char * m);


#endif

