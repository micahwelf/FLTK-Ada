

#ifndef FL_VALUE_OUTPUT_GUARD
#define FL_VALUE_OUTPUT_GUARD




typedef void* VALUE_OUTPUT;




extern "C" void value_output_set_draw_hook(VALUE_OUTPUT a, void * d);
extern "C" void fl_value_output_draw(VALUE_OUTPUT a);
extern "C" void value_output_set_handle_hook(VALUE_OUTPUT a, void * h);
extern "C" int fl_value_output_handle(VALUE_OUTPUT a, int e);




extern "C" VALUE_OUTPUT new_fl_value_output(int x, int y, int w, int h, char* label);
extern "C" void free_fl_value_output(VALUE_OUTPUT a);




extern "C" int fl_value_output_is_soft(VALUE_OUTPUT a);
extern "C" void fl_value_output_set_soft(VALUE_OUTPUT a, int t);


extern "C" unsigned int fl_value_output_get_text_color(VALUE_OUTPUT v);
extern "C" void fl_value_output_set_text_color(VALUE_OUTPUT v, unsigned int c);
extern "C" int fl_value_output_get_text_font(VALUE_OUTPUT v);
extern "C" void fl_value_output_set_text_font(VALUE_OUTPUT v, int f);
extern "C" int fl_value_output_get_text_size(VALUE_OUTPUT v);
extern "C" void fl_value_output_set_text_size(VALUE_OUTPUT v, int s);


#endif

