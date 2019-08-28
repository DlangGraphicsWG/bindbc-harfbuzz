/*
 * Copyright © 2009  Red Hat, Inc.
 * Copyright © 2012  Google, Inc.
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
 * Red Hat Author(s): Behdad Esfahbod
 * Google Author(s): Behdad Esfahbod
 */

module bindbc.hb.bind.shape;

import bindbc.hb.bind.buffer;
import bindbc.hb.bind.common;
import bindbc.hb.bind.font;

extern(C) @nogc nothrow:

version(BindHB_Static)
    void hb_shape (
        hb_font_t* font,
        hb_buffer_t* buffer,
        const(hb_feature_t)* features,
        uint num_features);
else
{
    private alias fp_hb_shape = void function (
        hb_font_t* font,
        hb_buffer_t* buffer,
        const(hb_feature_t)* features,
        uint num_features);
    __gshared fp_hb_shape hb_shape;
}

version(BindHB_Static)
    hb_bool_t hb_shape_full (
        hb_font_t* font,
        hb_buffer_t* buffer,
        const(hb_feature_t)* features,
        uint num_features,
        const(char*)* shaper_list);
else
{
    private alias fp_hb_shape_full = hb_bool_t function (
        hb_font_t* font,
        hb_buffer_t* buffer,
        const(hb_feature_t)* features,
        uint num_features,
        const(char*)* shaper_list);
    __gshared fp_hb_shape_full hb_shape_full;
}

version(BindHB_Static)
    const(char*)* hb_shape_list_shapers ();
else
{
    private alias fp_hb_shape_list_shapers = const(char*)* function ();
    __gshared fp_hb_shape_list_shapers hb_shape_list_shapers;
}

/* HB_SHAPE_H */
