

#ifndef FL_VALUE_INPUT_GUARD
#define FL_VALUE_INPUT_GUARD




typedef void* VALUE_INPUT;




extern "C" void value_input_set_draw_hook(VALUE_INPUT a, void * d);
extern "C" void fl_value_input_draw(VALUE_INPUT a);
extern "C" void value_input_set_handle_hook(VALUE_INPUT a, void * h);
extern "C" int fl_value_input_handle(VALUE_INPUT a, int e);




extern "C" VALUE_INPUT new_fl_value_input(int x, int y, int w, int h, char* label);
extern "C" void free_fl_value_input(VALUE_INPUT a);




extern "C" void * fl_value_input_get_input(VALUE_INPUT v);


extern "C" unsigned int fl_value_input_get_cursor_color(VALUE_INPUT v);
extern "C" void fl_value_input_set_cursor_color(VALUE_INPUT v, unsigned int c);


extern "C" int fl_value_input_get_shortcut(VALUE_INPUT v);
extern "C" void fl_value_input_set_shortcut(VALUE_INPUT v, int k);


extern "C" int fl_value_input_is_soft(VALUE_INPUT a);
extern "C" void fl_value_input_set_soft(VALUE_INPUT a, int t);


extern "C" unsigned int fl_value_input_get_text_color(VALUE_INPUT v);
extern "C" void fl_value_input_set_text_color(VALUE_INPUT v, unsigned int c);
extern "C" int fl_value_input_get_text_font(VALUE_INPUT v);
extern "C" void fl_value_input_set_text_font(VALUE_INPUT v, int f);
extern "C" int fl_value_input_get_text_size(VALUE_INPUT v);
extern "C" void fl_value_input_set_text_size(VALUE_INPUT v, int s);


#endif

