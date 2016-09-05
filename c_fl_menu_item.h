

#ifndef FL_MENU_ITEM_GUARD
#define FL_MENU_ITEM_GUARD


typedef void* MENUITEM;


extern "C" MENUITEM new_fl_menu_item(char* label, void* c, unsigned long k, unsigned short f);
extern "C" void free_fl_menu_item(MENUITEM m);


#endif

