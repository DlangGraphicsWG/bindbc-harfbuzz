
//          Copyright Ahmet Sait 2020.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

module bindbc.hb.bind.blob;

import bindbc.hb.config;

import bindbc.hb.bind.common;

extern(C) @nogc nothrow:

/*
 * Note re various memory-modes:
 *
 * - In no case shall the HarfBuzz client modify memory
 *   that is passed to HarfBuzz in a blob.  If there is
 *   any such possibility, MODE_DUPLICATE should be used
 *   such that HarfBuzz makes a copy immediately,
 *
 * - Use MODE_READONLY otherwise, unless you really really
 *   really know what you are doing,
 *
 * - MODE_WRITABLE is appropriate if you really made a
 *   copy of data solely for the purpose of passing to
 *   HarfBuzz and doing that just once (no reuse!),
 *
 * - If the font is mmap()ed, it's ok to use
 *   READONLY_MAY_MAKE_WRITABLE, however, using that mode
 *   correctly is very tricky.  Use MODE_READONLY instead.
 */
enum : int
{
    HB_MEMORY_MODE_DUPLICATE = 0,
    HB_MEMORY_MODE_READONLY = 1,
    HB_MEMORY_MODE_WRITABLE = 2,
    HB_MEMORY_MODE_READONLY_MAY_MAKE_WRITABLE = 3
}
alias hb_memory_mode_t = int;

struct hb_blob_t;

version(BindHB_Static)
    hb_blob_t* hb_blob_create (
        const(char)* data,
        uint length,
        hb_memory_mode_t mode,
        void* user_data,
        hb_destroy_func_t destroy);
else
{
    private alias fp_hb_blob_create = hb_blob_t* function (
        const(char)* data,
        uint length,
        hb_memory_mode_t mode,
        void* user_data,
        hb_destroy_func_t destroy);
    __gshared fp_hb_blob_create hb_blob_create;
}

static if (hbSupport >= HBSupport.v2_6_3)
{
	version(BindHB_Static)
		hb_blob_t* hb_blob_create_from_file (const(char)* file_name);
	else
	{
		private alias fp_hb_blob_create_from_file = hb_blob_t* function (const(char)* file_name);
		__gshared fp_hb_blob_create_from_file hb_blob_create_from_file;
	}
}

/* Always creates with MEMORY_MODE_READONLY.
 * Even if the parent blob is writable, we don't
 * want the user of the sub-blob to be able to
 * modify the parent data as that data may be
 * shared among multiple sub-blobs.
 */
version(BindHB_Static)
    hb_blob_t* hb_blob_create_sub_blob (
        hb_blob_t* parent,
        uint offset,
        uint length);
else
{
    private alias fp_hb_blob_create_sub_blob = hb_blob_t* function (
        hb_blob_t* parent,
        uint offset,
        uint length);
    __gshared fp_hb_blob_create_sub_blob hb_blob_create_sub_blob;
}

static if (hbSupport >= HBSupport.v2_6_3)
{
	version(BindHB_Static)
		hb_blob_t* hb_blob_copy_writable_or_fail (hb_blob_t* blob);
	else
	{
		private alias fp_hb_blob_copy_writable_or_fail = hb_blob_t* function (hb_blob_t* blob);
		__gshared fp_hb_blob_copy_writable_or_fail hb_blob_copy_writable_or_fail;
	}
}

version(BindHB_Static)
    hb_blob_t* hb_blob_get_empty ();
else
{
    private alias fp_hb_blob_get_empty = hb_blob_t* function ();
    __gshared fp_hb_blob_get_empty hb_blob_get_empty;
}

version(BindHB_Static)
    hb_blob_t* hb_blob_reference (hb_blob_t* blob);
else
{
    private alias fp_hb_blob_reference = hb_blob_t* function (hb_blob_t* blob);
    __gshared fp_hb_blob_reference hb_blob_reference;
}

version(BindHB_Static)
    void hb_blob_destroy (hb_blob_t* blob);
else
{
    private alias fp_hb_blob_destroy = void function (hb_blob_t* blob);
    __gshared fp_hb_blob_destroy hb_blob_destroy;
}

version(BindHB_Static)
    hb_bool_t hb_blob_set_user_data (
        hb_blob_t* blob,
        hb_user_data_key_t* key,
        void* data,
        hb_destroy_func_t destroy,
        hb_bool_t replace);
else
{
    private alias fp_hb_blob_set_user_data = hb_bool_t function (
        hb_blob_t* blob,
        hb_user_data_key_t* key,
        void* data,
        hb_destroy_func_t destroy,
        hb_bool_t replace);
    __gshared fp_hb_blob_set_user_data hb_blob_set_user_data;
}

version(BindHB_Static)
    void* hb_blob_get_user_data (hb_blob_t* blob, hb_user_data_key_t* key);
else
{
    private alias fp_hb_blob_get_user_data = void* function (hb_blob_t* blob, hb_user_data_key_t* key);
    __gshared fp_hb_blob_get_user_data hb_blob_get_user_data;
}

version(BindHB_Static)
    void hb_blob_make_immutable (hb_blob_t* blob);
else
{
    private alias fp_hb_blob_make_immutable = void function (hb_blob_t* blob);
    __gshared fp_hb_blob_make_immutable hb_blob_make_immutable;
}

version(BindHB_Static)
    hb_bool_t hb_blob_is_immutable (hb_blob_t* blob);
else
{
    private alias fp_hb_blob_is_immutable = hb_bool_t function (hb_blob_t* blob);
    __gshared fp_hb_blob_is_immutable hb_blob_is_immutable;
}

version(BindHB_Static)
    uint hb_blob_get_length (hb_blob_t* blob);
else
{
    private alias fp_hb_blob_get_length = uint function (hb_blob_t* blob);
    __gshared fp_hb_blob_get_length hb_blob_get_length;
}

version(BindHB_Static)
    const(char)* hb_blob_get_data (hb_blob_t* blob, uint* length);
else
{
    private alias fp_hb_blob_get_data = const(char)* function (hb_blob_t* blob, uint* length);
    __gshared fp_hb_blob_get_data hb_blob_get_data;
}

version(BindHB_Static)
    char* hb_blob_get_data_writable (hb_blob_t* blob, uint* length);
else
{
    private alias fp_hb_blob_get_data_writable = char* function (hb_blob_t* blob, uint* length);
    __gshared fp_hb_blob_get_data_writable hb_blob_get_data_writable;
}
