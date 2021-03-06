

#ifndef FL_EVENT_GUARD
#define FL_EVENT_GUARD




extern "C" void fl_event_add_handler(void * f);
extern "C" void fl_event_set_event_dispatch(void * f);
extern "C" int fl_event_handle(int e, void * w);


extern "C" void * fl_event_get_grab();
extern "C" void fl_event_set_grab(void * w);
extern "C" void * fl_event_get_pushed();
extern "C" void fl_event_set_pushed(void * w);
extern "C" void * fl_event_get_belowmouse();
extern "C" void fl_event_set_belowmouse(void * w);
extern "C" void * fl_event_get_focus();
extern "C" void fl_event_set_focus(void * w);


extern "C" int fl_event_compose(int &d);
extern "C" void fl_event_compose_reset();
extern "C" const char * fl_event_text();
extern "C" int fl_event_length();


extern "C" int fl_event_get();
extern "C" unsigned long fl_event_state();
extern "C" int fl_event_check_state(unsigned long s);


extern "C" int fl_event_x();
extern "C" int fl_event_x_root();
extern "C" int fl_event_y();
extern "C" int fl_event_y_root();
extern "C" int fl_event_dx();
extern "C" int fl_event_dy();
extern "C" void fl_event_get_mouse(int &x, int &y);
extern "C" int fl_event_is_click();
extern "C" int fl_event_is_clicks();
extern "C" void fl_event_set_clicks(int c);
extern "C" int fl_event_button();
extern "C" int fl_event_button1();
extern "C" int fl_event_button2();
extern "C" int fl_event_button3();
extern "C" int fl_event_inside(int x, int y, int w, int h);


extern "C" unsigned long fl_event_key();
extern "C" unsigned long fl_event_original_key();
extern "C" int fl_event_key_during(unsigned long k);
extern "C" int fl_event_get_key(unsigned long k);
extern "C" int fl_event_ctrl();
extern "C" int fl_event_alt();
extern "C" int fl_event_command();
extern "C" int fl_event_shift();


#endif

