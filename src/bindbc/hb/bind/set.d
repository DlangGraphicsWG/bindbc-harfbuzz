
//          Copyright Ahmet Sait 2019.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

module bindbc.hb.bind.set;

import bindbc.hb.bind.common;

extern(C) @nogc nothrow:

/*
 * Since: 0.9.21
 */
enum HB_SET_VALUE_INVALID = cast(hb_codepoint_t) -1;

struct hb_set_t;

version(BindHB_Static)
    hb_set_t* hb_set_create ();
else
{
    private alias fp_hb_set_create = hb_set_t* function ();
    __gshared fp_hb_set_create hb_set_create;
}

version(BindHB_Static)
    hb_set_t* hb_set_get_empty ();
else
{
    private alias fp_hb_set_get_empty = hb_set_t* function ();
    __gshared fp_hb_set_get_empty hb_set_get_empty;
}

version(BindHB_Static)
    hb_set_t* hb_set_reference (hb_set_t* set);
else
{
    private alias fp_hb_set_reference = hb_set_t* function (hb_set_t* set);
    __gshared fp_hb_set_reference hb_set_reference;
}

version(BindHB_Static)
    void hb_set_destroy (hb_set_t* set);
else
{
    private alias fp_hb_set_destroy = void function (hb_set_t* set);
    __gshared fp_hb_set_destroy hb_set_destroy;
}

version(BindHB_Static)
    hb_bool_t hb_set_set_user_data (
        hb_set_t* set,
        hb_user_data_key_t* key,
        void* data,
        hb_destroy_func_t destroy,
        hb_bool_t replace);
else
{
    private alias fp_hb_set_set_user_data = hb_bool_t function (
        hb_set_t* set,
        hb_user_data_key_t* key,
        void* data,
        hb_destroy_func_t destroy,
        hb_bool_t replace);
    __gshared fp_hb_set_set_user_data hb_set_set_user_data;
}

version(BindHB_Static)
    void* hb_set_get_user_data (hb_set_t* set, hb_user_data_key_t* key);
else
{
    private alias fp_hb_set_get_user_data = void* function (hb_set_t* set, hb_user_data_key_t* key);
    __gshared fp_hb_set_get_user_data hb_set_get_user_data;
}

/* Returns false if allocation has failed before */
version(BindHB_Static)
    hb_bool_t hb_set_allocation_successful (const(hb_set_t)* set);
else
{
    private alias fp_hb_set_allocation_successful = hb_bool_t function (const(hb_set_t)* set);
    __gshared fp_hb_set_allocation_successful hb_set_allocation_successful;
}

version(BindHB_Static)
    void hb_set_clear (hb_set_t* set);
else
{
    private alias fp_hb_set_clear = void function (hb_set_t* set);
    __gshared fp_hb_set_clear hb_set_clear;
}

version(BindHB_Static)
    hb_bool_t hb_set_is_empty (const(hb_set_t)* set);
else
{
    private alias fp_hb_set_is_empty = hb_bool_t function (const(hb_set_t)* set);
    __gshared fp_hb_set_is_empty hb_set_is_empty;
}

version(BindHB_Static)
    hb_bool_t hb_set_has (const(hb_set_t)* set, hb_codepoint_t codepoint);
else
{
    private alias fp_hb_set_has = hb_bool_t function (const(hb_set_t)* set, hb_codepoint_t codepoint);
    __gshared fp_hb_set_has hb_set_has;
}

version(BindHB_Static)
    void hb_set_add (hb_set_t* set, hb_codepoint_t codepoint);
else
{
    private alias fp_hb_set_add = void function (hb_set_t* set, hb_codepoint_t codepoint);
    __gshared fp_hb_set_add hb_set_add;
}

version(BindHB_Static)
    void hb_set_add_range (
        hb_set_t* set,
        hb_codepoint_t first,
        hb_codepoint_t last);
else
{
    private alias fp_hb_set_add_range = void function (
        hb_set_t* set,
        hb_codepoint_t first,
        hb_codepoint_t last);
    __gshared fp_hb_set_add_range hb_set_add_range;
}

version(BindHB_Static)
    void hb_set_del (hb_set_t* set, hb_codepoint_t codepoint);
else
{
    private alias fp_hb_set_del = void function (hb_set_t* set, hb_codepoint_t codepoint);
    __gshared fp_hb_set_del hb_set_del;
}

version(BindHB_Static)
    void hb_set_del_range (
        hb_set_t* set,
        hb_codepoint_t first,
        hb_codepoint_t last);
else
{
    private alias fp_hb_set_del_range = void function (
        hb_set_t* set,
        hb_codepoint_t first,
        hb_codepoint_t last);
    __gshared fp_hb_set_del_range hb_set_del_range;
}

version(BindHB_Static)
    hb_bool_t hb_set_is_equal (const(hb_set_t)* set, const(hb_set_t)* other);
else
{
    private alias fp_hb_set_is_equal = hb_bool_t function (const(hb_set_t)* set, const(hb_set_t)* other);
    __gshared fp_hb_set_is_equal hb_set_is_equal;
}

version(BindHB_Static)
    hb_bool_t hb_set_is_subset (const(hb_set_t)* set, const(hb_set_t)* larger_set);
else
{
    private alias fp_hb_set_is_subset = hb_bool_t function (const(hb_set_t)* set, const(hb_set_t)* larger_set);
    __gshared fp_hb_set_is_subset hb_set_is_subset;
}

version(BindHB_Static)
    void hb_set_set (hb_set_t* set, const(hb_set_t)* other);
else
{
    private alias fp_hb_set_set = void function (hb_set_t* set, const(hb_set_t)* other);
    __gshared fp_hb_set_set hb_set_set;
}

version(BindHB_Static)
    void hb_set_union (hb_set_t* set, const(hb_set_t)* other);
else
{
    private alias fp_hb_set_union = void function (hb_set_t* set, const(hb_set_t)* other);
    __gshared fp_hb_set_union hb_set_union;
}

version(BindHB_Static)
    void hb_set_intersect (hb_set_t* set, const(hb_set_t)* other);
else
{
    private alias fp_hb_set_intersect = void function (hb_set_t* set, const(hb_set_t)* other);
    __gshared fp_hb_set_intersect hb_set_intersect;
}

version(BindHB_Static)
    void hb_set_subtract (hb_set_t* set, const(hb_set_t)* other);
else
{
    private alias fp_hb_set_subtract = void function (hb_set_t* set, const(hb_set_t)* other);
    __gshared fp_hb_set_subtract hb_set_subtract;
}

version(BindHB_Static)
    void hb_set_symmetric_difference (hb_set_t* set, const(hb_set_t)* other);
else
{
    private alias fp_hb_set_symmetric_difference = void function (hb_set_t* set, const(hb_set_t)* other);
    __gshared fp_hb_set_symmetric_difference hb_set_symmetric_difference;
}

version(BindHB_Static)
    uint hb_set_get_population (const(hb_set_t)* set);
else
{
    private alias fp_hb_set_get_population = uint function (const(hb_set_t)* set);
    __gshared fp_hb_set_get_population hb_set_get_population;
}

/* Returns HB_SET_VALUE_INVALID if set empty. */
version(BindHB_Static)
    hb_codepoint_t hb_set_get_min (const(hb_set_t)* set);
else
{
    private alias fp_hb_set_get_min = hb_codepoint_t function (const(hb_set_t)* set);
    __gshared fp_hb_set_get_min hb_set_get_min;
}

/* Returns HB_SET_VALUE_INVALID if set empty. */
version(BindHB_Static)
    hb_codepoint_t hb_set_get_max (const(hb_set_t)* set);
else
{
    private alias fp_hb_set_get_max = hb_codepoint_t function (const(hb_set_t)* set);
    __gshared fp_hb_set_get_max hb_set_get_max;
}

/* Pass HB_SET_VALUE_INVALID in to get started. */
version(BindHB_Static)
    hb_bool_t hb_set_next (const(hb_set_t)* set, hb_codepoint_t* codepoint);
else
{
    private alias fp_hb_set_next = hb_bool_t function (const(hb_set_t)* set, hb_codepoint_t* codepoint);
    __gshared fp_hb_set_next hb_set_next;
}

/* Pass HB_SET_VALUE_INVALID in to get started. */
version(BindHB_Static)
    hb_bool_t hb_set_previous (const(hb_set_t)* set, hb_codepoint_t* codepoint);
else
{
    private alias fp_hb_set_previous = hb_bool_t function (const(hb_set_t)* set, hb_codepoint_t* codepoint);
    __gshared fp_hb_set_previous hb_set_previous;
}

/* Pass HB_SET_VALUE_INVALID for first and last to get started. */
version(BindHB_Static)
    hb_bool_t hb_set_next_range (
        const(hb_set_t)* set,
        hb_codepoint_t* first,
        hb_codepoint_t* last);
else
{
    private alias fp_hb_set_next_range = hb_bool_t function (
        const(hb_set_t)* set,
        hb_codepoint_t* first,
        hb_codepoint_t* last);
    __gshared fp_hb_set_next_range hb_set_next_range;
}

/* Pass HB_SET_VALUE_INVALID for first and last to get started. */
version(BindHB_Static)
    hb_bool_t hb_set_previous_range (
        const(hb_set_t)* set,
        hb_codepoint_t* first,
        hb_codepoint_t* last);
else
{
    private alias fp_hb_set_previous_range = hb_bool_t function (
        const(hb_set_t)* set,
        hb_codepoint_t* first,
        hb_codepoint_t* last);
    __gshared fp_hb_set_previous_range hb_set_previous_range;
}

/* HB_SET_H */
