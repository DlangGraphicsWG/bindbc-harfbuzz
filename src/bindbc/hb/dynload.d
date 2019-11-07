
//          Copyright Ahmet Sait Koçak 2019.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

module bindbc.hb.dynload;

version(BindHB_Static) {}
else:

import bindbc.loader;
import bindbc.hb.config,
       bindbc.hb.bind;

private {
    SharedLib lib;
    HBSupport loadedVersion;
}

void unloadHarfBuzz()
{
    if(lib != invalidHandle) {
        lib.unload();
    }
}

HBSupport loadedHarfBuzzVersion() { return loadedVersion; }

bool isHarfBuzzLoaded()
{
    return  lib != invalidHandle;
}

HBSupport loadHarfBuzz()
{
    // #1778 prevents me from using static arrays here :(
    version(Windows) {
        const(char)[][3] libNames = [
            "harfbuzz.dll",
            "libharfbuzz.dll",
			"libharfbuzz-0.dll"
        ];
    }
    else version(OSX) {
        const(char)[][6] libNames = [
            "libharfbuzz.dylib",
            "libharfbuzz.0.dylib",
            "/usr/X11/lib/libharfbuzz.dylib",
            "/usr/X11/lib/libharfbuzz.0.dylib",
            "/opt/X11/lib/libharfbuzz.dylib",
            "/opt/X11/lib/libharfbuzz.0.dylib"
        ];
    }
    else version(Posix) {
        const(char)[][2] libNames = [
            "libharfbuzz.so.0",
            "libharfbuzz.so"
        ];
    }
    else static assert(0, "bindbc-harfbuzz is not yet supported on this platform.");

    HBSupport ret;
    foreach(name; libNames) {
        ret = loadHarfBuzz(name.ptr);
        if(ret != HBSupport.noLibrary) break;
    }
    return ret;
}

HBSupport loadHarfBuzz(const(char)* libName)
{
    lib = load(libName);
    if(lib == invalidHandle) {
        return HBSupport.noLibrary;
    }

    auto errCount = errorCount();
    loadedVersion = HBSupport.badLibrary;
	
	// bindbc.hb.bind.blob
	lib.bindSymbol(cast(void**)&hb_blob_create, "hb_blob_create");
	lib.bindSymbol(cast(void**)&hb_blob_create_from_file, "hb_blob_create_from_file");
	lib.bindSymbol(cast(void**)&hb_blob_create_sub_blob, "hb_blob_create_sub_blob");
	lib.bindSymbol(cast(void**)&hb_blob_copy_writable_or_fail, "hb_blob_copy_writable_or_fail");
	lib.bindSymbol(cast(void**)&hb_blob_get_empty, "hb_blob_get_empty");
	lib.bindSymbol(cast(void**)&hb_blob_reference, "hb_blob_reference");
	lib.bindSymbol(cast(void**)&hb_blob_destroy, "hb_blob_destroy");
	lib.bindSymbol(cast(void**)&hb_blob_set_user_data, "hb_blob_set_user_data");
	lib.bindSymbol(cast(void**)&hb_blob_get_user_data, "hb_blob_get_user_data");
	lib.bindSymbol(cast(void**)&hb_blob_make_immutable, "hb_blob_make_immutable");
	lib.bindSymbol(cast(void**)&hb_blob_is_immutable, "hb_blob_is_immutable");
	lib.bindSymbol(cast(void**)&hb_blob_get_length, "hb_blob_get_length");
	lib.bindSymbol(cast(void**)&hb_blob_get_data, "hb_blob_get_data");
	lib.bindSymbol(cast(void**)&hb_blob_get_data_writable, "hb_blob_get_data_writable");

	// bindbc.hb.bind.buffer
	//lib.bindSymbol(cast(void**)&hb_glyph_info_get_glyph_flags, "hb_glyph_info_get_glyph_flags");
	lib.bindSymbol(cast(void**)&hb_segment_properties_equal, "hb_segment_properties_equal");
	lib.bindSymbol(cast(void**)&hb_segment_properties_hash, "hb_segment_properties_hash");
	lib.bindSymbol(cast(void**)&hb_buffer_create, "hb_buffer_create");
	lib.bindSymbol(cast(void**)&hb_buffer_get_empty, "hb_buffer_get_empty");
	lib.bindSymbol(cast(void**)&hb_buffer_reference, "hb_buffer_reference");
	lib.bindSymbol(cast(void**)&hb_buffer_destroy, "hb_buffer_destroy");
	lib.bindSymbol(cast(void**)&hb_buffer_set_user_data, "hb_buffer_set_user_data");
	lib.bindSymbol(cast(void**)&hb_buffer_get_user_data, "hb_buffer_get_user_data");
	lib.bindSymbol(cast(void**)&hb_buffer_set_content_type, "hb_buffer_set_content_type");
	lib.bindSymbol(cast(void**)&hb_buffer_get_content_type, "hb_buffer_get_content_type");
	lib.bindSymbol(cast(void**)&hb_buffer_set_unicode_funcs, "hb_buffer_set_unicode_funcs");
	lib.bindSymbol(cast(void**)&hb_buffer_get_unicode_funcs, "hb_buffer_get_unicode_funcs");
	lib.bindSymbol(cast(void**)&hb_buffer_set_direction, "hb_buffer_set_direction");
	lib.bindSymbol(cast(void**)&hb_buffer_get_direction, "hb_buffer_get_direction");
	lib.bindSymbol(cast(void**)&hb_buffer_set_script, "hb_buffer_set_script");
	lib.bindSymbol(cast(void**)&hb_buffer_get_script, "hb_buffer_get_script");
	lib.bindSymbol(cast(void**)&hb_buffer_set_language, "hb_buffer_set_language");
	lib.bindSymbol(cast(void**)&hb_buffer_get_language, "hb_buffer_get_language");
	lib.bindSymbol(cast(void**)&hb_buffer_set_segment_properties, "hb_buffer_set_segment_properties");
	lib.bindSymbol(cast(void**)&hb_buffer_get_segment_properties, "hb_buffer_get_segment_properties");
	lib.bindSymbol(cast(void**)&hb_buffer_guess_segment_properties, "hb_buffer_guess_segment_properties");
	lib.bindSymbol(cast(void**)&hb_buffer_set_flags, "hb_buffer_set_flags");
	lib.bindSymbol(cast(void**)&hb_buffer_get_flags, "hb_buffer_get_flags");
	lib.bindSymbol(cast(void**)&hb_buffer_set_cluster_level, "hb_buffer_set_cluster_level");
	lib.bindSymbol(cast(void**)&hb_buffer_get_cluster_level, "hb_buffer_get_cluster_level");
	lib.bindSymbol(cast(void**)&hb_buffer_set_replacement_codepoint, "hb_buffer_set_replacement_codepoint");
	lib.bindSymbol(cast(void**)&hb_buffer_get_replacement_codepoint, "hb_buffer_get_replacement_codepoint");
	lib.bindSymbol(cast(void**)&hb_buffer_set_invisible_glyph, "hb_buffer_set_invisible_glyph");
	lib.bindSymbol(cast(void**)&hb_buffer_get_invisible_glyph, "hb_buffer_get_invisible_glyph");
	lib.bindSymbol(cast(void**)&hb_buffer_reset, "hb_buffer_reset");
	lib.bindSymbol(cast(void**)&hb_buffer_clear_contents, "hb_buffer_clear_contents");
	lib.bindSymbol(cast(void**)&hb_buffer_pre_allocate, "hb_buffer_pre_allocate");
	lib.bindSymbol(cast(void**)&hb_buffer_allocation_successful, "hb_buffer_allocation_successful");
	lib.bindSymbol(cast(void**)&hb_buffer_reverse, "hb_buffer_reverse");
	lib.bindSymbol(cast(void**)&hb_buffer_reverse_range, "hb_buffer_reverse_range");
	lib.bindSymbol(cast(void**)&hb_buffer_reverse_clusters, "hb_buffer_reverse_clusters");
	lib.bindSymbol(cast(void**)&hb_buffer_add, "hb_buffer_add");
	lib.bindSymbol(cast(void**)&hb_buffer_add_utf8, "hb_buffer_add_utf8");
	lib.bindSymbol(cast(void**)&hb_buffer_add_utf16, "hb_buffer_add_utf16");
	lib.bindSymbol(cast(void**)&hb_buffer_add_utf32, "hb_buffer_add_utf32");
	lib.bindSymbol(cast(void**)&hb_buffer_add_latin1, "hb_buffer_add_latin1");
	lib.bindSymbol(cast(void**)&hb_buffer_add_codepoints, "hb_buffer_add_codepoints");
	lib.bindSymbol(cast(void**)&hb_buffer_append, "hb_buffer_append");
	lib.bindSymbol(cast(void**)&hb_buffer_set_length, "hb_buffer_set_length");
	lib.bindSymbol(cast(void**)&hb_buffer_get_length, "hb_buffer_get_length");
	lib.bindSymbol(cast(void**)&hb_buffer_get_glyph_infos, "hb_buffer_get_glyph_infos");
	lib.bindSymbol(cast(void**)&hb_buffer_get_glyph_positions, "hb_buffer_get_glyph_positions");
	lib.bindSymbol(cast(void**)&hb_buffer_normalize_glyphs, "hb_buffer_normalize_glyphs");
	lib.bindSymbol(cast(void**)&hb_buffer_serialize_format_from_string, "hb_buffer_serialize_format_from_string");
	lib.bindSymbol(cast(void**)&hb_buffer_serialize_format_to_string, "hb_buffer_serialize_format_to_string");
	lib.bindSymbol(cast(void**)&hb_buffer_serialize_list_formats, "hb_buffer_serialize_list_formats");
	lib.bindSymbol(cast(void**)&hb_buffer_serialize_glyphs, "hb_buffer_serialize_glyphs");
	lib.bindSymbol(cast(void**)&hb_buffer_deserialize_glyphs, "hb_buffer_deserialize_glyphs");
	lib.bindSymbol(cast(void**)&hb_buffer_diff, "hb_buffer_diff");
	lib.bindSymbol(cast(void**)&hb_buffer_set_message_func, "hb_buffer_set_message_func");

	// bindbc.hb.bind.common
	lib.bindSymbol(cast(void**)&hb_tag_from_string, "hb_tag_from_string");
	lib.bindSymbol(cast(void**)&hb_tag_to_string, "hb_tag_to_string");
	lib.bindSymbol(cast(void**)&hb_direction_from_string, "hb_direction_from_string");
	lib.bindSymbol(cast(void**)&hb_direction_to_string, "hb_direction_to_string");
	lib.bindSymbol(cast(void**)&hb_language_from_string, "hb_language_from_string");
	lib.bindSymbol(cast(void**)&hb_language_to_string, "hb_language_to_string");
	lib.bindSymbol(cast(void**)&hb_language_get_default, "hb_language_get_default");
	lib.bindSymbol(cast(void**)&hb_script_from_iso15924_tag, "hb_script_from_iso15924_tag");
	lib.bindSymbol(cast(void**)&hb_script_from_string, "hb_script_from_string");
	lib.bindSymbol(cast(void**)&hb_script_to_iso15924_tag, "hb_script_to_iso15924_tag");
	lib.bindSymbol(cast(void**)&hb_script_get_horizontal_direction, "hb_script_get_horizontal_direction");
	lib.bindSymbol(cast(void**)&hb_feature_from_string, "hb_feature_from_string");
	lib.bindSymbol(cast(void**)&hb_feature_to_string, "hb_feature_to_string");
	lib.bindSymbol(cast(void**)&hb_variation_from_string, "hb_variation_from_string");
	lib.bindSymbol(cast(void**)&hb_variation_to_string, "hb_variation_to_string");
	//lib.bindSymbol(cast(void**)&hb_color_get_alpha, "hb_color_get_alpha");
	//lib.bindSymbol(cast(void**)&hb_color_get_red, "hb_color_get_red");
	//lib.bindSymbol(cast(void**)&hb_color_get_green, "hb_color_get_green");
	//lib.bindSymbol(cast(void**)&hb_color_get_blue, "hb_color_get_blue");

	// bindbc.hb.bind.deprecated_
	lib.bindSymbol(cast(void**)&hb_font_funcs_set_glyph_func, "hb_font_funcs_set_glyph_func");
	lib.bindSymbol(cast(void**)&hb_set_invert, "hb_set_invert");
	lib.bindSymbol(cast(void**)&hb_unicode_funcs_set_eastasian_width_func, "hb_unicode_funcs_set_eastasian_width_func");
	lib.bindSymbol(cast(void**)&hb_unicode_eastasian_width, "hb_unicode_eastasian_width");
	lib.bindSymbol(cast(void**)&hb_unicode_funcs_set_decompose_compatibility_func, "hb_unicode_funcs_set_decompose_compatibility_func");
	lib.bindSymbol(cast(void**)&hb_unicode_decompose_compatibility, "hb_unicode_decompose_compatibility");
	lib.bindSymbol(cast(void**)&hb_font_funcs_set_glyph_v_kerning_func, "hb_font_funcs_set_glyph_v_kerning_func");
	lib.bindSymbol(cast(void**)&hb_font_get_glyph_v_kerning, "hb_font_get_glyph_v_kerning");

	// bindbc.hb.bind.face
	lib.bindSymbol(cast(void**)&hb_face_count, "hb_face_count");
	lib.bindSymbol(cast(void**)&hb_face_create, "hb_face_create");
	lib.bindSymbol(cast(void**)&hb_face_create_for_tables, "hb_face_create_for_tables");
	lib.bindSymbol(cast(void**)&hb_face_get_empty, "hb_face_get_empty");
	lib.bindSymbol(cast(void**)&hb_face_reference, "hb_face_reference");
	lib.bindSymbol(cast(void**)&hb_face_destroy, "hb_face_destroy");
	lib.bindSymbol(cast(void**)&hb_face_set_user_data, "hb_face_set_user_data");
	lib.bindSymbol(cast(void**)&hb_face_get_user_data, "hb_face_get_user_data");
	lib.bindSymbol(cast(void**)&hb_face_make_immutable, "hb_face_make_immutable");
	lib.bindSymbol(cast(void**)&hb_face_is_immutable, "hb_face_is_immutable");
	lib.bindSymbol(cast(void**)&hb_face_reference_table, "hb_face_reference_table");
	lib.bindSymbol(cast(void**)&hb_face_reference_blob, "hb_face_reference_blob");
	lib.bindSymbol(cast(void**)&hb_face_set_index, "hb_face_set_index");
	lib.bindSymbol(cast(void**)&hb_face_get_index, "hb_face_get_index");
	lib.bindSymbol(cast(void**)&hb_face_set_upem, "hb_face_set_upem");
	lib.bindSymbol(cast(void**)&hb_face_get_upem, "hb_face_get_upem");
	lib.bindSymbol(cast(void**)&hb_face_set_glyph_count, "hb_face_set_glyph_count");
	lib.bindSymbol(cast(void**)&hb_face_get_glyph_count, "hb_face_get_glyph_count");
	lib.bindSymbol(cast(void**)&hb_face_get_table_tags, "hb_face_get_table_tags");
	lib.bindSymbol(cast(void**)&hb_face_collect_unicodes, "hb_face_collect_unicodes");
	lib.bindSymbol(cast(void**)&hb_face_collect_variation_selectors, "hb_face_collect_variation_selectors");
	lib.bindSymbol(cast(void**)&hb_face_collect_variation_unicodes, "hb_face_collect_variation_unicodes");
	lib.bindSymbol(cast(void**)&hb_face_builder_create, "hb_face_builder_create");
	lib.bindSymbol(cast(void**)&hb_face_builder_add_table, "hb_face_builder_add_table");

	// bindbc.hb.bind.font
	lib.bindSymbol(cast(void**)&hb_font_funcs_create, "hb_font_funcs_create");
	lib.bindSymbol(cast(void**)&hb_font_funcs_get_empty, "hb_font_funcs_get_empty");
	lib.bindSymbol(cast(void**)&hb_font_funcs_reference, "hb_font_funcs_reference");
	lib.bindSymbol(cast(void**)&hb_font_funcs_destroy, "hb_font_funcs_destroy");
	lib.bindSymbol(cast(void**)&hb_font_funcs_set_user_data, "hb_font_funcs_set_user_data");
	lib.bindSymbol(cast(void**)&hb_font_funcs_get_user_data, "hb_font_funcs_get_user_data");
	lib.bindSymbol(cast(void**)&hb_font_funcs_make_immutable, "hb_font_funcs_make_immutable");
	lib.bindSymbol(cast(void**)&hb_font_funcs_is_immutable, "hb_font_funcs_is_immutable");
	lib.bindSymbol(cast(void**)&hb_font_funcs_set_font_h_extents_func, "hb_font_funcs_set_font_h_extents_func");
	lib.bindSymbol(cast(void**)&hb_font_funcs_set_font_v_extents_func, "hb_font_funcs_set_font_v_extents_func");
	lib.bindSymbol(cast(void**)&hb_font_funcs_set_nominal_glyph_func, "hb_font_funcs_set_nominal_glyph_func");
	lib.bindSymbol(cast(void**)&hb_font_funcs_set_nominal_glyphs_func, "hb_font_funcs_set_nominal_glyphs_func");
	lib.bindSymbol(cast(void**)&hb_font_funcs_set_variation_glyph_func, "hb_font_funcs_set_variation_glyph_func");
	lib.bindSymbol(cast(void**)&hb_font_funcs_set_glyph_h_advance_func, "hb_font_funcs_set_glyph_h_advance_func");
	lib.bindSymbol(cast(void**)&hb_font_funcs_set_glyph_v_advance_func, "hb_font_funcs_set_glyph_v_advance_func");
	lib.bindSymbol(cast(void**)&hb_font_funcs_set_glyph_h_advances_func, "hb_font_funcs_set_glyph_h_advances_func");
	lib.bindSymbol(cast(void**)&hb_font_funcs_set_glyph_v_advances_func, "hb_font_funcs_set_glyph_v_advances_func");
	lib.bindSymbol(cast(void**)&hb_font_funcs_set_glyph_h_origin_func, "hb_font_funcs_set_glyph_h_origin_func");
	lib.bindSymbol(cast(void**)&hb_font_funcs_set_glyph_v_origin_func, "hb_font_funcs_set_glyph_v_origin_func");
	lib.bindSymbol(cast(void**)&hb_font_funcs_set_glyph_h_kerning_func, "hb_font_funcs_set_glyph_h_kerning_func");
	lib.bindSymbol(cast(void**)&hb_font_funcs_set_glyph_extents_func, "hb_font_funcs_set_glyph_extents_func");
	lib.bindSymbol(cast(void**)&hb_font_funcs_set_glyph_contour_point_func, "hb_font_funcs_set_glyph_contour_point_func");
	lib.bindSymbol(cast(void**)&hb_font_funcs_set_glyph_name_func, "hb_font_funcs_set_glyph_name_func");
	lib.bindSymbol(cast(void**)&hb_font_funcs_set_glyph_from_name_func, "hb_font_funcs_set_glyph_from_name_func");
	lib.bindSymbol(cast(void**)&hb_font_get_h_extents, "hb_font_get_h_extents");
	lib.bindSymbol(cast(void**)&hb_font_get_v_extents, "hb_font_get_v_extents");
	lib.bindSymbol(cast(void**)&hb_font_get_nominal_glyph, "hb_font_get_nominal_glyph");
	lib.bindSymbol(cast(void**)&hb_font_get_variation_glyph, "hb_font_get_variation_glyph");
	lib.bindSymbol(cast(void**)&hb_font_get_glyph_h_advance, "hb_font_get_glyph_h_advance");
	lib.bindSymbol(cast(void**)&hb_font_get_glyph_v_advance, "hb_font_get_glyph_v_advance");
	lib.bindSymbol(cast(void**)&hb_font_get_glyph_h_advances, "hb_font_get_glyph_h_advances");
	lib.bindSymbol(cast(void**)&hb_font_get_glyph_v_advances, "hb_font_get_glyph_v_advances");
	lib.bindSymbol(cast(void**)&hb_font_get_glyph_h_origin, "hb_font_get_glyph_h_origin");
	lib.bindSymbol(cast(void**)&hb_font_get_glyph_v_origin, "hb_font_get_glyph_v_origin");
	lib.bindSymbol(cast(void**)&hb_font_get_glyph_h_kerning, "hb_font_get_glyph_h_kerning");
	lib.bindSymbol(cast(void**)&hb_font_get_glyph_extents, "hb_font_get_glyph_extents");
	lib.bindSymbol(cast(void**)&hb_font_get_glyph_contour_point, "hb_font_get_glyph_contour_point");
	lib.bindSymbol(cast(void**)&hb_font_get_glyph_name, "hb_font_get_glyph_name");
	lib.bindSymbol(cast(void**)&hb_font_get_glyph_from_name, "hb_font_get_glyph_from_name");
	lib.bindSymbol(cast(void**)&hb_font_get_glyph, "hb_font_get_glyph");
	lib.bindSymbol(cast(void**)&hb_font_get_extents_for_direction, "hb_font_get_extents_for_direction");
	lib.bindSymbol(cast(void**)&hb_font_get_glyph_advance_for_direction, "hb_font_get_glyph_advance_for_direction");
	lib.bindSymbol(cast(void**)&hb_font_get_glyph_advances_for_direction, "hb_font_get_glyph_advances_for_direction");
	lib.bindSymbol(cast(void**)&hb_font_get_glyph_origin_for_direction, "hb_font_get_glyph_origin_for_direction");
	lib.bindSymbol(cast(void**)&hb_font_add_glyph_origin_for_direction, "hb_font_add_glyph_origin_for_direction");
	lib.bindSymbol(cast(void**)&hb_font_subtract_glyph_origin_for_direction, "hb_font_subtract_glyph_origin_for_direction");
	lib.bindSymbol(cast(void**)&hb_font_get_glyph_kerning_for_direction, "hb_font_get_glyph_kerning_for_direction");
	lib.bindSymbol(cast(void**)&hb_font_get_glyph_extents_for_origin, "hb_font_get_glyph_extents_for_origin");
	lib.bindSymbol(cast(void**)&hb_font_get_glyph_contour_point_for_origin, "hb_font_get_glyph_contour_point_for_origin");
	lib.bindSymbol(cast(void**)&hb_font_glyph_to_string, "hb_font_glyph_to_string");
	lib.bindSymbol(cast(void**)&hb_font_glyph_from_string, "hb_font_glyph_from_string");
	lib.bindSymbol(cast(void**)&hb_font_create, "hb_font_create");
	lib.bindSymbol(cast(void**)&hb_font_create_sub_font, "hb_font_create_sub_font");
	lib.bindSymbol(cast(void**)&hb_font_get_empty, "hb_font_get_empty");
	lib.bindSymbol(cast(void**)&hb_font_reference, "hb_font_reference");
	lib.bindSymbol(cast(void**)&hb_font_destroy, "hb_font_destroy");
	lib.bindSymbol(cast(void**)&hb_font_set_user_data, "hb_font_set_user_data");
	lib.bindSymbol(cast(void**)&hb_font_get_user_data, "hb_font_get_user_data");
	lib.bindSymbol(cast(void**)&hb_font_make_immutable, "hb_font_make_immutable");
	lib.bindSymbol(cast(void**)&hb_font_is_immutable, "hb_font_is_immutable");
	lib.bindSymbol(cast(void**)&hb_font_set_parent, "hb_font_set_parent");
	lib.bindSymbol(cast(void**)&hb_font_get_parent, "hb_font_get_parent");
	lib.bindSymbol(cast(void**)&hb_font_set_face, "hb_font_set_face");
	lib.bindSymbol(cast(void**)&hb_font_get_face, "hb_font_get_face");
	lib.bindSymbol(cast(void**)&hb_font_set_funcs, "hb_font_set_funcs");
	lib.bindSymbol(cast(void**)&hb_font_set_funcs_data, "hb_font_set_funcs_data");
	lib.bindSymbol(cast(void**)&hb_font_set_scale, "hb_font_set_scale");
	lib.bindSymbol(cast(void**)&hb_font_get_scale, "hb_font_get_scale");
	lib.bindSymbol(cast(void**)&hb_font_set_ppem, "hb_font_set_ppem");
	lib.bindSymbol(cast(void**)&hb_font_get_ppem, "hb_font_get_ppem");
	lib.bindSymbol(cast(void**)&hb_font_set_ptem, "hb_font_set_ptem");
	lib.bindSymbol(cast(void**)&hb_font_get_ptem, "hb_font_get_ptem");
	lib.bindSymbol(cast(void**)&hb_font_set_variations, "hb_font_set_variations");
	lib.bindSymbol(cast(void**)&hb_font_set_var_coords_design, "hb_font_set_var_coords_design");
	lib.bindSymbol(cast(void**)&hb_font_set_var_coords_normalized, "hb_font_set_var_coords_normalized");
	lib.bindSymbol(cast(void**)&hb_font_get_var_coords_normalized, "hb_font_get_var_coords_normalized");
	//lib.bindSymbol(cast(void**)&hb_font_set_var_named_instance, "hb_font_set_var_named_instance");

	// bindbc.hb.bind.map
	lib.bindSymbol(cast(void**)&hb_map_create, "hb_map_create");
	lib.bindSymbol(cast(void**)&hb_map_get_empty, "hb_map_get_empty");
	lib.bindSymbol(cast(void**)&hb_map_reference, "hb_map_reference");
	lib.bindSymbol(cast(void**)&hb_map_destroy, "hb_map_destroy");
	lib.bindSymbol(cast(void**)&hb_map_set_user_data, "hb_map_set_user_data");
	lib.bindSymbol(cast(void**)&hb_map_get_user_data, "hb_map_get_user_data");
	lib.bindSymbol(cast(void**)&hb_map_allocation_successful, "hb_map_allocation_successful");
	lib.bindSymbol(cast(void**)&hb_map_clear, "hb_map_clear");
	lib.bindSymbol(cast(void**)&hb_map_is_empty, "hb_map_is_empty");
	lib.bindSymbol(cast(void**)&hb_map_get_population, "hb_map_get_population");
	lib.bindSymbol(cast(void**)&hb_map_set, "hb_map_set");
	lib.bindSymbol(cast(void**)&hb_map_get, "hb_map_get");
	lib.bindSymbol(cast(void**)&hb_map_del, "hb_map_del");
	lib.bindSymbol(cast(void**)&hb_map_has, "hb_map_has");

	// bindbc.hb.bind

	// bindbc.hb.bind.set
	lib.bindSymbol(cast(void**)&hb_set_create, "hb_set_create");
	lib.bindSymbol(cast(void**)&hb_set_get_empty, "hb_set_get_empty");
	lib.bindSymbol(cast(void**)&hb_set_reference, "hb_set_reference");
	lib.bindSymbol(cast(void**)&hb_set_destroy, "hb_set_destroy");
	lib.bindSymbol(cast(void**)&hb_set_set_user_data, "hb_set_set_user_data");
	lib.bindSymbol(cast(void**)&hb_set_get_user_data, "hb_set_get_user_data");
	lib.bindSymbol(cast(void**)&hb_set_allocation_successful, "hb_set_allocation_successful");
	lib.bindSymbol(cast(void**)&hb_set_clear, "hb_set_clear");
	lib.bindSymbol(cast(void**)&hb_set_is_empty, "hb_set_is_empty");
	lib.bindSymbol(cast(void**)&hb_set_has, "hb_set_has");
	lib.bindSymbol(cast(void**)&hb_set_add, "hb_set_add");
	lib.bindSymbol(cast(void**)&hb_set_add_range, "hb_set_add_range");
	lib.bindSymbol(cast(void**)&hb_set_del, "hb_set_del");
	lib.bindSymbol(cast(void**)&hb_set_del_range, "hb_set_del_range");
	lib.bindSymbol(cast(void**)&hb_set_is_equal, "hb_set_is_equal");
	lib.bindSymbol(cast(void**)&hb_set_is_subset, "hb_set_is_subset");
	lib.bindSymbol(cast(void**)&hb_set_set, "hb_set_set");
	lib.bindSymbol(cast(void**)&hb_set_union, "hb_set_union");
	lib.bindSymbol(cast(void**)&hb_set_intersect, "hb_set_intersect");
	lib.bindSymbol(cast(void**)&hb_set_subtract, "hb_set_subtract");
	lib.bindSymbol(cast(void**)&hb_set_symmetric_difference, "hb_set_symmetric_difference");
	lib.bindSymbol(cast(void**)&hb_set_get_population, "hb_set_get_population");
	lib.bindSymbol(cast(void**)&hb_set_get_min, "hb_set_get_min");
	lib.bindSymbol(cast(void**)&hb_set_get_max, "hb_set_get_max");
	lib.bindSymbol(cast(void**)&hb_set_next, "hb_set_next");
	lib.bindSymbol(cast(void**)&hb_set_previous, "hb_set_previous");
	lib.bindSymbol(cast(void**)&hb_set_next_range, "hb_set_next_range");
	lib.bindSymbol(cast(void**)&hb_set_previous_range, "hb_set_previous_range");

	// bindbc.hb.bind.shape
	lib.bindSymbol(cast(void**)&hb_shape, "hb_shape");
	lib.bindSymbol(cast(void**)&hb_shape_full, "hb_shape_full");
	lib.bindSymbol(cast(void**)&hb_shape_list_shapers, "hb_shape_list_shapers");

	// bindbc.hb.bind.shape_plan
	lib.bindSymbol(cast(void**)&hb_shape_plan_create, "hb_shape_plan_create");
	lib.bindSymbol(cast(void**)&hb_shape_plan_create_cached, "hb_shape_plan_create_cached");
	lib.bindSymbol(cast(void**)&hb_shape_plan_create2, "hb_shape_plan_create2");
	lib.bindSymbol(cast(void**)&hb_shape_plan_create_cached2, "hb_shape_plan_create_cached2");
	lib.bindSymbol(cast(void**)&hb_shape_plan_get_empty, "hb_shape_plan_get_empty");
	lib.bindSymbol(cast(void**)&hb_shape_plan_reference, "hb_shape_plan_reference");
	lib.bindSymbol(cast(void**)&hb_shape_plan_destroy, "hb_shape_plan_destroy");
	lib.bindSymbol(cast(void**)&hb_shape_plan_set_user_data, "hb_shape_plan_set_user_data");
	lib.bindSymbol(cast(void**)&hb_shape_plan_get_user_data, "hb_shape_plan_get_user_data");
	lib.bindSymbol(cast(void**)&hb_shape_plan_execute, "hb_shape_plan_execute");
	lib.bindSymbol(cast(void**)&hb_shape_plan_get_shaper, "hb_shape_plan_get_shaper");

	// bindbc.hb.bind.unicode
	lib.bindSymbol(cast(void**)&hb_unicode_funcs_get_default, "hb_unicode_funcs_get_default");
	lib.bindSymbol(cast(void**)&hb_unicode_funcs_create, "hb_unicode_funcs_create");
	lib.bindSymbol(cast(void**)&hb_unicode_funcs_get_empty, "hb_unicode_funcs_get_empty");
	lib.bindSymbol(cast(void**)&hb_unicode_funcs_reference, "hb_unicode_funcs_reference");
	lib.bindSymbol(cast(void**)&hb_unicode_funcs_destroy, "hb_unicode_funcs_destroy");
	lib.bindSymbol(cast(void**)&hb_unicode_funcs_set_user_data, "hb_unicode_funcs_set_user_data");
	lib.bindSymbol(cast(void**)&hb_unicode_funcs_get_user_data, "hb_unicode_funcs_get_user_data");
	lib.bindSymbol(cast(void**)&hb_unicode_funcs_make_immutable, "hb_unicode_funcs_make_immutable");
	lib.bindSymbol(cast(void**)&hb_unicode_funcs_is_immutable, "hb_unicode_funcs_is_immutable");
	lib.bindSymbol(cast(void**)&hb_unicode_funcs_get_parent, "hb_unicode_funcs_get_parent");
	lib.bindSymbol(cast(void**)&hb_unicode_funcs_set_combining_class_func, "hb_unicode_funcs_set_combining_class_func");
	lib.bindSymbol(cast(void**)&hb_unicode_funcs_set_general_category_func, "hb_unicode_funcs_set_general_category_func");
	lib.bindSymbol(cast(void**)&hb_unicode_funcs_set_mirroring_func, "hb_unicode_funcs_set_mirroring_func");
	lib.bindSymbol(cast(void**)&hb_unicode_funcs_set_script_func, "hb_unicode_funcs_set_script_func");
	lib.bindSymbol(cast(void**)&hb_unicode_funcs_set_compose_func, "hb_unicode_funcs_set_compose_func");
	lib.bindSymbol(cast(void**)&hb_unicode_funcs_set_decompose_func, "hb_unicode_funcs_set_decompose_func");
	lib.bindSymbol(cast(void**)&hb_unicode_combining_class, "hb_unicode_combining_class");
	lib.bindSymbol(cast(void**)&hb_unicode_general_category, "hb_unicode_general_category");
	lib.bindSymbol(cast(void**)&hb_unicode_mirroring, "hb_unicode_mirroring");
	lib.bindSymbol(cast(void**)&hb_unicode_script, "hb_unicode_script");
	lib.bindSymbol(cast(void**)&hb_unicode_compose, "hb_unicode_compose");
	lib.bindSymbol(cast(void**)&hb_unicode_decompose, "hb_unicode_decompose");

	// bindbc.hb.bind.version_
	lib.bindSymbol(cast(void**)&hb_version, "hb_version");
	lib.bindSymbol(cast(void**)&hb_version_string, "hb_version_string");
	lib.bindSymbol(cast(void**)&hb_version_atleast, "hb_version_atleast");

	// bindbc.hb.bind.ft
	{
		import bindbc.hb.bind.ft;
		lib.bindSymbol(cast(void**)&hb_ft_face_create, "hb_ft_face_create");
		lib.bindSymbol(cast(void**)&hb_ft_face_create_cached, "hb_ft_face_create_cached");
		lib.bindSymbol(cast(void**)&hb_ft_face_create_referenced, "hb_ft_face_create_referenced");
		lib.bindSymbol(cast(void**)&hb_ft_font_create, "hb_ft_font_create");
		lib.bindSymbol(cast(void**)&hb_ft_font_create_referenced, "hb_ft_font_create_referenced");
		lib.bindSymbol(cast(void**)&hb_ft_font_get_face, "hb_ft_font_get_face");
		lib.bindSymbol(cast(void**)&hb_ft_font_set_load_flags, "hb_ft_font_set_load_flags");
		lib.bindSymbol(cast(void**)&hb_ft_font_get_load_flags, "hb_ft_font_get_load_flags");
		lib.bindSymbol(cast(void**)&hb_ft_font_changed, "hb_ft_font_changed");
		lib.bindSymbol(cast(void**)&hb_ft_font_set_funcs, "hb_ft_font_set_funcs");
	}
	

    loadedVersion = HBSupport.hb26;

    if(errorCount() != errCount) return HBSupport.badLibrary;

    return loadedVersion;
}
