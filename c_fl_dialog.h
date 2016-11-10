

#ifndef FL_DIALOG_GUARD
#define FL_DIALOG_GUARD


extern "C" void dialog_fl_alert(const char * m);
extern "C" int dialog_fl_choice(const char * m, const char * a, const char * b, const char * c);
extern "C" char * dialog_fl_file_chooser(const char * m, const char * p, const char * d, int r);
extern "C" const char * dialog_fl_input(const char * m, const char * d);
extern "C" void dialog_fl_message(const char * m);


#endif

