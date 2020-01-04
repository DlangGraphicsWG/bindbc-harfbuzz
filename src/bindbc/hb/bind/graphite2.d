
//          Copyright Ahmet Sait 2020.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

/// This module requires Graphite2 bindings and does not compile
module bindbc.hb.bind.graphite2;

version(HB_with_graphite2):

import bindbc.hb.bind.common;

extern(C) @nogc nothrow:

enum HB_GRAPHITE2_TAG_SILF = HB_TAG('S', 'i', 'l', 'f');

version(BindHB_Static)
    	gr_face* hb_graphite2_face_get_gr_face (hb_face_t* face);
else
{
    private alias fp_hb_graphite2_face_get_gr_face = 	gr_face* function (hb_face_t* face);
    __gshared fp_hb_graphite2_face_get_gr_face hb_graphite2_face_get_gr_face;
}

version(BindHB_Static)
    	gr_font* hb_graphite2_font_get_gr_font (hb_font_t* font);
else
{
    private alias fp_hb_graphite2_font_get_gr_font = 	gr_font* function (hb_font_t* font);
    __gshared fp_hb_graphite2_font_get_gr_font hb_graphite2_font_get_gr_font;
}
