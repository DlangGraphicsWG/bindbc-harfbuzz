
//          Copyright Ahmet Sait 2020.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

module bindbc.hb.bind.ot.font;

import bindbc.hb.bind.font;

extern(C) @nogc nothrow:

version(BindHB_Static)
    void hb_ot_font_set_funcs (hb_font_t* font);
else
{
    private alias fp_hb_ot_font_set_funcs = void function (hb_font_t* font);
    __gshared fp_hb_ot_font_set_funcs hb_ot_font_set_funcs;
}
