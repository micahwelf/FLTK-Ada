

#ifndef FL_PRINTER_GUARD
#define FL_PRINTER_GUARD




typedef void* PRINTER;




extern "C" PRINTER new_fl_printer(void);
extern "C" void free_fl_printer(PRINTER p);




extern "C" int fl_printer_start_job(PRINTER p, int c);
extern "C" int fl_printer_start_job2(PRINTER p, int c, int f, int t);
extern "C" void fl_printer_end_job(PRINTER p);
extern "C" int fl_printer_start_page(PRINTER p);
extern "C" int fl_printer_end_page(PRINTER p);


extern "C" void fl_printer_margins(PRINTER p, int * l, int * t, int * r, int * b);
extern "C" int fl_printer_printable_rect(PRINTER p, int * w, int * h);
extern "C" void fl_printer_get_origin(PRINTER p, int * x, int * y);
extern "C" void fl_printer_set_origin(PRINTER p, int x, int y);
extern "C" void fl_printer_rotate(PRINTER p, float r);
extern "C" void fl_printer_scale(PRINTER p, float x, float y);
extern "C" void fl_printer_translate(PRINTER p, int x, int y);
extern "C" void fl_printer_untranslate(PRINTER p);


extern "C" void fl_printer_print_widget(PRINTER p, void * i, int dx, int dy);
extern "C" void fl_printer_print_window_part(PRINTER p, void * i, int x, int y, int w, int h, int dx, int dy);


extern "C" void fl_printer_set_current(PRINTER p);


#endif

