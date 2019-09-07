
//          Copyright Ahmet Sait 2019.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

module bindbc.hb.bind.font;

import bindbc.hb.bind.common;
import bindbc.hb.bind.face;

extern(C) @nogc nothrow:

struct hb_font_t;

/*
 * hb_font_funcs_t
 */

struct hb_font_funcs_t;

version(BindHB_Static)
    hb_font_funcs_t* hb_font_funcs_create ();
else
{
    private alias fp_hb_font_funcs_create = hb_font_funcs_t* function ();
    __gshared fp_hb_font_funcs_create hb_font_funcs_create;
}

version(BindHB_Static)
    hb_font_funcs_t* hb_font_funcs_get_empty ();
else
{
    private alias fp_hb_font_funcs_get_empty = hb_font_funcs_t* function ();
    __gshared fp_hb_font_funcs_get_empty hb_font_funcs_get_empty;
}

version(BindHB_Static)
    hb_font_funcs_t* hb_font_funcs_reference (hb_font_funcs_t* ffuncs);
else
{
    private alias fp_hb_font_funcs_reference = hb_font_funcs_t* function (hb_font_funcs_t* ffuncs);
    __gshared fp_hb_font_funcs_reference hb_font_funcs_reference;
}

version(BindHB_Static)
    void hb_font_funcs_destroy (hb_font_funcs_t* ffuncs);
else
{
    private alias fp_hb_font_funcs_destroy = void function (hb_font_funcs_t* ffuncs);
    __gshared fp_hb_font_funcs_destroy hb_font_funcs_destroy;
}

version(BindHB_Static)
    hb_bool_t hb_font_funcs_set_user_data (
        hb_font_funcs_t* ffuncs,
        hb_user_data_key_t* key,
        void* data,
        hb_destroy_func_t destroy,
        hb_bool_t replace);
else
{
    private alias fp_hb_font_funcs_set_user_data = hb_bool_t function (
        hb_font_funcs_t* ffuncs,
        hb_user_data_key_t* key,
        void* data,
        hb_destroy_func_t destroy,
        hb_bool_t replace);
    __gshared fp_hb_font_funcs_set_user_data hb_font_funcs_set_user_data;
}

version(BindHB_Static)
    void* hb_font_funcs_get_user_data (
        hb_font_funcs_t* ffuncs,
        hb_user_data_key_t* key);
else
{
    private alias fp_hb_font_funcs_get_user_data = void* function (
        hb_font_funcs_t* ffuncs,
        hb_user_data_key_t* key);
    __gshared fp_hb_font_funcs_get_user_data hb_font_funcs_get_user_data;
}

version(BindHB_Static)
    void hb_font_funcs_make_immutable (hb_font_funcs_t* ffuncs);
else
{
    private alias fp_hb_font_funcs_make_immutable = void function (hb_font_funcs_t* ffuncs);
    __gshared fp_hb_font_funcs_make_immutable hb_font_funcs_make_immutable;
}

version(BindHB_Static)
    hb_bool_t hb_font_funcs_is_immutable (hb_font_funcs_t* ffuncs);
else
{
    private alias fp_hb_font_funcs_is_immutable = hb_bool_t function (hb_font_funcs_t* ffuncs);
    __gshared fp_hb_font_funcs_is_immutable hb_font_funcs_is_immutable;
}

/* font and glyph extents */

/* Note that typically ascender is positive and descender negative in coordinate systems that grow up. */
struct hb_font_extents_t
{
    hb_position_t ascender; /* typographic ascender. */
    hb_position_t descender; /* typographic descender. */
    hb_position_t line_gap; /* suggested line spacing gap. */
    /*< private >*/
    hb_position_t reserved9;
    hb_position_t reserved8;
    hb_position_t reserved7;
    hb_position_t reserved6;
    hb_position_t reserved5;
    hb_position_t reserved4;
    hb_position_t reserved3;
    hb_position_t reserved2;
    hb_position_t reserved1;
}

/* Note that height is negative in coordinate systems that grow up. */
struct hb_glyph_extents_t
{
    hb_position_t x_bearing; /* left side of glyph from origin. */
    hb_position_t y_bearing; /* top side of glyph from origin. */
    hb_position_t width; /* distance from left to right side. */
    hb_position_t height; /* distance from top to bottom side. */
}

/* func types */

alias hb_font_get_font_extents_func_t = int function (
    hb_font_t* font,
    void* font_data,
    hb_font_extents_t* extents,
    void* user_data);
alias hb_font_get_font_h_extents_func_t = int function ();
alias hb_font_get_font_v_extents_func_t = int function ();

alias hb_font_get_nominal_glyph_func_t = int function (
    hb_font_t* font,
    void* font_data,
    hb_codepoint_t unicode,
    hb_codepoint_t* glyph,
    void* user_data);
alias hb_font_get_variation_glyph_func_t = int function (
    hb_font_t* font,
    void* font_data,
    hb_codepoint_t unicode,
    hb_codepoint_t variation_selector,
    hb_codepoint_t* glyph,
    void* user_data);

alias hb_font_get_nominal_glyphs_func_t = uint function (
    hb_font_t* font,
    void* font_data,
    uint count,
    const(hb_codepoint_t)* first_unicode,
    uint unicode_stride,
    hb_codepoint_t* first_glyph,
    uint glyph_stride,
    void* user_data);

alias hb_font_get_glyph_advance_func_t = int function (
    hb_font_t* font,
    void* font_data,
    hb_codepoint_t glyph,
    void* user_data);
alias hb_font_get_glyph_h_advance_func_t = int function ();
alias hb_font_get_glyph_v_advance_func_t = int function ();

alias hb_font_get_glyph_advances_func_t = void function (
    hb_font_t* font,
    void* font_data,
    uint count,
    const(hb_codepoint_t)* first_glyph,
    uint glyph_stride,
    hb_position_t* first_advance,
    uint advance_stride,
    void* user_data);
alias hb_font_get_glyph_h_advances_func_t = void function ();
alias hb_font_get_glyph_v_advances_func_t = void function ();

alias hb_font_get_glyph_origin_func_t = int function (
    hb_font_t* font,
    void* font_data,
    hb_codepoint_t glyph,
    hb_position_t* x,
    hb_position_t* y,
    void* user_data);
alias hb_font_get_glyph_h_origin_func_t = int function ();
alias hb_font_get_glyph_v_origin_func_t = int function ();

alias hb_font_get_glyph_kerning_func_t = int function (
    hb_font_t* font,
    void* font_data,
    hb_codepoint_t first_glyph,
    hb_codepoint_t second_glyph,
    void* user_data);
alias hb_font_get_glyph_h_kerning_func_t = int function ();

alias hb_font_get_glyph_extents_func_t = int function (
    hb_font_t* font,
    void* font_data,
    hb_codepoint_t glyph,
    hb_glyph_extents_t* extents,
    void* user_data);
alias hb_font_get_glyph_contour_point_func_t = int function (
    hb_font_t* font,
    void* font_data,
    hb_codepoint_t glyph,
    uint point_index,
    hb_position_t* x,
    hb_position_t* y,
    void* user_data);

alias hb_font_get_glyph_name_func_t = int function (
    hb_font_t* font,
    void* font_data,
    hb_codepoint_t glyph,
    char* name,
    uint size,
    void* user_data);

/* -1 means nul-terminated */
alias hb_font_get_glyph_from_name_func_t = int function (
    hb_font_t* font,
    void* font_data,
    const(char)* name,
    int len,
    hb_codepoint_t* glyph,
    void* user_data);

/* func setters */

/**
 * hb_font_funcs_set_font_h_extents_func:
 * @ffuncs: font functions.
 * @func: (closure user_data) (destroy destroy) (scope notified):
 * @user_data:
 * @destroy:
 *
 *
 *
 * Since: 1.1.2
 **/
version(BindHB_Static)
    void hb_font_funcs_set_font_h_extents_func (
        hb_font_funcs_t* ffuncs,
        hb_font_get_font_h_extents_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_font_funcs_set_font_h_extents_func = void function (
        hb_font_funcs_t* ffuncs,
        hb_font_get_font_h_extents_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_font_funcs_set_font_h_extents_func hb_font_funcs_set_font_h_extents_func;
}

/**
 * hb_font_funcs_set_font_v_extents_func:
 * @ffuncs: font functions.
 * @func: (closure user_data) (destroy destroy) (scope notified):
 * @user_data:
 * @destroy:
 *
 *
 *
 * Since: 1.1.2
 **/
version(BindHB_Static)
    void hb_font_funcs_set_font_v_extents_func (
        hb_font_funcs_t* ffuncs,
        hb_font_get_font_v_extents_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_font_funcs_set_font_v_extents_func = void function (
        hb_font_funcs_t* ffuncs,
        hb_font_get_font_v_extents_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_font_funcs_set_font_v_extents_func hb_font_funcs_set_font_v_extents_func;
}

/**
 * hb_font_funcs_set_nominal_glyph_func:
 * @ffuncs: font functions.
 * @func: (closure user_data) (destroy destroy) (scope notified):
 * @user_data:
 * @destroy:
 *
 *
 *
 * Since: 1.2.3
 **/
version(BindHB_Static)
    void hb_font_funcs_set_nominal_glyph_func (
        hb_font_funcs_t* ffuncs,
        hb_font_get_nominal_glyph_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_font_funcs_set_nominal_glyph_func = void function (
        hb_font_funcs_t* ffuncs,
        hb_font_get_nominal_glyph_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_font_funcs_set_nominal_glyph_func hb_font_funcs_set_nominal_glyph_func;
}

/**
 * hb_font_funcs_set_nominal_glyphs_func:
 * @ffuncs: font functions.
 * @func: (closure user_data) (destroy destroy) (scope notified):
 * @user_data:
 * @destroy:
 *
 *
 *
 * Since: 2.0.0
 **/
version(BindHB_Static)
    void hb_font_funcs_set_nominal_glyphs_func (
        hb_font_funcs_t* ffuncs,
        hb_font_get_nominal_glyphs_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_font_funcs_set_nominal_glyphs_func = void function (
        hb_font_funcs_t* ffuncs,
        hb_font_get_nominal_glyphs_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_font_funcs_set_nominal_glyphs_func hb_font_funcs_set_nominal_glyphs_func;
}

/**
 * hb_font_funcs_set_variation_glyph_func:
 * @ffuncs: font functions.
 * @func: (closure user_data) (destroy destroy) (scope notified):
 * @user_data:
 * @destroy:
 *
 *
 *
 * Since: 1.2.3
 **/
version(BindHB_Static)
    void hb_font_funcs_set_variation_glyph_func (
        hb_font_funcs_t* ffuncs,
        hb_font_get_variation_glyph_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_font_funcs_set_variation_glyph_func = void function (
        hb_font_funcs_t* ffuncs,
        hb_font_get_variation_glyph_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_font_funcs_set_variation_glyph_func hb_font_funcs_set_variation_glyph_func;
}

/**
 * hb_font_funcs_set_glyph_h_advance_func:
 * @ffuncs: font functions.
 * @func: (closure user_data) (destroy destroy) (scope notified):
 * @user_data:
 * @destroy:
 *
 *
 *
 * Since: 0.9.2
 **/
version(BindHB_Static)
    void hb_font_funcs_set_glyph_h_advance_func (
        hb_font_funcs_t* ffuncs,
        hb_font_get_glyph_h_advance_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_font_funcs_set_glyph_h_advance_func = void function (
        hb_font_funcs_t* ffuncs,
        hb_font_get_glyph_h_advance_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_font_funcs_set_glyph_h_advance_func hb_font_funcs_set_glyph_h_advance_func;
}

/**
 * hb_font_funcs_set_glyph_v_advance_func:
 * @ffuncs: font functions.
 * @func: (closure user_data) (destroy destroy) (scope notified):
 * @user_data:
 * @destroy:
 *
 *
 *
 * Since: 0.9.2
 **/
version(BindHB_Static)
    void hb_font_funcs_set_glyph_v_advance_func (
        hb_font_funcs_t* ffuncs,
        hb_font_get_glyph_v_advance_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_font_funcs_set_glyph_v_advance_func = void function (
        hb_font_funcs_t* ffuncs,
        hb_font_get_glyph_v_advance_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_font_funcs_set_glyph_v_advance_func hb_font_funcs_set_glyph_v_advance_func;
}

/**
 * hb_font_funcs_set_glyph_h_advances_func:
 * @ffuncs: font functions.
 * @func: (closure user_data) (destroy destroy) (scope notified):
 * @user_data:
 * @destroy:
 *
 *
 *
 * Since: 1.8.6
 **/
version(BindHB_Static)
    void hb_font_funcs_set_glyph_h_advances_func (
        hb_font_funcs_t* ffuncs,
        hb_font_get_glyph_h_advances_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_font_funcs_set_glyph_h_advances_func = void function (
        hb_font_funcs_t* ffuncs,
        hb_font_get_glyph_h_advances_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_font_funcs_set_glyph_h_advances_func hb_font_funcs_set_glyph_h_advances_func;
}

/**
 * hb_font_funcs_set_glyph_v_advances_func:
 * @ffuncs: font functions.
 * @func: (closure user_data) (destroy destroy) (scope notified):
 * @user_data:
 * @destroy:
 *
 *
 *
 * Since: 1.8.6
 **/
version(BindHB_Static)
    void hb_font_funcs_set_glyph_v_advances_func (
        hb_font_funcs_t* ffuncs,
        hb_font_get_glyph_v_advances_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_font_funcs_set_glyph_v_advances_func = void function (
        hb_font_funcs_t* ffuncs,
        hb_font_get_glyph_v_advances_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_font_funcs_set_glyph_v_advances_func hb_font_funcs_set_glyph_v_advances_func;
}

/**
 * hb_font_funcs_set_glyph_h_origin_func:
 * @ffuncs: font functions.
 * @func: (closure user_data) (destroy destroy) (scope notified):
 * @user_data:
 * @destroy:
 *
 *
 *
 * Since: 0.9.2
 **/
version(BindHB_Static)
    void hb_font_funcs_set_glyph_h_origin_func (
        hb_font_funcs_t* ffuncs,
        hb_font_get_glyph_h_origin_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_font_funcs_set_glyph_h_origin_func = void function (
        hb_font_funcs_t* ffuncs,
        hb_font_get_glyph_h_origin_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_font_funcs_set_glyph_h_origin_func hb_font_funcs_set_glyph_h_origin_func;
}

/**
 * hb_font_funcs_set_glyph_v_origin_func:
 * @ffuncs: font functions.
 * @func: (closure user_data) (destroy destroy) (scope notified):
 * @user_data:
 * @destroy:
 *
 *
 *
 * Since: 0.9.2
 **/
version(BindHB_Static)
    void hb_font_funcs_set_glyph_v_origin_func (
        hb_font_funcs_t* ffuncs,
        hb_font_get_glyph_v_origin_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_font_funcs_set_glyph_v_origin_func = void function (
        hb_font_funcs_t* ffuncs,
        hb_font_get_glyph_v_origin_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_font_funcs_set_glyph_v_origin_func hb_font_funcs_set_glyph_v_origin_func;
}

/**
 * hb_font_funcs_set_glyph_h_kerning_func:
 * @ffuncs: font functions.
 * @func: (closure user_data) (destroy destroy) (scope notified):
 * @user_data:
 * @destroy:
 *
 *
 *
 * Since: 0.9.2
 **/
version(BindHB_Static)
    void hb_font_funcs_set_glyph_h_kerning_func (
        hb_font_funcs_t* ffuncs,
        hb_font_get_glyph_h_kerning_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_font_funcs_set_glyph_h_kerning_func = void function (
        hb_font_funcs_t* ffuncs,
        hb_font_get_glyph_h_kerning_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_font_funcs_set_glyph_h_kerning_func hb_font_funcs_set_glyph_h_kerning_func;
}

/**
 * hb_font_funcs_set_glyph_extents_func:
 * @ffuncs: font functions.
 * @func: (closure user_data) (destroy destroy) (scope notified):
 * @user_data:
 * @destroy:
 *
 *
 *
 * Since: 0.9.2
 **/
version(BindHB_Static)
    void hb_font_funcs_set_glyph_extents_func (
        hb_font_funcs_t* ffuncs,
        hb_font_get_glyph_extents_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_font_funcs_set_glyph_extents_func = void function (
        hb_font_funcs_t* ffuncs,
        hb_font_get_glyph_extents_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_font_funcs_set_glyph_extents_func hb_font_funcs_set_glyph_extents_func;
}

/**
 * hb_font_funcs_set_glyph_contour_point_func:
 * @ffuncs: font functions.
 * @func: (closure user_data) (destroy destroy) (scope notified):
 * @user_data:
 * @destroy:
 *
 *
 *
 * Since: 0.9.2
 **/
version(BindHB_Static)
    void hb_font_funcs_set_glyph_contour_point_func (
        hb_font_funcs_t* ffuncs,
        hb_font_get_glyph_contour_point_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_font_funcs_set_glyph_contour_point_func = void function (
        hb_font_funcs_t* ffuncs,
        hb_font_get_glyph_contour_point_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_font_funcs_set_glyph_contour_point_func hb_font_funcs_set_glyph_contour_point_func;
}

/**
 * hb_font_funcs_set_glyph_name_func:
 * @ffuncs: font functions.
 * @func: (closure user_data) (destroy destroy) (scope notified):
 * @user_data:
 * @destroy:
 *
 *
 *
 * Since: 0.9.2
 **/
version(BindHB_Static)
    void hb_font_funcs_set_glyph_name_func (
        hb_font_funcs_t* ffuncs,
        hb_font_get_glyph_name_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_font_funcs_set_glyph_name_func = void function (
        hb_font_funcs_t* ffuncs,
        hb_font_get_glyph_name_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_font_funcs_set_glyph_name_func hb_font_funcs_set_glyph_name_func;
}

/**
 * hb_font_funcs_set_glyph_from_name_func:
 * @ffuncs: font functions.
 * @func: (closure user_data) (destroy destroy) (scope notified):
 * @user_data:
 * @destroy:
 *
 *
 *
 * Since: 0.9.2
 **/
version(BindHB_Static)
    void hb_font_funcs_set_glyph_from_name_func (
        hb_font_funcs_t* ffuncs,
        hb_font_get_glyph_from_name_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_font_funcs_set_glyph_from_name_func = void function (
        hb_font_funcs_t* ffuncs,
        hb_font_get_glyph_from_name_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_font_funcs_set_glyph_from_name_func hb_font_funcs_set_glyph_from_name_func;
}

/* func dispatch */

version(BindHB_Static)
    hb_bool_t hb_font_get_h_extents (hb_font_t* font, hb_font_extents_t* extents);
else
{
    private alias fp_hb_font_get_h_extents = hb_bool_t function (hb_font_t* font, hb_font_extents_t* extents);
    __gshared fp_hb_font_get_h_extents hb_font_get_h_extents;
}
version(BindHB_Static)
    hb_bool_t hb_font_get_v_extents (hb_font_t* font, hb_font_extents_t* extents);
else
{
    private alias fp_hb_font_get_v_extents = hb_bool_t function (hb_font_t* font, hb_font_extents_t* extents);
    __gshared fp_hb_font_get_v_extents hb_font_get_v_extents;
}

version(BindHB_Static)
    hb_bool_t hb_font_get_nominal_glyph (
        hb_font_t* font,
        hb_codepoint_t unicode,
        hb_codepoint_t* glyph);
else
{
    private alias fp_hb_font_get_nominal_glyph = hb_bool_t function (
        hb_font_t* font,
        hb_codepoint_t unicode,
        hb_codepoint_t* glyph);
    __gshared fp_hb_font_get_nominal_glyph hb_font_get_nominal_glyph;
}
version(BindHB_Static)
    hb_bool_t hb_font_get_variation_glyph (
        hb_font_t* font,
        hb_codepoint_t unicode,
        hb_codepoint_t variation_selector,
        hb_codepoint_t* glyph);
else
{
    private alias fp_hb_font_get_variation_glyph = hb_bool_t function (
        hb_font_t* font,
        hb_codepoint_t unicode,
        hb_codepoint_t variation_selector,
        hb_codepoint_t* glyph);
    __gshared fp_hb_font_get_variation_glyph hb_font_get_variation_glyph;
}

version(BindHB_Static)
    hb_position_t hb_font_get_glyph_h_advance (
        hb_font_t* font,
        hb_codepoint_t glyph);
else
{
    private alias fp_hb_font_get_glyph_h_advance = hb_position_t function (
        hb_font_t* font,
        hb_codepoint_t glyph);
    __gshared fp_hb_font_get_glyph_h_advance hb_font_get_glyph_h_advance;
}
version(BindHB_Static)
    hb_position_t hb_font_get_glyph_v_advance (
        hb_font_t* font,
        hb_codepoint_t glyph);
else
{
    private alias fp_hb_font_get_glyph_v_advance = hb_position_t function (
        hb_font_t* font,
        hb_codepoint_t glyph);
    __gshared fp_hb_font_get_glyph_v_advance hb_font_get_glyph_v_advance;
}

version(BindHB_Static)
    void hb_font_get_glyph_h_advances (
        hb_font_t* font,
        uint count,
        const(hb_codepoint_t)* first_glyph,
        uint glyph_stride,
        hb_position_t* first_advance,
        uint advance_stride);
else
{
    private alias fp_hb_font_get_glyph_h_advances = void function (
        hb_font_t* font,
        uint count,
        const(hb_codepoint_t)* first_glyph,
        uint glyph_stride,
        hb_position_t* first_advance,
        uint advance_stride);
    __gshared fp_hb_font_get_glyph_h_advances hb_font_get_glyph_h_advances;
}
version(BindHB_Static)
    void hb_font_get_glyph_v_advances (
        hb_font_t* font,
        uint count,
        const(hb_codepoint_t)* first_glyph,
        uint glyph_stride,
        hb_position_t* first_advance,
        uint advance_stride);
else
{
    private alias fp_hb_font_get_glyph_v_advances = void function (
        hb_font_t* font,
        uint count,
        const(hb_codepoint_t)* first_glyph,
        uint glyph_stride,
        hb_position_t* first_advance,
        uint advance_stride);
    __gshared fp_hb_font_get_glyph_v_advances hb_font_get_glyph_v_advances;
}

version(BindHB_Static)
    hb_bool_t hb_font_get_glyph_h_origin (
        hb_font_t* font,
        hb_codepoint_t glyph,
        hb_position_t* x,
        hb_position_t* y);
else
{
    private alias fp_hb_font_get_glyph_h_origin = hb_bool_t function (
        hb_font_t* font,
        hb_codepoint_t glyph,
        hb_position_t* x,
        hb_position_t* y);
    __gshared fp_hb_font_get_glyph_h_origin hb_font_get_glyph_h_origin;
}
version(BindHB_Static)
    hb_bool_t hb_font_get_glyph_v_origin (
        hb_font_t* font,
        hb_codepoint_t glyph,
        hb_position_t* x,
        hb_position_t* y);
else
{
    private alias fp_hb_font_get_glyph_v_origin = hb_bool_t function (
        hb_font_t* font,
        hb_codepoint_t glyph,
        hb_position_t* x,
        hb_position_t* y);
    __gshared fp_hb_font_get_glyph_v_origin hb_font_get_glyph_v_origin;
}

version(BindHB_Static)
    hb_position_t hb_font_get_glyph_h_kerning (
        hb_font_t* font,
        hb_codepoint_t left_glyph,
        hb_codepoint_t right_glyph);
else
{
    private alias fp_hb_font_get_glyph_h_kerning = hb_position_t function (
        hb_font_t* font,
        hb_codepoint_t left_glyph,
        hb_codepoint_t right_glyph);
    __gshared fp_hb_font_get_glyph_h_kerning hb_font_get_glyph_h_kerning;
}

version(BindHB_Static)
    hb_bool_t hb_font_get_glyph_extents (
        hb_font_t* font,
        hb_codepoint_t glyph,
        hb_glyph_extents_t* extents);
else
{
    private alias fp_hb_font_get_glyph_extents = hb_bool_t function (
        hb_font_t* font,
        hb_codepoint_t glyph,
        hb_glyph_extents_t* extents);
    __gshared fp_hb_font_get_glyph_extents hb_font_get_glyph_extents;
}

version(BindHB_Static)
    hb_bool_t hb_font_get_glyph_contour_point (
        hb_font_t* font,
        hb_codepoint_t glyph,
        uint point_index,
        hb_position_t* x,
        hb_position_t* y);
else
{
    private alias fp_hb_font_get_glyph_contour_point = hb_bool_t function (
        hb_font_t* font,
        hb_codepoint_t glyph,
        uint point_index,
        hb_position_t* x,
        hb_position_t* y);
    __gshared fp_hb_font_get_glyph_contour_point hb_font_get_glyph_contour_point;
}

version(BindHB_Static)
    hb_bool_t hb_font_get_glyph_name (
        hb_font_t* font,
        hb_codepoint_t glyph,
        char* name,
        uint size);
else
{
    private alias fp_hb_font_get_glyph_name = hb_bool_t function (
        hb_font_t* font,
        hb_codepoint_t glyph,
        char* name,
        uint size);
    __gshared fp_hb_font_get_glyph_name hb_font_get_glyph_name;
}

/* -1 means nul-terminated */
version(BindHB_Static)
    hb_bool_t hb_font_get_glyph_from_name (
        hb_font_t* font,
        const(char)* name,
        int len,
        hb_codepoint_t* glyph);
else
{
    private alias fp_hb_font_get_glyph_from_name = hb_bool_t function (
        hb_font_t* font,
        const(char)* name,
        int len,
        hb_codepoint_t* glyph);
    __gshared fp_hb_font_get_glyph_from_name hb_font_get_glyph_from_name;
}

/* high-level funcs, with fallback */

/* Calls either hb_font_get_nominal_glyph() if variation_selector is 0,
 * otherwise calls hb_font_get_variation_glyph(). */
version(BindHB_Static)
    hb_bool_t hb_font_get_glyph (
        hb_font_t* font,
        hb_codepoint_t unicode,
        hb_codepoint_t variation_selector,
        hb_codepoint_t* glyph);
else
{
    private alias fp_hb_font_get_glyph = hb_bool_t function (
        hb_font_t* font,
        hb_codepoint_t unicode,
        hb_codepoint_t variation_selector,
        hb_codepoint_t* glyph);
    __gshared fp_hb_font_get_glyph hb_font_get_glyph;
}

version(BindHB_Static)
    void hb_font_get_extents_for_direction (
        hb_font_t* font,
        hb_direction_t direction,
        hb_font_extents_t* extents);
else
{
    private alias fp_hb_font_get_extents_for_direction = void function (
        hb_font_t* font,
        hb_direction_t direction,
        hb_font_extents_t* extents);
    __gshared fp_hb_font_get_extents_for_direction hb_font_get_extents_for_direction;
}
version(BindHB_Static)
    void hb_font_get_glyph_advance_for_direction (
        hb_font_t* font,
        hb_codepoint_t glyph,
        hb_direction_t direction,
        hb_position_t* x,
        hb_position_t* y);
else
{
    private alias fp_hb_font_get_glyph_advance_for_direction = void function (
        hb_font_t* font,
        hb_codepoint_t glyph,
        hb_direction_t direction,
        hb_position_t* x,
        hb_position_t* y);
    __gshared fp_hb_font_get_glyph_advance_for_direction hb_font_get_glyph_advance_for_direction;
}
version(BindHB_Static)
    void hb_font_get_glyph_advances_for_direction (
        hb_font_t* font,
        hb_direction_t direction,
        uint count,
        const(hb_codepoint_t)* first_glyph,
        uint glyph_stride,
        hb_position_t* first_advance,
        uint advance_stride);
else
{
    private alias fp_hb_font_get_glyph_advances_for_direction = void function (
        hb_font_t* font,
        hb_direction_t direction,
        uint count,
        const(hb_codepoint_t)* first_glyph,
        uint glyph_stride,
        hb_position_t* first_advance,
        uint advance_stride);
    __gshared fp_hb_font_get_glyph_advances_for_direction hb_font_get_glyph_advances_for_direction;
}
version(BindHB_Static)
    void hb_font_get_glyph_origin_for_direction (
        hb_font_t* font,
        hb_codepoint_t glyph,
        hb_direction_t direction,
        hb_position_t* x,
        hb_position_t* y);
else
{
    private alias fp_hb_font_get_glyph_origin_for_direction = void function (
        hb_font_t* font,
        hb_codepoint_t glyph,
        hb_direction_t direction,
        hb_position_t* x,
        hb_position_t* y);
    __gshared fp_hb_font_get_glyph_origin_for_direction hb_font_get_glyph_origin_for_direction;
}
version(BindHB_Static)
    void hb_font_add_glyph_origin_for_direction (
        hb_font_t* font,
        hb_codepoint_t glyph,
        hb_direction_t direction,
        hb_position_t* x,
        hb_position_t* y);
else
{
    private alias fp_hb_font_add_glyph_origin_for_direction = void function (
        hb_font_t* font,
        hb_codepoint_t glyph,
        hb_direction_t direction,
        hb_position_t* x,
        hb_position_t* y);
    __gshared fp_hb_font_add_glyph_origin_for_direction hb_font_add_glyph_origin_for_direction;
}
version(BindHB_Static)
    void hb_font_subtract_glyph_origin_for_direction (
        hb_font_t* font,
        hb_codepoint_t glyph,
        hb_direction_t direction,
        hb_position_t* x,
        hb_position_t* y);
else
{
    private alias fp_hb_font_subtract_glyph_origin_for_direction = void function (
        hb_font_t* font,
        hb_codepoint_t glyph,
        hb_direction_t direction,
        hb_position_t* x,
        hb_position_t* y);
    __gshared fp_hb_font_subtract_glyph_origin_for_direction hb_font_subtract_glyph_origin_for_direction;
}

version(BindHB_Static)
    void hb_font_get_glyph_kerning_for_direction (
        hb_font_t* font,
        hb_codepoint_t first_glyph,
        hb_codepoint_t second_glyph,
        hb_direction_t direction,
        hb_position_t* x,
        hb_position_t* y);
else
{
    private alias fp_hb_font_get_glyph_kerning_for_direction = void function (
        hb_font_t* font,
        hb_codepoint_t first_glyph,
        hb_codepoint_t second_glyph,
        hb_direction_t direction,
        hb_position_t* x,
        hb_position_t* y);
    __gshared fp_hb_font_get_glyph_kerning_for_direction hb_font_get_glyph_kerning_for_direction;
}

version(BindHB_Static)
    hb_bool_t hb_font_get_glyph_extents_for_origin (
        hb_font_t* font,
        hb_codepoint_t glyph,
        hb_direction_t direction,
        hb_glyph_extents_t* extents);
else
{
    private alias fp_hb_font_get_glyph_extents_for_origin = hb_bool_t function (
        hb_font_t* font,
        hb_codepoint_t glyph,
        hb_direction_t direction,
        hb_glyph_extents_t* extents);
    __gshared fp_hb_font_get_glyph_extents_for_origin hb_font_get_glyph_extents_for_origin;
}

version(BindHB_Static)
    hb_bool_t hb_font_get_glyph_contour_point_for_origin (
        hb_font_t* font,
        hb_codepoint_t glyph,
        uint point_index,
        hb_direction_t direction,
        hb_position_t* x,
        hb_position_t* y);
else
{
    private alias fp_hb_font_get_glyph_contour_point_for_origin = hb_bool_t function (
        hb_font_t* font,
        hb_codepoint_t glyph,
        uint point_index,
        hb_direction_t direction,
        hb_position_t* x,
        hb_position_t* y);
    __gshared fp_hb_font_get_glyph_contour_point_for_origin hb_font_get_glyph_contour_point_for_origin;
}

/* Generates gidDDD if glyph has no name. */
version(BindHB_Static)
    void hb_font_glyph_to_string (
        hb_font_t* font,
        hb_codepoint_t glyph,
        char* s,
        uint size);
else
{
    private alias fp_hb_font_glyph_to_string = void function (
        hb_font_t* font,
        hb_codepoint_t glyph,
        char* s,
        uint size);
    __gshared fp_hb_font_glyph_to_string hb_font_glyph_to_string;
}
/* Parses gidDDD and uniUUUU strings automatically. */

/* -1 means nul-terminated */
version(BindHB_Static)
    hb_bool_t hb_font_glyph_from_string (
        hb_font_t* font,
        const(char)* s,
        int len,
        hb_codepoint_t* glyph);
else
{
    private alias fp_hb_font_glyph_from_string = hb_bool_t function (
        hb_font_t* font,
        const(char)* s,
        int len,
        hb_codepoint_t* glyph);
    __gshared fp_hb_font_glyph_from_string hb_font_glyph_from_string;
}

/*
 * hb_font_t
 */

/* Fonts are very light-weight objects */

version(BindHB_Static)
    hb_font_t* hb_font_create (hb_face_t* face);
else
{
    private alias fp_hb_font_create = hb_font_t* function (hb_face_t* face);
    __gshared fp_hb_font_create hb_font_create;
}

version(BindHB_Static)
    hb_font_t* hb_font_create_sub_font (hb_font_t* parent);
else
{
    private alias fp_hb_font_create_sub_font = hb_font_t* function (hb_font_t* parent);
    __gshared fp_hb_font_create_sub_font hb_font_create_sub_font;
}

version(BindHB_Static)
    hb_font_t* hb_font_get_empty ();
else
{
    private alias fp_hb_font_get_empty = hb_font_t* function ();
    __gshared fp_hb_font_get_empty hb_font_get_empty;
}

version(BindHB_Static)
    hb_font_t* hb_font_reference (hb_font_t* font);
else
{
    private alias fp_hb_font_reference = hb_font_t* function (hb_font_t* font);
    __gshared fp_hb_font_reference hb_font_reference;
}

version(BindHB_Static)
    void hb_font_destroy (hb_font_t* font);
else
{
    private alias fp_hb_font_destroy = void function (hb_font_t* font);
    __gshared fp_hb_font_destroy hb_font_destroy;
}

version(BindHB_Static)
    hb_bool_t hb_font_set_user_data (
        hb_font_t* font,
        hb_user_data_key_t* key,
        void* data,
        hb_destroy_func_t destroy,
        hb_bool_t replace);
else
{
    private alias fp_hb_font_set_user_data = hb_bool_t function (
        hb_font_t* font,
        hb_user_data_key_t* key,
        void* data,
        hb_destroy_func_t destroy,
        hb_bool_t replace);
    __gshared fp_hb_font_set_user_data hb_font_set_user_data;
}

version(BindHB_Static)
    void* hb_font_get_user_data (hb_font_t* font, hb_user_data_key_t* key);
else
{
    private alias fp_hb_font_get_user_data = void* function (hb_font_t* font, hb_user_data_key_t* key);
    __gshared fp_hb_font_get_user_data hb_font_get_user_data;
}

version(BindHB_Static)
    void hb_font_make_immutable (hb_font_t* font);
else
{
    private alias fp_hb_font_make_immutable = void function (hb_font_t* font);
    __gshared fp_hb_font_make_immutable hb_font_make_immutable;
}

version(BindHB_Static)
    hb_bool_t hb_font_is_immutable (hb_font_t* font);
else
{
    private alias fp_hb_font_is_immutable = hb_bool_t function (hb_font_t* font);
    __gshared fp_hb_font_is_immutable hb_font_is_immutable;
}

version(BindHB_Static)
    void hb_font_set_parent (hb_font_t* font, hb_font_t* parent);
else
{
    private alias fp_hb_font_set_parent = void function (hb_font_t* font, hb_font_t* parent);
    __gshared fp_hb_font_set_parent hb_font_set_parent;
}

version(BindHB_Static)
    hb_font_t* hb_font_get_parent (hb_font_t* font);
else
{
    private alias fp_hb_font_get_parent = hb_font_t* function (hb_font_t* font);
    __gshared fp_hb_font_get_parent hb_font_get_parent;
}

version(BindHB_Static)
    void hb_font_set_face (hb_font_t* font, hb_face_t* face);
else
{
    private alias fp_hb_font_set_face = void function (hb_font_t* font, hb_face_t* face);
    __gshared fp_hb_font_set_face hb_font_set_face;
}

version(BindHB_Static)
    hb_face_t* hb_font_get_face (hb_font_t* font);
else
{
    private alias fp_hb_font_get_face = hb_face_t* function (hb_font_t* font);
    __gshared fp_hb_font_get_face hb_font_get_face;
}

version(BindHB_Static)
    void hb_font_set_funcs (
        hb_font_t* font,
        hb_font_funcs_t* klass,
        void* font_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_font_set_funcs = void function (
        hb_font_t* font,
        hb_font_funcs_t* klass,
        void* font_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_font_set_funcs hb_font_set_funcs;
}

/* Be *very* careful with this function! */
version(BindHB_Static)
    void hb_font_set_funcs_data (
        hb_font_t* font,
        void* font_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_font_set_funcs_data = void function (
        hb_font_t* font,
        void* font_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_font_set_funcs_data hb_font_set_funcs_data;
}

version(BindHB_Static)
    void hb_font_set_scale (hb_font_t* font, int x_scale, int y_scale);
else
{
    private alias fp_hb_font_set_scale = void function (hb_font_t* font, int x_scale, int y_scale);
    __gshared fp_hb_font_set_scale hb_font_set_scale;
}

version(BindHB_Static)
    void hb_font_get_scale (hb_font_t* font, int* x_scale, int* y_scale);
else
{
    private alias fp_hb_font_get_scale = void function (hb_font_t* font, int* x_scale, int* y_scale);
    __gshared fp_hb_font_get_scale hb_font_get_scale;
}

/*
 * A zero value means "no hinting in that direction"
 */
version(BindHB_Static)
    void hb_font_set_ppem (hb_font_t* font, uint x_ppem, uint y_ppem);
else
{
    private alias fp_hb_font_set_ppem = void function (hb_font_t* font, uint x_ppem, uint y_ppem);
    __gshared fp_hb_font_set_ppem hb_font_set_ppem;
}

version(BindHB_Static)
    void hb_font_get_ppem (hb_font_t* font, uint* x_ppem, uint* y_ppem);
else
{
    private alias fp_hb_font_get_ppem = void function (hb_font_t* font, uint* x_ppem, uint* y_ppem);
    __gshared fp_hb_font_get_ppem hb_font_get_ppem;
}

/*
 * Point size per EM.  Used for optical-sizing in CoreText.
 * A value of zero means "not set".
 */
version(BindHB_Static)
    void hb_font_set_ptem (hb_font_t* font, float ptem);
else
{
    private alias fp_hb_font_set_ptem = void function (hb_font_t* font, float ptem);
    __gshared fp_hb_font_set_ptem hb_font_set_ptem;
}

version(BindHB_Static)
    float hb_font_get_ptem (hb_font_t* font);
else
{
    private alias fp_hb_font_get_ptem = float function (hb_font_t* font);
    __gshared fp_hb_font_get_ptem hb_font_get_ptem;
}

version(BindHB_Static)
    void hb_font_set_variations (
        hb_font_t* font,
        const(hb_variation_t)* variations,
        uint variations_length);
else
{
    private alias fp_hb_font_set_variations = void function (
        hb_font_t* font,
        const(hb_variation_t)* variations,
        uint variations_length);
    __gshared fp_hb_font_set_variations hb_font_set_variations;
}

version(BindHB_Static)
    void hb_font_set_var_coords_design (
        hb_font_t* font,
        const(float)* coords,
        uint coords_length);
else
{
    private alias fp_hb_font_set_var_coords_design = void function (
        hb_font_t* font,
        const(float)* coords,
        uint coords_length);
    __gshared fp_hb_font_set_var_coords_design hb_font_set_var_coords_design;
}

/* 2.14 normalized */
version(BindHB_Static)
    void hb_font_set_var_coords_normalized (
        hb_font_t* font,
        const(int)* coords,
        uint coords_length);
else
{
    private alias fp_hb_font_set_var_coords_normalized = void function (
        hb_font_t* font,
        const(int)* coords,
        uint coords_length);
    __gshared fp_hb_font_set_var_coords_normalized hb_font_set_var_coords_normalized;
}

version(BindHB_Static)
    const(int)* hb_font_get_var_coords_normalized (hb_font_t* font, uint* length);
else
{
    private alias fp_hb_font_get_var_coords_normalized = const(int)* function (hb_font_t* font, uint* length);
    __gshared fp_hb_font_get_var_coords_normalized hb_font_get_var_coords_normalized;
}

version(BindHB_Static)
    void hb_font_set_var_named_instance (hb_font_t* font, uint instance_index);
else
{
    private alias fp_hb_font_set_var_named_instance = void function (hb_font_t* font, uint instance_index);
    __gshared fp_hb_font_set_var_named_instance hb_font_set_var_named_instance;
}

/* HB_FONT_H */
