
//          Copyright Ahmet Sait 2020.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

module bindbc.hb.bind.ot.layout;

import bindbc.hb.config;

import bindbc.hb.bind.common;
import bindbc.hb.bind.face;
import bindbc.hb.bind.font;
import bindbc.hb.bind.set;
import bindbc.hb.bind.ot.name;

extern(C) @nogc nothrow:

enum HB_OT_TAG_BASE = HB_TAG('B', 'A', 'S', 'E');
enum HB_OT_TAG_GDEF = HB_TAG('G', 'D', 'E', 'F');
enum HB_OT_TAG_GSUB = HB_TAG('G', 'S', 'U', 'B');
enum HB_OT_TAG_GPOS = HB_TAG('G', 'P', 'O', 'S');
enum HB_OT_TAG_JSTF = HB_TAG('J', 'S', 'T', 'F');

/*
 * Script & Language tags.
 */

enum HB_OT_TAG_DEFAULT_SCRIPT = HB_TAG('D', 'F', 'L', 'T');
enum HB_OT_TAG_DEFAULT_LANGUAGE = HB_TAG('d', 'f', 'l', 't');

/**
 * HB_OT_MAX_TAGS_PER_SCRIPT:
 *
 * Since: 2.0.0
 **/
enum HB_OT_MAX_TAGS_PER_SCRIPT = 3u;
/**
 * HB_OT_MAX_TAGS_PER_LANGUAGE:
 *
 * Since: 2.0.0
 **/
enum HB_OT_MAX_TAGS_PER_LANGUAGE = 3u;

static if (hbSupport >= HBSupport.v2_6_3)
{
	/* IN/OUT */
	/* OUT */
	/* IN/OUT */
	/* OUT */
	version(BindHB_Static)
		void hb_ot_tags_from_script_and_language (
			hb_script_t script,
			hb_language_t language,
			uint* script_count,
			hb_tag_t* script_tags,
			uint* language_count,
			hb_tag_t* language_tags);
	else
	{
		private alias fp_hb_ot_tags_from_script_and_language = void function (
			hb_script_t script,
			hb_language_t language,
			uint* script_count,
			hb_tag_t* script_tags,
			uint* language_count,
			hb_tag_t* language_tags);
		__gshared fp_hb_ot_tags_from_script_and_language hb_ot_tags_from_script_and_language;
	}
}

version(BindHB_Static)
    hb_script_t hb_ot_tag_to_script (hb_tag_t tag);
else
{
    private alias fp_hb_ot_tag_to_script = hb_script_t function (hb_tag_t tag);
    __gshared fp_hb_ot_tag_to_script hb_ot_tag_to_script;
}

version(BindHB_Static)
    hb_language_t hb_ot_tag_to_language (hb_tag_t tag);
else
{
    private alias fp_hb_ot_tag_to_language = hb_language_t function (hb_tag_t tag);
    __gshared fp_hb_ot_tag_to_language hb_ot_tag_to_language;
}

static if (hbSupport >= HBSupport.v2_6_3)
{
	/* OUT */
	/* OUT */
	version(BindHB_Static)
		void hb_ot_tags_to_script_and_language (
			hb_tag_t script_tag,
			hb_tag_t language_tag,
			hb_script_t* script,
			hb_language_t* language);
	else
	{
		private alias fp_hb_ot_tags_to_script_and_language = void function (
			hb_tag_t script_tag,
			hb_tag_t language_tag,
			hb_script_t* script,
			hb_language_t* language);
		__gshared fp_hb_ot_tags_to_script_and_language hb_ot_tags_to_script_and_language;
	}
}

/*
 * GDEF
 */

version(BindHB_Static)
    hb_bool_t hb_ot_layout_has_glyph_classes (hb_face_t* face);
else
{
    private alias fp_hb_ot_layout_has_glyph_classes = hb_bool_t function (hb_face_t* face);
    __gshared fp_hb_ot_layout_has_glyph_classes hb_ot_layout_has_glyph_classes;
}

/**
 * hb_ot_layout_glyph_class_t:
 * @HB_OT_LAYOUT_GLYPH_CLASS_UNCLASSIFIED: Glyphs not matching the other classifications
 * @HB_OT_LAYOUT_GLYPH_CLASS_BASE_GLYPH: Spacing, single characters, capable of accepting marks
 * @HB_OT_LAYOUT_GLYPH_CLASS_LIGATURE: Glyphs that represent ligation of multiple characters
 * @HB_OT_LAYOUT_GLYPH_CLASS_MARK: Non-spacing, combining glyphs that represent marks
 * @HB_OT_LAYOUT_GLYPH_CLASS_COMPONENT: Spacing glyphs that represent part of a single character
 *
 * The GDEF classes defined for glyphs.
 *
 **/
enum : int
{
    HB_OT_LAYOUT_GLYPH_CLASS_UNCLASSIFIED = 0,
    HB_OT_LAYOUT_GLYPH_CLASS_BASE_GLYPH = 1,
    HB_OT_LAYOUT_GLYPH_CLASS_LIGATURE = 2,
    HB_OT_LAYOUT_GLYPH_CLASS_MARK = 3,
    HB_OT_LAYOUT_GLYPH_CLASS_COMPONENT = 4
}
alias hb_ot_layout_glyph_class_t = int;

version(BindHB_Static)
    hb_ot_layout_glyph_class_t hb_ot_layout_get_glyph_class (
        hb_face_t* face,
        hb_codepoint_t glyph);
else
{
    private alias fp_hb_ot_layout_get_glyph_class = hb_ot_layout_glyph_class_t function (
        hb_face_t* face,
        hb_codepoint_t glyph);
    __gshared fp_hb_ot_layout_get_glyph_class hb_ot_layout_get_glyph_class;
}

/* OUT */
version(BindHB_Static)
    void hb_ot_layout_get_glyphs_in_class (
        hb_face_t* face,
        hb_ot_layout_glyph_class_t klass,
        hb_set_t* glyphs);
else
{
    private alias fp_hb_ot_layout_get_glyphs_in_class = void function (
        hb_face_t* face,
        hb_ot_layout_glyph_class_t klass,
        hb_set_t* glyphs);
    __gshared fp_hb_ot_layout_get_glyphs_in_class hb_ot_layout_get_glyphs_in_class;
}

/* Not that useful.  Provides list of attach points for a glyph that a
 * client may want to cache */

/* IN/OUT */
/* OUT */
version(BindHB_Static)
    uint hb_ot_layout_get_attach_points (
        hb_face_t* face,
        hb_codepoint_t glyph,
        uint start_offset,
        uint* point_count,
        uint* point_array);
else
{
    private alias fp_hb_ot_layout_get_attach_points = uint function (
        hb_face_t* face,
        hb_codepoint_t glyph,
        uint start_offset,
        uint* point_count,
        uint* point_array);
    __gshared fp_hb_ot_layout_get_attach_points hb_ot_layout_get_attach_points;
}

/* Ligature caret positions */

/* IN/OUT */
/* OUT */
version(BindHB_Static)
    uint hb_ot_layout_get_ligature_carets (
        hb_font_t* font,
        hb_direction_t direction,
        hb_codepoint_t glyph,
        uint start_offset,
        uint* caret_count,
        hb_position_t* caret_array);
else
{
    private alias fp_hb_ot_layout_get_ligature_carets = uint function (
        hb_font_t* font,
        hb_direction_t direction,
        hb_codepoint_t glyph,
        uint start_offset,
        uint* caret_count,
        hb_position_t* caret_array);
    __gshared fp_hb_ot_layout_get_ligature_carets hb_ot_layout_get_ligature_carets;
}

/*
 * GSUB/GPOS feature query and enumeration interface
 */

enum HB_OT_LAYOUT_NO_SCRIPT_INDEX = 0xFFFFu;
enum HB_OT_LAYOUT_NO_FEATURE_INDEX = 0xFFFFu;
enum HB_OT_LAYOUT_DEFAULT_LANGUAGE_INDEX = 0xFFFFu;
enum HB_OT_LAYOUT_NO_VARIATIONS_INDEX = 0xFFFFFFFFu;

/* IN/OUT */
/* OUT */
version(BindHB_Static)
    uint hb_ot_layout_table_get_script_tags (
        hb_face_t* face,
        hb_tag_t table_tag,
        uint start_offset,
        uint* script_count,
        hb_tag_t* script_tags);
else
{
    private alias fp_hb_ot_layout_table_get_script_tags = uint function (
        hb_face_t* face,
        hb_tag_t table_tag,
        uint start_offset,
        uint* script_count,
        hb_tag_t* script_tags);
    __gshared fp_hb_ot_layout_table_get_script_tags hb_ot_layout_table_get_script_tags;
}

version(BindHB_Static)
    hb_bool_t hb_ot_layout_table_find_script (
        hb_face_t* face,
        hb_tag_t table_tag,
        hb_tag_t script_tag,
        uint* script_index);
else
{
    private alias fp_hb_ot_layout_table_find_script = hb_bool_t function (
        hb_face_t* face,
        hb_tag_t table_tag,
        hb_tag_t script_tag,
        uint* script_index);
    __gshared fp_hb_ot_layout_table_find_script hb_ot_layout_table_find_script;
}

static if (hbSupport >= HBSupport.v2_6_3)
{
	/* OUT */
	/* OUT */
	version(BindHB_Static)
		hb_bool_t hb_ot_layout_table_select_script (
			hb_face_t* face,
			hb_tag_t table_tag,
			uint script_count,
			const(hb_tag_t)* script_tags,
			uint* script_index,
			hb_tag_t* chosen_script);
	else
	{
		private alias fp_hb_ot_layout_table_select_script = hb_bool_t function (
			hb_face_t* face,
			hb_tag_t table_tag,
			uint script_count,
			const(hb_tag_t)* script_tags,
			uint* script_index,
			hb_tag_t* chosen_script);
		__gshared fp_hb_ot_layout_table_select_script hb_ot_layout_table_select_script;
	}
}

/* IN/OUT */
/* OUT */
version(BindHB_Static)
    uint hb_ot_layout_table_get_feature_tags (
        hb_face_t* face,
        hb_tag_t table_tag,
        uint start_offset,
        uint* feature_count,
        hb_tag_t* feature_tags);
else
{
    private alias fp_hb_ot_layout_table_get_feature_tags = uint function (
        hb_face_t* face,
        hb_tag_t table_tag,
        uint start_offset,
        uint* feature_count,
        hb_tag_t* feature_tags);
    __gshared fp_hb_ot_layout_table_get_feature_tags hb_ot_layout_table_get_feature_tags;
}

/* IN/OUT */
/* OUT */
version(BindHB_Static)
    uint hb_ot_layout_script_get_language_tags (
        hb_face_t* face,
        hb_tag_t table_tag,
        uint script_index,
        uint start_offset,
        uint* language_count,
        hb_tag_t* language_tags);
else
{
    private alias fp_hb_ot_layout_script_get_language_tags = uint function (
        hb_face_t* face,
        hb_tag_t table_tag,
        uint script_index,
        uint start_offset,
        uint* language_count,
        hb_tag_t* language_tags);
    __gshared fp_hb_ot_layout_script_get_language_tags hb_ot_layout_script_get_language_tags;
}

static if (hbSupport >= HBSupport.v2_6_3)
{
	/* OUT */
	version(BindHB_Static)
		hb_bool_t hb_ot_layout_script_select_language (
			hb_face_t* face,
			hb_tag_t table_tag,
			uint script_index,
			uint language_count,
			const(hb_tag_t)* language_tags,
			uint* language_index);
	else
	{
		private alias fp_hb_ot_layout_script_select_language = hb_bool_t function (
			hb_face_t* face,
			hb_tag_t table_tag,
			uint script_index,
			uint language_count,
			const(hb_tag_t)* language_tags,
			uint* language_index);
		__gshared fp_hb_ot_layout_script_select_language hb_ot_layout_script_select_language;
	}
}

version(BindHB_Static)
    hb_bool_t hb_ot_layout_language_get_required_feature_index (
        hb_face_t* face,
        hb_tag_t table_tag,
        uint script_index,
        uint language_index,
        uint* feature_index);
else
{
    private alias fp_hb_ot_layout_language_get_required_feature_index = hb_bool_t function (
        hb_face_t* face,
        hb_tag_t table_tag,
        uint script_index,
        uint language_index,
        uint* feature_index);
    __gshared fp_hb_ot_layout_language_get_required_feature_index hb_ot_layout_language_get_required_feature_index;
}

version(BindHB_Static)
    hb_bool_t hb_ot_layout_language_get_required_feature (
        hb_face_t* face,
        hb_tag_t table_tag,
        uint script_index,
        uint language_index,
        uint* feature_index,
        hb_tag_t* feature_tag);
else
{
    private alias fp_hb_ot_layout_language_get_required_feature = hb_bool_t function (
        hb_face_t* face,
        hb_tag_t table_tag,
        uint script_index,
        uint language_index,
        uint* feature_index,
        hb_tag_t* feature_tag);
    __gshared fp_hb_ot_layout_language_get_required_feature hb_ot_layout_language_get_required_feature;
}

/* IN/OUT */
/* OUT */
version(BindHB_Static)
    uint hb_ot_layout_language_get_feature_indexes (
        hb_face_t* face,
        hb_tag_t table_tag,
        uint script_index,
        uint language_index,
        uint start_offset,
        uint* feature_count,
        uint* feature_indexes);
else
{
    private alias fp_hb_ot_layout_language_get_feature_indexes = uint function (
        hb_face_t* face,
        hb_tag_t table_tag,
        uint script_index,
        uint language_index,
        uint start_offset,
        uint* feature_count,
        uint* feature_indexes);
    __gshared fp_hb_ot_layout_language_get_feature_indexes hb_ot_layout_language_get_feature_indexes;
}

/* IN/OUT */
/* OUT */
version(BindHB_Static)
    uint hb_ot_layout_language_get_feature_tags (
        hb_face_t* face,
        hb_tag_t table_tag,
        uint script_index,
        uint language_index,
        uint start_offset,
        uint* feature_count,
        hb_tag_t* feature_tags);
else
{
    private alias fp_hb_ot_layout_language_get_feature_tags = uint function (
        hb_face_t* face,
        hb_tag_t table_tag,
        uint script_index,
        uint language_index,
        uint start_offset,
        uint* feature_count,
        hb_tag_t* feature_tags);
    __gshared fp_hb_ot_layout_language_get_feature_tags hb_ot_layout_language_get_feature_tags;
}

version(BindHB_Static)
    hb_bool_t hb_ot_layout_language_find_feature (
        hb_face_t* face,
        hb_tag_t table_tag,
        uint script_index,
        uint language_index,
        hb_tag_t feature_tag,
        uint* feature_index);
else
{
    private alias fp_hb_ot_layout_language_find_feature = hb_bool_t function (
        hb_face_t* face,
        hb_tag_t table_tag,
        uint script_index,
        uint language_index,
        hb_tag_t feature_tag,
        uint* feature_index);
    __gshared fp_hb_ot_layout_language_find_feature hb_ot_layout_language_find_feature;
}

/* IN/OUT */
/* OUT */
version(BindHB_Static)
    uint hb_ot_layout_feature_get_lookups (
        hb_face_t* face,
        hb_tag_t table_tag,
        uint feature_index,
        uint start_offset,
        uint* lookup_count,
        uint* lookup_indexes);
else
{
    private alias fp_hb_ot_layout_feature_get_lookups = uint function (
        hb_face_t* face,
        hb_tag_t table_tag,
        uint feature_index,
        uint start_offset,
        uint* lookup_count,
        uint* lookup_indexes);
    __gshared fp_hb_ot_layout_feature_get_lookups hb_ot_layout_feature_get_lookups;
}

version(BindHB_Static)
    uint hb_ot_layout_table_get_lookup_count (hb_face_t* face, hb_tag_t table_tag);
else
{
    private alias fp_hb_ot_layout_table_get_lookup_count = uint function (hb_face_t* face, hb_tag_t table_tag);
    __gshared fp_hb_ot_layout_table_get_lookup_count hb_ot_layout_table_get_lookup_count;
}

static if (hbSupport >= HBSupport.v2_6_3)
{
	/* OUT */
	version(BindHB_Static)
		void hb_ot_layout_collect_features (
			hb_face_t* face,
			hb_tag_t table_tag,
			const(hb_tag_t)* scripts,
			const(hb_tag_t)* languages,
			const(hb_tag_t)* features,
			hb_set_t* feature_indexes);
	else
	{
		private alias fp_hb_ot_layout_collect_features = void function (
			hb_face_t* face,
			hb_tag_t table_tag,
			const(hb_tag_t)* scripts,
			const(hb_tag_t)* languages,
			const(hb_tag_t)* features,
			hb_set_t* feature_indexes);
		__gshared fp_hb_ot_layout_collect_features hb_ot_layout_collect_features;
	}
}

/* OUT */
version(BindHB_Static)
    void hb_ot_layout_collect_lookups (
        hb_face_t* face,
        hb_tag_t table_tag,
        const(hb_tag_t)* scripts,
        const(hb_tag_t)* languages,
        const(hb_tag_t)* features,
        hb_set_t* lookup_indexes);
else
{
    private alias fp_hb_ot_layout_collect_lookups = void function (
        hb_face_t* face,
        hb_tag_t table_tag,
        const(hb_tag_t)* scripts,
        const(hb_tag_t)* languages,
        const(hb_tag_t)* features,
        hb_set_t* lookup_indexes);
    __gshared fp_hb_ot_layout_collect_lookups hb_ot_layout_collect_lookups;
}

/* OUT.  May be NULL */
/* OUT.  May be NULL */
/* OUT.  May be NULL */
/* OUT.  May be NULL */
version(BindHB_Static)
    void hb_ot_layout_lookup_collect_glyphs (
        hb_face_t* face,
        hb_tag_t table_tag,
        uint lookup_index,
        hb_set_t* glyphs_before,
        hb_set_t* glyphs_input,
        hb_set_t* glyphs_after,
        hb_set_t* glyphs_output);
else
{
    private alias fp_hb_ot_layout_lookup_collect_glyphs = void function (
        hb_face_t* face,
        hb_tag_t table_tag,
        uint lookup_index,
        hb_set_t* glyphs_before,
        hb_set_t* glyphs_input,
        hb_set_t* glyphs_after,
        hb_set_t* glyphs_output);
    __gshared fp_hb_ot_layout_lookup_collect_glyphs hb_ot_layout_lookup_collect_glyphs;
}

/* Variations support */

/* out */
version(BindHB_Static)
    hb_bool_t hb_ot_layout_table_find_feature_variations (
        hb_face_t* face,
        hb_tag_t table_tag,
        const(int)* coords,
        uint num_coords,
        uint* variations_index);
else
{
    private alias fp_hb_ot_layout_table_find_feature_variations = hb_bool_t function (
        hb_face_t* face,
        hb_tag_t table_tag,
        const(int)* coords,
        uint num_coords,
        uint* variations_index);
    __gshared fp_hb_ot_layout_table_find_feature_variations hb_ot_layout_table_find_feature_variations;
}

/* IN/OUT */
/* OUT */
version(BindHB_Static)
    uint hb_ot_layout_feature_with_variations_get_lookups (
        hb_face_t* face,
        hb_tag_t table_tag,
        uint feature_index,
        uint variations_index,
        uint start_offset,
        uint* lookup_count,
        uint* lookup_indexes);
else
{
    private alias fp_hb_ot_layout_feature_with_variations_get_lookups = uint function (
        hb_face_t* face,
        hb_tag_t table_tag,
        uint feature_index,
        uint variations_index,
        uint start_offset,
        uint* lookup_count,
        uint* lookup_indexes);
    __gshared fp_hb_ot_layout_feature_with_variations_get_lookups hb_ot_layout_feature_with_variations_get_lookups;
}

/*
 * GSUB
 */

version(BindHB_Static)
    hb_bool_t hb_ot_layout_has_substitution (hb_face_t* face);
else
{
    private alias fp_hb_ot_layout_has_substitution = hb_bool_t function (hb_face_t* face);
    __gshared fp_hb_ot_layout_has_substitution hb_ot_layout_has_substitution;
}

version(BindHB_Static)
    hb_bool_t hb_ot_layout_lookup_would_substitute (
        hb_face_t* face,
        uint lookup_index,
        const(hb_codepoint_t)* glyphs,
        uint glyphs_length,
        hb_bool_t zero_context);
else
{
    private alias fp_hb_ot_layout_lookup_would_substitute = hb_bool_t function (
        hb_face_t* face,
        uint lookup_index,
        const(hb_codepoint_t)* glyphs,
        uint glyphs_length,
        hb_bool_t zero_context);
    __gshared fp_hb_ot_layout_lookup_would_substitute hb_ot_layout_lookup_would_substitute;
}

/*TODO , hb_bool_t  inclusive */
version(BindHB_Static)
    void hb_ot_layout_lookup_substitute_closure (
        hb_face_t* face,
        uint lookup_index,
        hb_set_t* glyphs);
else
{
    private alias fp_hb_ot_layout_lookup_substitute_closure = void function (
        hb_face_t* face,
        uint lookup_index,
        hb_set_t* glyphs);
    __gshared fp_hb_ot_layout_lookup_substitute_closure hb_ot_layout_lookup_substitute_closure;
}

static if (hbSupport >= HBSupport.v2_6_3)
{
	version(BindHB_Static)
		void hb_ot_layout_lookups_substitute_closure (
			hb_face_t* face,
			const(hb_set_t)* lookups,
			hb_set_t* glyphs);
	else
	{
		private alias fp_hb_ot_layout_lookups_substitute_closure = void function (
			hb_face_t* face,
			const(hb_set_t)* lookups,
			hb_set_t* glyphs);
		__gshared fp_hb_ot_layout_lookups_substitute_closure hb_ot_layout_lookups_substitute_closure;
	}
}

/* Note: You better have GDEF when using this API, or marks won't do much. */

/* OUT */
/* OUT */
/* OUT */

/*
 * GPOS
 */

version(BindHB_Static)
    hb_bool_t hb_ot_layout_has_positioning (hb_face_t* face);
else
{
    private alias fp_hb_ot_layout_has_positioning = hb_bool_t function (hb_face_t* face);
    __gshared fp_hb_ot_layout_has_positioning hb_ot_layout_has_positioning;
}

/* Note: You better have GDEF when using this API, or marks won't do much. */

/* IN / OUT */

/* Optical 'size' feature info.  Returns true if found.
 * https://docs.microsoft.com/en-us/typography/opentype/spec/features_pt#size */

/* OUT.  May be NULL */
/* OUT.  May be NULL */
/* OUT.  May be NULL */
/* OUT.  May be NULL */
/* OUT.  May be NULL */
version(BindHB_Static)
    hb_bool_t hb_ot_layout_get_size_params (
        hb_face_t* face,
        uint* design_size,
        uint* subfamily_id,
        hb_ot_name_id_t* subfamily_name_id,
        uint* range_start,
        uint* range_end);
else
{
    private alias fp_hb_ot_layout_get_size_params = hb_bool_t function (
        hb_face_t* face,
        uint* design_size,
        uint* subfamily_id,
        hb_ot_name_id_t* subfamily_name_id,
        uint* range_start,
        uint* range_end);
    __gshared fp_hb_ot_layout_get_size_params hb_ot_layout_get_size_params;
}

static if (hbSupport >= HBSupport.v2_6_3)
{
	/* OUT.  May be NULL */
	/* OUT.  May be NULL */
	/* OUT.  May be NULL */
	/* OUT.  May be NULL */
	/* OUT.  May be NULL */
	version(BindHB_Static)
		hb_bool_t hb_ot_layout_feature_get_name_ids (
			hb_face_t* face,
			hb_tag_t table_tag,
			uint feature_index,
			hb_ot_name_id_t* label_id,
			hb_ot_name_id_t* tooltip_id,
			hb_ot_name_id_t* sample_id,
			uint* num_named_parameters,
			hb_ot_name_id_t* first_param_id);
	else
	{
		private alias fp_hb_ot_layout_feature_get_name_ids = hb_bool_t function (
			hb_face_t* face,
			hb_tag_t table_tag,
			uint feature_index,
			hb_ot_name_id_t* label_id,
			hb_ot_name_id_t* tooltip_id,
			hb_ot_name_id_t* sample_id,
			uint* num_named_parameters,
			hb_ot_name_id_t* first_param_id);
		__gshared fp_hb_ot_layout_feature_get_name_ids hb_ot_layout_feature_get_name_ids;
	}
	
	/* IN/OUT.  May be NULL */
	/* OUT.     May be NULL */
	version(BindHB_Static)
		uint hb_ot_layout_feature_get_characters (
			hb_face_t* face,
			hb_tag_t table_tag,
			uint feature_index,
			uint start_offset,
			uint* char_count,
			hb_codepoint_t* characters);
	else
	{
		private alias fp_hb_ot_layout_feature_get_characters = uint function (
			hb_face_t* face,
			hb_tag_t table_tag,
			uint feature_index,
			uint start_offset,
			uint* char_count,
			hb_codepoint_t* characters);
		__gshared fp_hb_ot_layout_feature_get_characters hb_ot_layout_feature_get_characters;
	}
}

static if (hbSupport >= HBSupport.v2_6_3)
{
	/*
	 * BASE
	 */

	/**
	 * hb_ot_layout_baseline_tag_t:
	 * @HB_OT_LAYOUT_BASELINE_TAG_ROMAN: The baseline used by alphabetic scripts such as Latin, Cyrillic and Greek.
	 * In vertical writing mode, the alphabetic baseline for characters rotated 90 degrees clockwise.
	 * (This would not apply to alphabetic characters that remain upright in vertical writing mode, since these
	 * characters are not rotated.)
	 * @HB_OT_LAYOUT_BASELINE_TAG_HANGING: The hanging baseline. In horizontal direction, this is the horizontal
	 * line from which syllables seem, to hang in Tibetan and other similar scripts. In vertical writing mode,
	 * for Tibetan (or some other similar script) characters rotated 90 degrees clockwise.
	 * @HB_OT_LAYOUT_BASELINE_TAG_IDEO_FACE_BOTTOM_OR_LEFT: Ideographic character face bottom or left edge,
	 * if the direction is horizontal or vertical, respectively.
	 * @HB_OT_LAYOUT_BASELINE_TAG_IDEO_FACE_TOP_OR_RIGHT: Ideographic character face top or right edge,
	 * if the direction is horizontal or vertical, respectively.
	 * @HB_OT_LAYOUT_BASELINE_TAG_IDEO_EMBOX_BOTTOM_OR_LEFT: Ideographic em-box bottom or left edge,
	 * if the direction is horizontal or vertical, respectively.
	 * @HB_OT_LAYOUT_BASELINE_TAG_IDEO_EMBOX_TOP_OR_RIGHT: Ideographic em-box top or right edge baseline,
	 * if the direction is horizontal or vertical, respectively.
	 * @HB_OT_LAYOUT_BASELINE_TAG_MATH: The baseline about which mathematical characters are centered.
	 * In vertical writing mode when mathematical characters rotated 90 degrees clockwise, are centered.
	 *
	 * Baseline tags from https://docs.microsoft.com/en-us/typography/opentype/spec/baselinetags
	 *
	 * Since: 2.6.0
	 */
	enum : hb_tag_t
	{
		HB_OT_LAYOUT_BASELINE_TAG_ROMAN = HB_TAG('r', 'o', 'm', 'n'),
		HB_OT_LAYOUT_BASELINE_TAG_HANGING = HB_TAG('h', 'a', 'n', 'g'),
		HB_OT_LAYOUT_BASELINE_TAG_IDEO_FACE_BOTTOM_OR_LEFT = HB_TAG('i', 'c', 'f', 'b'),
		HB_OT_LAYOUT_BASELINE_TAG_IDEO_FACE_TOP_OR_RIGHT = HB_TAG('i', 'c', 'f', 't'),
		HB_OT_LAYOUT_BASELINE_TAG_IDEO_EMBOX_BOTTOM_OR_LEFT = HB_TAG('i', 'd', 'e', 'o'),
		HB_OT_LAYOUT_BASELINE_TAG_IDEO_EMBOX_TOP_OR_RIGHT = HB_TAG('i', 'd', 't', 'p'),
		HB_OT_LAYOUT_BASELINE_TAG_MATH = HB_TAG('m', 'a', 't', 'h'),

		_HB_OT_LAYOUT_BASELINE_TAG_MAX_VALUE = HB_TAG_MAX_SIGNED /*< skip >*/
	}
	alias hb_ot_layout_baseline_tag_t = hb_tag_t;

	/* OUT.  May be NULL. */
	version(BindHB_Static)
		hb_bool_t hb_ot_layout_get_baseline (
			hb_font_t* font,
			hb_ot_layout_baseline_tag_t baseline_tag,
			hb_direction_t direction,
			hb_tag_t script_tag,
			hb_tag_t language_tag,
			hb_position_t* coord);
	else
	{
		private alias fp_hb_ot_layout_get_baseline = hb_bool_t function (
			hb_font_t* font,
			hb_ot_layout_baseline_tag_t baseline_tag,
			hb_direction_t direction,
			hb_tag_t script_tag,
			hb_tag_t language_tag,
			hb_position_t* coord);
		__gshared fp_hb_ot_layout_get_baseline hb_ot_layout_get_baseline;
	}
}
