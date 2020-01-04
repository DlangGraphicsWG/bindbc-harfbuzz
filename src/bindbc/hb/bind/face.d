
//          Copyright Ahmet Sait 2020.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

module bindbc.hb.bind.face;

import bindbc.hb.config;

import bindbc.hb.bind.blob;
import bindbc.hb.bind.common;
import bindbc.hb.bind.set;

extern(C) @nogc nothrow:

static if (hbSupport >= HBSupport.v2_6_3)
{
	version(BindHB_Static)
		uint hb_face_count (hb_blob_t* blob);
	else
	{
		private alias fp_hb_face_count = uint function (hb_blob_t* blob);
		__gshared fp_hb_face_count hb_face_count;
	}
}

/*
 * hb_face_t
 */

struct hb_face_t;

version(BindHB_Static)
    hb_face_t* hb_face_create (hb_blob_t* blob, uint index);
else
{
    private alias fp_hb_face_create = hb_face_t* function (hb_blob_t* blob, uint index);
    __gshared fp_hb_face_create hb_face_create;
}

alias hb_reference_table_func_t = hb_blob_t* function (hb_face_t* face, hb_tag_t tag, void* user_data);

/* calls destroy() when not needing user_data anymore */
version(BindHB_Static)
    hb_face_t* hb_face_create_for_tables (
        hb_reference_table_func_t reference_table_func,
        void* user_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_face_create_for_tables = hb_face_t* function (
        hb_reference_table_func_t reference_table_func,
        void* user_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_face_create_for_tables hb_face_create_for_tables;
}

version(BindHB_Static)
    hb_face_t* hb_face_get_empty ();
else
{
    private alias fp_hb_face_get_empty = hb_face_t* function ();
    __gshared fp_hb_face_get_empty hb_face_get_empty;
}

version(BindHB_Static)
    hb_face_t* hb_face_reference (hb_face_t* face);
else
{
    private alias fp_hb_face_reference = hb_face_t* function (hb_face_t* face);
    __gshared fp_hb_face_reference hb_face_reference;
}

version(BindHB_Static)
    void hb_face_destroy (hb_face_t* face);
else
{
    private alias fp_hb_face_destroy = void function (hb_face_t* face);
    __gshared fp_hb_face_destroy hb_face_destroy;
}

version(BindHB_Static)
    hb_bool_t hb_face_set_user_data (
        hb_face_t* face,
        hb_user_data_key_t* key,
        void* data,
        hb_destroy_func_t destroy,
        hb_bool_t replace);
else
{
    private alias fp_hb_face_set_user_data = hb_bool_t function (
        hb_face_t* face,
        hb_user_data_key_t* key,
        void* data,
        hb_destroy_func_t destroy,
        hb_bool_t replace);
    __gshared fp_hb_face_set_user_data hb_face_set_user_data;
}

version(BindHB_Static)
    void* hb_face_get_user_data (const(hb_face_t)* face, hb_user_data_key_t* key);
else
{
    private alias fp_hb_face_get_user_data = void* function (const(hb_face_t)* face, hb_user_data_key_t* key);
    __gshared fp_hb_face_get_user_data hb_face_get_user_data;
}

version(BindHB_Static)
    void hb_face_make_immutable (hb_face_t* face);
else
{
    private alias fp_hb_face_make_immutable = void function (hb_face_t* face);
    __gshared fp_hb_face_make_immutable hb_face_make_immutable;
}

version(BindHB_Static)
    hb_bool_t hb_face_is_immutable (const(hb_face_t)* face);
else
{
    private alias fp_hb_face_is_immutable = hb_bool_t function (const(hb_face_t)* face);
    __gshared fp_hb_face_is_immutable hb_face_is_immutable;
}

version(BindHB_Static)
    hb_blob_t* hb_face_reference_table (const(hb_face_t)* face, hb_tag_t tag);
else
{
    private alias fp_hb_face_reference_table = hb_blob_t* function (const(hb_face_t)* face, hb_tag_t tag);
    __gshared fp_hb_face_reference_table hb_face_reference_table;
}

version(BindHB_Static)
    hb_blob_t* hb_face_reference_blob (hb_face_t* face);
else
{
    private alias fp_hb_face_reference_blob = hb_blob_t* function (hb_face_t* face);
    __gshared fp_hb_face_reference_blob hb_face_reference_blob;
}

version(BindHB_Static)
    void hb_face_set_index (hb_face_t* face, uint index);
else
{
    private alias fp_hb_face_set_index = void function (hb_face_t* face, uint index);
    __gshared fp_hb_face_set_index hb_face_set_index;
}

version(BindHB_Static)
    uint hb_face_get_index (const(hb_face_t)* face);
else
{
    private alias fp_hb_face_get_index = uint function (const(hb_face_t)* face);
    __gshared fp_hb_face_get_index hb_face_get_index;
}

version(BindHB_Static)
    void hb_face_set_upem (hb_face_t* face, uint upem);
else
{
    private alias fp_hb_face_set_upem = void function (hb_face_t* face, uint upem);
    __gshared fp_hb_face_set_upem hb_face_set_upem;
}

version(BindHB_Static)
    uint hb_face_get_upem (const(hb_face_t)* face);
else
{
    private alias fp_hb_face_get_upem = uint function (const(hb_face_t)* face);
    __gshared fp_hb_face_get_upem hb_face_get_upem;
}

version(BindHB_Static)
    void hb_face_set_glyph_count (hb_face_t* face, uint glyph_count);
else
{
    private alias fp_hb_face_set_glyph_count = void function (hb_face_t* face, uint glyph_count);
    __gshared fp_hb_face_set_glyph_count hb_face_set_glyph_count;
}

version(BindHB_Static)
    uint hb_face_get_glyph_count (const(hb_face_t)* face);
else
{
    private alias fp_hb_face_get_glyph_count = uint function (const(hb_face_t)* face);
    __gshared fp_hb_face_get_glyph_count hb_face_get_glyph_count;
}

/* IN/OUT */
/* OUT */
version(BindHB_Static)
    uint hb_face_get_table_tags (
        const(hb_face_t)* face,
        uint start_offset,
        uint* table_count,
        hb_tag_t* table_tags);
else
{
    private alias fp_hb_face_get_table_tags = uint function (
        const(hb_face_t)* face,
        uint start_offset,
        uint* table_count,
        hb_tag_t* table_tags);
    __gshared fp_hb_face_get_table_tags hb_face_get_table_tags;
}

static if (hbSupport >= HBSupport.v2_6_3)
{
	/*
	 * Character set.
	 */

	version(BindHB_Static)
		void hb_face_collect_unicodes (hb_face_t* face, hb_set_t* out_);
	else
	{
		private alias fp_hb_face_collect_unicodes = void function (hb_face_t* face, hb_set_t* out_);
		__gshared fp_hb_face_collect_unicodes hb_face_collect_unicodes;
	}

	version(BindHB_Static)
		void hb_face_collect_variation_selectors (hb_face_t* face, hb_set_t* out_);
	else
	{
		private alias fp_hb_face_collect_variation_selectors = void function (hb_face_t* face, hb_set_t* out_);
		__gshared fp_hb_face_collect_variation_selectors hb_face_collect_variation_selectors;
	}

	version(BindHB_Static)
		void hb_face_collect_variation_unicodes (
			hb_face_t* face,
			hb_codepoint_t variation_selector,
			hb_set_t* out_);
	else
	{
		private alias fp_hb_face_collect_variation_unicodes = void function (
			hb_face_t* face,
			hb_codepoint_t variation_selector,
			hb_set_t* out_);
		__gshared fp_hb_face_collect_variation_unicodes hb_face_collect_variation_unicodes;
	}

	/*
	 * Builder face.
	 */

	version(BindHB_Static)
		hb_face_t* hb_face_builder_create ();
	else
	{
		private alias fp_hb_face_builder_create = hb_face_t* function ();
		__gshared fp_hb_face_builder_create hb_face_builder_create;
	}

	version(BindHB_Static)
		hb_bool_t hb_face_builder_add_table (
			hb_face_t* face,
			hb_tag_t tag,
			hb_blob_t* blob);
	else
	{
		private alias fp_hb_face_builder_add_table = hb_bool_t function (
			hb_face_t* face,
			hb_tag_t tag,
			hb_blob_t* blob);
		__gshared fp_hb_face_builder_add_table hb_face_builder_add_table;
	}
}
