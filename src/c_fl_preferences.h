

#ifndef FL_PREFERENCES_GUARD
#define FL_PREFERENCES_GUARD




typedef void* PREFS;




extern "C" inline PREFS new_fl_preferences(char * p, char * v, char * a);
extern "C" inline void free_fl_preferences(PREFS e);




extern "C" inline int fl_preferences_entries(PREFS e);
extern "C" inline const char * fl_preferences_entry(PREFS e, int i);
extern "C" inline int fl_preferences_entryexists(PREFS e, const char * k);
extern "C" inline int fl_preferences_size(PREFS e, const char * k);


extern "C" inline int fl_preferences_get_int(PREFS e, const char * k, int& v, int d);
extern "C" inline int fl_preferences_get_float(PREFS e, const char * k, float& v, float d);
extern "C" inline int fl_preferences_get_double(PREFS e, const char * k, double& v, double d);
extern "C" inline int fl_preferences_get_str(PREFS e, const char * k, char *& v, const char * d);


extern "C" inline int fl_preferences_set_int(PREFS e, const char * k, int v);
extern "C" inline int fl_preferences_set_float(PREFS e, const char * k, float v);
extern "C" inline int fl_preferences_set_float_prec(PREFS e, const char * k, float v, int p);
extern "C" inline int fl_preferences_set_double(PREFS e, const char * k, double v);
extern "C" inline int fl_preferences_set_double_prec(PREFS e, const char * k, double v, int p);
extern "C" inline int fl_preferences_set_str(PREFS e, const char * k, const char * v);


extern "C" inline int fl_preferences_deleteentry(PREFS e, const char * k);
extern "C" inline int fl_preferences_deleteallentries(PREFS e);
extern "C" inline int fl_preferences_clear(PREFS e);


extern "C" inline void fl_preferences_flush(PREFS e);


#endif

