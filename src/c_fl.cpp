

#include <FL/Fl.H>
#include "c_fl.h"




int fl_abi_check(int v) {
    return Fl::abi_check(v);
}

int fl_abi_version() {
    return Fl::abi_version();
}

int fl_api_version() {
    return Fl::api_version();
}

double fl_version() {
    return Fl::version();
}




void fl_awake() {
    Fl::awake();
}

void fl_lock() {
    Fl::lock();
}

void fl_unlock() {
    Fl::unlock();
}




int fl_get_damage() {
    return Fl::damage();
}

void fl_set_damage(int v) {
    Fl::damage(v);
}

void fl_flush() {
    Fl::flush();
}

void fl_redraw() {
    Fl::redraw();
}




int fl_check() {
    return Fl::check();
}

int fl_ready() {
    return Fl::ready();
}

int fl_wait() {
    return Fl::wait();
}

int fl_wait2(double s) {
    return Fl::wait(s);
}

int fl_run() {
    return Fl::run();
}


