
//          Copyright Ahmet Sait 2020.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

module bindbc.hb.bind.unicode;

import bindbc.hb.bind.common;

extern(C) @nogc nothrow:

/**
 * HB_UNICODE_MAX
 *
 * Since: 1.9.0
 **/
enum HB_UNICODE_MAX = 0x10FFFFu;

/* hb_unicode_general_category_t */

/* Unicode Character Database property: General_Category (gc) */
enum : int
{
    HB_UNICODE_GENERAL_CATEGORY_CONTROL = 0, /* Cc */
    HB_UNICODE_GENERAL_CATEGORY_FORMAT = 1, /* Cf */
    HB_UNICODE_GENERAL_CATEGORY_UNASSIGNED = 2, /* Cn */
    HB_UNICODE_GENERAL_CATEGORY_PRIVATE_USE = 3, /* Co */
    HB_UNICODE_GENERAL_CATEGORY_SURROGATE = 4, /* Cs */
    HB_UNICODE_GENERAL_CATEGORY_LOWERCASE_LETTER = 5, /* Ll */
    HB_UNICODE_GENERAL_CATEGORY_MODIFIER_LETTER = 6, /* Lm */
    HB_UNICODE_GENERAL_CATEGORY_OTHER_LETTER = 7, /* Lo */
    HB_UNICODE_GENERAL_CATEGORY_TITLECASE_LETTER = 8, /* Lt */
    HB_UNICODE_GENERAL_CATEGORY_UPPERCASE_LETTER = 9, /* Lu */
    HB_UNICODE_GENERAL_CATEGORY_SPACING_MARK = 10, /* Mc */
    HB_UNICODE_GENERAL_CATEGORY_ENCLOSING_MARK = 11, /* Me */
    HB_UNICODE_GENERAL_CATEGORY_NON_SPACING_MARK = 12, /* Mn */
    HB_UNICODE_GENERAL_CATEGORY_DECIMAL_NUMBER = 13, /* Nd */
    HB_UNICODE_GENERAL_CATEGORY_LETTER_NUMBER = 14, /* Nl */
    HB_UNICODE_GENERAL_CATEGORY_OTHER_NUMBER = 15, /* No */
    HB_UNICODE_GENERAL_CATEGORY_CONNECT_PUNCTUATION = 16, /* Pc */
    HB_UNICODE_GENERAL_CATEGORY_DASH_PUNCTUATION = 17, /* Pd */
    HB_UNICODE_GENERAL_CATEGORY_CLOSE_PUNCTUATION = 18, /* Pe */
    HB_UNICODE_GENERAL_CATEGORY_FINAL_PUNCTUATION = 19, /* Pf */
    HB_UNICODE_GENERAL_CATEGORY_INITIAL_PUNCTUATION = 20, /* Pi */
    HB_UNICODE_GENERAL_CATEGORY_OTHER_PUNCTUATION = 21, /* Po */
    HB_UNICODE_GENERAL_CATEGORY_OPEN_PUNCTUATION = 22, /* Ps */
    HB_UNICODE_GENERAL_CATEGORY_CURRENCY_SYMBOL = 23, /* Sc */
    HB_UNICODE_GENERAL_CATEGORY_MODIFIER_SYMBOL = 24, /* Sk */
    HB_UNICODE_GENERAL_CATEGORY_MATH_SYMBOL = 25, /* Sm */
    HB_UNICODE_GENERAL_CATEGORY_OTHER_SYMBOL = 26, /* So */
    HB_UNICODE_GENERAL_CATEGORY_LINE_SEPARATOR = 27, /* Zl */
    HB_UNICODE_GENERAL_CATEGORY_PARAGRAPH_SEPARATOR = 28, /* Zp */
    HB_UNICODE_GENERAL_CATEGORY_SPACE_SEPARATOR = 29 /* Zs */
}
alias hb_unicode_general_category_t = int;

/* hb_unicode_combining_class_t */

/* Note: newer versions of Unicode may add new values.  Clients should be ready to handle
 * any value in the 0..254 range being returned from hb_unicode_combining_class().
 */

/* Unicode Character Database property: Canonical_Combining_Class (ccc) */
enum : int
{
    HB_UNICODE_COMBINING_CLASS_NOT_REORDERED = 0,
    HB_UNICODE_COMBINING_CLASS_OVERLAY = 1,
    HB_UNICODE_COMBINING_CLASS_NUKTA = 7,
    HB_UNICODE_COMBINING_CLASS_KANA_VOICING = 8,
    HB_UNICODE_COMBINING_CLASS_VIRAMA = 9,

    /* Hebrew */
    HB_UNICODE_COMBINING_CLASS_CCC10 = 10,
    HB_UNICODE_COMBINING_CLASS_CCC11 = 11,
    HB_UNICODE_COMBINING_CLASS_CCC12 = 12,
    HB_UNICODE_COMBINING_CLASS_CCC13 = 13,
    HB_UNICODE_COMBINING_CLASS_CCC14 = 14,
    HB_UNICODE_COMBINING_CLASS_CCC15 = 15,
    HB_UNICODE_COMBINING_CLASS_CCC16 = 16,
    HB_UNICODE_COMBINING_CLASS_CCC17 = 17,
    HB_UNICODE_COMBINING_CLASS_CCC18 = 18,
    HB_UNICODE_COMBINING_CLASS_CCC19 = 19,
    HB_UNICODE_COMBINING_CLASS_CCC20 = 20,
    HB_UNICODE_COMBINING_CLASS_CCC21 = 21,
    HB_UNICODE_COMBINING_CLASS_CCC22 = 22,
    HB_UNICODE_COMBINING_CLASS_CCC23 = 23,
    HB_UNICODE_COMBINING_CLASS_CCC24 = 24,
    HB_UNICODE_COMBINING_CLASS_CCC25 = 25,
    HB_UNICODE_COMBINING_CLASS_CCC26 = 26,

    /* Arabic */
    HB_UNICODE_COMBINING_CLASS_CCC27 = 27,
    HB_UNICODE_COMBINING_CLASS_CCC28 = 28,
    HB_UNICODE_COMBINING_CLASS_CCC29 = 29,
    HB_UNICODE_COMBINING_CLASS_CCC30 = 30,
    HB_UNICODE_COMBINING_CLASS_CCC31 = 31,
    HB_UNICODE_COMBINING_CLASS_CCC32 = 32,
    HB_UNICODE_COMBINING_CLASS_CCC33 = 33,
    HB_UNICODE_COMBINING_CLASS_CCC34 = 34,
    HB_UNICODE_COMBINING_CLASS_CCC35 = 35,

    /* Syriac */
    HB_UNICODE_COMBINING_CLASS_CCC36 = 36,

    /* Telugu */
    HB_UNICODE_COMBINING_CLASS_CCC84 = 84,
    HB_UNICODE_COMBINING_CLASS_CCC91 = 91,

    /* Thai */
    HB_UNICODE_COMBINING_CLASS_CCC103 = 103,
    HB_UNICODE_COMBINING_CLASS_CCC107 = 107,

    /* Lao */
    HB_UNICODE_COMBINING_CLASS_CCC118 = 118,
    HB_UNICODE_COMBINING_CLASS_CCC122 = 122,

    /* Tibetan */
    HB_UNICODE_COMBINING_CLASS_CCC129 = 129,
    HB_UNICODE_COMBINING_CLASS_CCC130 = 130,
    HB_UNICODE_COMBINING_CLASS_CCC133 = 132,

    HB_UNICODE_COMBINING_CLASS_ATTACHED_BELOW_LEFT = 200,
    HB_UNICODE_COMBINING_CLASS_ATTACHED_BELOW = 202,
    HB_UNICODE_COMBINING_CLASS_ATTACHED_ABOVE = 214,
    HB_UNICODE_COMBINING_CLASS_ATTACHED_ABOVE_RIGHT = 216,
    HB_UNICODE_COMBINING_CLASS_BELOW_LEFT = 218,
    HB_UNICODE_COMBINING_CLASS_BELOW = 220,
    HB_UNICODE_COMBINING_CLASS_BELOW_RIGHT = 222,
    HB_UNICODE_COMBINING_CLASS_LEFT = 224,
    HB_UNICODE_COMBINING_CLASS_RIGHT = 226,
    HB_UNICODE_COMBINING_CLASS_ABOVE_LEFT = 228,
    HB_UNICODE_COMBINING_CLASS_ABOVE = 230,
    HB_UNICODE_COMBINING_CLASS_ABOVE_RIGHT = 232,
    HB_UNICODE_COMBINING_CLASS_DOUBLE_BELOW = 233,
    HB_UNICODE_COMBINING_CLASS_DOUBLE_ABOVE = 234,

    HB_UNICODE_COMBINING_CLASS_IOTA_SUBSCRIPT = 240,

    HB_UNICODE_COMBINING_CLASS_INVALID = 255
}
alias hb_unicode_combining_class_t = int;

/*
 * hb_unicode_funcs_t
 */

struct hb_unicode_funcs_t;

/*
 * just give me the best implementation you've got there.
 */
version(BindHB_Static)
    hb_unicode_funcs_t* hb_unicode_funcs_get_default ();
else
{
    private alias fp_hb_unicode_funcs_get_default = hb_unicode_funcs_t* function ();
    __gshared fp_hb_unicode_funcs_get_default hb_unicode_funcs_get_default;
}

version(BindHB_Static)
    hb_unicode_funcs_t* hb_unicode_funcs_create (hb_unicode_funcs_t* parent);
else
{
    private alias fp_hb_unicode_funcs_create = hb_unicode_funcs_t* function (hb_unicode_funcs_t* parent);
    __gshared fp_hb_unicode_funcs_create hb_unicode_funcs_create;
}

version(BindHB_Static)
    hb_unicode_funcs_t* hb_unicode_funcs_get_empty ();
else
{
    private alias fp_hb_unicode_funcs_get_empty = hb_unicode_funcs_t* function ();
    __gshared fp_hb_unicode_funcs_get_empty hb_unicode_funcs_get_empty;
}

version(BindHB_Static)
    hb_unicode_funcs_t* hb_unicode_funcs_reference (hb_unicode_funcs_t* ufuncs);
else
{
    private alias fp_hb_unicode_funcs_reference = hb_unicode_funcs_t* function (hb_unicode_funcs_t* ufuncs);
    __gshared fp_hb_unicode_funcs_reference hb_unicode_funcs_reference;
}

version(BindHB_Static)
    void hb_unicode_funcs_destroy (hb_unicode_funcs_t* ufuncs);
else
{
    private alias fp_hb_unicode_funcs_destroy = void function (hb_unicode_funcs_t* ufuncs);
    __gshared fp_hb_unicode_funcs_destroy hb_unicode_funcs_destroy;
}

version(BindHB_Static)
    hb_bool_t hb_unicode_funcs_set_user_data (
        hb_unicode_funcs_t* ufuncs,
        hb_user_data_key_t* key,
        void* data,
        hb_destroy_func_t destroy,
        hb_bool_t replace);
else
{
    private alias fp_hb_unicode_funcs_set_user_data = hb_bool_t function (
        hb_unicode_funcs_t* ufuncs,
        hb_user_data_key_t* key,
        void* data,
        hb_destroy_func_t destroy,
        hb_bool_t replace);
    __gshared fp_hb_unicode_funcs_set_user_data hb_unicode_funcs_set_user_data;
}

version(BindHB_Static)
    void* hb_unicode_funcs_get_user_data (
        hb_unicode_funcs_t* ufuncs,
        hb_user_data_key_t* key);
else
{
    private alias fp_hb_unicode_funcs_get_user_data = void* function (
        hb_unicode_funcs_t* ufuncs,
        hb_user_data_key_t* key);
    __gshared fp_hb_unicode_funcs_get_user_data hb_unicode_funcs_get_user_data;
}

version(BindHB_Static)
    void hb_unicode_funcs_make_immutable (hb_unicode_funcs_t* ufuncs);
else
{
    private alias fp_hb_unicode_funcs_make_immutable = void function (hb_unicode_funcs_t* ufuncs);
    __gshared fp_hb_unicode_funcs_make_immutable hb_unicode_funcs_make_immutable;
}

version(BindHB_Static)
    hb_bool_t hb_unicode_funcs_is_immutable (hb_unicode_funcs_t* ufuncs);
else
{
    private alias fp_hb_unicode_funcs_is_immutable = hb_bool_t function (hb_unicode_funcs_t* ufuncs);
    __gshared fp_hb_unicode_funcs_is_immutable hb_unicode_funcs_is_immutable;
}

version(BindHB_Static)
    hb_unicode_funcs_t* hb_unicode_funcs_get_parent (hb_unicode_funcs_t* ufuncs);
else
{
    private alias fp_hb_unicode_funcs_get_parent = hb_unicode_funcs_t* function (hb_unicode_funcs_t* ufuncs);
    __gshared fp_hb_unicode_funcs_get_parent hb_unicode_funcs_get_parent;
}

/*
 * funcs
 */

/* typedefs */

alias hb_unicode_combining_class_func_t = hb_unicode_combining_class_t function (
    hb_unicode_funcs_t* ufuncs,
    hb_codepoint_t unicode,
    void* user_data);
alias hb_unicode_general_category_func_t = hb_unicode_general_category_t function (
    hb_unicode_funcs_t* ufuncs,
    hb_codepoint_t unicode,
    void* user_data);
alias hb_unicode_mirroring_func_t = hb_codepoint_t function (
    hb_unicode_funcs_t* ufuncs,
    hb_codepoint_t unicode,
    void* user_data);
alias hb_unicode_script_func_t = hb_script_t function (
    hb_unicode_funcs_t* ufuncs,
    hb_codepoint_t unicode,
    void* user_data);

alias hb_unicode_compose_func_t = hb_bool_t function (
    hb_unicode_funcs_t* ufuncs,
    hb_codepoint_t a,
    hb_codepoint_t b,
    hb_codepoint_t* ab,
    void* user_data);
alias hb_unicode_decompose_func_t = hb_bool_t function (
    hb_unicode_funcs_t* ufuncs,
    hb_codepoint_t ab,
    hb_codepoint_t* a,
    hb_codepoint_t* b,
    void* user_data);

/* setters */

/**
 * hb_unicode_funcs_set_combining_class_func:
 * @ufuncs: a Unicode function structure
 * @func: (closure user_data) (destroy destroy) (scope notified):
 * @user_data:
 * @destroy:
 *
 *
 *
 * Since: 0.9.2
 **/
version(BindHB_Static)
    void hb_unicode_funcs_set_combining_class_func (
        hb_unicode_funcs_t* ufuncs,
        hb_unicode_combining_class_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_unicode_funcs_set_combining_class_func = void function (
        hb_unicode_funcs_t* ufuncs,
        hb_unicode_combining_class_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_unicode_funcs_set_combining_class_func hb_unicode_funcs_set_combining_class_func;
}

/**
 * hb_unicode_funcs_set_general_category_func:
 * @ufuncs: a Unicode function structure
 * @func: (closure user_data) (destroy destroy) (scope notified):
 * @user_data:
 * @destroy:
 *
 *
 *
 * Since: 0.9.2
 **/
version(BindHB_Static)
    void hb_unicode_funcs_set_general_category_func (
        hb_unicode_funcs_t* ufuncs,
        hb_unicode_general_category_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_unicode_funcs_set_general_category_func = void function (
        hb_unicode_funcs_t* ufuncs,
        hb_unicode_general_category_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_unicode_funcs_set_general_category_func hb_unicode_funcs_set_general_category_func;
}

/**
 * hb_unicode_funcs_set_mirroring_func:
 * @ufuncs: a Unicode function structure
 * @func: (closure user_data) (destroy destroy) (scope notified):
 * @user_data:
 * @destroy:
 *
 *
 *
 * Since: 0.9.2
 **/
version(BindHB_Static)
    void hb_unicode_funcs_set_mirroring_func (
        hb_unicode_funcs_t* ufuncs,
        hb_unicode_mirroring_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_unicode_funcs_set_mirroring_func = void function (
        hb_unicode_funcs_t* ufuncs,
        hb_unicode_mirroring_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_unicode_funcs_set_mirroring_func hb_unicode_funcs_set_mirroring_func;
}

/**
 * hb_unicode_funcs_set_script_func:
 * @ufuncs: a Unicode function structure
 * @func: (closure user_data) (destroy destroy) (scope notified):
 * @user_data:
 * @destroy:
 *
 *
 *
 * Since: 0.9.2
 **/
version(BindHB_Static)
    void hb_unicode_funcs_set_script_func (
        hb_unicode_funcs_t* ufuncs,
        hb_unicode_script_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_unicode_funcs_set_script_func = void function (
        hb_unicode_funcs_t* ufuncs,
        hb_unicode_script_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_unicode_funcs_set_script_func hb_unicode_funcs_set_script_func;
}

/**
 * hb_unicode_funcs_set_compose_func:
 * @ufuncs: a Unicode function structure
 * @func: (closure user_data) (destroy destroy) (scope notified):
 * @user_data:
 * @destroy:
 *
 *
 *
 * Since: 0.9.2
 **/
version(BindHB_Static)
    void hb_unicode_funcs_set_compose_func (
        hb_unicode_funcs_t* ufuncs,
        hb_unicode_compose_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_unicode_funcs_set_compose_func = void function (
        hb_unicode_funcs_t* ufuncs,
        hb_unicode_compose_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_unicode_funcs_set_compose_func hb_unicode_funcs_set_compose_func;
}

/**
 * hb_unicode_funcs_set_decompose_func:
 * @ufuncs: a Unicode function structure
 * @func: (closure user_data) (destroy destroy) (scope notified):
 * @user_data:
 * @destroy:
 *
 *
 *
 * Since: 0.9.2
 **/
version(BindHB_Static)
    void hb_unicode_funcs_set_decompose_func (
        hb_unicode_funcs_t* ufuncs,
        hb_unicode_decompose_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_unicode_funcs_set_decompose_func = void function (
        hb_unicode_funcs_t* ufuncs,
        hb_unicode_decompose_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_unicode_funcs_set_decompose_func hb_unicode_funcs_set_decompose_func;
}

/* accessors */

/**
 * hb_unicode_combining_class:
 *
 * Since: 0.9.2
 **/
version(BindHB_Static)
    hb_unicode_combining_class_t hb_unicode_combining_class (
        hb_unicode_funcs_t* ufuncs,
        hb_codepoint_t unicode);
else
{
    private alias fp_hb_unicode_combining_class = hb_unicode_combining_class_t function (
        hb_unicode_funcs_t* ufuncs,
        hb_codepoint_t unicode);
    __gshared fp_hb_unicode_combining_class hb_unicode_combining_class;
}

/**
 * hb_unicode_general_category:
 *
 * Since: 0.9.2
 **/
version(BindHB_Static)
    hb_unicode_general_category_t hb_unicode_general_category (
        hb_unicode_funcs_t* ufuncs,
        hb_codepoint_t unicode);
else
{
    private alias fp_hb_unicode_general_category = hb_unicode_general_category_t function (
        hb_unicode_funcs_t* ufuncs,
        hb_codepoint_t unicode);
    __gshared fp_hb_unicode_general_category hb_unicode_general_category;
}

/**
 * hb_unicode_mirroring:
 *
 * Since: 0.9.2
 **/
version(BindHB_Static)
    hb_codepoint_t hb_unicode_mirroring (
        hb_unicode_funcs_t* ufuncs,
        hb_codepoint_t unicode);
else
{
    private alias fp_hb_unicode_mirroring = hb_codepoint_t function (
        hb_unicode_funcs_t* ufuncs,
        hb_codepoint_t unicode);
    __gshared fp_hb_unicode_mirroring hb_unicode_mirroring;
}

/**
 * hb_unicode_script:
 *
 * Since: 0.9.2
 **/
version(BindHB_Static)
    hb_script_t hb_unicode_script (
        hb_unicode_funcs_t* ufuncs,
        hb_codepoint_t unicode);
else
{
    private alias fp_hb_unicode_script = hb_script_t function (
        hb_unicode_funcs_t* ufuncs,
        hb_codepoint_t unicode);
    __gshared fp_hb_unicode_script hb_unicode_script;
}

version(BindHB_Static)
    hb_bool_t hb_unicode_compose (
        hb_unicode_funcs_t* ufuncs,
        hb_codepoint_t a,
        hb_codepoint_t b,
        hb_codepoint_t* ab);
else
{
    private alias fp_hb_unicode_compose = hb_bool_t function (
        hb_unicode_funcs_t* ufuncs,
        hb_codepoint_t a,
        hb_codepoint_t b,
        hb_codepoint_t* ab);
    __gshared fp_hb_unicode_compose hb_unicode_compose;
}

version(BindHB_Static)
    hb_bool_t hb_unicode_decompose (
        hb_unicode_funcs_t* ufuncs,
        hb_codepoint_t ab,
        hb_codepoint_t* a,
        hb_codepoint_t* b);
else
{
    private alias fp_hb_unicode_decompose = hb_bool_t function (
        hb_unicode_funcs_t* ufuncs,
        hb_codepoint_t ab,
        hb_codepoint_t* a,
        hb_codepoint_t* b);
    __gshared fp_hb_unicode_decompose hb_unicode_decompose;
}
