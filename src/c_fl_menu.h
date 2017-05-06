

#ifndef FL_MENU_GUARD
#define FL_MENU_GUARD


typedef void* MENU;
//  typedef void* MENUITEM;


extern "C" void menu_set_draw_hook(MENU m, void * d);


extern "C" MENU new_fl_menu(int x, int y, int w, int h, char* label);
extern "C" void free_fl_menu(MENU m);


extern "C" int fl_menu_add(MENU m, const char * t, unsigned long s, void * c, void * u, unsigned long f);
extern "C" const void * fl_menu_find_item(MENU m, const char * t);
extern "C" const void * fl_menu_mvalue(MENU m);


extern "C" int fl_menuitem_value(void * mi);
extern "C" void fl_menuitem_activate(void * mi);
extern "C" void fl_menuitem_deactivate(void * mi);


#endif

