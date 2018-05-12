

#ifndef FL_TABS_GUARD
#define FL_TABS_GUARD




typedef void* TABS;




extern "C" void tabs_set_draw_hook(TABS t, void * d);
extern "C" void fl_tabs_draw(TABS t);
extern "C" void tabs_set_handle_hook(TABS t, void * h);
extern "C" int fl_tabs_handle(TABS t, int e);




extern "C" TABS new_fl_tabs(int x, int y, int w, int h, char* label);
extern "C" void free_fl_tabs(TABS t);




extern "C" void fl_tabs_client_area(TABS t, int * x, int * y, int * w, int * h, int i);


extern "C" void * fl_tabs_get_push(TABS t);
extern "C" void fl_tabs_set_push(TABS t, void * w);
extern "C" void * fl_tabs_get_value(TABS t);
extern "C" void fl_tabs_set_value(TABS t, void * w);
extern "C" void * fl_tabs_which(TABS t, int x, int y);


#endif

