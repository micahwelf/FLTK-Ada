

#ifndef FL_CHOICE_GUARD
#define FL_CHOICE_GUARD




typedef void* CHOICE;




extern "C" void choice_set_draw_hook(CHOICE n, void * d);
extern "C" void fl_choice_draw(CHOICE n);
extern "C" void choice_set_handle_hook(CHOICE n, void * h);
extern "C" int fl_choice_handle(CHOICE n, int e);




extern "C" CHOICE new_fl_choice(int x, int y, int w, int h, char * label);
extern "C" void free_fl_choice(CHOICE b);




extern "C" int fl_choice_value(CHOICE c);
extern "C" int fl_choice_set_value(CHOICE c, int p);
extern "C" int fl_choice_set_value2(CHOICE c, void * i);


#endif

