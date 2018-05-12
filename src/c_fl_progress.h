

#ifndef FL_PROGRESS_GUARD
#define FL_PROGRESS_GUARD




typedef void* PROGRESS;




extern "C" void progress_set_draw_hook(PROGRESS p, void * d);
extern "C" void fl_progress_draw(PROGRESS p);
extern "C" void progress_set_handle_hook(PROGRESS p, void * h);
extern "C" int fl_progress_handle(PROGRESS p, int e);




extern "C" PROGRESS new_fl_progress(int x, int y, int w, int h, char* label);
extern "C" void free_fl_progress(PROGRESS p);




extern "C" float fl_progress_get_minimum(PROGRESS p);
extern "C" void fl_progress_set_minimum(PROGRESS p, float t);
extern "C" float fl_progress_get_maximum(PROGRESS p);
extern "C" void fl_progress_set_maximum(PROGRESS p, float t);
extern "C" float fl_progress_get_value(PROGRESS p);
extern "C" void fl_progress_set_value(PROGRESS p, float t);


#endif

