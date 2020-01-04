
//          Copyright Ahmet Sait 2020.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

module bindbc.hb.bind.ot.shape;

import bindbc.hb.bind.buffer;
import bindbc.hb.bind.common;
import bindbc.hb.bind.font;
import bindbc.hb.bind.set;
import bindbc.hb.bind.shape_plan;

extern(C) @nogc nothrow:

/* TODO port to shape-plan / set. */
version(BindHB_Static)
    void hb_ot_shape_glyphs_closure (
        hb_font_t* font,
        hb_buffer_t* buffer,
        const(hb_feature_t)* features,
        uint num_features,
        hb_set_t* glyphs);
else
{
    private alias fp_hb_ot_shape_glyphs_closure = void function (
        hb_font_t* font,
        hb_buffer_t* buffer,
        const(hb_feature_t)* features,
        uint num_features,
        hb_set_t* glyphs);
    __gshared fp_hb_ot_shape_glyphs_closure hb_ot_shape_glyphs_closure;
}

/* OUT */
version(BindHB_Static)
    void hb_ot_shape_plan_collect_lookups (
        hb_shape_plan_t* shape_plan,
        hb_tag_t table_tag,
        hb_set_t* lookup_indexes);
else
{
    private alias fp_hb_ot_shape_plan_collect_lookups = void function (
        hb_shape_plan_t* shape_plan,
        hb_tag_t table_tag,
        hb_set_t* lookup_indexes);
    __gshared fp_hb_ot_shape_plan_collect_lookups hb_ot_shape_plan_collect_lookups;
}
