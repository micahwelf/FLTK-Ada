

#include <FL/Fl.H>
#include "c_fl_event.h"


int fl_event_key() {
    return Fl::event_key();
}




int fl_event_x() {
    return Fl::event_x();
}

int fl_event_x_root() {
    return Fl::event_x_root();
}

int fl_event_y() {
    return Fl::event_y();
}

int fl_event_y_root() {
    return Fl::event_y_root();
}

int fl_event_is_click() {
    return Fl::event_is_click();
}

