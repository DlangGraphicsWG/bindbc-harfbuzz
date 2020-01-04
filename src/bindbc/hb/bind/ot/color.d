
//          Copyright Ahmet Sait 2020.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

module bindbc.hb.bind.ot.color;

import bindbc.hb.config;

static if (hbSupport >= HBSupport.v2_6_3)
{
	import bindbc.hb.bind.blob;
	import bindbc.hb.bind.common;
	import bindbc.hb.bind.face;
	import bindbc.hb.bind.font;
	import bindbc.hb.bind.ot.name;

	extern(C) @nogc nothrow:

	/*
	 * Color palettes.
	 */

	version(BindHB_Static)
		hb_bool_t hb_ot_color_has_palettes (hb_face_t* face);
	else
	{
		private alias fp_hb_ot_color_has_palettes = hb_bool_t function (hb_face_t* face);
		__gshared fp_hb_ot_color_has_palettes hb_ot_color_has_palettes;
	}

	version(BindHB_Static)
		uint hb_ot_color_palette_get_count (hb_face_t* face);
	else
	{
		private alias fp_hb_ot_color_palette_get_count = uint function (hb_face_t* face);
		__gshared fp_hb_ot_color_palette_get_count hb_ot_color_palette_get_count;
	}

	version(BindHB_Static)
		hb_ot_name_id_t hb_ot_color_palette_get_name_id (
			hb_face_t* face,
			uint palette_index);
	else
	{
		private alias fp_hb_ot_color_palette_get_name_id = hb_ot_name_id_t function (
			hb_face_t* face,
			uint palette_index);
		__gshared fp_hb_ot_color_palette_get_name_id hb_ot_color_palette_get_name_id;
	}

	version(BindHB_Static)
		hb_ot_name_id_t hb_ot_color_palette_color_get_name_id (
			hb_face_t* face,
			uint color_index);
	else
	{
		private alias fp_hb_ot_color_palette_color_get_name_id = hb_ot_name_id_t function (
			hb_face_t* face,
			uint color_index);
		__gshared fp_hb_ot_color_palette_color_get_name_id hb_ot_color_palette_color_get_name_id;
	}

	/**
	 * hb_ot_color_palette_flags_t:
	 * @HB_OT_COLOR_PALETTE_FLAG_DEFAULT: Default indicating that there is nothing special
	 *   to note about a color palette.
	 * @HB_OT_COLOR_PALETTE_FLAG_USABLE_WITH_LIGHT_BACKGROUND: Flag indicating that the color
	 *   palette is appropriate to use when displaying the font on a light background such as white.
	 * @HB_OT_COLOR_PALETTE_FLAG_USABLE_WITH_DARK_BACKGROUND: Flag indicating that the color
	 *   palette is appropriate to use when displaying the font on a dark background such as black.
	 *
	 * Since: 2.1.0
	 */
	enum : uint
	{
		/*< flags >*/
		HB_OT_COLOR_PALETTE_FLAG_DEFAULT = 0x00000000u,
		HB_OT_COLOR_PALETTE_FLAG_USABLE_WITH_LIGHT_BACKGROUND = 0x00000001u,
		HB_OT_COLOR_PALETTE_FLAG_USABLE_WITH_DARK_BACKGROUND = 0x00000002u
	}
	alias hb_ot_color_palette_flags_t = uint;

	version(BindHB_Static)
		hb_ot_color_palette_flags_t hb_ot_color_palette_get_flags (
			hb_face_t* face,
			uint palette_index);
	else
	{
		private alias fp_hb_ot_color_palette_get_flags = hb_ot_color_palette_flags_t function (
			hb_face_t* face,
			uint palette_index);
		__gshared fp_hb_ot_color_palette_get_flags hb_ot_color_palette_get_flags;
	}

	/* IN/OUT.  May be NULL. */
	/* OUT.     May be NULL. */
	version(BindHB_Static)
		uint hb_ot_color_palette_get_colors (
			hb_face_t* face,
			uint palette_index,
			uint start_offset,
			uint* color_count,
			hb_color_t* colors);
	else
	{
		private alias fp_hb_ot_color_palette_get_colors = uint function (
			hb_face_t* face,
			uint palette_index,
			uint start_offset,
			uint* color_count,
			hb_color_t* colors);
		__gshared fp_hb_ot_color_palette_get_colors hb_ot_color_palette_get_colors;
	}

	/*
	 * Color layers.
	 */

	version(BindHB_Static)
		hb_bool_t hb_ot_color_has_layers (hb_face_t* face);
	else
	{
		private alias fp_hb_ot_color_has_layers = hb_bool_t function (hb_face_t* face);
		__gshared fp_hb_ot_color_has_layers hb_ot_color_has_layers;
	}

	/**
	 * hb_ot_color_layer_t:
	 *
	 * Pairs of glyph and color index.
	 *
	 * Since: 2.1.0
	 **/
	struct hb_ot_color_layer_t
	{
		hb_codepoint_t glyph;
		uint color_index;
	}

	/* IN/OUT.  May be NULL. */
	/* OUT.     May be NULL. */
	version(BindHB_Static)
		uint hb_ot_color_glyph_get_layers (
			hb_face_t* face,
			hb_codepoint_t glyph,
			uint start_offset,
			uint* layer_count,
			hb_ot_color_layer_t* layers);
	else
	{
		private alias fp_hb_ot_color_glyph_get_layers = uint function (
			hb_face_t* face,
			hb_codepoint_t glyph,
			uint start_offset,
			uint* layer_count,
			hb_ot_color_layer_t* layers);
		__gshared fp_hb_ot_color_glyph_get_layers hb_ot_color_glyph_get_layers;
	}

	/*
	 * SVG
	 */

	version(BindHB_Static)
		hb_bool_t hb_ot_color_has_svg (hb_face_t* face);
	else
	{
		private alias fp_hb_ot_color_has_svg = hb_bool_t function (hb_face_t* face);
		__gshared fp_hb_ot_color_has_svg hb_ot_color_has_svg;
	}

	version(BindHB_Static)
		hb_blob_t* hb_ot_color_glyph_reference_svg (
			hb_face_t* face,
			hb_codepoint_t glyph);
	else
	{
		private alias fp_hb_ot_color_glyph_reference_svg = hb_blob_t* function (
			hb_face_t* face,
			hb_codepoint_t glyph);
		__gshared fp_hb_ot_color_glyph_reference_svg hb_ot_color_glyph_reference_svg;
	}

	/*
	 * PNG: CBDT or sbix
	 */

	version(BindHB_Static)
		hb_bool_t hb_ot_color_has_png (hb_face_t* face);
	else
	{
		private alias fp_hb_ot_color_has_png = hb_bool_t function (hb_face_t* face);
		__gshared fp_hb_ot_color_has_png hb_ot_color_has_png;
	}

	version(BindHB_Static)
		hb_blob_t* hb_ot_color_glyph_reference_png (
			hb_font_t* font,
			hb_codepoint_t glyph);
	else
	{
		private alias fp_hb_ot_color_glyph_reference_png = hb_blob_t* function (
			hb_font_t* font,
			hb_codepoint_t glyph);
		__gshared fp_hb_ot_color_glyph_reference_png hb_ot_color_glyph_reference_png;
	}
}
