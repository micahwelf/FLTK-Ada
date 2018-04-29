

#ifndef FL_PRINTER_GUARD
#define FL_PRINTER_GUARD




typedef void* PRINTER;




extern "C" inline PRINTER new_fl_printer(void);
extern "C" inline void free_fl_printer(PRINTER p);




extern "C" inline int fl_printer_start_job(PRINTER p, int c);
extern "C" inline int fl_printer_start_job2(PRINTER p, int c, int f, int t);
extern "C" inline void fl_printer_end_job(PRINTER p);
extern "C" inline int fl_printer_start_page(PRINTER p);
extern "C" inline int fl_printer_end_page(PRINTER p);


extern "C" inline void fl_printer_margins(PRINTER p, int * l, int * t, int * r, int * b);
extern "C" inline int fl_printer_printable_rect(PRINTER p, int * w, int * h);
extern "C" inline void fl_printer_get_origin(PRINTER p, int * x, int * y);
extern "C" inline void fl_printer_set_origin(PRINTER p, int x, int y);
extern "C" inline void fl_printer_rotate(PRINTER p, float r);
extern "C" inline void fl_printer_scale(PRINTER p, float x, float y);
extern "C" inline void fl_printer_translate(PRINTER p, int x, int y);
extern "C" inline void fl_printer_untranslate(PRINTER p);


extern "C" inline void fl_printer_print_widget(PRINTER p, void * i, int dx, int dy);
extern "C" inline void fl_printer_print_window_part(PRINTER p, void * i, int x, int y, int w, int h, int dx, int dy);


extern "C" inline void fl_printer_set_current(PRINTER p);


#endif

