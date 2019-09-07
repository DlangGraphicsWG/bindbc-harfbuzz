
//          Copyright Ahmet Sait 2019.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

module bindbc.hb.bind.deprecated_;

import bindbc.hb.bind.common;
import bindbc.hb.bind.buffer;
import bindbc.hb.bind.font;
import bindbc.hb.bind.set;
import bindbc.hb.bind.unicode;

extern(C) @nogc nothrow:

/**
 * SECTION:hb-deprecated
 * @title: hb-deprecated
 * @short_description: Deprecated API
 * @include: hb.h
 *
 * These API have been deprecated in favor of newer API, or because they
 * were deemed unnecessary.
 **/

// alias HB_SCRIPT_CANADIAN_ABORIGINAL = .HB_SCRIPT_CANADIAN_SYLLABICS;

// alias HB_BUFFER_FLAGS_DEFAULT = HB_BUFFER_FLAG_DEFAULT;
// alias HB_BUFFER_SERIALIZE_FLAGS_DEFAULT = HB_BUFFER_SERIALIZE_FLAG_DEFAULT;

alias hb_font_get_glyph_func_t = int function (
    hb_font_t* font,
    void* font_data,
    hb_codepoint_t unicode,
    hb_codepoint_t variation_selector,
    hb_codepoint_t* glyph,
    void* user_data);

version(BindHB_Static)
    void hb_font_funcs_set_glyph_func (
        hb_font_funcs_t* ffuncs,
        hb_font_get_glyph_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_font_funcs_set_glyph_func = void function (
        hb_font_funcs_t* ffuncs,
        hb_font_get_glyph_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_font_funcs_set_glyph_func hb_font_funcs_set_glyph_func;
}

version(BindHB_Static)
    void hb_set_invert (hb_set_t* set);
else
{
    private alias fp_hb_set_invert = void function (hb_set_t* set);
    __gshared fp_hb_set_invert hb_set_invert;
}

/**
 * hb_unicode_eastasian_width_func_t:
 *
 * Deprecated: 2.0.0
 */
alias hb_unicode_eastasian_width_func_t = uint function (
    hb_unicode_funcs_t* ufuncs,
    hb_codepoint_t unicode,
    void* user_data);

/**
 * hb_unicode_funcs_set_eastasian_width_func:
 * @ufuncs: a Unicode function structure
 * @func: (closure user_data) (destroy destroy) (scope notified):
 * @user_data:
 * @destroy:
 *
 *
 *
 * Since: 0.9.2
 * Deprecated: 2.0.0
 **/
version(BindHB_Static)
    void hb_unicode_funcs_set_eastasian_width_func (
        hb_unicode_funcs_t* ufuncs,
        hb_unicode_eastasian_width_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_unicode_funcs_set_eastasian_width_func = void function (
        hb_unicode_funcs_t* ufuncs,
        hb_unicode_eastasian_width_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_unicode_funcs_set_eastasian_width_func hb_unicode_funcs_set_eastasian_width_func;
}

/**
 * hb_unicode_eastasian_width:
 *
 * Since: 0.9.2
 * Deprecated: 2.0.0
 **/
version(BindHB_Static)
    uint hb_unicode_eastasian_width (
        hb_unicode_funcs_t* ufuncs,
        hb_codepoint_t unicode);
else
{
    private alias fp_hb_unicode_eastasian_width = uint function (
        hb_unicode_funcs_t* ufuncs,
        hb_codepoint_t unicode);
    __gshared fp_hb_unicode_eastasian_width hb_unicode_eastasian_width;
}

/**
 * hb_unicode_decompose_compatibility_func_t:
 * @ufuncs: a Unicode function structure
 * @u: codepoint to decompose
 * @decomposed: address of codepoint array (of length %HB_UNICODE_MAX_DECOMPOSITION_LEN) to write decomposition into
 * @user_data: user data pointer as passed to hb_unicode_funcs_set_decompose_compatibility_func()
 *
 * Fully decompose @u to its Unicode compatibility decomposition. The codepoints of the decomposition will be written to @decomposed.
 * The complete length of the decomposition will be returned.
 *
 * If @u has no compatibility decomposition, zero should be returned.
 *
 * The Unicode standard guarantees that a buffer of length %HB_UNICODE_MAX_DECOMPOSITION_LEN codepoints will always be sufficient for any
 * compatibility decomposition plus an terminating value of 0.  Consequently, @decompose must be allocated by the caller to be at least this length.  Implementations
 * of this function type must ensure that they do not write past the provided array.
 *
 * Return value: number of codepoints in the full compatibility decomposition of @u, or 0 if no decomposition available.
 *
 * Deprecated: 2.0.0
 */
alias hb_unicode_decompose_compatibility_func_t = uint function (
    hb_unicode_funcs_t* ufuncs,
    hb_codepoint_t u,
    hb_codepoint_t* decomposed,
    void* user_data);

/**
 * HB_UNICODE_MAX_DECOMPOSITION_LEN:
 *
 * See Unicode 6.1 for details on the maximum decomposition length.
 *
 * Deprecated: 2.0.0
 */
enum HB_UNICODE_MAX_DECOMPOSITION_LEN = 18 + 1; /* codepoints */

/**
 * hb_unicode_funcs_set_decompose_compatibility_func:
 * @ufuncs: a Unicode function structure
 * @func: (closure user_data) (destroy destroy) (scope notified):
 * @user_data:
 * @destroy:
 *
 *
 *
 * Since: 0.9.2
 * Deprecated: 2.0.0
 **/
version(BindHB_Static)
    void hb_unicode_funcs_set_decompose_compatibility_func (
        hb_unicode_funcs_t* ufuncs,
        hb_unicode_decompose_compatibility_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_unicode_funcs_set_decompose_compatibility_func = void function (
        hb_unicode_funcs_t* ufuncs,
        hb_unicode_decompose_compatibility_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_unicode_funcs_set_decompose_compatibility_func hb_unicode_funcs_set_decompose_compatibility_func;
}

version(BindHB_Static)
    uint hb_unicode_decompose_compatibility (
        hb_unicode_funcs_t* ufuncs,
        hb_codepoint_t u,
        hb_codepoint_t* decomposed);
else
{
    private alias fp_hb_unicode_decompose_compatibility = uint function (
        hb_unicode_funcs_t* ufuncs,
        hb_codepoint_t u,
        hb_codepoint_t* decomposed);
    __gshared fp_hb_unicode_decompose_compatibility hb_unicode_decompose_compatibility;
}

alias hb_font_get_glyph_v_kerning_func_t = int function ();

/**
 * hb_font_funcs_set_glyph_v_kerning_func:
 * @ffuncs: font functions.
 * @func: (closure user_data) (destroy destroy) (scope notified):
 * @user_data:
 * @destroy:
 *
 *
 *
 * Since: 0.9.2
 * Deprecated: 2.0.0
 **/
version(BindHB_Static)
    void hb_font_funcs_set_glyph_v_kerning_func (
        hb_font_funcs_t* ffuncs,
        hb_font_get_glyph_v_kerning_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_font_funcs_set_glyph_v_kerning_func = void function (
        hb_font_funcs_t* ffuncs,
        hb_font_get_glyph_v_kerning_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_font_funcs_set_glyph_v_kerning_func hb_font_funcs_set_glyph_v_kerning_func;
}

version(BindHB_Static)
    hb_position_t hb_font_get_glyph_v_kerning (
        hb_font_t* font,
        hb_codepoint_t top_glyph,
        hb_codepoint_t bottom_glyph);
else
{
    private alias fp_hb_font_get_glyph_v_kerning = hb_position_t function (
        hb_font_t* font,
        hb_codepoint_t top_glyph,
        hb_codepoint_t bottom_glyph);
    __gshared fp_hb_font_get_glyph_v_kerning hb_font_get_glyph_v_kerning;
}

/* HB_DEPRECATED_H */
