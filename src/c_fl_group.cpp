

#include <FL/Fl_Group.H>
#include <FL/Fl_Widget.H>
#include "c_fl_group.h"
#include "c_fl_widget.h"




typedef void (d_hook)(void*);
typedef d_hook* d_hook_p;


typedef int (h_hook)(void*,int);
typedef h_hook* h_hook_p;




class My_Group : public Fl_Group {
    public:
        using Fl_Group::Fl_Group;
        friend void group_set_draw_hook(GROUP g, void * d);
        friend void fl_group_draw(GROUP g);
        friend void group_set_handle_hook(GROUP g, void * h);
        friend int fl_group_handle(GROUP g, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};


void My_Group::draw() {
    (*draw_hook)(this->user_data());
}


void My_Group::real_draw() {
    Fl_Group::draw();
}


int My_Group::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}


int My_Group::real_handle(int e) {
    return Fl_Group::handle(e);
}


void group_set_draw_hook(GROUP g, void * d) {
    reinterpret_cast<My_Group*>(g)->draw_hook = reinterpret_cast<d_hook_p>(d);
}


void fl_group_draw(GROUP g) {
    reinterpret_cast<My_Group*>(g)->real_draw();
}


void group_set_handle_hook(GROUP g, void * h) {
    reinterpret_cast<My_Group*>(g)->handle_hook = reinterpret_cast<h_hook_p>(h);
}


int fl_group_handle(GROUP g, int e) {
    return reinterpret_cast<My_Group*>(g)->real_handle(e);
}




GROUP new_fl_group(int x, int y, int w, int h, char* label) {
    My_Group *g = new My_Group(x, y, w, h, label);
    return g;
}


void free_fl_group(GROUP g) {
    delete reinterpret_cast<My_Group*>(g);
}




void fl_group_end(GROUP g) {
    reinterpret_cast<Fl_Group*>(g)->end();
}




void fl_group_add(GROUP g, WIDGET item) {
    reinterpret_cast<Fl_Group*>(g)->add(reinterpret_cast<Fl_Widget*>(item));
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


void fl_group_resizable(GROUP g, WIDGET item) {
    reinterpret_cast<Fl_Group*>(g)->resizable(reinterpret_cast<Fl_Widget*>(item));
}




int fl_group_children(GROUP g) {
    return reinterpret_cast<Fl_Group*>(g)->children();
}


void * fl_group_child(GROUP g, int place) {
    return reinterpret_cast<Fl_Group*>(g)->child(place);
}

