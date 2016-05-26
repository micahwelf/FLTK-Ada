

with Ada.Finalization;
private with System;


package FLTK is


    function Run return Integer;


    --  ugly implementation thing; never use this
    --  just ignore the hand moving behind the curtain here
    type Wrapper is abstract new Ada.Finalization.Limited_Controlled with private;


private


    type Wrapper is abstract new Ada.Finalization.Limited_Controlled with
        record
            Void_Ptr : System.Address;
        end record;


    overriding procedure Initialize
           (This : in out Wrapper);


end FLTK;

