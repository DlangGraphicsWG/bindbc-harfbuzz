
//          Copyright Ahmet Sait 2020.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

module bindbc.hb.bind.map;

import bindbc.hb.config;

import bindbc.hb.bind.common;

extern(C) @nogc nothrow:

static if (hbSupport >= 10707)
{
	/*
	 * Since: 1.7.7
	 */
	enum HB_MAP_VALUE_INVALID = cast(hb_codepoint_t) -1;

	struct hb_map_t;

	version(BindHB_Static)
		hb_map_t* hb_map_create ();
	else
	{
		private alias fp_hb_map_create = hb_map_t* function ();
		__gshared fp_hb_map_create hb_map_create;
	}

	version(BindHB_Static)
		hb_map_t* hb_map_get_empty ();
	else
	{
		private alias fp_hb_map_get_empty = hb_map_t* function ();
		__gshared fp_hb_map_get_empty hb_map_get_empty;
	}

	version(BindHB_Static)
		hb_map_t* hb_map_reference (hb_map_t* map);
	else
	{
		private alias fp_hb_map_reference = hb_map_t* function (hb_map_t* map);
		__gshared fp_hb_map_reference hb_map_reference;
	}

	version(BindHB_Static)
		void hb_map_destroy (hb_map_t* map);
	else
	{
		private alias fp_hb_map_destroy = void function (hb_map_t* map);
		__gshared fp_hb_map_destroy hb_map_destroy;
	}

	version(BindHB_Static)
		hb_bool_t hb_map_set_user_data (
			hb_map_t* map,
			hb_user_data_key_t* key,
			void* data,
			hb_destroy_func_t destroy,
			hb_bool_t replace);
	else
	{
		private alias fp_hb_map_set_user_data = hb_bool_t function (
			hb_map_t* map,
			hb_user_data_key_t* key,
			void* data,
			hb_destroy_func_t destroy,
			hb_bool_t replace);
		__gshared fp_hb_map_set_user_data hb_map_set_user_data;
	}

	version(BindHB_Static)
		void* hb_map_get_user_data (hb_map_t* map, hb_user_data_key_t* key);
	else
	{
		private alias fp_hb_map_get_user_data = void* function (hb_map_t* map, hb_user_data_key_t* key);
		__gshared fp_hb_map_get_user_data hb_map_get_user_data;
	}

	/* Returns false if allocation has failed before */
	version(BindHB_Static)
		hb_bool_t hb_map_allocation_successful (const(hb_map_t)* map);
	else
	{
		private alias fp_hb_map_allocation_successful = hb_bool_t function (const(hb_map_t)* map);
		__gshared fp_hb_map_allocation_successful hb_map_allocation_successful;
	}

	version(BindHB_Static)
		void hb_map_clear (hb_map_t* map);
	else
	{
		private alias fp_hb_map_clear = void function (hb_map_t* map);
		__gshared fp_hb_map_clear hb_map_clear;
	}

	version(BindHB_Static)
		hb_bool_t hb_map_is_empty (const(hb_map_t)* map);
	else
	{
		private alias fp_hb_map_is_empty = hb_bool_t function (const(hb_map_t)* map);
		__gshared fp_hb_map_is_empty hb_map_is_empty;
	}

	version(BindHB_Static)
		uint hb_map_get_population (const(hb_map_t)* map);
	else
	{
		private alias fp_hb_map_get_population = uint function (const(hb_map_t)* map);
		__gshared fp_hb_map_get_population hb_map_get_population;
	}

	version(BindHB_Static)
		void hb_map_set (hb_map_t* map, hb_codepoint_t key, hb_codepoint_t value);
	else
	{
		private alias fp_hb_map_set = void function (hb_map_t* map, hb_codepoint_t key, hb_codepoint_t value);
		__gshared fp_hb_map_set hb_map_set;
	}

	version(BindHB_Static)
		hb_codepoint_t hb_map_get (const(hb_map_t)* map, hb_codepoint_t key);
	else
	{
		private alias fp_hb_map_get = hb_codepoint_t function (const(hb_map_t)* map, hb_codepoint_t key);
		__gshared fp_hb_map_get hb_map_get;
	}

	version(BindHB_Static)
		void hb_map_del (hb_map_t* map, hb_codepoint_t key);
	else
	{
		private alias fp_hb_map_del = void function (hb_map_t* map, hb_codepoint_t key);
		__gshared fp_hb_map_del hb_map_del;
	}

	version(BindHB_Static)
		hb_bool_t hb_map_has (const(hb_map_t)* map, hb_codepoint_t key);
	else
	{
		private alias fp_hb_map_has = hb_bool_t function (const(hb_map_t)* map, hb_codepoint_t key);
		__gshared fp_hb_map_has hb_map_has;
	}
}
