

#ifndef FL_INPUT_CHOICE_GUARD
#define FL_INPUT_CHOICE_GUARD




typedef void* INPUT_CHOICE;




extern "C" void input_choice_set_draw_hook(INPUT_CHOICE n, void * d);
extern "C" void fl_input_choice_draw(INPUT_CHOICE n);
extern "C" void input_choice_set_handle_hook(INPUT_CHOICE n, void * h);
extern "C" int fl_input_choice_handle(INPUT_CHOICE n, int e);




extern "C" INPUT_CHOICE new_fl_input_choice(int x, int y, int w, int h, char* label);
extern "C" void free_fl_input_choice(INPUT_CHOICE n);




extern "C" void * fl_input_choice_input(INPUT_CHOICE n);
extern "C" void * fl_input_choice_menubutton(INPUT_CHOICE n);


extern "C" int fl_input_choice_changed(INPUT_CHOICE n);
extern "C" void fl_input_choice_clear_changed(INPUT_CHOICE n);
extern "C" int fl_input_choice_get_down_box(INPUT_CHOICE n);
extern "C" void fl_input_choice_set_down_box(INPUT_CHOICE n, int t);
extern "C" unsigned int fl_input_choice_get_textcolor(INPUT_CHOICE n);
extern "C" void fl_input_choice_set_textcolor(INPUT_CHOICE n, unsigned int t);
extern "C" int fl_input_choice_get_textfont(INPUT_CHOICE n);
extern "C" void fl_input_choice_set_textfont(INPUT_CHOICE n, int t);
extern "C" int fl_input_choice_get_textsize(INPUT_CHOICE n);
extern "C" void fl_input_choice_set_textsize(INPUT_CHOICE n, int t);
extern "C" const char * fl_input_choice_get_value(INPUT_CHOICE n);
extern "C" void fl_input_choice_set_value(INPUT_CHOICE n, const char * t);
extern "C" void fl_input_choice_set_value2(INPUT_CHOICE n, int t);


#endif

