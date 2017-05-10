

#ifndef FL_FILE_INPUT_GUARD
#define FL_FILE_INPUT_GUARD


typedef void* FILE_INPUT;


extern "C" void file_input_set_draw_hook(FILE_INPUT n, void * d);
extern "C" void fl_file_input_draw(FILE_INPUT n);

extern "C" FILE_INPUT new_fl_file_input(int x, int y, int w, int h, char* label);
extern "C" void free_fl_file_input(FILE_INPUT i);


#endif

