

#ifndef FL_MENU_GUARD
#define FL_MENU_GUARD


typedef void* MENU;
//  typedef void* MENUITEM;


extern "C" int fl_menu_add(MENU m, const char * t, unsigned long s, void * c, void * u, unsigned long f);
extern "C" const void * fl_menu_mvalue(MENU m);


extern "C" int fl_menuitem_value(void * mi);


#endif

