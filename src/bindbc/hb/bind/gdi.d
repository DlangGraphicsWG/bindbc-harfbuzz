
//          Copyright Ahmet Sait 2020.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

module bindbc.hb.bind.gdi;

version(Windows):
version(HB_with_gdi):

import core.sys.windows.windef : HFONT;
import bindbc.hb.bind.face;

extern(C) @nogc nothrow:

version(BindHB_Static)
    	hb_face_t* hb_gdi_face_create (HFONT hfont);
else
{
    private alias fp_hb_gdi_face_create = 	hb_face_t* function (HFONT hfont);
    __gshared fp_hb_gdi_face_create hb_gdi_face_create;
}
