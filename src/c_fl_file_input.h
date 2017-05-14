

#ifndef FL_FILE_INPUT_GUARD
#define FL_FILE_INPUT_GUARD


typedef void* FILE_INPUT;


extern "C" void file_input_set_draw_hook(FILE_INPUT i, void * d);
extern "C" void fl_file_input_draw(FILE_INPUT i);
extern "C" void file_input_set_handle_hook(FILE_INPUT i, void * h);
extern "C" int fl_file_input_handle(FILE_INPUT i, int e);


extern "C" FILE_INPUT new_fl_file_input(int x, int y, int w, int h, char* label);
extern "C" void free_fl_file_input(FILE_INPUT i);


#endif

