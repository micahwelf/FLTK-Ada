

#ifndef FL_MENU_BAR_GUARD
#define FL_MENU_BAR_GUARD


typedef void* MENUBAR;


extern "C" MENUBAR new_fl_menu_bar(int x, int y, int w, int h, char* label);
extern "C" void free_fl_menu_bar(MENUBAR m);


#endif

