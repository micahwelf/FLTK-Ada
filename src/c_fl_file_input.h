

#ifndef FL_FILE_INPUT_GUARD
#define FL_FILE_INPUT_GUARD




typedef void* FILE_INPUT;




extern "C" inline void file_input_set_draw_hook(FILE_INPUT i, void * d);
extern "C" inline void fl_file_input_draw(FILE_INPUT i);
extern "C" inline void file_input_set_handle_hook(FILE_INPUT i, void * h);
extern "C" inline int fl_file_input_handle(FILE_INPUT i, int e);




extern "C" inline FILE_INPUT new_fl_file_input(int x, int y, int w, int h, char* label);
extern "C" inline void free_fl_file_input(FILE_INPUT i);




extern "C" inline int fl_file_input_get_down_box(FILE_INPUT i);
extern "C" inline void fl_file_input_set_down_box(FILE_INPUT i, int t);
extern "C" inline unsigned int fl_file_input_get_errorcolor(FILE_INPUT i);
extern "C" inline void fl_file_input_set_errorcolor(FILE_INPUT i, unsigned int t);


extern "C" inline const char * fl_file_input_get_value(FILE_INPUT i);
extern "C" inline void fl_file_input_set_value(FILE_INPUT i, const char * s, int len);


#endif

