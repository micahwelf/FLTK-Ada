

#ifndef FL_MENU_BUTTON_GUARD
#define FL_MENU_BUTTON_GUARD


typedef void* MENUBUTTON;


extern "C" MENUBUTTON new_fl_menu_button(int x, int y, int w, int h, char* label);
extern "C" void free_fl_menu_button(MENUBUTTON m);


extern "C" void fl_menu_button_type(MENUBUTTON m, unsigned int t);


#endif

