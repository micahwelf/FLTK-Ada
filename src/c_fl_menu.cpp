

#include <FL/Fl_Menu_.H>
#include <FL/Fl_Menu_Item.H>
#include "c_fl_menu.h"
#include "c_fl_type.h"




class My_Menu : public Fl_Menu_ {
    public:
        using Fl_Menu_::Fl_Menu_;
        friend void menu_set_draw_hook(MENU m, void * d);
        friend void menu_set_handle_hook(MENU m, void * h);
    protected:
        void draw();
        int handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Menu::draw() {
    (*draw_hook)(this->user_data());
}

int My_Menu::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

void menu_set_draw_hook(MENU m, void * d) {
    reinterpret_cast<My_Menu*>(m)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void menu_set_handle_hook(MENU m, void * h) {
    reinterpret_cast<My_Menu*>(m)->handle_hook = reinterpret_cast<h_hook_p>(h);
}




MENU new_fl_menu(int x, int y, int w, int h, char* label) {
    My_Menu *m = new My_Menu(x, y, w, h, label);
    return m;
}

void free_fl_menu(MENU m) {
    delete reinterpret_cast<My_Menu*>(m);
}




int fl_menu_add(MENU m, const char * t, unsigned long s, void * c, void * u, unsigned long f) {
    return reinterpret_cast<Fl_Menu_*>(m)->add(t,s,reinterpret_cast<Fl_Callback_p>(c),u,f);
}

int fl_menu_insert(MENU m, int p, const char * t, unsigned long s, void * c, void * u, unsigned long f) {
    return reinterpret_cast<Fl_Menu_*>(m)->insert(p,t,s,reinterpret_cast<Fl_Callback_p>(c),u,f);
}

void fl_menu_remove(MENU m, int p) {
    reinterpret_cast<Fl_Menu_*>(m)->remove(p);
}

void fl_menu_clear(MENU m) {
    reinterpret_cast<Fl_Menu_*>(m)->clear();
}




const void * fl_menu_get_item(MENU m, int i) {
    return &(reinterpret_cast<Fl_Menu_*>(m)->menu()[i]);
}

const void * fl_menu_find_item(MENU m, const char * t) {
    return reinterpret_cast<Fl_Menu_*>(m)->find_item(t);
}

const void * fl_menu_find_item2(MENU m, void * cb) {
    //  have to loop through the array manually since callbacks are stored in userdata
    for (int i=0; i<fl_menu_size(m); i++) {
        if (reinterpret_cast<Fl_Menu_*>(m)->menu()[i].user_data() == cb) {
            return fl_menu_get_item(m,i);
        }
    }
    return 0;
}

int fl_menu_find_index(MENU m, const char * t) {
    return reinterpret_cast<Fl_Menu_*>(m)->find_index(t);
}

int fl_menu_find_index2(MENU m, void * i) {
    return reinterpret_cast<Fl_Menu_*>(m)->find_index(reinterpret_cast<Fl_Menu_Item*>(i));
}

int fl_menu_find_index3(MENU m, void * cb) {
    //  have to loop through the array manually since callbacks are stored in userdata
    for (int i=0; i<fl_menu_size(m); i++) {
        if (reinterpret_cast<Fl_Menu_*>(m)->menu()[i].user_data() == cb) {
            return i;
        }
    }
    return -1;
}

int fl_menu_size(MENU m) {
    return reinterpret_cast<Fl_Menu_*>(m)->size();
}




const void * fl_menu_mvalue(MENU m) {
    return reinterpret_cast<Fl_Menu_*>(m)->mvalue();
}

const char * fl_menu_text(MENU m) {
    return reinterpret_cast<Fl_Menu_*>(m)->text();
}

int fl_menu_value(MENU m) {
    return reinterpret_cast<Fl_Menu_*>(m)->value();
}




unsigned int fl_menu_get_textcolor(MENU m) {
    return reinterpret_cast<Fl_Menu_*>(m)->textcolor();
}

void fl_menu_set_textcolor(MENU m, unsigned int c) {
    reinterpret_cast<Fl_Menu_*>(m)->textcolor(c);
}

int fl_menu_get_textfont(MENU m) {
    return reinterpret_cast<Fl_Menu_*>(m)->textfont();
}

void fl_menu_set_textfont(MENU m, int f) {
    reinterpret_cast<Fl_Menu_*>(m)->textfont(f);
}

int fl_menu_get_textsize(MENU m) {
    return reinterpret_cast<Fl_Menu_*>(m)->textsize();
}

void fl_menu_set_textsize(MENU m, int s) {
    reinterpret_cast<Fl_Menu_*>(m)->textsize(s);
}




int fl_menu_get_down_box(MENU m) {
    return reinterpret_cast<Fl_Menu_*>(m)->down_box();
}

void fl_menu_set_down_box(MENU m, int t) {
    reinterpret_cast<Fl_Menu_*>(m)->down_box(static_cast<Fl_Boxtype>(t));
}

void fl_menu_global(MENU m) {
    reinterpret_cast<Fl_Menu_*>(m)->global();
}

int fl_menu_measure(MENU m, int i, int *h) {
    //  method actually belongs to Fl_Menu_Item
    const Fl_Menu_Item * item = reinterpret_cast<const Fl_Menu_Item*>(fl_menu_get_item(m,i));
    return item->measure(h,reinterpret_cast<Fl_Menu_*>(m));
}




const void * fl_menu_popup(MENU m, int x, int y, const char * t, int n) {
    //  method actually belongs to Fl_Menu_Item
    const Fl_Menu_Item * dummy = reinterpret_cast<const Fl_Menu_Item*>(fl_menu_get_item(m,0));
    const Fl_Menu_Item * item;
    if (n >= 0) {
        item = reinterpret_cast<const Fl_Menu_Item*>(fl_menu_get_item(m,n));
    } else {
        item = 0;
    }
    return dummy->popup(x,y,t,item,reinterpret_cast<Fl_Menu_*>(m));
}

const void * fl_menu_pulldown(MENU m, int x, int y, int w, int h, int n) {
    //  method actually belongs to Fl_Menu_Item
    const Fl_Menu_Item * dummy = reinterpret_cast<const Fl_Menu_Item*>(fl_menu_get_item(m,0));
    const Fl_Menu_Item * item;
    if (n >= 0) {
        item = reinterpret_cast<const Fl_Menu_Item*>(fl_menu_get_item(m,n));
    } else {
        item = 0;
    }
    return dummy->pulldown(x,y,w,h,item,reinterpret_cast<Fl_Menu_*>(m));
}




void fl_menu_draw_item(MENU m, int i, int x, int y, int w, int h, int s) {
    //  method actually belongs to Fl_Menu_Item
    const Fl_Menu_Item * item = reinterpret_cast<const Fl_Menu_Item*>(fl_menu_get_item(m,i));
    item->draw(x,y,w,h,reinterpret_cast<Fl_Menu_*>(m),s);
}


