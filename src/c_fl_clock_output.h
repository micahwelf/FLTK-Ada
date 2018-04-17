

#ifndef FL_CLOCK_OUTPUT_GUARD
#define FL_CLOCK_OUTPUT_GUARD




typedef void* CLOCK_OUTPUT;




extern "C" inline void clock_output_set_draw_hook(CLOCK_OUTPUT c, void * d);
extern "C" inline void fl_clock_output_draw(CLOCK_OUTPUT c);
extern "C" inline void clock_output_set_handle_hook(CLOCK_OUTPUT c, void * h);
extern "C" inline int fl_clock_output_handle(CLOCK_OUTPUT c, int e);




extern "C" inline CLOCK_OUTPUT new_fl_clock_output(int x, int y, int w, int h, char* label);
extern "C" inline void free_fl_clock_output(CLOCK_OUTPUT c);




extern "C" inline int fl_clock_output_get_hour(CLOCK_OUTPUT c);
extern "C" inline int fl_clock_output_get_minute(CLOCK_OUTPUT c);
extern "C" inline int fl_clock_output_get_second(CLOCK_OUTPUT c);


extern "C" inline ulong fl_clock_output_get_value(CLOCK_OUTPUT c);
extern "C" inline void fl_clock_output_set_value(CLOCK_OUTPUT c, ulong v);
extern "C" inline void fl_clock_output_set_value2(CLOCK_OUTPUT c, int h, int m, int s);


extern "C" inline void fl_clock_output_draw2(CLOCK_OUTPUT c, int x, int y, int w, int h);


#endif

