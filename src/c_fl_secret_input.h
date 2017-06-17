

#ifndef FL_SECRET_INPUT_GUARD
#define FL_SECRET_INPUT_GUARD




typedef void* SECRET_INPUT;




extern "C" void secret_input_set_draw_hook(SECRET_INPUT i, void * d);
extern "C" void fl_secret_input_draw(SECRET_INPUT i);
extern "C" void secret_input_set_handle_hook(SECRET_INPUT i, void * h);
extern "C" int fl_secret_input_handle(SECRET_INPUT i, int e);




extern "C" SECRET_INPUT new_fl_secret_input(int x, int y, int w, int h, char* label);
extern "C" void free_fl_secret_input(SECRET_INPUT i);


#endif

