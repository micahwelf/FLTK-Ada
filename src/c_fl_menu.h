

#ifndef FL_MENU_GUARD
#define FL_MENU_GUARD




typedef void* MENU;




extern "C" void menu_set_draw_hook(MENU m, void * d);
extern "C" void menu_set_handle_hook(MENU m, void * h);




extern "C" MENU new_fl_menu(int x, int y, int w, int h, char* label);
extern "C" void free_fl_menu(MENU m);




extern "C" int fl_menu_add(MENU m, const char * t, unsigned long s, void * c, void * u, unsigned long f);
extern "C" int fl_menu_insert(MENU m, int p, const char * t, unsigned long s, void * c, void * u, unsigned long f);
extern "C" void fl_menu_remove(MENU m, int p);
extern "C" void fl_menu_clear(MENU m);


extern "C" const void * fl_menu_get_item(MENU m, int i);
extern "C" const void * fl_menu_find_item(MENU m, const char * t);
extern "C" const void * fl_menu_find_item2(MENU m, void * cb);
extern "C" int fl_menu_find_index(MENU m, const char * t);
extern "C" int fl_menu_find_index2(MENU m, void * i);
extern "C" int fl_menu_find_index3(MENU m, void * cb);
extern "C" int fl_menu_size(MENU m);


extern "C" const void * fl_menu_mvalue(MENU m);
extern "C" const char * fl_menu_text(MENU m);
extern "C" int fl_menu_value(MENU m);
extern "C" int fl_menu_set_value(MENU m, int p);
extern "C" int fl_menu_set_value2(MENU m, void * i);


extern "C" unsigned int fl_menu_get_textcolor(MENU m);
extern "C" void fl_menu_set_textcolor(MENU m, unsigned int c);
extern "C" int fl_menu_get_textfont(MENU m);
extern "C" void fl_menu_set_textfont(MENU m, int f);
extern "C" int fl_menu_get_textsize(MENU m);
extern "C" void fl_menu_set_textsize(MENU m, int s);


extern "C" int fl_menu_get_down_box(MENU m);
extern "C" void fl_menu_set_down_box(MENU m, int t);
extern "C" void fl_menu_global(MENU m);
extern "C" int fl_menu_measure(MENU m, int i, int *h);


extern "C" const void * fl_menu_popup(MENU m, int x, int y, const char * t, int n);
extern "C" const void * fl_menu_pulldown(MENU m, int x, int y, int w, int h, int n);


extern "C" void fl_menu_draw_item(MENU m, int i, int x, int y, int w, int h, int s);


#endif

