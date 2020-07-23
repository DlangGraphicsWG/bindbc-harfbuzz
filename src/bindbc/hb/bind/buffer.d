
//          Copyright Ahmet Sait 2020.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

module bindbc.hb.bind.buffer;

import bindbc.hb.config;

import bindbc.hb.bind.common;
import bindbc.hb.bind.font;
import bindbc.hb.bind.unicode;

extern(C) @nogc nothrow:

/**
 * hb_glyph_info_t:
 * @codepoint: either a Unicode code point (before shaping) or a glyph index
 *             (after shaping).
 * @cluster: the index of the character in the original text that corresponds
 *           to this #hb_glyph_info_t, or whatever the client passes to
 *           hb_buffer_add(). More than one #hb_glyph_info_t can have the same
 *           @cluster value, if they resulted from the same character (e.g. one
 *           to many glyph substitution), and when more than one character gets
 *           merged in the same glyph (e.g. many to one glyph substitution) the
 *           #hb_glyph_info_t will have the smallest cluster value of them.
 *           By default some characters are merged into the same cluster
 *           (e.g. combining marks have the same cluster as their bases)
 *           even if they are separate glyphs, hb_buffer_set_cluster_level()
 *           allow selecting more fine-grained cluster handling.
 *
 * The #hb_glyph_info_t is the structure that holds information about the
 * glyphs and their relation to input text.
 */
struct hb_glyph_info_t
{
    hb_codepoint_t codepoint;
    /*< private >*/
    hb_mask_t mask;
    /*< public >*/
    uint cluster;

    /*< private >*/
    hb_var_int_t var1;
    hb_var_int_t var2;
}

/**
 * hb_glyph_flags_t:
 * @HB_GLYPH_FLAG_UNSAFE_TO_BREAK: Indicates that if input text is broken at the
 * 				   beginning of the cluster this glyph is part of,
 * 				   then both sides need to be re-shaped, as the
 * 				   result might be different.  On the flip side,
 * 				   it means that when this flag is not present,
 * 				   then it's safe to break the glyph-run at the
 * 				   beginning of this cluster, and the two sides
 * 				   represent the exact same result one would get
 * 				   if breaking input text at the beginning of
 * 				   this cluster and shaping the two sides
 * 				   separately.  This can be used to optimize
 * 				   paragraph layout, by avoiding re-shaping
 * 				   of each line after line-breaking, or limiting
 * 				   the reshaping to a small piece around the
 * 				   breaking point only.
 * @HB_GLYPH_FLAG_DEFINED: All the currently defined flags.
 *
 * Since: 1.5.0
 */
enum : uint
{
    /*< flags >*/
    HB_GLYPH_FLAG_UNSAFE_TO_BREAK = 0x00000001,

    HB_GLYPH_FLAG_DEFINED = 0x00000001 /* OR of all defined flags */
}
alias hb_glyph_flags_t = uint;

extern (D) hb_glyph_flags_t hb_glyph_info_get_glyph_flags(const(hb_glyph_info_t)* info)
{
    return cast(hb_glyph_flags_t) (cast(uint) info.mask & HB_GLYPH_FLAG_DEFINED);
}

/**
 * hb_glyph_position_t:
 * @x_advance: how much the line advances after drawing this glyph when setting
 *             text in horizontal direction.
 * @y_advance: how much the line advances after drawing this glyph when setting
 *             text in vertical direction.
 * @x_offset: how much the glyph moves on the X-axis before drawing it, this
 *            should not affect how much the line advances.
 * @y_offset: how much the glyph moves on the Y-axis before drawing it, this
 *            should not affect how much the line advances.
 *
 * The #hb_glyph_position_t is the structure that holds the positions of the
 * glyph in both horizontal and vertical directions. All positions in
 * #hb_glyph_position_t are relative to the current point.
 *
 */
struct hb_glyph_position_t
{
    hb_position_t x_advance;
    hb_position_t y_advance;
    hb_position_t x_offset;
    hb_position_t y_offset;

    /*< private >*/
    hb_var_int_t var;
}

/**
 * hb_segment_properties_t:
 * @direction: the #hb_direction_t of the buffer, see hb_buffer_set_direction().
 * @script: the #hb_script_t of the buffer, see hb_buffer_set_script().
 * @language: the #hb_language_t of the buffer, see hb_buffer_set_language().
 *
 * The structure that holds various text properties of an #hb_buffer_t. Can be
 * set and retrieved using hb_buffer_set_segment_properties() and
 * hb_buffer_get_segment_properties(), respectively.
 */
struct hb_segment_properties_t
{
    hb_direction_t direction;
    hb_script_t script;
    hb_language_t language;
    /*< private >*/
    void* reserved1;
    void* reserved2;
}

version(BindHB_Static)
    hb_bool_t hb_segment_properties_equal (
        const(hb_segment_properties_t)* a,
        const(hb_segment_properties_t)* b);
else
{
    private alias fp_hb_segment_properties_equal = hb_bool_t function (
        const(hb_segment_properties_t)* a,
        const(hb_segment_properties_t)* b);
    __gshared fp_hb_segment_properties_equal hb_segment_properties_equal;
}

version(BindHB_Static)
    uint hb_segment_properties_hash (const(hb_segment_properties_t)* p);
else
{
    private alias fp_hb_segment_properties_hash = uint function (const(hb_segment_properties_t)* p);
    __gshared fp_hb_segment_properties_hash hb_segment_properties_hash;
}

/**
 * hb_buffer_t:
 *
 * The main structure holding the input text and its properties before shaping,
 * and output glyphs and their information after shaping.
 */

struct hb_buffer_t;

version(BindHB_Static)
    hb_buffer_t* hb_buffer_create ();
else
{
    private alias fp_hb_buffer_create = hb_buffer_t* function ();
    __gshared fp_hb_buffer_create hb_buffer_create;
}

version(BindHB_Static)
    hb_buffer_t* hb_buffer_get_empty ();
else
{
    private alias fp_hb_buffer_get_empty = hb_buffer_t* function ();
    __gshared fp_hb_buffer_get_empty hb_buffer_get_empty;
}

version(BindHB_Static)
    hb_buffer_t* hb_buffer_reference (hb_buffer_t* buffer);
else
{
    private alias fp_hb_buffer_reference = hb_buffer_t* function (hb_buffer_t* buffer);
    __gshared fp_hb_buffer_reference hb_buffer_reference;
}

version(BindHB_Static)
    void hb_buffer_destroy (hb_buffer_t* buffer);
else
{
    private alias fp_hb_buffer_destroy = void function (hb_buffer_t* buffer);
    __gshared fp_hb_buffer_destroy hb_buffer_destroy;
}

version(BindHB_Static)
    hb_bool_t hb_buffer_set_user_data (
        hb_buffer_t* buffer,
        hb_user_data_key_t* key,
        void* data,
        hb_destroy_func_t destroy,
        hb_bool_t replace);
else
{
    private alias fp_hb_buffer_set_user_data = hb_bool_t function (
        hb_buffer_t* buffer,
        hb_user_data_key_t* key,
        void* data,
        hb_destroy_func_t destroy,
        hb_bool_t replace);
    __gshared fp_hb_buffer_set_user_data hb_buffer_set_user_data;
}

version(BindHB_Static)
    void* hb_buffer_get_user_data (hb_buffer_t* buffer, hb_user_data_key_t* key);
else
{
    private alias fp_hb_buffer_get_user_data = void* function (hb_buffer_t* buffer, hb_user_data_key_t* key);
    __gshared fp_hb_buffer_get_user_data hb_buffer_get_user_data;
}

/**
 * hb_buffer_content_type_t:
 * @HB_BUFFER_CONTENT_TYPE_INVALID: Initial value for new buffer.
 * @HB_BUFFER_CONTENT_TYPE_UNICODE: The buffer contains input characters (before shaping).
 * @HB_BUFFER_CONTENT_TYPE_GLYPHS: The buffer contains output glyphs (after shaping).
 */
enum : int
{
    HB_BUFFER_CONTENT_TYPE_INVALID = 0,
    HB_BUFFER_CONTENT_TYPE_UNICODE = 1,
    HB_BUFFER_CONTENT_TYPE_GLYPHS = 2
}
alias hb_buffer_content_type_t = int;

version(BindHB_Static)
    void hb_buffer_set_content_type (
        hb_buffer_t* buffer,
        hb_buffer_content_type_t content_type);
else
{
    private alias fp_hb_buffer_set_content_type = void function (
        hb_buffer_t* buffer,
        hb_buffer_content_type_t content_type);
    __gshared fp_hb_buffer_set_content_type hb_buffer_set_content_type;
}

version(BindHB_Static)
    hb_buffer_content_type_t hb_buffer_get_content_type (hb_buffer_t* buffer);
else
{
    private alias fp_hb_buffer_get_content_type = hb_buffer_content_type_t function (hb_buffer_t* buffer);
    __gshared fp_hb_buffer_get_content_type hb_buffer_get_content_type;
}

version(BindHB_Static)
    void hb_buffer_set_unicode_funcs (
        hb_buffer_t* buffer,
        hb_unicode_funcs_t* unicode_funcs);
else
{
    private alias fp_hb_buffer_set_unicode_funcs = void function (
        hb_buffer_t* buffer,
        hb_unicode_funcs_t* unicode_funcs);
    __gshared fp_hb_buffer_set_unicode_funcs hb_buffer_set_unicode_funcs;
}

version(BindHB_Static)
    hb_unicode_funcs_t* hb_buffer_get_unicode_funcs (hb_buffer_t* buffer);
else
{
    private alias fp_hb_buffer_get_unicode_funcs = hb_unicode_funcs_t* function (hb_buffer_t* buffer);
    __gshared fp_hb_buffer_get_unicode_funcs hb_buffer_get_unicode_funcs;
}

version(BindHB_Static)
    void hb_buffer_set_direction (hb_buffer_t* buffer, hb_direction_t direction);
else
{
    private alias fp_hb_buffer_set_direction = void function (hb_buffer_t* buffer, hb_direction_t direction);
    __gshared fp_hb_buffer_set_direction hb_buffer_set_direction;
}

version(BindHB_Static)
    hb_direction_t hb_buffer_get_direction (hb_buffer_t* buffer);
else
{
    private alias fp_hb_buffer_get_direction = hb_direction_t function (hb_buffer_t* buffer);
    __gshared fp_hb_buffer_get_direction hb_buffer_get_direction;
}

version(BindHB_Static)
    void hb_buffer_set_script (hb_buffer_t* buffer, hb_script_t script);
else
{
    private alias fp_hb_buffer_set_script = void function (hb_buffer_t* buffer, hb_script_t script);
    __gshared fp_hb_buffer_set_script hb_buffer_set_script;
}

version(BindHB_Static)
    hb_script_t hb_buffer_get_script (hb_buffer_t* buffer);
else
{
    private alias fp_hb_buffer_get_script = hb_script_t function (hb_buffer_t* buffer);
    __gshared fp_hb_buffer_get_script hb_buffer_get_script;
}

version(BindHB_Static)
    void hb_buffer_set_language (hb_buffer_t* buffer, hb_language_t language);
else
{
    private alias fp_hb_buffer_set_language = void function (hb_buffer_t* buffer, hb_language_t language);
    __gshared fp_hb_buffer_set_language hb_buffer_set_language;
}

version(BindHB_Static)
    hb_language_t hb_buffer_get_language (hb_buffer_t* buffer);
else
{
    private alias fp_hb_buffer_get_language = hb_language_t function (hb_buffer_t* buffer);
    __gshared fp_hb_buffer_get_language hb_buffer_get_language;
}

version(BindHB_Static)
    void hb_buffer_set_segment_properties (
        hb_buffer_t* buffer,
        const(hb_segment_properties_t)* props);
else
{
    private alias fp_hb_buffer_set_segment_properties = void function (
        hb_buffer_t* buffer,
        const(hb_segment_properties_t)* props);
    __gshared fp_hb_buffer_set_segment_properties hb_buffer_set_segment_properties;
}

version(BindHB_Static)
    void hb_buffer_get_segment_properties (
        hb_buffer_t* buffer,
        hb_segment_properties_t* props);
else
{
    private alias fp_hb_buffer_get_segment_properties = void function (
        hb_buffer_t* buffer,
        hb_segment_properties_t* props);
    __gshared fp_hb_buffer_get_segment_properties hb_buffer_get_segment_properties;
}

version(BindHB_Static)
    void hb_buffer_guess_segment_properties (hb_buffer_t* buffer);
else
{
    private alias fp_hb_buffer_guess_segment_properties = void function (hb_buffer_t* buffer);
    __gshared fp_hb_buffer_guess_segment_properties hb_buffer_guess_segment_properties;
}

/**
 * hb_buffer_flags_t:
 * @HB_BUFFER_FLAG_DEFAULT: the default buffer flag.
 * @HB_BUFFER_FLAG_BOT: flag indicating that special handling of the beginning
 *                      of text paragraph can be applied to this buffer. Should usually
 *                      be set, unless you are passing to the buffer only part
 *                      of the text without the full context.
 * @HB_BUFFER_FLAG_EOT: flag indicating that special handling of the end of text
 *                      paragraph can be applied to this buffer, similar to
 *                      @HB_BUFFER_FLAG_BOT.
 * @HB_BUFFER_FLAG_PRESERVE_DEFAULT_IGNORABLES:
 *                      flag indication that character with Default_Ignorable
 *                      Unicode property should use the corresponding glyph
 *                      from the font, instead of hiding them (done by
 *                      replacing them with the space glyph and zeroing the
 *                      advance width.)  This flag takes precedence over
 *                      @HB_BUFFER_FLAG_REMOVE_DEFAULT_IGNORABLES.
 * @HB_BUFFER_FLAG_REMOVE_DEFAULT_IGNORABLES:
 *                      flag indication that character with Default_Ignorable
 *                      Unicode property should be removed from glyph string
 *                      instead of hiding them (done by replacing them with the
 *                      space glyph and zeroing the advance width.)
 *                      @HB_BUFFER_FLAG_PRESERVE_DEFAULT_IGNORABLES takes
 *                      precedence over this flag. Since: 1.8.0
 * @HB_BUFFER_FLAG_DO_NOT_INSERT_DOTTED_CIRCLE:
 *                      flag indicating that a dotted circle should
 *                      not be inserted in the rendering of incorrect
 *                      character sequences (such at <0905 093E>). Since: 2.4
 *
 * Since: 0.9.20
 */
enum : uint
{
    /*< flags >*/
    HB_BUFFER_FLAG_DEFAULT = 0x00000000u,
    HB_BUFFER_FLAG_BOT = 0x00000001u, /* Beginning-of-text */
    HB_BUFFER_FLAG_EOT = 0x00000002u, /* End-of-text */
    HB_BUFFER_FLAG_PRESERVE_DEFAULT_IGNORABLES = 0x00000004u,
    HB_BUFFER_FLAG_REMOVE_DEFAULT_IGNORABLES = 0x00000008u,
    HB_BUFFER_FLAG_DO_NOT_INSERT_DOTTED_CIRCLE = 0x00000010u
}
alias hb_buffer_flags_t = uint;

version(BindHB_Static)
    void hb_buffer_set_flags (hb_buffer_t* buffer, hb_buffer_flags_t flags);
else
{
    private alias fp_hb_buffer_set_flags = void function (hb_buffer_t* buffer, hb_buffer_flags_t flags);
    __gshared fp_hb_buffer_set_flags hb_buffer_set_flags;
}

version(BindHB_Static)
    hb_buffer_flags_t hb_buffer_get_flags (hb_buffer_t* buffer);
else
{
    private alias fp_hb_buffer_get_flags = hb_buffer_flags_t function (hb_buffer_t* buffer);
    __gshared fp_hb_buffer_get_flags hb_buffer_get_flags;
}

/**
 * hb_buffer_cluster_level_t:
 * @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES: Return cluster values grouped by graphemes into
 *   monotone order.
 * @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_CHARACTERS: Return cluster values grouped into monotone order.
 * @HB_BUFFER_CLUSTER_LEVEL_CHARACTERS: Don't group cluster values.
 * @HB_BUFFER_CLUSTER_LEVEL_DEFAULT: Default cluster level,
 *   equal to @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES.
 *
 * Since: 0.9.42
 */
enum : int
{
    HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES = 0,
    HB_BUFFER_CLUSTER_LEVEL_MONOTONE_CHARACTERS = 1,
    HB_BUFFER_CLUSTER_LEVEL_CHARACTERS = 2,
    HB_BUFFER_CLUSTER_LEVEL_DEFAULT = HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES
}
alias hb_buffer_cluster_level_t = int;

version(BindHB_Static)
    void hb_buffer_set_cluster_level (
        hb_buffer_t* buffer,
        hb_buffer_cluster_level_t cluster_level);
else
{
    private alias fp_hb_buffer_set_cluster_level = void function (
        hb_buffer_t* buffer,
        hb_buffer_cluster_level_t cluster_level);
    __gshared fp_hb_buffer_set_cluster_level hb_buffer_set_cluster_level;
}

version(BindHB_Static)
    hb_buffer_cluster_level_t hb_buffer_get_cluster_level (hb_buffer_t* buffer);
else
{
    private alias fp_hb_buffer_get_cluster_level = hb_buffer_cluster_level_t function (hb_buffer_t* buffer);
    __gshared fp_hb_buffer_get_cluster_level hb_buffer_get_cluster_level;
}

/**
 * HB_BUFFER_REPLACEMENT_CODEPOINT_DEFAULT:
 *
 * The default code point for replacing invalid characters in a given encoding.
 * Set to U+FFFD REPLACEMENT CHARACTER.
 *
 * Since: 0.9.31
 */
enum HB_BUFFER_REPLACEMENT_CODEPOINT_DEFAULT = 0xFFFDu;

version(BindHB_Static)
    void hb_buffer_set_replacement_codepoint (
        hb_buffer_t* buffer,
        hb_codepoint_t replacement);
else
{
    private alias fp_hb_buffer_set_replacement_codepoint = void function (
        hb_buffer_t* buffer,
        hb_codepoint_t replacement);
    __gshared fp_hb_buffer_set_replacement_codepoint hb_buffer_set_replacement_codepoint;
}

version(BindHB_Static)
    hb_codepoint_t hb_buffer_get_replacement_codepoint (hb_buffer_t* buffer);
else
{
    private alias fp_hb_buffer_get_replacement_codepoint = hb_codepoint_t function (hb_buffer_t* buffer);
    __gshared fp_hb_buffer_get_replacement_codepoint hb_buffer_get_replacement_codepoint;
}

static if (hbSupport >= HBSupport.v2_6_3)
{
	version(BindHB_Static)
		void hb_buffer_set_invisible_glyph (
			hb_buffer_t* buffer,
			hb_codepoint_t invisible);
	else
	{
		private alias fp_hb_buffer_set_invisible_glyph = void function (
			hb_buffer_t* buffer,
			hb_codepoint_t invisible);
		__gshared fp_hb_buffer_set_invisible_glyph hb_buffer_set_invisible_glyph;
	}
	
	version(BindHB_Static)
		hb_codepoint_t hb_buffer_get_invisible_glyph (hb_buffer_t* buffer);
	else
	{
		private alias fp_hb_buffer_get_invisible_glyph = hb_codepoint_t function (hb_buffer_t* buffer);
		__gshared fp_hb_buffer_get_invisible_glyph hb_buffer_get_invisible_glyph;
	}
}

version(BindHB_Static)
    void hb_buffer_reset (hb_buffer_t* buffer);
else
{
    private alias fp_hb_buffer_reset = void function (hb_buffer_t* buffer);
    __gshared fp_hb_buffer_reset hb_buffer_reset;
}

version(BindHB_Static)
    void hb_buffer_clear_contents (hb_buffer_t* buffer);
else
{
    private alias fp_hb_buffer_clear_contents = void function (hb_buffer_t* buffer);
    __gshared fp_hb_buffer_clear_contents hb_buffer_clear_contents;
}

version(BindHB_Static)
    hb_bool_t hb_buffer_pre_allocate (hb_buffer_t* buffer, uint size);
else
{
    private alias fp_hb_buffer_pre_allocate = hb_bool_t function (hb_buffer_t* buffer, uint size);
    __gshared fp_hb_buffer_pre_allocate hb_buffer_pre_allocate;
}

version(BindHB_Static)
    hb_bool_t hb_buffer_allocation_successful (hb_buffer_t* buffer);
else
{
    private alias fp_hb_buffer_allocation_successful = hb_bool_t function (hb_buffer_t* buffer);
    __gshared fp_hb_buffer_allocation_successful hb_buffer_allocation_successful;
}

version(BindHB_Static)
    void hb_buffer_reverse (hb_buffer_t* buffer);
else
{
    private alias fp_hb_buffer_reverse = void function (hb_buffer_t* buffer);
    __gshared fp_hb_buffer_reverse hb_buffer_reverse;
}

version(BindHB_Static)
    void hb_buffer_reverse_range (hb_buffer_t* buffer, uint start, uint end);
else
{
    private alias fp_hb_buffer_reverse_range = void function (hb_buffer_t* buffer, uint start, uint end);
    __gshared fp_hb_buffer_reverse_range hb_buffer_reverse_range;
}

version(BindHB_Static)
    void hb_buffer_reverse_clusters (hb_buffer_t* buffer);
else
{
    private alias fp_hb_buffer_reverse_clusters = void function (hb_buffer_t* buffer);
    __gshared fp_hb_buffer_reverse_clusters hb_buffer_reverse_clusters;
}

/* Filling the buffer in */

version(BindHB_Static)
    void hb_buffer_add (
        hb_buffer_t* buffer,
        hb_codepoint_t codepoint,
        uint cluster);
else
{
    private alias fp_hb_buffer_add = void function (
        hb_buffer_t* buffer,
        hb_codepoint_t codepoint,
        uint cluster);
    __gshared fp_hb_buffer_add hb_buffer_add;
}

version(BindHB_Static)
    void hb_buffer_add_utf8 (
        hb_buffer_t* buffer,
        const(char)* text,
        int text_length,
        uint item_offset,
        int item_length);
else
{
    private alias fp_hb_buffer_add_utf8 = void function (
        hb_buffer_t* buffer,
        const(char)* text,
        int text_length,
        uint item_offset,
        int item_length);
    __gshared fp_hb_buffer_add_utf8 hb_buffer_add_utf8;
}

version(BindHB_Static)
    void hb_buffer_add_utf16 (
        hb_buffer_t* buffer,
        const(ushort)* text,
        int text_length,
        uint item_offset,
        int item_length);
else
{
    private alias fp_hb_buffer_add_utf16 = void function (
        hb_buffer_t* buffer,
        const(wchar)* text,
        int text_length,
        uint item_offset,
        int item_length);
    __gshared fp_hb_buffer_add_utf16 hb_buffer_add_utf16;
}

version(BindHB_Static)
    void hb_buffer_add_utf32 (
        hb_buffer_t* buffer,
        const(uint)* text,
        int text_length,
        uint item_offset,
        int item_length);
else
{
    private alias fp_hb_buffer_add_utf32 = void function (
        hb_buffer_t* buffer,
        const(dchar)* text,
        int text_length,
        uint item_offset,
        int item_length);
    __gshared fp_hb_buffer_add_utf32 hb_buffer_add_utf32;
}

version(BindHB_Static)
    void hb_buffer_add_latin1 (
        hb_buffer_t* buffer,
        const(ubyte)* text,
        int text_length,
        uint item_offset,
        int item_length);
else
{
    private alias fp_hb_buffer_add_latin1 = void function (
        hb_buffer_t* buffer,
        const(ubyte)* text,
        int text_length,
        uint item_offset,
        int item_length);
    __gshared fp_hb_buffer_add_latin1 hb_buffer_add_latin1;
}

version(BindHB_Static)
    void hb_buffer_add_codepoints (
        hb_buffer_t* buffer,
        const(hb_codepoint_t)* text,
        int text_length,
        uint item_offset,
        int item_length);
else
{
    private alias fp_hb_buffer_add_codepoints = void function (
        hb_buffer_t* buffer,
        const(hb_codepoint_t)* text,
        int text_length,
        uint item_offset,
        int item_length);
    __gshared fp_hb_buffer_add_codepoints hb_buffer_add_codepoints;
}

version(BindHB_Static)
    void hb_buffer_append (
        hb_buffer_t* buffer,
        hb_buffer_t* source,
        uint start,
        uint end);
else
{
    private alias fp_hb_buffer_append = void function (
        hb_buffer_t* buffer,
        hb_buffer_t* source,
        uint start,
        uint end);
    __gshared fp_hb_buffer_append hb_buffer_append;
}

version(BindHB_Static)
    hb_bool_t hb_buffer_set_length (hb_buffer_t* buffer, uint length);
else
{
    private alias fp_hb_buffer_set_length = hb_bool_t function (hb_buffer_t* buffer, uint length);
    __gshared fp_hb_buffer_set_length hb_buffer_set_length;
}

version(BindHB_Static)
    uint hb_buffer_get_length (hb_buffer_t* buffer);
else
{
    private alias fp_hb_buffer_get_length = uint function (hb_buffer_t* buffer);
    __gshared fp_hb_buffer_get_length hb_buffer_get_length;
}

/* Getting glyphs out of the buffer */

version(BindHB_Static)
    hb_glyph_info_t* hb_buffer_get_glyph_infos (hb_buffer_t* buffer, uint* length);
else
{
    private alias fp_hb_buffer_get_glyph_infos = hb_glyph_info_t* function (hb_buffer_t* buffer, uint* length);
    __gshared fp_hb_buffer_get_glyph_infos hb_buffer_get_glyph_infos;
}

version(BindHB_Static)
    hb_glyph_position_t* hb_buffer_get_glyph_positions (
        hb_buffer_t* buffer,
        uint* length);
else
{
    private alias fp_hb_buffer_get_glyph_positions = hb_glyph_position_t* function (
        hb_buffer_t* buffer,
        uint* length);
    __gshared fp_hb_buffer_get_glyph_positions hb_buffer_get_glyph_positions;
}

version(BindHB_Static)
    void hb_buffer_normalize_glyphs (hb_buffer_t* buffer);
else
{
    private alias fp_hb_buffer_normalize_glyphs = void function (hb_buffer_t* buffer);
    __gshared fp_hb_buffer_normalize_glyphs hb_buffer_normalize_glyphs;
}

/*
 * Serialize
 */

/**
 * hb_buffer_serialize_flags_t:
 * @HB_BUFFER_SERIALIZE_FLAG_DEFAULT: serialize glyph names, clusters and positions.
 * @HB_BUFFER_SERIALIZE_FLAG_NO_CLUSTERS: do not serialize glyph cluster.
 * @HB_BUFFER_SERIALIZE_FLAG_NO_POSITIONS: do not serialize glyph position information.
 * @HB_BUFFER_SERIALIZE_FLAG_NO_GLYPH_NAMES: do no serialize glyph name.
 * @HB_BUFFER_SERIALIZE_FLAG_GLYPH_EXTENTS: serialize glyph extents.
 * @HB_BUFFER_SERIALIZE_FLAG_GLYPH_FLAGS: serialize glyph flags. Since: 1.5.0
 * @HB_BUFFER_SERIALIZE_FLAG_NO_ADVANCES: do not serialize glyph advances,
 *  glyph offsets will reflect absolute glyph positions. Since: 1.8.0
 *
 * Flags that control what glyph information are serialized in hb_buffer_serialize_glyphs().
 *
 * Since: 0.9.20
 */
enum : uint
{
    /*< flags >*/
    HB_BUFFER_SERIALIZE_FLAG_DEFAULT = 0x00000000u,
    HB_BUFFER_SERIALIZE_FLAG_NO_CLUSTERS = 0x00000001u,
    HB_BUFFER_SERIALIZE_FLAG_NO_POSITIONS = 0x00000002u,
    HB_BUFFER_SERIALIZE_FLAG_NO_GLYPH_NAMES = 0x00000004u,
    HB_BUFFER_SERIALIZE_FLAG_GLYPH_EXTENTS = 0x00000008u,
    HB_BUFFER_SERIALIZE_FLAG_GLYPH_FLAGS = 0x00000010u,
    HB_BUFFER_SERIALIZE_FLAG_NO_ADVANCES = 0x00000020u
}
alias hb_buffer_serialize_flags_t = uint;

/**
 * hb_buffer_serialize_format_t:
 * @HB_BUFFER_SERIALIZE_FORMAT_TEXT: a human-readable, plain text format.
 * @HB_BUFFER_SERIALIZE_FORMAT_JSON: a machine-readable JSON format.
 * @HB_BUFFER_SERIALIZE_FORMAT_INVALID: invalid format.
 *
 * The buffer serialization and de-serialization format used in
 * hb_buffer_serialize_glyphs() and hb_buffer_deserialize_glyphs().
 *
 * Since: 0.9.2
 */
enum : hb_tag_t
{
    HB_BUFFER_SERIALIZE_FORMAT_TEXT = HB_TAG('T', 'E', 'X', 'T'),
    HB_BUFFER_SERIALIZE_FORMAT_JSON = HB_TAG('J', 'S', 'O', 'N'),
    HB_BUFFER_SERIALIZE_FORMAT_INVALID = HB_TAG_NONE
}
alias hb_buffer_serialize_format_t = hb_tag_t;

version(BindHB_Static)
    hb_buffer_serialize_format_t hb_buffer_serialize_format_from_string (
        const(char)* str,
        int len);
else
{
    private alias fp_hb_buffer_serialize_format_from_string = hb_buffer_serialize_format_t function (
        const(char)* str,
        int len);
    __gshared fp_hb_buffer_serialize_format_from_string hb_buffer_serialize_format_from_string;
}

version(BindHB_Static)
    const(char)* hb_buffer_serialize_format_to_string (
        hb_buffer_serialize_format_t format);
else
{
    private alias fp_hb_buffer_serialize_format_to_string = const(char)* function (
        hb_buffer_serialize_format_t format);
    __gshared fp_hb_buffer_serialize_format_to_string hb_buffer_serialize_format_to_string;
}

version(BindHB_Static)
    const(char*)* hb_buffer_serialize_list_formats ();
else
{
    private alias fp_hb_buffer_serialize_list_formats = const(char*)* function ();
    __gshared fp_hb_buffer_serialize_list_formats hb_buffer_serialize_list_formats;
}

version(BindHB_Static)
    uint hb_buffer_serialize_glyphs (
        hb_buffer_t* buffer,
        uint start,
        uint end,
        char* buf,
        uint buf_size,
        uint* buf_consumed,
        hb_font_t* font,
        hb_buffer_serialize_format_t format,
        hb_buffer_serialize_flags_t flags);
else
{
    private alias fp_hb_buffer_serialize_glyphs = uint function (
        hb_buffer_t* buffer,
        uint start,
        uint end,
        char* buf,
        uint buf_size,
        uint* buf_consumed,
        hb_font_t* font,
        hb_buffer_serialize_format_t format,
        hb_buffer_serialize_flags_t flags);
    __gshared fp_hb_buffer_serialize_glyphs hb_buffer_serialize_glyphs;
}

version(BindHB_Static)
    hb_bool_t hb_buffer_deserialize_glyphs (
        hb_buffer_t* buffer,
        const(char)* buf,
        int buf_len,
        const(char*)* end_ptr,
        hb_font_t* font,
        hb_buffer_serialize_format_t format);
else
{
    private alias fp_hb_buffer_deserialize_glyphs = hb_bool_t function (
        hb_buffer_t* buffer,
        const(char)* buf,
        int buf_len,
        const(char*)* end_ptr,
        hb_font_t* font,
        hb_buffer_serialize_format_t format);
    __gshared fp_hb_buffer_deserialize_glyphs hb_buffer_deserialize_glyphs;
}

/*
 * Compare buffers
 */

enum : uint
{
    /*< flags >*/
    HB_BUFFER_DIFF_FLAG_EQUAL = 0x0000,

    /* Buffers with different content_type cannot be meaningfully compared
     * in any further detail. */
    HB_BUFFER_DIFF_FLAG_CONTENT_TYPE_MISMATCH = 0x0001,

    /* For buffers with differing length, the per-glyph comparison is not
     * attempted, though we do still scan reference for dottedcircle / .notdef
     * glyphs. */
    HB_BUFFER_DIFF_FLAG_LENGTH_MISMATCH = 0x0002,

    /* We want to know if dottedcircle / .notdef glyphs are present in the
     * reference, as we may not care so much about other differences in this
     * case. */
    HB_BUFFER_DIFF_FLAG_NOTDEF_PRESENT = 0x0004,
    HB_BUFFER_DIFF_FLAG_DOTTED_CIRCLE_PRESENT = 0x0008,

    /* If the buffers have the same length, we compare them glyph-by-glyph
     * and report which aspect(s) of the glyph info/position are different. */
    HB_BUFFER_DIFF_FLAG_CODEPOINT_MISMATCH = 0x0010,
    HB_BUFFER_DIFF_FLAG_CLUSTER_MISMATCH = 0x0020,
    HB_BUFFER_DIFF_FLAG_GLYPH_FLAGS_MISMATCH = 0x0040,
    HB_BUFFER_DIFF_FLAG_POSITION_MISMATCH = 0x0080
}
alias hb_buffer_diff_flags_t = uint;

/* Compare the contents of two buffers, report types of differences. */
version(BindHB_Static)
    hb_buffer_diff_flags_t hb_buffer_diff (
        hb_buffer_t* buffer,
        hb_buffer_t* reference,
        hb_codepoint_t dottedcircle_glyph,
        uint position_fuzz);
else
{
    private alias fp_hb_buffer_diff = hb_buffer_diff_flags_t function (
        hb_buffer_t* buffer,
        hb_buffer_t* reference,
        hb_codepoint_t dottedcircle_glyph,
        uint position_fuzz);
    __gshared fp_hb_buffer_diff hb_buffer_diff;
}

/*
 * Debugging.
 */

alias hb_buffer_message_func_t = int function (
    hb_buffer_t* buffer,
    hb_font_t* font,
    const(char)* message,
    void* user_data);

version(BindHB_Static)
    void hb_buffer_set_message_func (
        hb_buffer_t* buffer,
        hb_buffer_message_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_buffer_set_message_func = void function (
        hb_buffer_t* buffer,
        hb_buffer_message_func_t func,
        void* user_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_buffer_set_message_func hb_buffer_set_message_func;
}
