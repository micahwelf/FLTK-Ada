

#ifndef FL_MENU_BUTTON_GUARD
#define FL_MENU_BUTTON_GUARD




typedef void* MENUBUTTON;




extern "C" inline void menu_button_set_draw_hook(MENUBUTTON m, void * d);
extern "C" inline void fl_menu_button_draw(MENUBUTTON m);
extern "C" inline void menu_button_set_handle_hook(MENUBUTTON m, void * h);
extern "C" inline int fl_menu_button_handle(MENUBUTTON m, int e);




extern "C" inline MENUBUTTON new_fl_menu_button(int x, int y, int w, int h, char* label);
extern "C" inline void free_fl_menu_button(MENUBUTTON m);




extern "C" inline void fl_menu_button_type(MENUBUTTON m, unsigned int t);
extern "C" inline const void * fl_menu_button_popup(MENUBUTTON m);


#endif

