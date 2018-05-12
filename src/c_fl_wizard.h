

#ifndef FL_WIZARD_GUARD
#define FL_WIZARD_GUARD




typedef void* WIZARD;




extern "C" void wizard_set_draw_hook(WIZARD w, void * d);
extern "C" void fl_wizard_draw(WIZARD w);
extern "C" void wizard_set_handle_hook(WIZARD w, void * h);
extern "C" int fl_wizard_handle(WIZARD w, int e);




extern "C" WIZARD new_fl_wizard(int x, int y, int w, int h, char* label);
extern "C" void free_fl_wizard(WIZARD w);




extern "C" void fl_wizard_next(WIZARD w);
extern "C" void fl_wizard_prev(WIZARD w);


extern "C" void * fl_wizard_get_visible(WIZARD w);
extern "C" void fl_wizard_set_visible(WIZARD w, void * i);


#endif

