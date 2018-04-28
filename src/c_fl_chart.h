

#ifndef FL_CHART_GUARD
#define FL_CHART_GUARD




typedef void* CHART;




extern "C" inline void chart_set_draw_hook(CHART n, void * d);
extern "C" inline void fl_chart_draw(CHART n);
extern "C" inline void chart_set_handle_hook(CHART n, void * h);
extern "C" inline int fl_chart_handle(CHART n, int e);




extern "C" inline CHART new_fl_chart(int x, int y, int w, int h, char * label);
extern "C" inline void free_fl_chart(CHART b);




extern "C" inline void fl_chart_add(CHART b, double v, char * s, unsigned int c);
extern "C" inline void fl_chart_insert(CHART b, int i, double v, char * s, unsigned int c);
extern "C" inline void fl_chart_replace(CHART b, int i, double v, char * s, unsigned int c);
extern "C" inline void fl_chart_clear(CHART b);


extern "C" inline int fl_chart_get_autosize(CHART b);
extern "C" inline void fl_chart_set_autosize(CHART b, int a);
extern "C" inline void fl_chart_get_bounds(CHART b, double * l, double * u);
extern "C" inline void fl_chart_set_bounds(CHART b, double l, double u);
extern "C" inline int fl_chart_get_maxsize(CHART b);
extern "C" inline void fl_chart_set_maxsize(CHART b, int m);
extern "C" inline int fl_chart_size(CHART b);


extern "C" inline void fl_chart_size2(CHART b, int w, int h);


extern "C" inline unsigned int fl_chart_get_textcolor(CHART b);
extern "C" inline void fl_chart_set_textcolor(CHART b, unsigned int c);
extern "C" inline int fl_chart_get_textfont(CHART b);
extern "C" inline void fl_chart_set_textfont(CHART b, int f);
extern "C" inline int fl_chart_get_textsize(CHART b);
extern "C" inline void fl_chart_set_textsize(CHART b, int s);


#endif

