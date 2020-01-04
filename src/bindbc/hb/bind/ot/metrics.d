
//          Copyright Ahmet Sait 2020.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

module bindbc.hb.bind.ot.metrics;

import bindbc.hb.config;

static if (hbSupport >= HBSupport.v2_6_3)
{
	import bindbc.hb.bind.common;
	import bindbc.hb.bind.font;

	extern(C) @nogc nothrow:

	/**
	 * hb_ot_metrics_tag_t:
	 * @HB_OT_METRICS_TAG_HORIZONTAL_ASCENDER: horizontal ascender.
	 * @HB_OT_METRICS_TAG_HORIZONTAL_DESCENDER: horizontal descender.
	 * @HB_OT_METRICS_TAG_HORIZONTAL_LINE_GAP: horizontal line gap.
	 * @HB_OT_METRICS_TAG_HORIZONTAL_CLIPPING_ASCENT: horizontal clipping ascent.
	 * @HB_OT_METRICS_TAG_HORIZONTAL_CLIPPING_DESCENT: horizontal clipping descent.
	 * @HB_OT_METRICS_TAG_VERTICAL_ASCENDER: vertical ascender.
	 * @HB_OT_METRICS_TAG_VERTICAL_DESCENDER: vertical descender.
	 * @HB_OT_METRICS_TAG_VERTICAL_LINE_GAP: vertical line gap.
	 * @HB_OT_METRICS_TAG_HORIZONTAL_CARET_RISE: horizontal caret rise.
	 * @HB_OT_METRICS_TAG_HORIZONTAL_CARET_RUN: horizontal caret run.
	 * @HB_OT_METRICS_TAG_HORIZONTAL_CARET_OFFSET: horizontal caret offset.
	 * @HB_OT_METRICS_TAG_VERTICAL_CARET_RISE: vertical caret rise.
	 * @HB_OT_METRICS_TAG_VERTICAL_CARET_RUN: vertical caret run.
	 * @HB_OT_METRICS_TAG_VERTICAL_CARET_OFFSET: vertical caret offset.
	 * @HB_OT_METRICS_TAG_X_HEIGHT: x height.
	 * @HB_OT_METRICS_TAG_CAP_HEIGHT: cap height.
	 * @HB_OT_METRICS_TAG_SUBSCRIPT_EM_X_SIZE: subscript em x size.
	 * @HB_OT_METRICS_TAG_SUBSCRIPT_EM_Y_SIZE: subscript em y size.
	 * @HB_OT_METRICS_TAG_SUBSCRIPT_EM_X_OFFSET: subscript em x offset.
	 * @HB_OT_METRICS_TAG_SUBSCRIPT_EM_Y_OFFSET: subscript em y offset.
	 * @HB_OT_METRICS_TAG_SUPERSCRIPT_EM_X_SIZE: superscript em x size.
	 * @HB_OT_METRICS_TAG_SUPERSCRIPT_EM_Y_SIZE: superscript em y size.
	 * @HB_OT_METRICS_TAG_SUPERSCRIPT_EM_X_OFFSET: superscript em x offset.
	 * @HB_OT_METRICS_TAG_SUPERSCRIPT_EM_Y_OFFSET: superscript em y offset.
	 * @HB_OT_METRICS_TAG_STRIKEOUT_SIZE: strikeout size.
	 * @HB_OT_METRICS_TAG_STRIKEOUT_OFFSET: strikeout offset.
	 * @HB_OT_METRICS_TAG_UNDERLINE_SIZE: underline size.
	 * @HB_OT_METRICS_TAG_UNDERLINE_OFFSET: underline offset.
	 *
	 * From https://docs.microsoft.com/en-us/typography/opentype/spec/mvar#value-tags
	 *
	 * Since: 2.6.0
	 **/
	enum : hb_tag_t
	{
		HB_OT_METRICS_TAG_HORIZONTAL_ASCENDER = HB_TAG('h', 'a', 's', 'c'),
		HB_OT_METRICS_TAG_HORIZONTAL_DESCENDER = HB_TAG('h', 'd', 's', 'c'),
		HB_OT_METRICS_TAG_HORIZONTAL_LINE_GAP = HB_TAG('h', 'l', 'g', 'p'),
		HB_OT_METRICS_TAG_HORIZONTAL_CLIPPING_ASCENT = HB_TAG('h', 'c', 'l', 'a'),
		HB_OT_METRICS_TAG_HORIZONTAL_CLIPPING_DESCENT = HB_TAG('h', 'c', 'l', 'd'),
		HB_OT_METRICS_TAG_VERTICAL_ASCENDER = HB_TAG('v', 'a', 's', 'c'),
		HB_OT_METRICS_TAG_VERTICAL_DESCENDER = HB_TAG('v', 'd', 's', 'c'),
		HB_OT_METRICS_TAG_VERTICAL_LINE_GAP = HB_TAG('v', 'l', 'g', 'p'),
		HB_OT_METRICS_TAG_HORIZONTAL_CARET_RISE = HB_TAG('h', 'c', 'r', 's'),
		HB_OT_METRICS_TAG_HORIZONTAL_CARET_RUN = HB_TAG('h', 'c', 'r', 'n'),
		HB_OT_METRICS_TAG_HORIZONTAL_CARET_OFFSET = HB_TAG('h', 'c', 'o', 'f'),
		HB_OT_METRICS_TAG_VERTICAL_CARET_RISE = HB_TAG('v', 'c', 'r', 's'),
		HB_OT_METRICS_TAG_VERTICAL_CARET_RUN = HB_TAG('v', 'c', 'r', 'n'),
		HB_OT_METRICS_TAG_VERTICAL_CARET_OFFSET = HB_TAG('v', 'c', 'o', 'f'),
		HB_OT_METRICS_TAG_X_HEIGHT = HB_TAG('x', 'h', 'g', 't'),
		HB_OT_METRICS_TAG_CAP_HEIGHT = HB_TAG('c', 'p', 'h', 't'),
		HB_OT_METRICS_TAG_SUBSCRIPT_EM_X_SIZE = HB_TAG('s', 'b', 'x', 's'),
		HB_OT_METRICS_TAG_SUBSCRIPT_EM_Y_SIZE = HB_TAG('s', 'b', 'y', 's'),
		HB_OT_METRICS_TAG_SUBSCRIPT_EM_X_OFFSET = HB_TAG('s', 'b', 'x', 'o'),
		HB_OT_METRICS_TAG_SUBSCRIPT_EM_Y_OFFSET = HB_TAG('s', 'b', 'y', 'o'),
		HB_OT_METRICS_TAG_SUPERSCRIPT_EM_X_SIZE = HB_TAG('s', 'p', 'x', 's'),
		HB_OT_METRICS_TAG_SUPERSCRIPT_EM_Y_SIZE = HB_TAG('s', 'p', 'y', 's'),
		HB_OT_METRICS_TAG_SUPERSCRIPT_EM_X_OFFSET = HB_TAG('s', 'p', 'x', 'o'),
		HB_OT_METRICS_TAG_SUPERSCRIPT_EM_Y_OFFSET = HB_TAG('s', 'p', 'y', 'o'),
		HB_OT_METRICS_TAG_STRIKEOUT_SIZE = HB_TAG('s', 't', 'r', 's'),
		HB_OT_METRICS_TAG_STRIKEOUT_OFFSET = HB_TAG('s', 't', 'r', 'o'),
		HB_OT_METRICS_TAG_UNDERLINE_SIZE = HB_TAG('u', 'n', 'd', 's'),
		HB_OT_METRICS_TAG_UNDERLINE_OFFSET = HB_TAG('u', 'n', 'd', 'o'),

		_HB_OT_METRICS_TAG_MAX_VALUE = HB_TAG_MAX_SIGNED /*< skip >*/
	}
	alias hb_ot_metrics_tag_t = hb_tag_t;

	/* OUT.  May be NULL. */
	version(BindHB_Static)
		hb_bool_t hb_ot_metrics_get_position (
			hb_font_t* font,
			hb_ot_metrics_tag_t metrics_tag,
			hb_position_t* position);
	else
	{
		private alias fp_hb_ot_metrics_get_position = hb_bool_t function (
			hb_font_t* font,
			hb_ot_metrics_tag_t metrics_tag,
			hb_position_t* position);
		__gshared fp_hb_ot_metrics_get_position hb_ot_metrics_get_position;
	}

	version(BindHB_Static)
		float hb_ot_metrics_get_variation (
			hb_font_t* font,
			hb_ot_metrics_tag_t metrics_tag);
	else
	{
		private alias fp_hb_ot_metrics_get_variation = float function (
			hb_font_t* font,
			hb_ot_metrics_tag_t metrics_tag);
		__gshared fp_hb_ot_metrics_get_variation hb_ot_metrics_get_variation;
	}

	version(BindHB_Static)
		hb_position_t hb_ot_metrics_get_x_variation (
			hb_font_t* font,
			hb_ot_metrics_tag_t metrics_tag);
	else
	{
		private alias fp_hb_ot_metrics_get_x_variation = hb_position_t function (
			hb_font_t* font,
			hb_ot_metrics_tag_t metrics_tag);
		__gshared fp_hb_ot_metrics_get_x_variation hb_ot_metrics_get_x_variation;
	}

	version(BindHB_Static)
		hb_position_t hb_ot_metrics_get_y_variation (
			hb_font_t* font,
			hb_ot_metrics_tag_t metrics_tag);
	else
	{
		private alias fp_hb_ot_metrics_get_y_variation = hb_position_t function (
			hb_font_t* font,
			hb_ot_metrics_tag_t metrics_tag);
		__gshared fp_hb_ot_metrics_get_y_variation hb_ot_metrics_get_y_variation;
	}
}
