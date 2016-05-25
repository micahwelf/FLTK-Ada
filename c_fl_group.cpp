

#include <FL/Fl_Group.H>
#include <FL/Fl_Widget.H>
#include "c_fl_group.h"
#include "c_fl_widget.h"


GROUP new_fl_group(int x, int y, int w, int h, char* label) {
    Fl_Group *g = new Fl_Group(x, y, w, h, label);
    return g;
}


void free_fl_group(GROUP g) {
    delete reinterpret_cast<Fl_Group*>(g);
}


void fl_group_end(GROUP g) {
    reinterpret_cast<Fl_Group*>(g)->end();
}


void fl_group_add(GROUP g, WIDGET item) {
    reinterpret_cast<Fl_Group*>(g)->add(reinterpret_cast<Fl_Widget*>(item));
}


void fl_group_clear(GROUP g) {
    reinterpret_cast<Fl_Group*>(g)->clear();
}


int fl_group_find(GROUP g, WIDGET item) {
    return reinterpret_cast<Fl_Group*>(g)->find(reinterpret_cast<Fl_Widget*>(item));
}


void fl_group_insert(GROUP g, WIDGET item, int place) {
    reinterpret_cast<Fl_Group*>(g)->insert(*(reinterpret_cast<Fl_Widget*>(item)), place);
}


void fl_group_remove(GROUP g, WIDGET item) {
    reinterpret_cast<Fl_Group*>(g)->remove(reinterpret_cast<Fl_Widget*>(item));
}


void fl_group_remove2(GROUP g, int place) {
    reinterpret_cast<Fl_Group*>(g)->remove(place);
}

