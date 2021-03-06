

#ifndef FL_TILE_GUARD
#define FL_TILE_GUARD




typedef void* TILE;




extern "C" void tile_set_draw_hook(TILE n, void * d);
extern "C" void fl_tile_draw(TILE n);
extern "C" void tile_set_handle_hook(TILE n, void * h);
extern "C" int fl_tile_handle(TILE n, int e);




extern "C" TILE new_fl_tile(int x, int y, int w, int h, char * label);
extern "C" void free_fl_tile(TILE t);




extern "C" void fl_tile_position(TILE t, int ox, int oy, int nx, int ny);


#endif

