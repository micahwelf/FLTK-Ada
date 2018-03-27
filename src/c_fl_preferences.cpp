

#include <FL/Fl_Preferences.H>
#include "c_fl_preferences.h"




PREFS new_fl_preferences(char * p, char * v, char * a) {
    Fl_Preferences *e = new Fl_Preferences(p,v,a);
    return e;
}

void free_fl_preferences(PREFS e) {
    delete reinterpret_cast<Fl_Preferences*>(e);
}




int fl_preferences_entries(PREFS e) {
    return reinterpret_cast<Fl_Preferences*>(e)->entries();
}

const char * fl_preferences_entry(PREFS e, int i) {
    return reinterpret_cast<Fl_Preferences*>(e)->entry(i);
}

int fl_preferences_entryexists(PREFS e, const char * k) {
    return reinterpret_cast<Fl_Preferences*>(e)->entryExists(k);
}

int fl_preferences_size(PREFS e, const char * k) {
    return reinterpret_cast<Fl_Preferences*>(e)->size(k);
}




int fl_preferences_get_int(PREFS e, const char * k, int& v, int d) {
    return reinterpret_cast<Fl_Preferences*>(e)->get(k,v,d);
}

int fl_preferences_get_float(PREFS e, const char * k, float& v, float d) {
    return reinterpret_cast<Fl_Preferences*>(e)->get(k,v,d);
}

int fl_preferences_get_double(PREFS e, const char * k, double& v, double d) {
    return reinterpret_cast<Fl_Preferences*>(e)->get(k,v,d);
}

int fl_preferences_get_str(PREFS e, const char * k, char *& v, const char * d) {
    return reinterpret_cast<Fl_Preferences*>(e)->get(k,v,d);
}




int fl_preferences_set_int(PREFS e, const char * k, int v) {
    return reinterpret_cast<Fl_Preferences*>(e)->set(k,v);
}

int fl_preferences_set_float(PREFS e, const char * k, float v) {
    return reinterpret_cast<Fl_Preferences*>(e)->set(k,v);
}

int fl_preferences_set_float_prec(PREFS e, const char * k, float v, int p) {
    return reinterpret_cast<Fl_Preferences*>(e)->set(k,v,p);
}

int fl_preferences_set_double(PREFS e, const char * k, double v) {
    return reinterpret_cast<Fl_Preferences*>(e)->set(k,v);
}

int fl_preferences_set_double_prec(PREFS e, const char * k, double v, int p) {
    return reinterpret_cast<Fl_Preferences*>(e)->set(k,v,p);
}

int fl_preferences_set_str(PREFS e, const char * k, const char * v) {
    return reinterpret_cast<Fl_Preferences*>(e)->set(k,v);
}




int fl_preferences_deleteentry(PREFS e, const char * k) {
    return reinterpret_cast<Fl_Preferences*>(e)->deleteEntry(k);
}

int fl_preferences_deleteallentries(PREFS e) {
    return reinterpret_cast<Fl_Preferences*>(e)->deleteAllEntries();
}

int fl_preferences_clear(PREFS e) {
    return reinterpret_cast<Fl_Preferences*>(e)->clear();
}




void fl_preferences_flush(PREFS e) {
    reinterpret_cast<Fl_Preferences*>(e)->flush();
}


