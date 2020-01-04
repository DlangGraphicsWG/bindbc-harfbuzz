
//          Copyright Ahmet Sait 2020.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

module bindbc.hb.bind.uniscribe;

version(Windows):
version(HB_with_uniscribe):

import core.sys.windows.windef : HFONT;
import core.sys.windows.wingdi : LOGFONTW;
import bindbc.hb.bind.common;
import bindbc.hb.bind.font;

extern(C) @nogc nothrow:

version(BindHB_Static)
		LOGFONTW* hb_uniscribe_font_get_logfontw (hb_font_t* font);
else
{
	private alias fp_hb_uniscribe_font_get_logfontw = 	LOGFONTW* function (hb_font_t* font);
	__gshared fp_hb_uniscribe_font_get_logfontw hb_uniscribe_font_get_logfontw;
}

version(BindHB_Static)
		HFONT hb_uniscribe_font_get_hfont (hb_font_t* font);
else
{
	private alias fp_hb_uniscribe_font_get_hfont = 	HFONT function (hb_font_t* font);
	__gshared fp_hb_uniscribe_font_get_hfont hb_uniscribe_font_get_hfont;
}
