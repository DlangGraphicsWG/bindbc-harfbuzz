
//          Copyright Ahmet Sait 2020.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

module bindbc.hb.bind.ot.meta;

import bindbc.hb.config;

static if (hbSupport >= HBSupport.v2_6_3)
{
	import bindbc.hb.bind.blob;
	import bindbc.hb.bind.common;
	import bindbc.hb.bind.face;

	extern(C) @nogc nothrow:

	/**
	 * hb_ot_meta_tag_t:
	 * @HB_OT_META_TAG_DESIGN_LANGUAGES: Design languages. Text, using only
	 * Basic Latin (ASCII) characters. Indicates languages and/or scripts
	 * for the user audiences that the font was primarily designed for.
	 * @HB_OT_META_TAG_SUPPORTED_LANGUAGES: Supported languages. Text, using
	 * only Basic Latin (ASCII) characters. Indicates languages and/or scripts
	 * that the font is declared to be capable of supporting.
	 *
	 * Known metadata tags from https://docs.microsoft.com/en-us/typography/opentype/spec/meta
	 *
	 * Since: 2.6.0
	 **/
	enum : hb_tag_t
	{
		/*
		   HB_OT_META_TAG_APPL		= HB_TAG ('a','p','p','l'),
		   HB_OT_META_TAG_BILD		= HB_TAG ('b','i','l','d'),
		*/
		HB_OT_META_TAG_DESIGN_LANGUAGES = HB_TAG('d', 'l', 'n', 'g'),
		HB_OT_META_TAG_SUPPORTED_LANGUAGES = HB_TAG('s', 'l', 'n', 'g'),

		_HB_OT_META_TAG_MAX_VALUE = HB_TAG_MAX_SIGNED /*< skip >*/
	}
	alias hb_ot_meta_tag_t = hb_tag_t;

	/* IN/OUT.  May be NULL. */
	/* OUT.     May be NULL. */
	version(BindHB_Static)
		uint hb_ot_meta_get_entry_tags (
			hb_face_t* face,
			uint start_offset,
			uint* entries_count,
			hb_ot_meta_tag_t* entries);
	else
	{
		private alias fp_hb_ot_meta_get_entry_tags = uint function (
			hb_face_t* face,
			uint start_offset,
			uint* entries_count,
			hb_ot_meta_tag_t* entries);
		__gshared fp_hb_ot_meta_get_entry_tags hb_ot_meta_get_entry_tags;
	}

	version(BindHB_Static)
		hb_blob_t* hb_ot_meta_reference_entry (
			hb_face_t* face,
			hb_ot_meta_tag_t meta_tag);
	else
	{
		private alias fp_hb_ot_meta_reference_entry = hb_blob_t* function (
			hb_face_t* face,
			hb_ot_meta_tag_t meta_tag);
		__gshared fp_hb_ot_meta_reference_entry hb_ot_meta_reference_entry;
	}
}
