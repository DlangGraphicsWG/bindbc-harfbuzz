/*
 * Copyright © 2011  Google, Inc.
 *
 *  This is part of HarfBuzz, a text shaping library.
 *
 * Permission is hereby granted, without written agreement and without
 * license or royalty fees, to use, copy, modify, and distribute this
 * software and its documentation for any purpose, provided that the
 * above copyright notice and the following two paragraphs appear in
 * all copies of this software.
 *
 * IN NO EVENT SHALL THE COPYRIGHT HOLDER BE LIABLE TO ANY PARTY FOR
 * DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES
 * ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN
 * IF THE COPYRIGHT HOLDER HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGE.
 *
 * THE COPYRIGHT HOLDER SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING,
 * BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
 * FITNESS FOR A PARTICULAR PURPOSE.  THE SOFTWARE PROVIDED HEREUNDER IS
 * ON AN "AS IS" BASIS, AND THE COPYRIGHT HOLDER HAS NO OBLIGATION TO
 * PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
 *
 * Google Author(s): Behdad Esfahbod
 */

module bindbc.hb.bind.version_;

import bindbc.hb.bind.common;

extern(C) @nogc nothrow:

enum HB_VERSION_MAJOR = 2;
enum HB_VERSION_MINOR = 6;
enum HB_VERSION_MICRO = 0;

enum HB_VERSION_STRING = "2.6.0";

extern (D) auto HB_VERSION_ATLEAST(T0, T1, T2)(auto ref T0 major, auto ref T1 minor, auto ref T2 micro)
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
