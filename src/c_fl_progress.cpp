

#include <FL/Fl_Progress.H>
#include "c_fl_progress.h"
#include "c_fl_type.h"




class My_Progress : public Fl_Progress {
    public:
        using Fl_Progress::Fl_Progress;
        friend void progress_set_draw_hook(PROGRESS p, void * d);
        friend void fl_progress_draw(PROGRESS p);
        friend void progress_set_handle_hook(PROGRESS p, void * h);
        friend int fl_progress_handle(PROGRESS p, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Progress::draw() {
    (*draw_hook)(this->user_data());
}

void My_Progress::real_draw() {
    Fl_Progress::draw();
}

int My_Progress::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Progress::real_handle(int e) {
    return Fl_Progress::handle(e);
}

void progress_set_draw_hook(PROGRESS p, void * d) {
    reinterpret_cast<My_Progress*>(p)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_progress_draw(PROGRESS p) {
    reinterpret_cast<My_Progress*>(p)->real_draw();
}

void progress_set_handle_hook(PROGRESS p, void * h) {
    reinterpret_cast<My_Progress*>(p)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_progress_handle(PROGRESS p, int e) {
    return reinterpret_cast<My_Progress*>(p)->real_handle(e);
}




PROGRESS new_fl_progress(int x, int y, int w, int h, char* label) {
    My_Progress *p = new My_Progress(x, y, w, h, label);
    return p;
}

void free_fl_progress(PROGRESS p) {
    delete reinterpret_cast<My_Progress*>(p);
}




float fl_progress_get_minimum(PROGRESS p) {
    return reinterpret_cast<Fl_Progress*>(p)->minimum();
}

void fl_progress_set_minimum(PROGRESS p, float t) {
    reinterpret_cast<Fl_Progress*>(p)->minimum(t);
}

float fl_progress_get_maximum(PROGRESS p) {
    return reinterpret_cast<Fl_Progress*>(p)->maximum();
}

void fl_progress_set_maximum(PROGRESS p, float t) {
    reinterpret_cast<Fl_Progress*>(p)->maximum(t);
}

float fl_progress_get_value(PROGRESS p) {
    return reinterpret_cast<Fl_Progress*>(p)->value();
}

void fl_progress_set_value(PROGRESS p, float t) {
    reinterpret_cast<Fl_Progress*>(p)->value(t);
}

