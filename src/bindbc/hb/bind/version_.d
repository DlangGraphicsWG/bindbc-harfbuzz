
//          Copyright Ahmet Sait 2019.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

module bindbc.hb.bind.version_;

import bindbc.hb.bind.common;

extern(C) @nogc nothrow:

enum HB_VERSION_MAJOR = 2;
enum HB_VERSION_MINOR = 6;
enum HB_VERSION_MICRO = 0;

enum HB_VERSION_STRING = "2.6.0";

extern (D) int HB_VERSION_ATLEAST(int major, int minor, int micro)
{
    return major * 10000 + minor * 100 + micro <= HB_VERSION_MAJOR * 10000 + HB_VERSION_MINOR * 100 + HB_VERSION_MICRO;
}

version(BindHB_Static)
    void hb_version (uint* major, uint* minor, uint* micro);
else
{
    private alias fp_hb_version = void function (uint* major, uint* minor, uint* micro);
    __gshared fp_hb_version hb_version;
}

version(BindHB_Static)
    const(char)* hb_version_string ();
else
{
    private alias fp_hb_version_string = const(char)* function ();
    __gshared fp_hb_version_string hb_version_string;
}

version(BindHB_Static)
    hb_bool_t hb_version_atleast (uint major, uint minor, uint micro);
else
{
    private alias fp_hb_version_atleast = hb_bool_t function (uint major, uint minor, uint micro);
    __gshared fp_hb_version_atleast hb_version_atleast;
}

/* HB_VERSION_H */
