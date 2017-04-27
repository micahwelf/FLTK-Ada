

#ifndef FL_GROUP_GUARD
#define FL_GROUP_GUARD

#include "c_fl_widget.h"


typedef void* GROUP;


extern "C" GROUP new_fl_group(int x, int y, int w, int h, char* label);
extern "C" void free_fl_group(GROUP g);

extern "C" void fl_group_end(GROUP g);

extern "C" void fl_group_add(GROUP g, WIDGET item);
extern "C" int fl_group_find(GROUP g, WIDGET item);
extern "C" void fl_group_insert(GROUP g, WIDGET item, int place);
extern "C" void fl_group_remove(GROUP g, WIDGET item);
extern "C" void fl_group_remove2(GROUP g, int place);
extern "C" void fl_group_resizable(GROUP g, WIDGET item);

extern "C" int fl_group_children(GROUP g);
extern "C" void * fl_group_child(GROUP g, int place);


#endif

