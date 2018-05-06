

#ifndef FL_GUARD
#define FL_GUARD




extern "C" inline int fl_abi_check(int v);
extern "C" inline int fl_abi_version();
extern "C" inline int fl_api_version();
extern "C" inline double fl_version();


extern "C" inline void fl_awake();
extern "C" inline void fl_lock();
extern "C" inline void fl_unlock();


extern "C" inline int fl_get_damage();
extern "C" inline void fl_set_damage(int v);
extern "C" inline void fl_flush();
extern "C" inline void fl_redraw();


extern "C" inline int fl_check();
extern "C" inline int fl_ready();
extern "C" inline int fl_wait();
extern "C" inline int fl_wait2(double s);
extern "C" inline int fl_run();


#endif

