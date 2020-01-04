
//          Copyright Ahmet Sait 2020.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

module bindbc.hb.bind.ot.deprecated_;

version(HB_with_deprecated):

import bindbc.hb.bind.common;
import bindbc.hb.bind.face;
import bindbc.hb.bind.ot.math;
import bindbc.hb.bind.ot.name;

extern(C) @nogc nothrow:

/* https://github.com/harfbuzz/harfbuzz/issues/1734 */
enum HB_MATH_GLYPH_PART_FLAG_EXTENDER = HB_OT_MATH_GLYPH_PART_FLAG_EXTENDER;

/* Like hb_ot_layout_table_find_script, but takes zero-terminated array of scripts to test */
version(BindHB_Static)
    hb_bool_t hb_ot_layout_table_choose_script (
        hb_face_t* face,
        hb_tag_t table_tag,
        const(hb_tag_t)* script_tags,
        uint* script_index,
        hb_tag_t* chosen_script);
else
{
    private alias fp_hb_ot_layout_table_choose_script = hb_bool_t function (
        hb_face_t* face,
        hb_tag_t table_tag,
        const(hb_tag_t)* script_tags,
        uint* script_index,
        hb_tag_t* chosen_script);
    __gshared fp_hb_ot_layout_table_choose_script hb_ot_layout_table_choose_script;
}

version(BindHB_Static)
    hb_bool_t hb_ot_layout_script_find_language (
        hb_face_t* face,
        hb_tag_t table_tag,
        uint script_index,
        hb_tag_t language_tag,
        uint* language_index);
else
{
    private alias fp_hb_ot_layout_script_find_language = hb_bool_t function (
        hb_face_t* face,
        hb_tag_t table_tag,
        uint script_index,
        hb_tag_t language_tag,
        uint* language_index);
    __gshared fp_hb_ot_layout_script_find_language hb_ot_layout_script_find_language;
}

version(BindHB_Static)
    void hb_ot_tags_from_script (
        hb_script_t script,
        hb_tag_t* script_tag_1,
        hb_tag_t* script_tag_2);
else
{
    private alias fp_hb_ot_tags_from_script = void function (
        hb_script_t script,
        hb_tag_t* script_tag_1,
        hb_tag_t* script_tag_2);
    __gshared fp_hb_ot_tags_from_script hb_ot_tags_from_script;
}

version(BindHB_Static)
    hb_tag_t hb_ot_tag_from_language (hb_language_t language);
else
{
    private alias fp_hb_ot_tag_from_language = hb_tag_t function (hb_language_t language);
    __gshared fp_hb_ot_tag_from_language hb_ot_tag_from_language;
}

/**
 * HB_OT_VAR_NO_AXIS_INDEX:
 *
 * Since: 1.4.2
 * Deprecated: 2.2.0
 */
enum HB_OT_VAR_NO_AXIS_INDEX = 0xFFFFFFFFu;

/**
 * hb_ot_var_axis_t:
 *
 * Since: 1.4.2
 * Deprecated: 2.2.0
 */
struct hb_ot_var_axis_t
{
    hb_tag_t tag;
    hb_ot_name_id_t name_id;
    float min_value;
    float default_value;
    float max_value;
}

/* IN/OUT */
/* OUT */
version(BindHB_Static)
    uint hb_ot_var_get_axes (
        hb_face_t* face,
        uint start_offset,
        uint* axes_count,
        hb_ot_var_axis_t* axes_array);
else
{
    private alias fp_hb_ot_var_get_axes = uint function (
        hb_face_t* face,
        uint start_offset,
        uint* axes_count,
        hb_ot_var_axis_t* axes_array);
    __gshared fp_hb_ot_var_get_axes hb_ot_var_get_axes;
}

version(BindHB_Static)
    hb_bool_t hb_ot_var_find_axis (
        hb_face_t* face,
        hb_tag_t axis_tag,
        uint* axis_index,
        hb_ot_var_axis_t* axis_info);
else
{
    private alias fp_hb_ot_var_find_axis = hb_bool_t function (
        hb_face_t* face,
        hb_tag_t axis_tag,
        uint* axis_index,
        hb_ot_var_axis_t* axis_info);
    __gshared fp_hb_ot_var_find_axis hb_ot_var_find_axis;
}
