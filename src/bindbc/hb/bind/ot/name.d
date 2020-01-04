
//          Copyright Ahmet Sait 2020.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

module bindbc.hb.bind.ot.name;

import bindbc.hb.config;

import bindbc.hb.bind.common;
import bindbc.hb.bind.face;

extern(C) @nogc nothrow:

/**
 * hb_ot_name_id_t:
 * @HB_OT_NAME_ID_INVALID: Value to represent a nonexistent name ID.
 *
 * An integral type representing an OpenType 'name' table name identifier.
 * There are predefined name IDs, as well as name IDs return from other
 * API.  These can be used to fetch name strings from a font face.
 *
 * Since: 2.0.0
 **/
enum : uint
{
	HB_OT_NAME_ID_COPYRIGHT = 0,
	HB_OT_NAME_ID_FONT_FAMILY = 1,
	HB_OT_NAME_ID_FONT_SUBFAMILY = 2,
	HB_OT_NAME_ID_UNIQUE_ID = 3,
	HB_OT_NAME_ID_FULL_NAME = 4,
	HB_OT_NAME_ID_VERSION_STRING = 5,
	HB_OT_NAME_ID_POSTSCRIPT_NAME = 6,
	HB_OT_NAME_ID_TRADEMARK = 7,
	HB_OT_NAME_ID_MANUFACTURER = 8,
	HB_OT_NAME_ID_DESIGNER = 9,
	HB_OT_NAME_ID_DESCRIPTION = 10,
	HB_OT_NAME_ID_VENDOR_URL = 11,
	HB_OT_NAME_ID_DESIGNER_URL = 12,
	HB_OT_NAME_ID_LICENSE = 13,
	HB_OT_NAME_ID_LICENSE_URL = 14,
	/*HB_OT_NAME_ID_RESERVED		= 15,*/
	HB_OT_NAME_ID_TYPOGRAPHIC_FAMILY = 16,
	HB_OT_NAME_ID_TYPOGRAPHIC_SUBFAMILY = 17,
	HB_OT_NAME_ID_MAC_FULL_NAME = 18,
	HB_OT_NAME_ID_SAMPLE_TEXT = 19,
	HB_OT_NAME_ID_CID_FINDFONT_NAME = 20,
	HB_OT_NAME_ID_WWS_FAMILY = 21,
	HB_OT_NAME_ID_WWS_SUBFAMILY = 22,
	HB_OT_NAME_ID_LIGHT_BACKGROUND = 23,
	HB_OT_NAME_ID_DARK_BACKGROUND = 24,
	HB_OT_NAME_ID_VARIATIONS_PS_PREFIX = 25,

	HB_OT_NAME_ID_INVALID = 0xFFFF
}
alias hb_ot_name_id_t = uint;

static if (hbSupport >= HBSupport.v2_6_3)
{
	/**
	 * hb_ot_name_entry_t:
	 * @name_id: name ID
	 * @language: language
	 *
	 * Structure representing a name ID in a particular language.
	 *
	 * Since: 2.1.0
	 **/
	struct hb_ot_name_entry_t
	{
		hb_ot_name_id_t name_id;
		/*< private >*/
		hb_var_int_t var;
		/*< public >*/
		hb_language_t language;
	}

	/* OUT */
	version(BindHB_Static)
		const(hb_ot_name_entry_t)* hb_ot_name_list_names (
			hb_face_t* face,
			uint* num_entries);
	else
	{
		private alias fp_hb_ot_name_list_names = const(hb_ot_name_entry_t)* function (
			hb_face_t* face,
			uint* num_entries);
		__gshared fp_hb_ot_name_list_names hb_ot_name_list_names;
	}

	/* IN/OUT */
	/* OUT */
	version(BindHB_Static)
		uint hb_ot_name_get_utf8 (
			hb_face_t* face,
			hb_ot_name_id_t name_id,
			hb_language_t language,
			uint* text_size,
			char* text);
	else
	{
		private alias fp_hb_ot_name_get_utf8 = uint function (
			hb_face_t* face,
			hb_ot_name_id_t name_id,
			hb_language_t language,
			uint* text_size,
			char* text);
		__gshared fp_hb_ot_name_get_utf8 hb_ot_name_get_utf8;
	}

	/* IN/OUT */
	/* OUT */
	version(BindHB_Static)
		uint hb_ot_name_get_utf16 (
			hb_face_t* face,
			hb_ot_name_id_t name_id,
			hb_language_t language,
			uint* text_size,
			ushort* text);
	else
	{
		private alias fp_hb_ot_name_get_utf16 = uint function (
			hb_face_t* face,
			hb_ot_name_id_t name_id,
			hb_language_t language,
			uint* text_size,
			ushort* text);
		__gshared fp_hb_ot_name_get_utf16 hb_ot_name_get_utf16;
	}

	/* IN/OUT */
	/* OUT */
	version(BindHB_Static)
		uint hb_ot_name_get_utf32 (
			hb_face_t* face,
			hb_ot_name_id_t name_id,
			hb_language_t language,
			uint* text_size,
			uint* text);
	else
	{
		private alias fp_hb_ot_name_get_utf32 = uint function (
			hb_face_t* face,
			hb_ot_name_id_t name_id,
			hb_language_t language,
			uint* text_size,
			uint* text);
		__gshared fp_hb_ot_name_get_utf32 hb_ot_name_get_utf32;
	}
}
