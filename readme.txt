

FLTK Binding for the Ada Programming Language
=============================================




This is a thick binding. In particular, dynamic allocation of FLTK objects is
not necessary as in Ada they can be placed on the stack and automatically cleaned
up. Ada 2012 iterators have also been made available for the Fl_Group and Fl_Menu
bindings.

For documentation on what C++ method or class corresponds to what Ada function,
procedure, or package, see the /doc/index.html file.




Dependencies:

    GNAT
    FLTK




How to build/install:

This repository is written to use the GNAT Project Manager build tools. To build
this FLTK-Ada binding for testing purposes, use the following command

    gprbuild fltkada.gpr

And to install the binding, use

    gprinstall -p -m fltkada.gpr




For further information on the build tools, consult

    https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug.html




A technical note on callbacks and overriding:

As part of its normal operation, FLTK calls a Widget's Draw and Handle methods from its
main loop to deal with draw and input events. Since it's another part of the program
that is invoking them, even if it's a part the programmer has no direct control over,
this binding is set up so that if you override Draw or Handle, the behaviour will change.

On the other hand, something like the Push method in tabbed groups is usually invoked
from within that same tabbed group widget's Handle method. Therefore, keeping consistency
with Ada semantics, overriding the Push method will NOT change the behaviour of the
corresponding Handle method. You must also override Handle.


