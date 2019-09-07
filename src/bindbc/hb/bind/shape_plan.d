
//          Copyright Ahmet Sait Koçak 2019.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

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
