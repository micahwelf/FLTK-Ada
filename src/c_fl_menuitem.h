

#ifndef FL_MENU_ITEM_GUARD
#define FL_MENU_ITEM_GUARD




typedef void* MENU_ITEM;




extern "C" inline void * new_fl_menu_item(char * t, void * c, unsigned long s, unsigned long f);
extern "C" inline void free_fl_menu_item(MENU_ITEM mi);




extern "C" inline void * fl_menu_item_get_user_data(MENU_ITEM mi);
extern "C" inline void fl_menu_item_set_user_data(MENU_ITEM mi, void * c);
extern "C" inline void fl_menu_item_do_callback(MENU_ITEM mi, void * w);


extern "C" inline int fl_menu_item_checkbox(MENU_ITEM mi);
extern "C" inline int fl_menu_item_radio(MENU_ITEM mi);
extern "C" inline int fl_menu_item_value(MENU_ITEM mi);
extern "C" inline void fl_menu_item_set(MENU_ITEM mi);
extern "C" inline void fl_menu_item_clear(MENU_ITEM mi);
extern "C" inline void fl_menu_item_setonly(MENU_ITEM mi);


extern "C" inline const char * fl_menu_item_get_label(MENU_ITEM mi);
extern "C" inline void fl_menu_item_set_label(MENU_ITEM mi, const char *t);
extern "C" inline unsigned int fl_menu_item_get_labelcolor(MENU_ITEM mi);
extern "C" inline void fl_menu_item_set_labelcolor(MENU_ITEM mi, unsigned int c);
extern "C" inline int fl_menu_item_get_labelfont(MENU_ITEM mi);
extern "C" inline void fl_menu_item_set_labelfont(MENU_ITEM mi, int f);
extern "C" inline int fl_menu_item_get_labelsize(MENU_ITEM mi);
extern "C" inline void fl_menu_item_set_labelsize(MENU_ITEM mi, int s);
extern "C" inline int fl_menu_item_get_labeltype(MENU_ITEM mi);
extern "C" inline void fl_menu_item_set_labeltype(MENU_ITEM mi, int t);


extern "C" inline int fl_menu_item_get_shortcut(MENU_ITEM mi);
extern "C" inline void fl_menu_item_set_shortcut(MENU_ITEM mi, int s);


extern "C" inline void fl_menu_item_activate(MENU_ITEM mi);
extern "C" inline void fl_menu_item_deactivate(MENU_ITEM mi);
extern "C" inline void fl_menu_item_show(MENU_ITEM mi);
extern "C" inline void fl_menu_item_hide(MENU_ITEM mi);
extern "C" inline int fl_menu_item_active(MENU_ITEM mi);
extern "C" inline int fl_menu_item_visible(MENU_ITEM mi);
extern "C" inline int fl_menu_item_activevisible(MENU_ITEM mi);


#endif

