

#include <FL/Fl_Device.H>
#include "c_fl_surface.h"




class My_Surface_Device : public Fl_Surface_Device {
    public:
        using Fl_Surface_Device::Fl_Surface_Device;
        friend SURFACE new_fl_surface(void * g);
};




SURFACE new_fl_surface(void * g) {
    My_Surface_Device *s = new My_Surface_Device(reinterpret_cast<Fl_Graphics_Driver*>(g));
    return s;
}

void free_fl_surface(SURFACE s) {
    delete reinterpret_cast<My_Surface_Device*>(s);
}




void fl_surface_set_current(SURFACE s) {
    reinterpret_cast<Fl_Surface_Device*>(s)->set_current();
}

SURFACE fl_surface_get_surface(void) {
    return Fl_Surface_Device::surface();
}


