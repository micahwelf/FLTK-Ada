

#ifndef FL_PAGED_DEVICE_GUARD
#define FL_PAGED_DEVICE_GUARD




typedef void* PAGED_DEVICE;




extern "C" PAGED_DEVICE new_fl_paged_device(void);
extern "C" void free_fl_paged_device(PAGED_DEVICE p);




extern "C" int fl_paged_device_start_job(PAGED_DEVICE p, int c);
extern "C" int fl_paged_device_start_job2(PAGED_DEVICE p, int c, int f, int t);
extern "C" void fl_paged_device_end_job(PAGED_DEVICE p);
extern "C" int fl_paged_device_start_page(PAGED_DEVICE p);
extern "C" int fl_paged_device_end_page(PAGED_DEVICE p);


extern "C" void fl_paged_device_margins(PAGED_DEVICE p, int * l, int * t, int * r, int * b);
extern "C" int fl_paged_device_printable_rect(PAGED_DEVICE p, int * w, int * h);
extern "C" void fl_paged_device_get_origin(PAGED_DEVICE p, int * x, int * y);
extern "C" void fl_paged_device_set_origin(PAGED_DEVICE p, int x, int y);
extern "C" void fl_paged_device_rotate(PAGED_DEVICE p, float r);
extern "C" void fl_paged_device_scale(PAGED_DEVICE p, float x, float y);
extern "C" void fl_paged_device_translate(PAGED_DEVICE p, int x, int y);
extern "C" void fl_paged_device_untranslate(PAGED_DEVICE p);


extern "C" void fl_paged_device_print_widget(PAGED_DEVICE p, void * i, int dx, int dy);
extern "C" void fl_paged_device_print_window(PAGED_DEVICE p, void * i, int dx, int dy);
extern "C" void fl_paged_device_print_window_part(PAGED_DEVICE p, void * i, int x, int y, int w, int h, int dx, int dy);


#endif

