

#ifndef FL_COLOR_CHOOSER_GUARD
#define FL_COLOR_CHOOSER_GUARD




typedef void* COLOR_CHOOSER;




extern "C" void color_chooser_set_draw_hook(COLOR_CHOOSER n, void * d);
extern "C" void fl_color_chooser_draw(COLOR_CHOOSER n);
extern "C" void color_chooser_set_handle_hook(COLOR_CHOOSER n, void * h);
extern "C" int fl_color_chooser_handle(COLOR_CHOOSER n, int e);




extern "C" COLOR_CHOOSER new_fl_color_chooser(int x, int y, int w, int h, char* label);
extern "C" void free_fl_color_chooser(COLOR_CHOOSER n);




extern "C" double fl_color_chooser_r(COLOR_CHOOSER n);
extern "C" double fl_color_chooser_g(COLOR_CHOOSER n);
extern "C" double fl_color_chooser_b(COLOR_CHOOSER n);
extern "C" int fl_color_chooser_rgb(COLOR_CHOOSER n, int r, int g, int b);


extern "C" double fl_color_chooser_hue(COLOR_CHOOSER n);
extern "C" double fl_color_chooser_saturation(COLOR_CHOOSER n);
extern "C" double fl_color_chooser_value(COLOR_CHOOSER n);
extern "C" int fl_color_chooser_hsv(COLOR_CHOOSER n, int h, int s, int v);


extern "C" void fl_color_chooser_hsv2rgb(double h, double s, double v, double &r, double &g, double &b);
extern "C" void fl_color_chooser_rgb2hsv(double r, double g, double b, double &h, double &s, double &v);


extern "C" int fl_color_chooser_get_mode(COLOR_CHOOSER n);
extern "C" void fl_color_chooser_set_mode(COLOR_CHOOSER n, int m);


#endif

