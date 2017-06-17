

#ifndef FL_MENUITEM_GUARD
#define FL_MENUITEM_GUARD




typedef void* MENUITEM;




extern "C" int fl_menuitem_value(MENUITEM mi);


extern "C" void fl_menuitem_activate(MENUITEM mi);
extern "C" void fl_menuitem_deactivate(MENUITEM mi);


#endif

