

#ifndef FL_GROUP_GUARD
#define FL_GROUP_GUARD


typedef void* my_fl_group;


extern "C" my_fl_group new_fl_group(int x, int y, int w, int h, char * label);
extern "C" void free_fl_group(my_fl_group f);

extern "C" void fl_group_end(my_fl_group f);

extern "C" void fl_group_add(my_fl_group f, void * item);
extern "C" void fl_group_clear(my_fl_group f);
extern "C" int fl_group_find(my_fl_group f, void * item);
extern "C" void fl_group_insert(my_fl_group f, void * item, int place);
extern "C" void fl_group_remove(my_fl_group f, void * item);
extern "C" void fl_group_remove2(my_fl_group f, int place);


#endif

