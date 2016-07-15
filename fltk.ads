

with Ada.Finalization;
private with System;


package FLTK is


    function Run return Integer;


    --  ugly implementation detail, never use this
    --  just ignore the hand moving behind the curtain
    --  (this is necessary so things like text_buffers and
    --  widgets can talk to each other behind the binding)
    type Wrapper is abstract new Ada.Finalization.Limited_Controlled with private;


private


    type Wrapper is abstract new Ada.Finalization.Limited_Controlled with
        record
            Void_Ptr : System.Address;
        end record;


    overriding procedure Initialize
           (This : in out Wrapper);


end FLTK;

