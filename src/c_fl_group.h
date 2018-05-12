

#ifndef FL_GROUP_GUARD
#define FL_GROUP_GUARD

#include "c_fl_widget.h"




typedef void* GROUP;




extern "C" void group_set_draw_hook(GROUP g, void * d);
extern "C" void fl_group_draw(GROUP g);
extern "C" void group_set_handle_hook(GROUP g, void * h);
extern "C" int fl_group_handle(GROUP g, int e);




extern "C" GROUP new_fl_group(int x, int y, int w, int h, char* label);
extern "C" void free_fl_group(GROUP g);




extern "C" void fl_group_end(GROUP g);


extern "C" void fl_group_add(GROUP g, WIDGET item);
extern "C" void fl_group_insert(GROUP g, WIDGET item, int place);
extern "C" void fl_group_insert2(GROUP g, WIDGET item, WIDGET before);
extern "C" void fl_group_remove(GROUP g, WIDGET item);
extern "C" void fl_group_remove2(GROUP g, int place);


extern "C" void * fl_group_child(GROUP g, int place);
extern "C" int fl_group_find(GROUP g, WIDGET item);
extern "C" int fl_group_children(GROUP g);


//extern "C" unsigned int fl_group_get_clip_children(GROUP g);
//extern "C" void fl_group_set_clip_children(GROUP g, int c);


extern "C" void * fl_group_get_resizable(GROUP g);
extern "C" void fl_group_set_resizable(GROUP g, WIDGET item);
extern "C" void fl_group_init_sizes(GROUP g);


extern "C" void * fl_group_get_current();
extern "C" void fl_group_set_current(GROUP g);


#endif

