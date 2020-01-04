
//          Copyright Ahmet Sait 2020.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

/// This module requires ICU bindings and does not compile
module bindbc.hb.bind.icu;

version(HB_with_icu):

import bindbc.hb.bind.common;

extern(C) @nogc nothrow:

version(BindHB_Static)
    	hb_script_t hb_icu_script_to_script (UScriptCode script);
else
{
    private alias fp_hb_icu_script_to_script = 	hb_script_t function (UScriptCode script);
    __gshared fp_hb_icu_script_to_script hb_icu_script_to_script;
}

version(BindHB_Static)
    	UScriptCode hb_icu_script_from_script (hb_script_t script);
else
{
    private alias fp_hb_icu_script_from_script = 	UScriptCode function (hb_script_t script);
    __gshared fp_hb_icu_script_from_script hb_icu_script_from_script;
}

version(BindHB_Static)
    	hb_unicode_funcs_t* hb_icu_get_unicode_funcs ();
else
{
    private alias fp_hb_icu_get_unicode_funcs = 	hb_unicode_funcs_t* function ();
    __gshared fp_hb_icu_get_unicode_funcs hb_icu_get_unicode_funcs;
}
