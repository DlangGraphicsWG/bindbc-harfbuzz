
//          Copyright Ahmet Sait 2020.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

module bindbc.hb.bind.subset;

import bindbc.hb.config;

version(HB_with_subset):

pragma(msg, "Warning: HarfBuzz Subset API is not stable and subject to breaking changes.");

static if (hbSupport >= 20500)
{
	import bindbc.hb.bind.common;
	import bindbc.hb.bind.face;
	import bindbc.hb.bind.set;

	extern(C) @nogc nothrow:

	/*
	 * hb_subset_input_t
	 *
	 * Things that change based on the input. Characters to keep, etc.
	 */

	struct hb_subset_input_t;

	version(BindHB_Static)
		hb_subset_input_t* hb_subset_input_create_or_fail ();
	else
	{
		private alias fp_hb_subset_input_create_or_fail = hb_subset_input_t* function ();
		__gshared fp_hb_subset_input_create_or_fail hb_subset_input_create_or_fail;
	}

	version(BindHB_Static)
		hb_subset_input_t* hb_subset_input_reference (hb_subset_input_t* subset_input);
	else
	{
		private alias fp_hb_subset_input_reference = hb_subset_input_t* function (hb_subset_input_t* subset_input);
		__gshared fp_hb_subset_input_reference hb_subset_input_reference;
	}

	version(BindHB_Static)
		void hb_subset_input_destroy (hb_subset_input_t* subset_input);
	else
	{
		private alias fp_hb_subset_input_destroy = void function (hb_subset_input_t* subset_input);
		__gshared fp_hb_subset_input_destroy hb_subset_input_destroy;
	}

	version(BindHB_Static)
		hb_set_t* hb_subset_input_unicode_set (hb_subset_input_t* subset_input);
	else
	{
		private alias fp_hb_subset_input_unicode_set = hb_set_t* function (hb_subset_input_t* subset_input);
		__gshared fp_hb_subset_input_unicode_set hb_subset_input_unicode_set;
	}

	version(BindHB_Static)
		hb_set_t* hb_subset_input_glyph_set (hb_subset_input_t* subset_input);
	else
	{
		private alias fp_hb_subset_input_glyph_set = hb_set_t* function (hb_subset_input_t* subset_input);
		__gshared fp_hb_subset_input_glyph_set hb_subset_input_glyph_set;
	}

	version(BindHB_Static)
		hb_set_t* hb_subset_input_nameid_set (hb_subset_input_t* subset_input);
	else
	{
		private alias fp_hb_subset_input_nameid_set = hb_set_t* function (hb_subset_input_t* subset_input);
		__gshared fp_hb_subset_input_nameid_set hb_subset_input_nameid_set;
	}

	version(BindHB_Static)
		hb_set_t* hb_subset_input_drop_tables_set (hb_subset_input_t* subset_input);
	else
	{
		private alias fp_hb_subset_input_drop_tables_set = hb_set_t* function (hb_subset_input_t* subset_input);
		__gshared fp_hb_subset_input_drop_tables_set hb_subset_input_drop_tables_set;
	}

	version(BindHB_Static)
		void hb_subset_input_set_drop_hints (
			hb_subset_input_t* subset_input,
			hb_bool_t drop_hints);
	else
	{
		private alias fp_hb_subset_input_set_drop_hints = void function (
			hb_subset_input_t* subset_input,
			hb_bool_t drop_hints);
		__gshared fp_hb_subset_input_set_drop_hints hb_subset_input_set_drop_hints;
	}
	version(BindHB_Static)
		hb_bool_t hb_subset_input_get_drop_hints (hb_subset_input_t* subset_input);
	else
	{
		private alias fp_hb_subset_input_get_drop_hints = hb_bool_t function (hb_subset_input_t* subset_input);
		__gshared fp_hb_subset_input_get_drop_hints hb_subset_input_get_drop_hints;
	}

	version(BindHB_Static)
		void hb_subset_input_set_desubroutinize (
			hb_subset_input_t* subset_input,
			hb_bool_t desubroutinize);
	else
	{
		private alias fp_hb_subset_input_set_desubroutinize = void function (
			hb_subset_input_t* subset_input,
			hb_bool_t desubroutinize);
		__gshared fp_hb_subset_input_set_desubroutinize hb_subset_input_set_desubroutinize;
	}
	version(BindHB_Static)
		hb_bool_t hb_subset_input_get_desubroutinize (hb_subset_input_t* subset_input);
	else
	{
		private alias fp_hb_subset_input_get_desubroutinize = hb_bool_t function (hb_subset_input_t* subset_input);
		__gshared fp_hb_subset_input_get_desubroutinize hb_subset_input_get_desubroutinize;
	}

	version(BindHB_Static)
		void hb_subset_input_set_retain_gids (
			hb_subset_input_t* subset_input,
			hb_bool_t retain_gids);
	else
	{
		private alias fp_hb_subset_input_set_retain_gids = void function (
			hb_subset_input_t* subset_input,
			hb_bool_t retain_gids);
		__gshared fp_hb_subset_input_set_retain_gids hb_subset_input_set_retain_gids;
	}
	version(BindHB_Static)
		hb_bool_t hb_subset_input_get_retain_gids (hb_subset_input_t* subset_input);
	else
	{
		private alias fp_hb_subset_input_get_retain_gids = hb_bool_t function (hb_subset_input_t* subset_input);
		__gshared fp_hb_subset_input_get_retain_gids hb_subset_input_get_retain_gids;
	}

	/* hb_subset () */
	version(BindHB_Static)
		hb_face_t* hb_subset (hb_face_t* source, hb_subset_input_t* input);
	else
	{
		private alias fp_hb_subset = hb_face_t* function (hb_face_t* source, hb_subset_input_t* input);
		__gshared fp_hb_subset hb_subset;
	}
}
