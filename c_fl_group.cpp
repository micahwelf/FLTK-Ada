

#include <FL/Fl_Group.H>
#include <FL/Fl_Widget.H>
#include "c_fl_group.h"


my_fl_group new_fl_group(int x, int y, int w, int h, char * label) {
    Fl_Group *group = new Fl_Group(x, y, w, h, label);
    return group;
}


void free_fl_group(my_fl_group f) {
    delete reinterpret_cast<Fl_Group*>(f);
}


void fl_group_end(my_fl_group f) {
    reinterpret_cast<Fl_Group*>(f)->end();
}


void fl_group_add(my_fl_group f, void * item) {
    reinterpret_cast<Fl_Group*>(f)->add(reinterpret_cast<Fl_Widget*>(item));
}


void fl_group_clear(my_fl_group f) {
    reinterpret_cast<Fl_Group*>(f)->clear();
}


int fl_group_find(my_fl_group f, void * item) {
    return reinterpret_cast<Fl_Group*>(f)->find(reinterpret_cast<Fl_Widget*>(item));
}


void fl_group_insert(my_fl_group f, void * item, int place) {
    reinterpret_cast<Fl_Group*>(f)->insert(*(reinterpret_cast<Fl_Widget*>(item)), place);
}


void fl_group_remove(my_fl_group f, void * item) {
    reinterpret_cast<Fl_Group*>(f)->remove(reinterpret_cast<Fl_Widget*>(item));
}


void fl_group_remove2(my_fl_group f, int place) {
    reinterpret_cast<Fl_Group*>(f)->remove(place);
}

