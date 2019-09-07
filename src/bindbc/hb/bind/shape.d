
//          Copyright Ahmet Sait Koçak 2019.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

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
