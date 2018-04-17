

#ifndef FL_DIALOG_GUARD
#define FL_DIALOG_GUARD


extern "C" inline void dialog_fl_alert(const char * m);
//extern "C" inline int dialog_fl_ask(const char * m);
extern "C" inline void dialog_fl_beep(int b);
extern "C" inline int dialog_fl_choice(const char * m, const char * a, const char * b, const char * c);
extern "C" inline const char * dialog_fl_input(const char * m, const char * d);
extern "C" inline void dialog_fl_message(const char * m);
extern "C" inline const char * dialog_fl_password(const char * m, const char * d);


extern "C" inline int dialog_fl_color_chooser(const char * n, double & r, double & g, double & b, int m);
extern "C" inline int dialog_fl_color_chooser2(const char * n, uchar & r, uchar & g, uchar & b, int m);
extern "C" inline char * dialog_fl_dir_chooser(const char * m, const char * d, int r);
extern "C" inline char * dialog_fl_file_chooser(const char * m, const char * p, const char * d, int r);


extern "C" inline int dialog_fl_get_message_hotspot(void);
extern "C" inline void dialog_fl_set_message_hotspot(int v);
extern "C" inline void dialog_fl_message_font(int f, int s);
extern "C" inline void * dialog_fl_message_icon(void);
extern "C" inline void dialog_fl_message_title(const char * t);
extern "C" inline void dialog_fl_message_title_default(const char * t);


#endif

