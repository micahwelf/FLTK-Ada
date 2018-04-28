

#ifndef FL_PACK_GUARD
#define FL_PACK_GUARD




typedef void* PACK;




extern "C" inline void pack_set_draw_hook(PACK n, void * d);
extern "C" inline void fl_pack_draw(PACK n);
extern "C" inline void pack_set_handle_hook(PACK n, void * h);
extern "C" inline int fl_pack_handle(PACK n, int e);




extern "C" inline PACK new_fl_pack(int x, int y, int w, int h, char * label);
extern "C" inline void free_fl_pack(PACK p);




extern "C" inline int fl_pack_get_spacing(PACK p);
extern "C" inline void fl_pack_set_spacing(PACK p, int t);


#endif

