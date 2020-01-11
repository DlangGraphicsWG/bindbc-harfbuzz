
//          Copyright Ahmet Sait 2020.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

module bindbc.hb.dynload;

version(BindHB_Static) {}
else:

nothrow @nogc:

import bindbc.loader;
import bindbc.hb.config;

private
{
	__gshared SharedLib hbLib;
	__gshared SharedLib hbSubsetLib;
	__gshared HBSupport hbLoadedVersion;
}

void unloadHarfBuzz()
{
	version(HB_with_subset)
		if (hbSubsetLib != invalidHandle)
			hbSubsetLib.unload();

	if (hbLib != invalidHandle)
		hbLib.unload();
}

HBSupport loadedHarfBuzzVersion() { return hbLoadedVersion; }

bool isHarfBuzzLoaded()
{
	return hbLib != invalidHandle;
}

bool isHarfBuzzSubsetLoaded()
{
	return hbSubsetLib != invalidHandle;
}

HBSupport loadHarfBuzz()
{
	// FIXME: Library names are not verified
	version(Windows)
	{
		const(char)[][3] hbLibNames = [
			"harfbuzz.dll",
			"libharfbuzz.dll",
			"libharfbuzz-0.dll"
		];
		const(char)[][3] subsetLibNames = [
			"harfbuzz-subset.dll",
			"libharfbuzz-subset.dll",
			"libharfbuzz-subset-0.dll"
		];
	}
	else version(OSX)
	{
		const(char)[][6] hbLibNames = [
			"libharfbuzz.dylib",
			"libharfbuzz.0.dylib",
			"/usr/X11/hbLib/libharfbuzz.dylib",
			"/usr/X11/hbLib/libharfbuzz.0.dylib",
			"/opt/X11/hbLib/libharfbuzz.dylib",
			"/opt/X11/hbLib/libharfbuzz.0.dylib"
		];
		const(char)[][6] subsetLibNames = [
			"libharfbuzz-subset.dylib",
			"libharfbuzz-subset.0.dylib",
			"/usr/X11/hbLib/libharfbuzz-subset.dylib",
			"/usr/X11/hbLib/libharfbuzz-subset.0.dylib",
			"/opt/X11/hbLib/libharfbuzz-subset.dylib",
			"/opt/X11/hbLib/libharfbuzz-subset.0.dylib"
		];
	}
	else version(Posix)
	{
		const(char)[][2] hbLibNames = [
			"libharfbuzz.so.0",
			"libharfbuzz.so"
		];
		const(char)[][2] subsetLibNames = [
			"libharfbuzz-subset.so.0",
			"libharfbuzz-subset.so"
		];
	}
	else static assert(0, "bindbc-harfbuzz is not yet supported on this platform.");

	HBSupport ret;
	assert(hbLibNames.length == subsetLibNames.length);
	foreach(i; 0 .. hbLibNames.length)
	{
		version(HB_with_subset)
			ret = loadHarfBuzz(hbLibNames[i].ptr, subsetLibNames[i].ptr);
		else
			ret = loadHarfBuzz(hbLibNames[i].ptr, null);
		if (ret != HBSupport.noLibrary)
			break;
	}
	return ret;
}

HBSupport loadHarfBuzz(const(char)* libName, const(char)* subsetLibName)
{
	hbLib = load(libName);
	if (hbLib == invalidHandle)
		return HBSupport.noLibrary;
	
	version(HB_with_subset)
	{
		hbSubsetLib = load(subsetLibName);
		if (hbSubsetLib == invalidHandle)
			return HBSupport.noLibrary;
	}

	auto lastErrorCount = errorCount();
	hbLoadedVersion = HBSupport.badLibrary;

	import bindbc.hb.bind.blob;
	hbLib.bindSymbol(cast(void**)&hb_blob_create, "hb_blob_create");
	hbLib.bindSymbol(cast(void**)&hb_blob_create_sub_blob, "hb_blob_create_sub_blob");
	hbLib.bindSymbol(cast(void**)&hb_blob_get_empty, "hb_blob_get_empty");
	hbLib.bindSymbol(cast(void**)&hb_blob_reference, "hb_blob_reference");
	hbLib.bindSymbol(cast(void**)&hb_blob_destroy, "hb_blob_destroy");
	hbLib.bindSymbol(cast(void**)&hb_blob_set_user_data, "hb_blob_set_user_data");
	hbLib.bindSymbol(cast(void**)&hb_blob_get_user_data, "hb_blob_get_user_data");
	hbLib.bindSymbol(cast(void**)&hb_blob_make_immutable, "hb_blob_make_immutable");
	hbLib.bindSymbol(cast(void**)&hb_blob_is_immutable, "hb_blob_is_immutable");
	hbLib.bindSymbol(cast(void**)&hb_blob_get_length, "hb_blob_get_length");
	hbLib.bindSymbol(cast(void**)&hb_blob_get_data, "hb_blob_get_data");
	hbLib.bindSymbol(cast(void**)&hb_blob_get_data_writable, "hb_blob_get_data_writable");

	import bindbc.hb.bind.buffer;
	//hbLib.bindSymbol(cast(void**)&hb_glyph_info_get_glyph_flags, "hb_glyph_info_get_glyph_flags");
	hbLib.bindSymbol(cast(void**)&hb_segment_properties_equal, "hb_segment_properties_equal");
	hbLib.bindSymbol(cast(void**)&hb_segment_properties_hash, "hb_segment_properties_hash");
	hbLib.bindSymbol(cast(void**)&hb_buffer_create, "hb_buffer_create");
	hbLib.bindSymbol(cast(void**)&hb_buffer_get_empty, "hb_buffer_get_empty");
	hbLib.bindSymbol(cast(void**)&hb_buffer_reference, "hb_buffer_reference");
	hbLib.bindSymbol(cast(void**)&hb_buffer_destroy, "hb_buffer_destroy");
	hbLib.bindSymbol(cast(void**)&hb_buffer_set_user_data, "hb_buffer_set_user_data");
	hbLib.bindSymbol(cast(void**)&hb_buffer_get_user_data, "hb_buffer_get_user_data");
	hbLib.bindSymbol(cast(void**)&hb_buffer_set_content_type, "hb_buffer_set_content_type");
	hbLib.bindSymbol(cast(void**)&hb_buffer_get_content_type, "hb_buffer_get_content_type");
	hbLib.bindSymbol(cast(void**)&hb_buffer_set_unicode_funcs, "hb_buffer_set_unicode_funcs");
	hbLib.bindSymbol(cast(void**)&hb_buffer_get_unicode_funcs, "hb_buffer_get_unicode_funcs");
	hbLib.bindSymbol(cast(void**)&hb_buffer_set_direction, "hb_buffer_set_direction");
	hbLib.bindSymbol(cast(void**)&hb_buffer_get_direction, "hb_buffer_get_direction");
	hbLib.bindSymbol(cast(void**)&hb_buffer_set_script, "hb_buffer_set_script");
	hbLib.bindSymbol(cast(void**)&hb_buffer_get_script, "hb_buffer_get_script");
	hbLib.bindSymbol(cast(void**)&hb_buffer_set_language, "hb_buffer_set_language");
	hbLib.bindSymbol(cast(void**)&hb_buffer_get_language, "hb_buffer_get_language");
	hbLib.bindSymbol(cast(void**)&hb_buffer_set_segment_properties, "hb_buffer_set_segment_properties");
	hbLib.bindSymbol(cast(void**)&hb_buffer_get_segment_properties, "hb_buffer_get_segment_properties");
	hbLib.bindSymbol(cast(void**)&hb_buffer_guess_segment_properties, "hb_buffer_guess_segment_properties");
	hbLib.bindSymbol(cast(void**)&hb_buffer_set_flags, "hb_buffer_set_flags");
	hbLib.bindSymbol(cast(void**)&hb_buffer_get_flags, "hb_buffer_get_flags");
	hbLib.bindSymbol(cast(void**)&hb_buffer_set_cluster_level, "hb_buffer_set_cluster_level");
	hbLib.bindSymbol(cast(void**)&hb_buffer_get_cluster_level, "hb_buffer_get_cluster_level");
	hbLib.bindSymbol(cast(void**)&hb_buffer_set_replacement_codepoint, "hb_buffer_set_replacement_codepoint");
	hbLib.bindSymbol(cast(void**)&hb_buffer_get_replacement_codepoint, "hb_buffer_get_replacement_codepoint");
	hbLib.bindSymbol(cast(void**)&hb_buffer_reset, "hb_buffer_reset");
	hbLib.bindSymbol(cast(void**)&hb_buffer_clear_contents, "hb_buffer_clear_contents");
	hbLib.bindSymbol(cast(void**)&hb_buffer_pre_allocate, "hb_buffer_pre_allocate");
	hbLib.bindSymbol(cast(void**)&hb_buffer_allocation_successful, "hb_buffer_allocation_successful");
	hbLib.bindSymbol(cast(void**)&hb_buffer_reverse, "hb_buffer_reverse");
	hbLib.bindSymbol(cast(void**)&hb_buffer_reverse_range, "hb_buffer_reverse_range");
	hbLib.bindSymbol(cast(void**)&hb_buffer_reverse_clusters, "hb_buffer_reverse_clusters");
	hbLib.bindSymbol(cast(void**)&hb_buffer_add, "hb_buffer_add");
	hbLib.bindSymbol(cast(void**)&hb_buffer_add_utf8, "hb_buffer_add_utf8");
	hbLib.bindSymbol(cast(void**)&hb_buffer_add_utf16, "hb_buffer_add_utf16");
	hbLib.bindSymbol(cast(void**)&hb_buffer_add_utf32, "hb_buffer_add_utf32");
	hbLib.bindSymbol(cast(void**)&hb_buffer_add_latin1, "hb_buffer_add_latin1");
	hbLib.bindSymbol(cast(void**)&hb_buffer_add_codepoints, "hb_buffer_add_codepoints");
	hbLib.bindSymbol(cast(void**)&hb_buffer_append, "hb_buffer_append");
	hbLib.bindSymbol(cast(void**)&hb_buffer_set_length, "hb_buffer_set_length");
	hbLib.bindSymbol(cast(void**)&hb_buffer_get_length, "hb_buffer_get_length");
	hbLib.bindSymbol(cast(void**)&hb_buffer_get_glyph_infos, "hb_buffer_get_glyph_infos");
	hbLib.bindSymbol(cast(void**)&hb_buffer_get_glyph_positions, "hb_buffer_get_glyph_positions");
	hbLib.bindSymbol(cast(void**)&hb_buffer_normalize_glyphs, "hb_buffer_normalize_glyphs");
	hbLib.bindSymbol(cast(void**)&hb_buffer_serialize_format_from_string, "hb_buffer_serialize_format_from_string");
	hbLib.bindSymbol(cast(void**)&hb_buffer_serialize_format_to_string, "hb_buffer_serialize_format_to_string");
	hbLib.bindSymbol(cast(void**)&hb_buffer_serialize_list_formats, "hb_buffer_serialize_list_formats");
	hbLib.bindSymbol(cast(void**)&hb_buffer_serialize_glyphs, "hb_buffer_serialize_glyphs");
	hbLib.bindSymbol(cast(void**)&hb_buffer_deserialize_glyphs, "hb_buffer_deserialize_glyphs");
	hbLib.bindSymbol(cast(void**)&hb_buffer_diff, "hb_buffer_diff");
	hbLib.bindSymbol(cast(void**)&hb_buffer_set_message_func, "hb_buffer_set_message_func");

	import bindbc.hb.bind.common;
	hbLib.bindSymbol(cast(void**)&hb_tag_from_string, "hb_tag_from_string");
	hbLib.bindSymbol(cast(void**)&hb_tag_to_string, "hb_tag_to_string");
	hbLib.bindSymbol(cast(void**)&hb_direction_from_string, "hb_direction_from_string");
	hbLib.bindSymbol(cast(void**)&hb_direction_to_string, "hb_direction_to_string");
	hbLib.bindSymbol(cast(void**)&hb_language_from_string, "hb_language_from_string");
	hbLib.bindSymbol(cast(void**)&hb_language_to_string, "hb_language_to_string");
	hbLib.bindSymbol(cast(void**)&hb_language_get_default, "hb_language_get_default");
	hbLib.bindSymbol(cast(void**)&hb_script_from_iso15924_tag, "hb_script_from_iso15924_tag");
	hbLib.bindSymbol(cast(void**)&hb_script_from_string, "hb_script_from_string");
	hbLib.bindSymbol(cast(void**)&hb_script_to_iso15924_tag, "hb_script_to_iso15924_tag");
	hbLib.bindSymbol(cast(void**)&hb_script_get_horizontal_direction, "hb_script_get_horizontal_direction");
	hbLib.bindSymbol(cast(void**)&hb_feature_from_string, "hb_feature_from_string");
	hbLib.bindSymbol(cast(void**)&hb_feature_to_string, "hb_feature_to_string");
	hbLib.bindSymbol(cast(void**)&hb_variation_from_string, "hb_variation_from_string");
	hbLib.bindSymbol(cast(void**)&hb_variation_to_string, "hb_variation_to_string");

	version(HB_with_deprecated)
	{
		import bindbc.hb.bind.deprecated_;
		hbLib.bindSymbol(cast(void**)&hb_font_funcs_set_glyph_func, "hb_font_funcs_set_glyph_func");
		hbLib.bindSymbol(cast(void**)&hb_set_invert, "hb_set_invert");
		hbLib.bindSymbol(cast(void**)&hb_unicode_funcs_set_eastasian_width_func, "hb_unicode_funcs_set_eastasian_width_func");
		hbLib.bindSymbol(cast(void**)&hb_unicode_eastasian_width, "hb_unicode_eastasian_width");
		hbLib.bindSymbol(cast(void**)&hb_unicode_funcs_set_decompose_compatibility_func, "hb_unicode_funcs_set_decompose_compatibility_func");
		hbLib.bindSymbol(cast(void**)&hb_unicode_decompose_compatibility, "hb_unicode_decompose_compatibility");
		hbLib.bindSymbol(cast(void**)&hb_font_funcs_set_glyph_v_kerning_func, "hb_font_funcs_set_glyph_v_kerning_func");
		hbLib.bindSymbol(cast(void**)&hb_font_get_glyph_v_kerning, "hb_font_get_glyph_v_kerning");
	}
	
	version(Windows)
	version(HB_with_directwrite)
	version(Have_aurora_directx)
	{
		import bindbc.hb.bind.directwrite;
		hbLib.bindSymbol(cast(void**)&hb_directwrite_face_create, "hb_directwrite_face_create");
		hbLib.bindSymbol(cast(void**)&hb_directwrite_face_get_font_face, "hb_directwrite_face_get_font_face");
	}
	
	import bindbc.hb.bind.face;
	hbLib.bindSymbol(cast(void**)&hb_face_create, "hb_face_create");
	hbLib.bindSymbol(cast(void**)&hb_face_create_for_tables, "hb_face_create_for_tables");
	hbLib.bindSymbol(cast(void**)&hb_face_get_empty, "hb_face_get_empty");
	hbLib.bindSymbol(cast(void**)&hb_face_reference, "hb_face_reference");
	hbLib.bindSymbol(cast(void**)&hb_face_destroy, "hb_face_destroy");
	hbLib.bindSymbol(cast(void**)&hb_face_set_user_data, "hb_face_set_user_data");
	hbLib.bindSymbol(cast(void**)&hb_face_get_user_data, "hb_face_get_user_data");
	hbLib.bindSymbol(cast(void**)&hb_face_make_immutable, "hb_face_make_immutable");
	hbLib.bindSymbol(cast(void**)&hb_face_is_immutable, "hb_face_is_immutable");
	hbLib.bindSymbol(cast(void**)&hb_face_reference_table, "hb_face_reference_table");
	hbLib.bindSymbol(cast(void**)&hb_face_reference_blob, "hb_face_reference_blob");
	hbLib.bindSymbol(cast(void**)&hb_face_set_index, "hb_face_set_index");
	hbLib.bindSymbol(cast(void**)&hb_face_get_index, "hb_face_get_index");
	hbLib.bindSymbol(cast(void**)&hb_face_set_upem, "hb_face_set_upem");
	hbLib.bindSymbol(cast(void**)&hb_face_get_upem, "hb_face_get_upem");
	hbLib.bindSymbol(cast(void**)&hb_face_set_glyph_count, "hb_face_set_glyph_count");
	hbLib.bindSymbol(cast(void**)&hb_face_get_glyph_count, "hb_face_get_glyph_count");
	hbLib.bindSymbol(cast(void**)&hb_face_get_table_tags, "hb_face_get_table_tags");

	import bindbc.hb.bind.font;
	hbLib.bindSymbol(cast(void**)&hb_font_funcs_create, "hb_font_funcs_create");
	hbLib.bindSymbol(cast(void**)&hb_font_funcs_get_empty, "hb_font_funcs_get_empty");
	hbLib.bindSymbol(cast(void**)&hb_font_funcs_reference, "hb_font_funcs_reference");
	hbLib.bindSymbol(cast(void**)&hb_font_funcs_destroy, "hb_font_funcs_destroy");
	hbLib.bindSymbol(cast(void**)&hb_font_funcs_set_user_data, "hb_font_funcs_set_user_data");
	hbLib.bindSymbol(cast(void**)&hb_font_funcs_get_user_data, "hb_font_funcs_get_user_data");
	hbLib.bindSymbol(cast(void**)&hb_font_funcs_make_immutable, "hb_font_funcs_make_immutable");
	hbLib.bindSymbol(cast(void**)&hb_font_funcs_is_immutable, "hb_font_funcs_is_immutable");
	hbLib.bindSymbol(cast(void**)&hb_font_funcs_set_font_h_extents_func, "hb_font_funcs_set_font_h_extents_func");
	hbLib.bindSymbol(cast(void**)&hb_font_funcs_set_font_v_extents_func, "hb_font_funcs_set_font_v_extents_func");
	hbLib.bindSymbol(cast(void**)&hb_font_funcs_set_nominal_glyph_func, "hb_font_funcs_set_nominal_glyph_func");
	hbLib.bindSymbol(cast(void**)&hb_font_funcs_set_variation_glyph_func, "hb_font_funcs_set_variation_glyph_func");
	hbLib.bindSymbol(cast(void**)&hb_font_funcs_set_glyph_h_advance_func, "hb_font_funcs_set_glyph_h_advance_func");
	hbLib.bindSymbol(cast(void**)&hb_font_funcs_set_glyph_v_advance_func, "hb_font_funcs_set_glyph_v_advance_func");
	hbLib.bindSymbol(cast(void**)&hb_font_funcs_set_glyph_h_origin_func, "hb_font_funcs_set_glyph_h_origin_func");
	hbLib.bindSymbol(cast(void**)&hb_font_funcs_set_glyph_v_origin_func, "hb_font_funcs_set_glyph_v_origin_func");
	hbLib.bindSymbol(cast(void**)&hb_font_funcs_set_glyph_h_kerning_func, "hb_font_funcs_set_glyph_h_kerning_func");
	hbLib.bindSymbol(cast(void**)&hb_font_funcs_set_glyph_extents_func, "hb_font_funcs_set_glyph_extents_func");
	hbLib.bindSymbol(cast(void**)&hb_font_funcs_set_glyph_contour_point_func, "hb_font_funcs_set_glyph_contour_point_func");
	hbLib.bindSymbol(cast(void**)&hb_font_funcs_set_glyph_name_func, "hb_font_funcs_set_glyph_name_func");
	hbLib.bindSymbol(cast(void**)&hb_font_funcs_set_glyph_from_name_func, "hb_font_funcs_set_glyph_from_name_func");
	hbLib.bindSymbol(cast(void**)&hb_font_get_h_extents, "hb_font_get_h_extents");
	hbLib.bindSymbol(cast(void**)&hb_font_get_v_extents, "hb_font_get_v_extents");
	hbLib.bindSymbol(cast(void**)&hb_font_get_nominal_glyph, "hb_font_get_nominal_glyph");
	hbLib.bindSymbol(cast(void**)&hb_font_get_variation_glyph, "hb_font_get_variation_glyph");
	hbLib.bindSymbol(cast(void**)&hb_font_get_glyph_h_advance, "hb_font_get_glyph_h_advance");
	hbLib.bindSymbol(cast(void**)&hb_font_get_glyph_v_advance, "hb_font_get_glyph_v_advance");
	hbLib.bindSymbol(cast(void**)&hb_font_get_glyph_h_origin, "hb_font_get_glyph_h_origin");
	hbLib.bindSymbol(cast(void**)&hb_font_get_glyph_v_origin, "hb_font_get_glyph_v_origin");
	hbLib.bindSymbol(cast(void**)&hb_font_get_glyph_h_kerning, "hb_font_get_glyph_h_kerning");
	hbLib.bindSymbol(cast(void**)&hb_font_get_glyph_extents, "hb_font_get_glyph_extents");
	hbLib.bindSymbol(cast(void**)&hb_font_get_glyph_contour_point, "hb_font_get_glyph_contour_point");
	hbLib.bindSymbol(cast(void**)&hb_font_get_glyph_name, "hb_font_get_glyph_name");
	hbLib.bindSymbol(cast(void**)&hb_font_get_glyph_from_name, "hb_font_get_glyph_from_name");
	hbLib.bindSymbol(cast(void**)&hb_font_get_glyph, "hb_font_get_glyph");
	hbLib.bindSymbol(cast(void**)&hb_font_get_extents_for_direction, "hb_font_get_extents_for_direction");
	hbLib.bindSymbol(cast(void**)&hb_font_get_glyph_advance_for_direction, "hb_font_get_glyph_advance_for_direction");
	hbLib.bindSymbol(cast(void**)&hb_font_get_glyph_origin_for_direction, "hb_font_get_glyph_origin_for_direction");
	hbLib.bindSymbol(cast(void**)&hb_font_add_glyph_origin_for_direction, "hb_font_add_glyph_origin_for_direction");
	hbLib.bindSymbol(cast(void**)&hb_font_subtract_glyph_origin_for_direction, "hb_font_subtract_glyph_origin_for_direction");
	hbLib.bindSymbol(cast(void**)&hb_font_get_glyph_kerning_for_direction, "hb_font_get_glyph_kerning_for_direction");
	hbLib.bindSymbol(cast(void**)&hb_font_get_glyph_extents_for_origin, "hb_font_get_glyph_extents_for_origin");
	hbLib.bindSymbol(cast(void**)&hb_font_get_glyph_contour_point_for_origin, "hb_font_get_glyph_contour_point_for_origin");
	hbLib.bindSymbol(cast(void**)&hb_font_glyph_to_string, "hb_font_glyph_to_string");
	hbLib.bindSymbol(cast(void**)&hb_font_glyph_from_string, "hb_font_glyph_from_string");
	hbLib.bindSymbol(cast(void**)&hb_font_create, "hb_font_create");
	hbLib.bindSymbol(cast(void**)&hb_font_create_sub_font, "hb_font_create_sub_font");
	hbLib.bindSymbol(cast(void**)&hb_font_get_empty, "hb_font_get_empty");
	hbLib.bindSymbol(cast(void**)&hb_font_reference, "hb_font_reference");
	hbLib.bindSymbol(cast(void**)&hb_font_destroy, "hb_font_destroy");
	hbLib.bindSymbol(cast(void**)&hb_font_set_user_data, "hb_font_set_user_data");
	hbLib.bindSymbol(cast(void**)&hb_font_get_user_data, "hb_font_get_user_data");
	hbLib.bindSymbol(cast(void**)&hb_font_make_immutable, "hb_font_make_immutable");
	hbLib.bindSymbol(cast(void**)&hb_font_is_immutable, "hb_font_is_immutable");
	hbLib.bindSymbol(cast(void**)&hb_font_set_parent, "hb_font_set_parent");
	hbLib.bindSymbol(cast(void**)&hb_font_get_parent, "hb_font_get_parent");
	hbLib.bindSymbol(cast(void**)&hb_font_set_face, "hb_font_set_face");
	hbLib.bindSymbol(cast(void**)&hb_font_get_face, "hb_font_get_face");
	hbLib.bindSymbol(cast(void**)&hb_font_set_funcs, "hb_font_set_funcs");
	hbLib.bindSymbol(cast(void**)&hb_font_set_funcs_data, "hb_font_set_funcs_data");
	hbLib.bindSymbol(cast(void**)&hb_font_set_scale, "hb_font_set_scale");
	hbLib.bindSymbol(cast(void**)&hb_font_get_scale, "hb_font_get_scale");
	hbLib.bindSymbol(cast(void**)&hb_font_set_ppem, "hb_font_set_ppem");
	hbLib.bindSymbol(cast(void**)&hb_font_get_ppem, "hb_font_get_ppem");
	hbLib.bindSymbol(cast(void**)&hb_font_set_ptem, "hb_font_set_ptem");
	hbLib.bindSymbol(cast(void**)&hb_font_get_ptem, "hb_font_get_ptem");
	hbLib.bindSymbol(cast(void**)&hb_font_set_variations, "hb_font_set_variations");
	hbLib.bindSymbol(cast(void**)&hb_font_set_var_coords_design, "hb_font_set_var_coords_design");
	hbLib.bindSymbol(cast(void**)&hb_font_set_var_coords_normalized, "hb_font_set_var_coords_normalized");
	hbLib.bindSymbol(cast(void**)&hb_font_get_var_coords_normalized, "hb_font_get_var_coords_normalized");

	version(HB_with_freetype)
	version(Have_bindbc_freetype)
	{
		import bindbc.hb.bind.ft;
		hbLib.bindSymbol(cast(void**)&hb_ft_face_create, "hb_ft_face_create");
		hbLib.bindSymbol(cast(void**)&hb_ft_face_create_cached, "hb_ft_face_create_cached");
		hbLib.bindSymbol(cast(void**)&hb_ft_face_create_referenced, "hb_ft_face_create_referenced");
		hbLib.bindSymbol(cast(void**)&hb_ft_font_create, "hb_ft_font_create");
		hbLib.bindSymbol(cast(void**)&hb_ft_font_create_referenced, "hb_ft_font_create_referenced");
		hbLib.bindSymbol(cast(void**)&hb_ft_font_get_face, "hb_ft_font_get_face");
		hbLib.bindSymbol(cast(void**)&hb_ft_font_set_load_flags, "hb_ft_font_set_load_flags");
		hbLib.bindSymbol(cast(void**)&hb_ft_font_get_load_flags, "hb_ft_font_get_load_flags");
		hbLib.bindSymbol(cast(void**)&hb_ft_font_changed, "hb_ft_font_changed");
		hbLib.bindSymbol(cast(void**)&hb_ft_font_set_funcs, "hb_ft_font_set_funcs");
	}
	
	version(Windows)
	version(HB_with_gdi)
	{
		import bindbc.hb.bind.gdi;
		hbLib.bindSymbol(cast(void**)&hb_gdi_face_create, "hb_gdi_face_create");
	}
	
	version(HB_with_graphite2)
	{
		import bindbc.hb.bind.graphite2;
		hbLib.bindSymbol(cast(void**)&hb_graphite2_face_get_gr_face, "hb_graphite2_face_get_gr_face");
		hbLib.bindSymbol(cast(void**)&hb_graphite2_font_get_gr_font, "hb_graphite2_font_get_gr_font");
	}

	version(HB_with_icu)
	{
		import bindbc.hb.bind.icu;
		hbLib.bindSymbol(cast(void**)&hb_icu_script_to_script, "hb_icu_script_to_script");
		hbLib.bindSymbol(cast(void**)&hb_icu_script_from_script, "hb_icu_script_from_script");
		hbLib.bindSymbol(cast(void**)&hb_icu_get_unicode_funcs, "hb_icu_get_unicode_funcs");
	}
	
	import bindbc.hb.bind.set;
	hbLib.bindSymbol(cast(void**)&hb_set_create, "hb_set_create");
	hbLib.bindSymbol(cast(void**)&hb_set_get_empty, "hb_set_get_empty");
	hbLib.bindSymbol(cast(void**)&hb_set_reference, "hb_set_reference");
	hbLib.bindSymbol(cast(void**)&hb_set_destroy, "hb_set_destroy");
	hbLib.bindSymbol(cast(void**)&hb_set_set_user_data, "hb_set_set_user_data");
	hbLib.bindSymbol(cast(void**)&hb_set_get_user_data, "hb_set_get_user_data");
	hbLib.bindSymbol(cast(void**)&hb_set_allocation_successful, "hb_set_allocation_successful");
	hbLib.bindSymbol(cast(void**)&hb_set_clear, "hb_set_clear");
	hbLib.bindSymbol(cast(void**)&hb_set_is_empty, "hb_set_is_empty");
	hbLib.bindSymbol(cast(void**)&hb_set_has, "hb_set_has");
	hbLib.bindSymbol(cast(void**)&hb_set_add, "hb_set_add");
	hbLib.bindSymbol(cast(void**)&hb_set_add_range, "hb_set_add_range");
	hbLib.bindSymbol(cast(void**)&hb_set_del, "hb_set_del");
	hbLib.bindSymbol(cast(void**)&hb_set_del_range, "hb_set_del_range");
	hbLib.bindSymbol(cast(void**)&hb_set_is_equal, "hb_set_is_equal");
	hbLib.bindSymbol(cast(void**)&hb_set_set, "hb_set_set");
	hbLib.bindSymbol(cast(void**)&hb_set_union, "hb_set_union");
	hbLib.bindSymbol(cast(void**)&hb_set_intersect, "hb_set_intersect");
	hbLib.bindSymbol(cast(void**)&hb_set_subtract, "hb_set_subtract");
	hbLib.bindSymbol(cast(void**)&hb_set_symmetric_difference, "hb_set_symmetric_difference");
	hbLib.bindSymbol(cast(void**)&hb_set_get_population, "hb_set_get_population");
	hbLib.bindSymbol(cast(void**)&hb_set_get_min, "hb_set_get_min");
	hbLib.bindSymbol(cast(void**)&hb_set_get_max, "hb_set_get_max");
	hbLib.bindSymbol(cast(void**)&hb_set_next, "hb_set_next");
	hbLib.bindSymbol(cast(void**)&hb_set_next_range, "hb_set_next_range");

	import bindbc.hb.bind.shape;
	hbLib.bindSymbol(cast(void**)&hb_shape, "hb_shape");
	hbLib.bindSymbol(cast(void**)&hb_shape_full, "hb_shape_full");
	hbLib.bindSymbol(cast(void**)&hb_shape_list_shapers, "hb_shape_list_shapers");

	import bindbc.hb.bind.shape_plan;
	hbLib.bindSymbol(cast(void**)&hb_shape_plan_create, "hb_shape_plan_create");
	hbLib.bindSymbol(cast(void**)&hb_shape_plan_create_cached, "hb_shape_plan_create_cached");
	hbLib.bindSymbol(cast(void**)&hb_shape_plan_create2, "hb_shape_plan_create2");
	hbLib.bindSymbol(cast(void**)&hb_shape_plan_create_cached2, "hb_shape_plan_create_cached2");
	hbLib.bindSymbol(cast(void**)&hb_shape_plan_get_empty, "hb_shape_plan_get_empty");
	hbLib.bindSymbol(cast(void**)&hb_shape_plan_reference, "hb_shape_plan_reference");
	hbLib.bindSymbol(cast(void**)&hb_shape_plan_destroy, "hb_shape_plan_destroy");
	hbLib.bindSymbol(cast(void**)&hb_shape_plan_set_user_data, "hb_shape_plan_set_user_data");
	hbLib.bindSymbol(cast(void**)&hb_shape_plan_get_user_data, "hb_shape_plan_get_user_data");
	hbLib.bindSymbol(cast(void**)&hb_shape_plan_execute, "hb_shape_plan_execute");
	hbLib.bindSymbol(cast(void**)&hb_shape_plan_get_shaper, "hb_shape_plan_get_shaper");

	import bindbc.hb.bind.unicode;
	hbLib.bindSymbol(cast(void**)&hb_unicode_funcs_get_default, "hb_unicode_funcs_get_default");
	hbLib.bindSymbol(cast(void**)&hb_unicode_funcs_create, "hb_unicode_funcs_create");
	hbLib.bindSymbol(cast(void**)&hb_unicode_funcs_get_empty, "hb_unicode_funcs_get_empty");
	hbLib.bindSymbol(cast(void**)&hb_unicode_funcs_reference, "hb_unicode_funcs_reference");
	hbLib.bindSymbol(cast(void**)&hb_unicode_funcs_destroy, "hb_unicode_funcs_destroy");
	hbLib.bindSymbol(cast(void**)&hb_unicode_funcs_set_user_data, "hb_unicode_funcs_set_user_data");
	hbLib.bindSymbol(cast(void**)&hb_unicode_funcs_get_user_data, "hb_unicode_funcs_get_user_data");
	hbLib.bindSymbol(cast(void**)&hb_unicode_funcs_make_immutable, "hb_unicode_funcs_make_immutable");
	hbLib.bindSymbol(cast(void**)&hb_unicode_funcs_is_immutable, "hb_unicode_funcs_is_immutable");
	hbLib.bindSymbol(cast(void**)&hb_unicode_funcs_get_parent, "hb_unicode_funcs_get_parent");
	hbLib.bindSymbol(cast(void**)&hb_unicode_funcs_set_combining_class_func, "hb_unicode_funcs_set_combining_class_func");
	hbLib.bindSymbol(cast(void**)&hb_unicode_funcs_set_general_category_func, "hb_unicode_funcs_set_general_category_func");
	hbLib.bindSymbol(cast(void**)&hb_unicode_funcs_set_mirroring_func, "hb_unicode_funcs_set_mirroring_func");
	hbLib.bindSymbol(cast(void**)&hb_unicode_funcs_set_script_func, "hb_unicode_funcs_set_script_func");
	hbLib.bindSymbol(cast(void**)&hb_unicode_funcs_set_compose_func, "hb_unicode_funcs_set_compose_func");
	hbLib.bindSymbol(cast(void**)&hb_unicode_funcs_set_decompose_func, "hb_unicode_funcs_set_decompose_func");
	hbLib.bindSymbol(cast(void**)&hb_unicode_combining_class, "hb_unicode_combining_class");
	hbLib.bindSymbol(cast(void**)&hb_unicode_general_category, "hb_unicode_general_category");
	hbLib.bindSymbol(cast(void**)&hb_unicode_mirroring, "hb_unicode_mirroring");
	hbLib.bindSymbol(cast(void**)&hb_unicode_script, "hb_unicode_script");
	hbLib.bindSymbol(cast(void**)&hb_unicode_compose, "hb_unicode_compose");
	hbLib.bindSymbol(cast(void**)&hb_unicode_decompose, "hb_unicode_decompose");

	version(Windows)
	version(HB_with_uniscribe)
	{
		import bindbc.hb.bind.uniscribe;
		hbLib.bindSymbol(cast(void**)&hb_uniscribe_font_get_logfontw, "hb_uniscribe_font_get_logfontw");
		hbLib.bindSymbol(cast(void**)&hb_uniscribe_font_get_hfont, "hb_uniscribe_font_get_hfont");
	}

	import bindbc.hb.bind.version_;
	hbLib.bindSymbol(cast(void**)&hb_version, "hb_version");
	hbLib.bindSymbol(cast(void**)&hb_version_string, "hb_version_string");
	hbLib.bindSymbol(cast(void**)&hb_version_atleast, "hb_version_atleast");

	version(HB_with_deprecated)
	{
		import bindbc.hb.bind.ot.deprecated_;
		hbLib.bindSymbol(cast(void**)&hb_ot_layout_table_choose_script, "hb_ot_layout_table_choose_script");
		hbLib.bindSymbol(cast(void**)&hb_ot_layout_script_find_language, "hb_ot_layout_script_find_language");
		hbLib.bindSymbol(cast(void**)&hb_ot_tags_from_script, "hb_ot_tags_from_script");
		hbLib.bindSymbol(cast(void**)&hb_ot_tag_from_language, "hb_ot_tag_from_language");
		hbLib.bindSymbol(cast(void**)&hb_ot_var_get_axes, "hb_ot_var_get_axes");
		hbLib.bindSymbol(cast(void**)&hb_ot_var_find_axis, "hb_ot_var_find_axis");
	}

	import bindbc.hb.bind.ot.font;
	hbLib.bindSymbol(cast(void**)&hb_ot_font_set_funcs, "hb_ot_font_set_funcs");

	import bindbc.hb.bind.ot.layout;
	hbLib.bindSymbol(cast(void**)&hb_ot_tag_to_script, "hb_ot_tag_to_script");
	hbLib.bindSymbol(cast(void**)&hb_ot_tag_to_language, "hb_ot_tag_to_language");
	hbLib.bindSymbol(cast(void**)&hb_ot_layout_has_glyph_classes, "hb_ot_layout_has_glyph_classes");
	hbLib.bindSymbol(cast(void**)&hb_ot_layout_get_glyph_class, "hb_ot_layout_get_glyph_class");
	hbLib.bindSymbol(cast(void**)&hb_ot_layout_get_glyphs_in_class, "hb_ot_layout_get_glyphs_in_class");
	hbLib.bindSymbol(cast(void**)&hb_ot_layout_get_attach_points, "hb_ot_layout_get_attach_points");
	hbLib.bindSymbol(cast(void**)&hb_ot_layout_get_ligature_carets, "hb_ot_layout_get_ligature_carets");
	hbLib.bindSymbol(cast(void**)&hb_ot_layout_table_get_script_tags, "hb_ot_layout_table_get_script_tags");
	hbLib.bindSymbol(cast(void**)&hb_ot_layout_table_find_script, "hb_ot_layout_table_find_script");
	hbLib.bindSymbol(cast(void**)&hb_ot_layout_table_get_feature_tags, "hb_ot_layout_table_get_feature_tags");
	hbLib.bindSymbol(cast(void**)&hb_ot_layout_script_get_language_tags, "hb_ot_layout_script_get_language_tags");
	hbLib.bindSymbol(cast(void**)&hb_ot_layout_language_get_required_feature_index, "hb_ot_layout_language_get_required_feature_index");
	hbLib.bindSymbol(cast(void**)&hb_ot_layout_language_get_required_feature, "hb_ot_layout_language_get_required_feature");
	hbLib.bindSymbol(cast(void**)&hb_ot_layout_language_get_feature_indexes, "hb_ot_layout_language_get_feature_indexes");
	hbLib.bindSymbol(cast(void**)&hb_ot_layout_language_get_feature_tags, "hb_ot_layout_language_get_feature_tags");
	hbLib.bindSymbol(cast(void**)&hb_ot_layout_language_find_feature, "hb_ot_layout_language_find_feature");
	hbLib.bindSymbol(cast(void**)&hb_ot_layout_feature_get_lookups, "hb_ot_layout_feature_get_lookups");
	hbLib.bindSymbol(cast(void**)&hb_ot_layout_table_get_lookup_count, "hb_ot_layout_table_get_lookup_count");
	hbLib.bindSymbol(cast(void**)&hb_ot_layout_collect_lookups, "hb_ot_layout_collect_lookups");
	hbLib.bindSymbol(cast(void**)&hb_ot_layout_lookup_collect_glyphs, "hb_ot_layout_lookup_collect_glyphs");
	hbLib.bindSymbol(cast(void**)&hb_ot_layout_table_find_feature_variations, "hb_ot_layout_table_find_feature_variations");
	hbLib.bindSymbol(cast(void**)&hb_ot_layout_feature_with_variations_get_lookups, "hb_ot_layout_feature_with_variations_get_lookups");
	hbLib.bindSymbol(cast(void**)&hb_ot_layout_has_substitution, "hb_ot_layout_has_substitution");
	hbLib.bindSymbol(cast(void**)&hb_ot_layout_lookup_would_substitute, "hb_ot_layout_lookup_would_substitute");
	hbLib.bindSymbol(cast(void**)&hb_ot_layout_lookup_substitute_closure, "hb_ot_layout_lookup_substitute_closure");
	hbLib.bindSymbol(cast(void**)&hb_ot_layout_has_positioning, "hb_ot_layout_has_positioning");
	hbLib.bindSymbol(cast(void**)&hb_ot_layout_get_size_params, "hb_ot_layout_get_size_params");

	import bindbc.hb.bind.ot.math;
	hbLib.bindSymbol(cast(void**)&hb_ot_math_has_data, "hb_ot_math_has_data");
	hbLib.bindSymbol(cast(void**)&hb_ot_math_get_constant, "hb_ot_math_get_constant");
	hbLib.bindSymbol(cast(void**)&hb_ot_math_get_glyph_italics_correction, "hb_ot_math_get_glyph_italics_correction");
	hbLib.bindSymbol(cast(void**)&hb_ot_math_get_glyph_top_accent_attachment, "hb_ot_math_get_glyph_top_accent_attachment");
	hbLib.bindSymbol(cast(void**)&hb_ot_math_is_glyph_extended_shape, "hb_ot_math_is_glyph_extended_shape");
	hbLib.bindSymbol(cast(void**)&hb_ot_math_get_glyph_kerning, "hb_ot_math_get_glyph_kerning");
	hbLib.bindSymbol(cast(void**)&hb_ot_math_get_glyph_variants, "hb_ot_math_get_glyph_variants");
	hbLib.bindSymbol(cast(void**)&hb_ot_math_get_min_connector_overlap, "hb_ot_math_get_min_connector_overlap");
	hbLib.bindSymbol(cast(void**)&hb_ot_math_get_glyph_assembly, "hb_ot_math_get_glyph_assembly");

	import bindbc.hb.bind.ot.shape;
	hbLib.bindSymbol(cast(void**)&hb_ot_shape_glyphs_closure, "hb_ot_shape_glyphs_closure");
	hbLib.bindSymbol(cast(void**)&hb_ot_shape_plan_collect_lookups, "hb_ot_shape_plan_collect_lookups");

	import bindbc.hb.bind.ot.var;
	hbLib.bindSymbol(cast(void**)&hb_ot_var_has_data, "hb_ot_var_has_data");
	hbLib.bindSymbol(cast(void**)&hb_ot_var_get_axis_count, "hb_ot_var_get_axis_count");
	hbLib.bindSymbol(cast(void**)&hb_ot_var_normalize_variations, "hb_ot_var_normalize_variations");
	hbLib.bindSymbol(cast(void**)&hb_ot_var_normalize_coords, "hb_ot_var_normalize_coords");
	
	if (errorCount() != lastErrorCount)
		return HBSupport.badLibrary;
	else
		hbLoadedVersion = HBSupport.v1_7_2;
	
	version(HB_with_subset)
	{
		static if (hbSupport >= 20500)
		{
			import bindbc.hb.bind.subset;
			hbSubsetLib.bindSymbol(cast(void**)&hb_subset_input_create_or_fail, "hb_subset_input_create_or_fail");
			hbSubsetLib.bindSymbol(cast(void**)&hb_subset_input_reference, "hb_subset_input_reference");
			hbSubsetLib.bindSymbol(cast(void**)&hb_subset_input_destroy, "hb_subset_input_destroy");
			hbSubsetLib.bindSymbol(cast(void**)&hb_subset_input_unicode_set, "hb_subset_input_unicode_set");
			hbSubsetLib.bindSymbol(cast(void**)&hb_subset_input_glyph_set, "hb_subset_input_glyph_set");
			hbSubsetLib.bindSymbol(cast(void**)&hb_subset_input_nameid_set, "hb_subset_input_nameid_set");
			hbSubsetLib.bindSymbol(cast(void**)&hb_subset_input_drop_tables_set, "hb_subset_input_drop_tables_set");
			hbSubsetLib.bindSymbol(cast(void**)&hb_subset_input_set_drop_hints, "hb_subset_input_set_drop_hints");
			hbSubsetLib.bindSymbol(cast(void**)&hb_subset_input_get_drop_hints, "hb_subset_input_get_drop_hints");
			hbSubsetLib.bindSymbol(cast(void**)&hb_subset_input_set_desubroutinize, "hb_subset_input_set_desubroutinize");
			hbSubsetLib.bindSymbol(cast(void**)&hb_subset_input_get_desubroutinize, "hb_subset_input_get_desubroutinize");
			hbSubsetLib.bindSymbol(cast(void**)&hb_subset_input_set_retain_gids, "hb_subset_input_set_retain_gids");
			hbSubsetLib.bindSymbol(cast(void**)&hb_subset_input_get_retain_gids, "hb_subset_input_get_retain_gids");
			hbSubsetLib.bindSymbol(cast(void**)&hb_subset, "hb_subset");
		}
		else
			static assert(false, "Subset library is only supported for versions >= 2.5.0");
	}
	
	static if (hbSupport >= HBSupport.v2_6_3)
	{
		import bindbc.hb.bind.aat.layout;
		hbLib.bindSymbol(cast(void**)&hb_aat_layout_feature_type_get_name_id, "hb_aat_layout_feature_type_get_name_id");
		hbLib.bindSymbol(cast(void**)&hb_aat_layout_feature_type_get_selector_infos, "hb_aat_layout_feature_type_get_selector_infos");
		hbLib.bindSymbol(cast(void**)&hb_aat_layout_get_feature_types, "hb_aat_layout_get_feature_types");
		hbLib.bindSymbol(cast(void**)&hb_aat_layout_has_positioning, "hb_aat_layout_has_positioning");
		hbLib.bindSymbol(cast(void**)&hb_aat_layout_has_substitution, "hb_aat_layout_has_substitution");
		hbLib.bindSymbol(cast(void**)&hb_aat_layout_has_tracking, "hb_aat_layout_has_tracking");
		
		import bindbc.hb.bind.blob;
		hbLib.bindSymbol(cast(void**)&hb_blob_copy_writable_or_fail, "hb_blob_copy_writable_or_fail");
		hbLib.bindSymbol(cast(void**)&hb_blob_create_from_file, "hb_blob_create_from_file");
		
		import bindbc.hb.bind.buffer;
		hbLib.bindSymbol(cast(void**)&hb_buffer_get_invisible_glyph, "hb_buffer_get_invisible_glyph");
		hbLib.bindSymbol(cast(void**)&hb_buffer_set_invisible_glyph, "hb_buffer_set_invisible_glyph");
		
		//import bindbc.hb.bind.common;
		//hbLib.bindSymbol(cast(void**)&hb_color_get_alpha, "hb_color_get_alpha");
		//hbLib.bindSymbol(cast(void**)&hb_color_get_blue, "hb_color_get_blue");
		//hbLib.bindSymbol(cast(void**)&hb_color_get_green, "hb_color_get_green");
		//hbLib.bindSymbol(cast(void**)&hb_color_get_red, "hb_color_get_red");
		
		import bindbc.hb.bind.face;
		hbLib.bindSymbol(cast(void**)&hb_face_builder_add_table, "hb_face_builder_add_table");
		hbLib.bindSymbol(cast(void**)&hb_face_builder_create, "hb_face_builder_create");
		hbLib.bindSymbol(cast(void**)&hb_face_collect_unicodes, "hb_face_collect_unicodes");
		hbLib.bindSymbol(cast(void**)&hb_face_collect_variation_selectors, "hb_face_collect_variation_selectors");
		hbLib.bindSymbol(cast(void**)&hb_face_collect_variation_unicodes, "hb_face_collect_variation_unicodes");
		hbLib.bindSymbol(cast(void**)&hb_face_count, "hb_face_count");
		
		import bindbc.hb.bind.font;
		hbLib.bindSymbol(cast(void**)&hb_font_funcs_set_glyph_h_advances_func, "hb_font_funcs_set_glyph_h_advances_func");
		hbLib.bindSymbol(cast(void**)&hb_font_funcs_set_glyph_v_advances_func, "hb_font_funcs_set_glyph_v_advances_func");
		hbLib.bindSymbol(cast(void**)&hb_font_funcs_set_nominal_glyphs_func, "hb_font_funcs_set_nominal_glyphs_func");
		hbLib.bindSymbol(cast(void**)&hb_font_get_glyph_advances_for_direction, "hb_font_get_glyph_advances_for_direction");
		hbLib.bindSymbol(cast(void**)&hb_font_get_glyph_h_advances, "hb_font_get_glyph_h_advances");
		hbLib.bindSymbol(cast(void**)&hb_font_get_glyph_v_advances, "hb_font_get_glyph_v_advances");
		hbLib.bindSymbol(cast(void**)&hb_font_get_nominal_glyphs, "hb_font_get_nominal_glyphs");
		hbLib.bindSymbol(cast(void**)&hb_font_set_var_named_instance, "hb_font_set_var_named_instance");
		
		import bindbc.hb.bind.map;
		hbLib.bindSymbol(cast(void**)&hb_map_allocation_successful, "hb_map_allocation_successful");
		hbLib.bindSymbol(cast(void**)&hb_map_clear, "hb_map_clear");
		hbLib.bindSymbol(cast(void**)&hb_map_create, "hb_map_create");
		hbLib.bindSymbol(cast(void**)&hb_map_del, "hb_map_del");
		hbLib.bindSymbol(cast(void**)&hb_map_destroy, "hb_map_destroy");
		hbLib.bindSymbol(cast(void**)&hb_map_get, "hb_map_get");
		hbLib.bindSymbol(cast(void**)&hb_map_get_empty, "hb_map_get_empty");
		hbLib.bindSymbol(cast(void**)&hb_map_get_population, "hb_map_get_population");
		hbLib.bindSymbol(cast(void**)&hb_map_get_user_data, "hb_map_get_user_data");
		hbLib.bindSymbol(cast(void**)&hb_map_has, "hb_map_has");
		hbLib.bindSymbol(cast(void**)&hb_map_is_empty, "hb_map_is_empty");
		hbLib.bindSymbol(cast(void**)&hb_map_reference, "hb_map_reference");
		hbLib.bindSymbol(cast(void**)&hb_map_set, "hb_map_set");
		hbLib.bindSymbol(cast(void**)&hb_map_set_user_data, "hb_map_set_user_data");
		
		import bindbc.hb.bind.ot.color;
		hbLib.bindSymbol(cast(void**)&hb_ot_color_glyph_get_layers, "hb_ot_color_glyph_get_layers");
		hbLib.bindSymbol(cast(void**)&hb_ot_color_glyph_reference_png, "hb_ot_color_glyph_reference_png");
		hbLib.bindSymbol(cast(void**)&hb_ot_color_glyph_reference_svg, "hb_ot_color_glyph_reference_svg");
		hbLib.bindSymbol(cast(void**)&hb_ot_color_has_layers, "hb_ot_color_has_layers");
		hbLib.bindSymbol(cast(void**)&hb_ot_color_has_palettes, "hb_ot_color_has_palettes");
		hbLib.bindSymbol(cast(void**)&hb_ot_color_has_png, "hb_ot_color_has_png");
		hbLib.bindSymbol(cast(void**)&hb_ot_color_has_svg, "hb_ot_color_has_svg");
		hbLib.bindSymbol(cast(void**)&hb_ot_color_palette_color_get_name_id, "hb_ot_color_palette_color_get_name_id");
		hbLib.bindSymbol(cast(void**)&hb_ot_color_palette_get_colors, "hb_ot_color_palette_get_colors");
		hbLib.bindSymbol(cast(void**)&hb_ot_color_palette_get_count, "hb_ot_color_palette_get_count");
		hbLib.bindSymbol(cast(void**)&hb_ot_color_palette_get_flags, "hb_ot_color_palette_get_flags");
		hbLib.bindSymbol(cast(void**)&hb_ot_color_palette_get_name_id, "hb_ot_color_palette_get_name_id");
		
		import bindbc.hb.bind.ot.layout;
		hbLib.bindSymbol(cast(void**)&hb_ot_layout_collect_features, "hb_ot_layout_collect_features");
		hbLib.bindSymbol(cast(void**)&hb_ot_layout_feature_get_characters, "hb_ot_layout_feature_get_characters");
		hbLib.bindSymbol(cast(void**)&hb_ot_layout_feature_get_name_ids, "hb_ot_layout_feature_get_name_ids");
		hbLib.bindSymbol(cast(void**)&hb_ot_layout_get_baseline, "hb_ot_layout_get_baseline");
		hbLib.bindSymbol(cast(void**)&hb_ot_layout_lookups_substitute_closure, "hb_ot_layout_lookups_substitute_closure");
		hbLib.bindSymbol(cast(void**)&hb_ot_layout_script_select_language, "hb_ot_layout_script_select_language");
		hbLib.bindSymbol(cast(void**)&hb_ot_layout_table_select_script, "hb_ot_layout_table_select_script");
		hbLib.bindSymbol(cast(void**)&hb_ot_tags_from_script_and_language, "hb_ot_tags_from_script_and_language");
		hbLib.bindSymbol(cast(void**)&hb_ot_tags_to_script_and_language, "hb_ot_tags_to_script_and_language");
		
		import bindbc.hb.bind.ot.meta;
		hbLib.bindSymbol(cast(void**)&hb_ot_meta_get_entry_tags, "hb_ot_meta_get_entry_tags");
		hbLib.bindSymbol(cast(void**)&hb_ot_meta_reference_entry, "hb_ot_meta_reference_entry");
		
		import bindbc.hb.bind.ot.metrics;
		hbLib.bindSymbol(cast(void**)&hb_ot_metrics_get_position, "hb_ot_metrics_get_position");
		hbLib.bindSymbol(cast(void**)&hb_ot_metrics_get_variation, "hb_ot_metrics_get_variation");
		hbLib.bindSymbol(cast(void**)&hb_ot_metrics_get_x_variation, "hb_ot_metrics_get_x_variation");
		hbLib.bindSymbol(cast(void**)&hb_ot_metrics_get_y_variation, "hb_ot_metrics_get_y_variation");
		
		import bindbc.hb.bind.ot.name;
		hbLib.bindSymbol(cast(void**)&hb_ot_name_get_utf16, "hb_ot_name_get_utf16");
		hbLib.bindSymbol(cast(void**)&hb_ot_name_get_utf32, "hb_ot_name_get_utf32");
		hbLib.bindSymbol(cast(void**)&hb_ot_name_get_utf8, "hb_ot_name_get_utf8");
		hbLib.bindSymbol(cast(void**)&hb_ot_name_list_names, "hb_ot_name_list_names");
		
		import bindbc.hb.bind.ot.var;
		hbLib.bindSymbol(cast(void**)&hb_ot_var_find_axis_info, "hb_ot_var_find_axis_info");
		hbLib.bindSymbol(cast(void**)&hb_ot_var_get_axis_infos, "hb_ot_var_get_axis_infos");
		hbLib.bindSymbol(cast(void**)&hb_ot_var_get_named_instance_count, "hb_ot_var_get_named_instance_count");
		hbLib.bindSymbol(cast(void**)&hb_ot_var_named_instance_get_design_coords, "hb_ot_var_named_instance_get_design_coords");
		hbLib.bindSymbol(cast(void**)&hb_ot_var_named_instance_get_postscript_name_id, "hb_ot_var_named_instance_get_postscript_name_id");
		hbLib.bindSymbol(cast(void**)&hb_ot_var_named_instance_get_subfamily_name_id, "hb_ot_var_named_instance_get_subfamily_name_id");
		
		import bindbc.hb.bind.set;
		hbLib.bindSymbol(cast(void**)&hb_set_is_subset, "hb_set_is_subset");
		hbLib.bindSymbol(cast(void**)&hb_set_previous, "hb_set_previous");
		hbLib.bindSymbol(cast(void**)&hb_set_previous_range, "hb_set_previous_range");

		if (errorCount() != lastErrorCount)
			return HBSupport.badLibrary;
		else
			hbLoadedVersion = HBSupport.v2_6_3;
	}
	
	return hbLoadedVersion;
}
