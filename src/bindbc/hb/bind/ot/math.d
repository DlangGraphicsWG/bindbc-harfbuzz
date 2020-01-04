
//          Copyright Ahmet Sait 2020.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

module bindbc.hb.bind.ot.math;

import bindbc.hb.bind.common;
import bindbc.hb.bind.face;
import bindbc.hb.bind.font;

extern(C) @nogc nothrow:

/*
 * MATH
 */

enum HB_OT_TAG_MATH = HB_TAG('M', 'A', 'T', 'H');

/* Use with hb_buffer_set_script() for math shaping. */
enum HB_OT_MATH_SCRIPT = HB_TAG('m', 'a', 't', 'h');

/* Types */

/**
 * hb_ot_math_constant_t:
 *
 * The 'MATH' table constants specified at
 * https://docs.microsoft.com/en-us/typography/opentype/spec/math
 *
 * Since: 1.3.3
 */
enum : int
{
    HB_OT_MATH_CONSTANT_SCRIPT_PERCENT_SCALE_DOWN = 0,
    HB_OT_MATH_CONSTANT_SCRIPT_SCRIPT_PERCENT_SCALE_DOWN = 1,
    HB_OT_MATH_CONSTANT_DELIMITED_SUB_FORMULA_MIN_HEIGHT = 2,
    HB_OT_MATH_CONSTANT_DISPLAY_OPERATOR_MIN_HEIGHT = 3,
    HB_OT_MATH_CONSTANT_MATH_LEADING = 4,
    HB_OT_MATH_CONSTANT_AXIS_HEIGHT = 5,
    HB_OT_MATH_CONSTANT_ACCENT_BASE_HEIGHT = 6,
    HB_OT_MATH_CONSTANT_FLATTENED_ACCENT_BASE_HEIGHT = 7,
    HB_OT_MATH_CONSTANT_SUBSCRIPT_SHIFT_DOWN = 8,
    HB_OT_MATH_CONSTANT_SUBSCRIPT_TOP_MAX = 9,
    HB_OT_MATH_CONSTANT_SUBSCRIPT_BASELINE_DROP_MIN = 10,
    HB_OT_MATH_CONSTANT_SUPERSCRIPT_SHIFT_UP = 11,
    HB_OT_MATH_CONSTANT_SUPERSCRIPT_SHIFT_UP_CRAMPED = 12,
    HB_OT_MATH_CONSTANT_SUPERSCRIPT_BOTTOM_MIN = 13,
    HB_OT_MATH_CONSTANT_SUPERSCRIPT_BASELINE_DROP_MAX = 14,
    HB_OT_MATH_CONSTANT_SUB_SUPERSCRIPT_GAP_MIN = 15,
    HB_OT_MATH_CONSTANT_SUPERSCRIPT_BOTTOM_MAX_WITH_SUBSCRIPT = 16,
    HB_OT_MATH_CONSTANT_SPACE_AFTER_SCRIPT = 17,
    HB_OT_MATH_CONSTANT_UPPER_LIMIT_GAP_MIN = 18,
    HB_OT_MATH_CONSTANT_UPPER_LIMIT_BASELINE_RISE_MIN = 19,
    HB_OT_MATH_CONSTANT_LOWER_LIMIT_GAP_MIN = 20,
    HB_OT_MATH_CONSTANT_LOWER_LIMIT_BASELINE_DROP_MIN = 21,
    HB_OT_MATH_CONSTANT_STACK_TOP_SHIFT_UP = 22,
    HB_OT_MATH_CONSTANT_STACK_TOP_DISPLAY_STYLE_SHIFT_UP = 23,
    HB_OT_MATH_CONSTANT_STACK_BOTTOM_SHIFT_DOWN = 24,
    HB_OT_MATH_CONSTANT_STACK_BOTTOM_DISPLAY_STYLE_SHIFT_DOWN = 25,
    HB_OT_MATH_CONSTANT_STACK_GAP_MIN = 26,
    HB_OT_MATH_CONSTANT_STACK_DISPLAY_STYLE_GAP_MIN = 27,
    HB_OT_MATH_CONSTANT_STRETCH_STACK_TOP_SHIFT_UP = 28,
    HB_OT_MATH_CONSTANT_STRETCH_STACK_BOTTOM_SHIFT_DOWN = 29,
    HB_OT_MATH_CONSTANT_STRETCH_STACK_GAP_ABOVE_MIN = 30,
    HB_OT_MATH_CONSTANT_STRETCH_STACK_GAP_BELOW_MIN = 31,
    HB_OT_MATH_CONSTANT_FRACTION_NUMERATOR_SHIFT_UP = 32,
    HB_OT_MATH_CONSTANT_FRACTION_NUMERATOR_DISPLAY_STYLE_SHIFT_UP = 33,
    HB_OT_MATH_CONSTANT_FRACTION_DENOMINATOR_SHIFT_DOWN = 34,
    HB_OT_MATH_CONSTANT_FRACTION_DENOMINATOR_DISPLAY_STYLE_SHIFT_DOWN = 35,
    HB_OT_MATH_CONSTANT_FRACTION_NUMERATOR_GAP_MIN = 36,
    HB_OT_MATH_CONSTANT_FRACTION_NUM_DISPLAY_STYLE_GAP_MIN = 37,
    HB_OT_MATH_CONSTANT_FRACTION_RULE_THICKNESS = 38,
    HB_OT_MATH_CONSTANT_FRACTION_DENOMINATOR_GAP_MIN = 39,
    HB_OT_MATH_CONSTANT_FRACTION_DENOM_DISPLAY_STYLE_GAP_MIN = 40,
    HB_OT_MATH_CONSTANT_SKEWED_FRACTION_HORIZONTAL_GAP = 41,
    HB_OT_MATH_CONSTANT_SKEWED_FRACTION_VERTICAL_GAP = 42,
    HB_OT_MATH_CONSTANT_OVERBAR_VERTICAL_GAP = 43,
    HB_OT_MATH_CONSTANT_OVERBAR_RULE_THICKNESS = 44,
    HB_OT_MATH_CONSTANT_OVERBAR_EXTRA_ASCENDER = 45,
    HB_OT_MATH_CONSTANT_UNDERBAR_VERTICAL_GAP = 46,
    HB_OT_MATH_CONSTANT_UNDERBAR_RULE_THICKNESS = 47,
    HB_OT_MATH_CONSTANT_UNDERBAR_EXTRA_DESCENDER = 48,
    HB_OT_MATH_CONSTANT_RADICAL_VERTICAL_GAP = 49,
    HB_OT_MATH_CONSTANT_RADICAL_DISPLAY_STYLE_VERTICAL_GAP = 50,
    HB_OT_MATH_CONSTANT_RADICAL_RULE_THICKNESS = 51,
    HB_OT_MATH_CONSTANT_RADICAL_EXTRA_ASCENDER = 52,
    HB_OT_MATH_CONSTANT_RADICAL_KERN_BEFORE_DEGREE = 53,
    HB_OT_MATH_CONSTANT_RADICAL_KERN_AFTER_DEGREE = 54,
    HB_OT_MATH_CONSTANT_RADICAL_DEGREE_BOTTOM_RAISE_PERCENT = 55
}
alias hb_ot_math_constant_t = int;

/**
 * hb_ot_math_kern_t:
 *
 * The math kerning-table types defined for the four corners
 * of a glyph.
 *
 * Since: 1.3.3
 */
enum : int
{
    HB_OT_MATH_KERN_TOP_RIGHT = 0,
    HB_OT_MATH_KERN_TOP_LEFT = 1,
    HB_OT_MATH_KERN_BOTTOM_RIGHT = 2,
    HB_OT_MATH_KERN_BOTTOM_LEFT = 3
}
alias hb_ot_math_kern_t = int;

/**
 * hb_ot_math_glyph_variant_t:
 * @glyph: The glyph index of the variant
 * @advance: The advance width of the variant
 *
 * Data type to hold math-variant information for a glyph.
 *
 * Since: 1.3.3
 */
struct hb_ot_math_glyph_variant_t
{
    hb_codepoint_t glyph;
    hb_position_t advance;
}

/**
 * hb_ot_math_glyph_part_flags_t:
 *
 * Flags for math glyph parts.
 *
 * Since: 1.3.3
 */
enum : uint
{
    /*< flags >*/
    HB_OT_MATH_GLYPH_PART_FLAG_EXTENDER = 0x00000001u /* Extender glyph */
}
alias hb_ot_math_glyph_part_flags_t = uint;

/**
 * hb_ot_math_glyph_part_t:
 * @glyph: The glyph index of the variant part
 * @start_connector_length: The length of the connector on the starting side of the variant part
 * @end_connector_length: The length of the connector on the ending side of the variant part
 * @full_advance: The total advance of the part
 * @flags: #hb_ot_math_glyph_part_flags_t flags for the part
 *
 * Data type to hold information for a "part" component of a math-variant glyph.
 * Large variants for stretchable math glyphs (such as parentheses) can be constructed
 * on the fly from parts.
 *
 * Since: 1.3.3
 */
struct hb_ot_math_glyph_part_t
{
    hb_codepoint_t glyph;
    hb_position_t start_connector_length;
    hb_position_t end_connector_length;
    hb_position_t full_advance;
    hb_ot_math_glyph_part_flags_t flags;
}

/* Methods */

version(BindHB_Static)
    hb_bool_t hb_ot_math_has_data (hb_face_t* face);
else
{
    private alias fp_hb_ot_math_has_data = hb_bool_t function (hb_face_t* face);
    __gshared fp_hb_ot_math_has_data hb_ot_math_has_data;
}

version(BindHB_Static)
    hb_position_t hb_ot_math_get_constant (
        hb_font_t* font,
        hb_ot_math_constant_t constant);
else
{
    private alias fp_hb_ot_math_get_constant = hb_position_t function (
        hb_font_t* font,
        hb_ot_math_constant_t constant);
    __gshared fp_hb_ot_math_get_constant hb_ot_math_get_constant;
}

version(BindHB_Static)
    hb_position_t hb_ot_math_get_glyph_italics_correction (
        hb_font_t* font,
        hb_codepoint_t glyph);
else
{
    private alias fp_hb_ot_math_get_glyph_italics_correction = hb_position_t function (
        hb_font_t* font,
        hb_codepoint_t glyph);
    __gshared fp_hb_ot_math_get_glyph_italics_correction hb_ot_math_get_glyph_italics_correction;
}

version(BindHB_Static)
    hb_position_t hb_ot_math_get_glyph_top_accent_attachment (
        hb_font_t* font,
        hb_codepoint_t glyph);
else
{
    private alias fp_hb_ot_math_get_glyph_top_accent_attachment = hb_position_t function (
        hb_font_t* font,
        hb_codepoint_t glyph);
    __gshared fp_hb_ot_math_get_glyph_top_accent_attachment hb_ot_math_get_glyph_top_accent_attachment;
}

version(BindHB_Static)
    hb_bool_t hb_ot_math_is_glyph_extended_shape (
        hb_face_t* face,
        hb_codepoint_t glyph);
else
{
    private alias fp_hb_ot_math_is_glyph_extended_shape = hb_bool_t function (
        hb_face_t* face,
        hb_codepoint_t glyph);
    __gshared fp_hb_ot_math_is_glyph_extended_shape hb_ot_math_is_glyph_extended_shape;
}

version(BindHB_Static)
    hb_position_t hb_ot_math_get_glyph_kerning (
        hb_font_t* font,
        hb_codepoint_t glyph,
        hb_ot_math_kern_t kern,
        hb_position_t correction_height);
else
{
    private alias fp_hb_ot_math_get_glyph_kerning = hb_position_t function (
        hb_font_t* font,
        hb_codepoint_t glyph,
        hb_ot_math_kern_t kern,
        hb_position_t correction_height);
    __gshared fp_hb_ot_math_get_glyph_kerning hb_ot_math_get_glyph_kerning;
}

/* IN/OUT */
/* OUT */
version(BindHB_Static)
    uint hb_ot_math_get_glyph_variants (
        hb_font_t* font,
        hb_codepoint_t glyph,
        hb_direction_t direction,
        uint start_offset,
        uint* variants_count,
        hb_ot_math_glyph_variant_t* variants);
else
{
    private alias fp_hb_ot_math_get_glyph_variants = uint function (
        hb_font_t* font,
        hb_codepoint_t glyph,
        hb_direction_t direction,
        uint start_offset,
        uint* variants_count,
        hb_ot_math_glyph_variant_t* variants);
    __gshared fp_hb_ot_math_get_glyph_variants hb_ot_math_get_glyph_variants;
}

version(BindHB_Static)
    hb_position_t hb_ot_math_get_min_connector_overlap (
        hb_font_t* font,
        hb_direction_t direction);
else
{
    private alias fp_hb_ot_math_get_min_connector_overlap = hb_position_t function (
        hb_font_t* font,
        hb_direction_t direction);
    __gshared fp_hb_ot_math_get_min_connector_overlap hb_ot_math_get_min_connector_overlap;
}

/* IN/OUT */
/* OUT */
/* OUT */
version(BindHB_Static)
    uint hb_ot_math_get_glyph_assembly (
        hb_font_t* font,
        hb_codepoint_t glyph,
        hb_direction_t direction,
        uint start_offset,
        uint* parts_count,
        hb_ot_math_glyph_part_t* parts,
        hb_position_t* italics_correction);
else
{
    private alias fp_hb_ot_math_get_glyph_assembly = uint function (
        hb_font_t* font,
        hb_codepoint_t glyph,
        hb_direction_t direction,
        uint start_offset,
        uint* parts_count,
        hb_ot_math_glyph_part_t* parts,
        hb_position_t* italics_correction);
    __gshared fp_hb_ot_math_get_glyph_assembly hb_ot_math_get_glyph_assembly;
}
