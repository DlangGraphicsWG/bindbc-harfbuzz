/*
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
 * Google Author(s): Behdad Esfahbod
 */

module bindbc.hb.bind.shape_plan;

import bindbc.hb.bind.buffer;
import bindbc.hb.bind.common;
import bindbc.hb.bind.face;
import bindbc.hb.bind.font;

extern(C) @nogc nothrow:

struct hb_shape_plan_t;

version(BindHB_Static)
    hb_shape_plan_t* hb_shape_plan_create (
        hb_face_t* face,
        const(hb_segment_properties_t)* props,
        const(hb_feature_t)* user_features,
        uint num_user_features,
        const(char*)* shaper_list);
else
{
    private alias fp_hb_shape_plan_create = hb_shape_plan_t* function (
        hb_face_t* face,
        const(hb_segment_properties_t)* props,
        const(hb_feature_t)* user_features,
        uint num_user_features,
        const(char*)* shaper_list);
    __gshared fp_hb_shape_plan_create hb_shape_plan_create;
}

version(BindHB_Static)
    hb_shape_plan_t* hb_shape_plan_create_cached (
        hb_face_t* face,
        const(hb_segment_properties_t)* props,
        const(hb_feature_t)* user_features,
        uint num_user_features,
        const(char*)* shaper_list);
else
{
    private alias fp_hb_shape_plan_create_cached = hb_shape_plan_t* function (
        hb_face_t* face,
        const(hb_segment_properties_t)* props,
        const(hb_feature_t)* user_features,
        uint num_user_features,
        const(char*)* shaper_list);
    __gshared fp_hb_shape_plan_create_cached hb_shape_plan_create_cached;
}

version(BindHB_Static)
    hb_shape_plan_t* hb_shape_plan_create2 (
        hb_face_t* face,
        const(hb_segment_properties_t)* props,
        const(hb_feature_t)* user_features,
        uint num_user_features,
        const(int)* coords,
        uint num_coords,
        const(char*)* shaper_list);
else
{
    private alias fp_hb_shape_plan_create2 = hb_shape_plan_t* function (
        hb_face_t* face,
        const(hb_segment_properties_t)* props,
        const(hb_feature_t)* user_features,
        uint num_user_features,
        const(int)* coords,
        uint num_coords,
        const(char*)* shaper_list);
    __gshared fp_hb_shape_plan_create2 hb_shape_plan_create2;
}

version(BindHB_Static)
    hb_shape_plan_t* hb_shape_plan_create_cached2 (
        hb_face_t* face,
        const(hb_segment_properties_t)* props,
        const(hb_feature_t)* user_features,
        uint num_user_features,
        const(int)* coords,
        uint num_coords,
        const(char*)* shaper_list);
else
{
    private alias fp_hb_shape_plan_create_cached2 = hb_shape_plan_t* function (
        hb_face_t* face,
        const(hb_segment_properties_t)* props,
        const(hb_feature_t)* user_features,
        uint num_user_features,
        const(int)* coords,
        uint num_coords,
        const(char*)* shaper_list);
    __gshared fp_hb_shape_plan_create_cached2 hb_shape_plan_create_cached2;
}

version(BindHB_Static)
    hb_shape_plan_t* hb_shape_plan_get_empty ();
else
{
    private alias fp_hb_shape_plan_get_empty = hb_shape_plan_t* function ();
    __gshared fp_hb_shape_plan_get_empty hb_shape_plan_get_empty;
}

version(BindHB_Static)
    hb_shape_plan_t* hb_shape_plan_reference (hb_shape_plan_t* shape_plan);
else
{
    private alias fp_hb_shape_plan_reference = hb_shape_plan_t* function (hb_shape_plan_t* shape_plan);
    __gshared fp_hb_shape_plan_reference hb_shape_plan_reference;
}

version(BindHB_Static)
    void hb_shape_plan_destroy (hb_shape_plan_t* shape_plan);
else
{
    private alias fp_hb_shape_plan_destroy = void function (hb_shape_plan_t* shape_plan);
    __gshared fp_hb_shape_plan_destroy hb_shape_plan_destroy;
}

version(BindHB_Static)
    hb_bool_t hb_shape_plan_set_user_data (
        hb_shape_plan_t* shape_plan,
        hb_user_data_key_t* key,
        void* data,
        hb_destroy_func_t destroy,
        hb_bool_t replace);
else
{
    private alias fp_hb_shape_plan_set_user_data = hb_bool_t function (
        hb_shape_plan_t* shape_plan,
        hb_user_data_key_t* key,
        void* data,
        hb_destroy_func_t destroy,
        hb_bool_t replace);
    __gshared fp_hb_shape_plan_set_user_data hb_shape_plan_set_user_data;
}

version(BindHB_Static)
    void* hb_shape_plan_get_user_data (
        hb_shape_plan_t* shape_plan,
        hb_user_data_key_t* key);
else
{
    private alias fp_hb_shape_plan_get_user_data = void* function (
        hb_shape_plan_t* shape_plan,
        hb_user_data_key_t* key);
    __gshared fp_hb_shape_plan_get_user_data hb_shape_plan_get_user_data;
}

version(BindHB_Static)
    hb_bool_t hb_shape_plan_execute (
        hb_shape_plan_t* shape_plan,
        hb_font_t* font,
        hb_buffer_t* buffer,
        const(hb_feature_t)* features,
        uint num_features);
else
{
    private alias fp_hb_shape_plan_execute = hb_bool_t function (
        hb_shape_plan_t* shape_plan,
        hb_font_t* font,
        hb_buffer_t* buffer,
        const(hb_feature_t)* features,
        uint num_features);
    __gshared fp_hb_shape_plan_execute hb_shape_plan_execute;
}

version(BindHB_Static)
    const(char)* hb_shape_plan_get_shaper (hb_shape_plan_t* shape_plan);
else
{
    private alias fp_hb_shape_plan_get_shaper = const(char)* function (hb_shape_plan_t* shape_plan);
    __gshared fp_hb_shape_plan_get_shaper hb_shape_plan_get_shaper;
}

/* HB_SHAPE_PLAN_H */
