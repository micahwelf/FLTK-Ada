

#ifndef FL_SPINNER_GUARD
#define FL_SPINNER_GUARD




typedef void* SPINNER;




extern "C" void spinner_set_draw_hook(SPINNER n, void * d);
extern "C" void fl_spinner_draw(SPINNER n);
extern "C" void spinner_set_handle_hook(SPINNER n, void * h);
extern "C" int fl_spinner_handle(SPINNER n, int e);




extern "C" SPINNER new_fl_spinner(int x, int y, int w, int h, char* label);
extern "C" void free_fl_spinner(SPINNER n);




extern "C" unsigned int fl_spinner_get_color(SPINNER n);
extern "C" void fl_spinner_set_color(SPINNER n, unsigned int t);
extern "C" unsigned int fl_spinner_get_selection_color(SPINNER n);
extern "C" void fl_spinner_set_selection_color(SPINNER n, unsigned int t);
extern "C" unsigned int fl_spinner_get_textcolor(SPINNER n);
extern "C" void fl_spinner_set_textcolor(SPINNER n, unsigned int t);
extern "C" int fl_spinner_get_textfont(SPINNER n);
extern "C" void fl_spinner_set_textfont(SPINNER n, int t);
extern "C" int fl_spinner_get_textsize(SPINNER n);
extern "C" void fl_spinner_set_textsize(SPINNER n, int t);


extern "C" double fl_spinner_get_minimum(SPINNER n);
extern "C" void fl_spinner_set_minimum(SPINNER n, double t);
extern "C" double fl_spinner_get_maximum(SPINNER n);
extern "C" void fl_spinner_set_maximum(SPINNER n, double t);
extern "C" void fl_spinner_range(SPINNER n, double a, double b);
extern "C" double fl_spinner_get_step(SPINNER n);
extern "C" void fl_spinner_set_step(SPINNER n, double t);
extern "C" int fl_spinner_get_type(SPINNER n);
extern "C" void fl_spinner_set_type(SPINNER n, int t);
extern "C" double fl_spinner_get_value(SPINNER n);
extern "C" void fl_spinner_set_value(SPINNER n, double t);


#endif

