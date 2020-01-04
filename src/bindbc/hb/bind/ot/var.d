
//          Copyright Ahmet Sait 2020.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

module bindbc.hb.bind.ot.var;

import bindbc.hb.config;

import bindbc.hb.bind.common;
import bindbc.hb.bind.face;
import bindbc.hb.bind.ot.name;

extern(C) @nogc nothrow:

enum HB_OT_TAG_VAR_AXIS_ITALIC = HB_TAG('i', 't', 'a', 'l');
enum HB_OT_TAG_VAR_AXIS_OPTICAL_SIZE = HB_TAG('o', 'p', 's', 'z');
enum HB_OT_TAG_VAR_AXIS_SLANT = HB_TAG('s', 'l', 'n', 't');
enum HB_OT_TAG_VAR_AXIS_WIDTH = HB_TAG('w', 'd', 't', 'h');
enum HB_OT_TAG_VAR_AXIS_WEIGHT = HB_TAG('w', 'g', 'h', 't');

/*
 * fvar / avar
 */

version(BindHB_Static)
    hb_bool_t hb_ot_var_has_data (hb_face_t* face);
else
{
    private alias fp_hb_ot_var_has_data = hb_bool_t function (hb_face_t* face);
    __gshared fp_hb_ot_var_has_data hb_ot_var_has_data;
}

/*
 * Variation axes.
 */

version(BindHB_Static)
    uint hb_ot_var_get_axis_count (hb_face_t* face);
else
{
    private alias fp_hb_ot_var_get_axis_count = uint function (hb_face_t* face);
    __gshared fp_hb_ot_var_get_axis_count hb_ot_var_get_axis_count;
}

static if (hbSupport >= HBSupport.v2_6_3)
{
	/**
	 * hb_ot_var_axis_flags_t:
	 * @HB_OT_VAR_AXIS_FLAG_HIDDEN: The axis should not be exposed directly in user interfaces.
	 *
	 * Since: 2.2.0
	 */
	enum : hb_tag_t
	{
		/*< flags >*/
		HB_OT_VAR_AXIS_FLAG_HIDDEN = 0x00000001u,

		_HB_OT_VAR_AXIS_FLAG_MAX_VALUE = HB_TAG_MAX_SIGNED /*< skip >*/
	}
	alias hb_ot_var_axis_flags_t = hb_tag_t;

	/**
	 * hb_ot_var_axis_info_t:
	 *
	 * Since: 2.2.0
	 */
	struct hb_ot_var_axis_info_t
	{
		uint axis_index;
		hb_tag_t tag;
		hb_ot_name_id_t name_id;
		hb_ot_var_axis_flags_t flags;
		float min_value;
		float default_value;
		float max_value;
		/*< private >*/
		uint reserved;
	}

	/* IN/OUT */
	/* OUT */
	version(BindHB_Static)
		uint hb_ot_var_get_axis_infos (
			hb_face_t* face,
			uint start_offset,
			uint* axes_count,
			hb_ot_var_axis_info_t* axes_array);
	else
	{
		private alias fp_hb_ot_var_get_axis_infos = uint function (
			hb_face_t* face,
			uint start_offset,
			uint* axes_count,
			hb_ot_var_axis_info_t* axes_array);
		__gshared fp_hb_ot_var_get_axis_infos hb_ot_var_get_axis_infos;
	}

	version(BindHB_Static)
		hb_bool_t hb_ot_var_find_axis_info (
			hb_face_t* face,
			hb_tag_t axis_tag,
			hb_ot_var_axis_info_t* axis_info);
	else
	{
		private alias fp_hb_ot_var_find_axis_info = hb_bool_t function (
			hb_face_t* face,
			hb_tag_t axis_tag,
			hb_ot_var_axis_info_t* axis_info);
		__gshared fp_hb_ot_var_find_axis_info hb_ot_var_find_axis_info;
	}

	/*
	 * Named instances.
	 */

	version(BindHB_Static)
		uint hb_ot_var_get_named_instance_count (hb_face_t* face);
	else
	{
		private alias fp_hb_ot_var_get_named_instance_count = uint function (hb_face_t* face);
		__gshared fp_hb_ot_var_get_named_instance_count hb_ot_var_get_named_instance_count;
	}

	version(BindHB_Static)
		hb_ot_name_id_t hb_ot_var_named_instance_get_subfamily_name_id (
			hb_face_t* face,
			uint instance_index);
	else
	{
		private alias fp_hb_ot_var_named_instance_get_subfamily_name_id = hb_ot_name_id_t function (
			hb_face_t* face,
			uint instance_index);
		__gshared fp_hb_ot_var_named_instance_get_subfamily_name_id hb_ot_var_named_instance_get_subfamily_name_id;
	}

	version(BindHB_Static)
		hb_ot_name_id_t hb_ot_var_named_instance_get_postscript_name_id (
			hb_face_t* face,
			uint instance_index);
	else
	{
		private alias fp_hb_ot_var_named_instance_get_postscript_name_id = hb_ot_name_id_t function (
			hb_face_t* face,
			uint instance_index);
		__gshared fp_hb_ot_var_named_instance_get_postscript_name_id hb_ot_var_named_instance_get_postscript_name_id;
	}

	/* IN/OUT */
	/* OUT */
	version(BindHB_Static)
		uint hb_ot_var_named_instance_get_design_coords (
			hb_face_t* face,
			uint instance_index,
			uint* coords_length,
			float* coords);
	else
	{
		private alias fp_hb_ot_var_named_instance_get_design_coords = uint function (
			hb_face_t* face,
			uint instance_index,
			uint* coords_length,
			float* coords);
		__gshared fp_hb_ot_var_named_instance_get_design_coords hb_ot_var_named_instance_get_design_coords;
	}
}

/*
 * Conversions.
 */

/* IN */

/* OUT */
version(BindHB_Static)
    void hb_ot_var_normalize_variations (
        hb_face_t* face,
        const(hb_variation_t)* variations,
        uint variations_length,
        int* coords,
        uint coords_length);
else
{
    private alias fp_hb_ot_var_normalize_variations = void function (
        hb_face_t* face,
        const(hb_variation_t)* variations,
        uint variations_length,
        int* coords,
        uint coords_length);
    __gshared fp_hb_ot_var_normalize_variations hb_ot_var_normalize_variations;
}

/* IN */
/* OUT */
version(BindHB_Static)
    void hb_ot_var_normalize_coords (
        hb_face_t* face,
        uint coords_length,
        const(float)* design_coords,
        int* normalized_coords);
else
{
    private alias fp_hb_ot_var_normalize_coords = void function (
        hb_face_t* face,
        uint coords_length,
        const(float)* design_coords,
        int* normalized_coords);
    __gshared fp_hb_ot_var_normalize_coords hb_ot_var_normalize_coords;
}
