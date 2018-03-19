

#include <FL/Fl_Tile.H>
#include "c_fl_tile.h"
#include "c_fl_type.h"




class My_Tile : public Fl_Tile {
    public:
        using Fl_Tile::Fl_Tile;
        friend void tile_set_draw_hook(TILE n, void * d);
        friend void fl_tile_draw(TILE n);
        friend void tile_set_handle_hook(TILE n, void * h);
        friend int fl_tile_handle(TILE n, int e);
    protected:
        void draw();
        void real_draw();
        int handle(int e);
        int real_handle(int e);
        d_hook_p draw_hook;
        h_hook_p handle_hook;
};

void My_Tile::draw() {
    (*draw_hook)(this->user_data());
}

void My_Tile::real_draw() {
    Fl_Tile::draw();
}

int My_Tile::handle(int e) {
    return (*handle_hook)(this->user_data(), e);
}

int My_Tile::real_handle(int e) {
    return Fl_Tile::handle(e);
}

void tile_set_draw_hook(TILE n, void * d) {
    reinterpret_cast<My_Tile*>(n)->draw_hook = reinterpret_cast<d_hook_p>(d);
}

void fl_tile_draw(TILE n) {
    reinterpret_cast<My_Tile*>(n)->real_draw();
}

void tile_set_handle_hook(TILE n, void * h) {
    reinterpret_cast<My_Tile*>(n)->handle_hook = reinterpret_cast<h_hook_p>(h);
}

int fl_tile_handle(TILE n, int e) {
    return reinterpret_cast<My_Tile*>(n)->real_handle(e);
}




TILE new_fl_tile(int x, int y, int w, int h, char* label) {
    My_Tile *b = new My_Tile(x, y, w, h, label);
    return b;
}

void free_fl_tile(TILE t) {
    delete reinterpret_cast<My_Tile*>(t);
}




void fl_tile_position(TILE t, int ox, int oy, int nx, int ny) {
    reinterpret_cast<My_Tile*>(t)->position(ox,oy,nx,ny);
}


