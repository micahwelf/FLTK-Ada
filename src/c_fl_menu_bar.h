

#ifndef FL_MENU_BAR_GUARD
#define FL_MENU_BAR_GUARD


typedef void* MENUBAR;


extern "C" void menu_bar_set_draw_hook(MENUBAR m, void * d);
extern "C" void fl_menu_bar_draw(MENUBAR m);

extern "C" MENUBAR new_fl_menu_bar(int x, int y, int w, int h, char* label);
extern "C" void free_fl_menu_bar(MENUBAR m);


#endif

