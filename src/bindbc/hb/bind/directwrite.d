
//          Copyright Ahmet Sait 2020.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

module bindbc.hb.bind.directwrite;

version(Windows):
version(HB_with_directwrite):
version(Have_aurora_directx):

import aurora.directx.dwrite.dwrite_0 : IDWriteFontFace;
import bindbc.hb.bind.face;

extern(C) @nogc nothrow:

version(BindHB_Static)
    	hb_face_t* hb_directwrite_face_create (IDWriteFontFace* font_face);
else
{
    private alias fp_hb_directwrite_face_create = 	hb_face_t* function (IDWriteFontFace* font_face);
    __gshared fp_hb_directwrite_face_create hb_directwrite_face_create;
}

version(BindHB_Static)
    	IDWriteFontFace* hb_directwrite_face_get_font_face (hb_face_t* face);
else
{
    private alias fp_hb_directwrite_face_get_font_face = 	IDWriteFontFace* function (hb_face_t* face);
    __gshared fp_hb_directwrite_face_get_font_face hb_directwrite_face_get_font_face;
}
