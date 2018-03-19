

#ifndef FL_INPUT_GUARD
#define FL_INPUT_GUARD




typedef void* INPUT;




extern "C" void input_set_draw_hook(INPUT n, void * d);
extern "C" void fl_input_draw(INPUT n);
extern "C" void input_set_handle_hook(INPUT i, void * h);
extern "C" int fl_input_handle(INPUT i, int e);




extern "C" INPUT new_fl_input(int x, int y, int w, int h, char* label);
extern "C" void free_fl_input(INPUT i);




extern "C" int fl_input_copy(INPUT i);
extern "C" int fl_input_cut(INPUT i);
extern "C" int fl_input_cut2(INPUT i, int b);
extern "C" int fl_input_cut3(INPUT i, int a, int b);
extern "C" int fl_input_copy_cuts(INPUT i);


extern "C" int fl_input_get_readonly(INPUT i);
extern "C" void fl_input_set_readonly(INPUT i, int t);


extern "C" const char * fl_input_get_value(INPUT i);
extern "C" void fl_input_set_value(INPUT i, char * s, int len);


extern "C" unsigned int fl_input_get_textcolor(INPUT i);
extern "C" void fl_input_set_textcolor(INPUT i, unsigned int t);
extern "C" int fl_input_get_textfont(INPUT i);
extern "C" void fl_input_set_textfont(INPUT i, int t);
extern "C" int fl_input_get_textsize(INPUT i);
extern "C" void fl_input_set_textsize(INPUT i, int t);


#endif

