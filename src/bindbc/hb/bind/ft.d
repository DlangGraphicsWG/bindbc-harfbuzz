
//          Copyright Ahmet Sait 2020.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

module bindbc.hb.bind.ft;

version(HB_with_freetype):
version(Have_bindbc_freetype):

import bindbc.freetype.bind.freetype : FT_Face;
import bindbc.hb.bind.common;
import bindbc.hb.bind.face;
import bindbc.hb.bind.font;

extern(C) @nogc nothrow:

/*
 * Note: FreeType is not thread-safe.
 * Hence, these functions are not either.
 */

/*
 * hb-face from ft-face.
 */

/* This one creates a new hb-face for given ft-face.
 * When the returned hb-face is destroyed, the destroy
 * callback is called (if not NULL), with the ft-face passed
 * to it.
 *
 * The client is responsible to make sure that ft-face is
 * destroyed after hb-face is destroyed.
 *
 * Most often you don't want this function.  You should use either
 * hb_ft_face_create_cached(), or hb_ft_face_create_referenced().
 * In particular, if you are going to pass NULL as destroy, you
 * probably should use (the more recent) hb_ft_face_create_referenced()
 * instead.
 */
version(BindHB_Static)
    	hb_face_t* hb_ft_face_create (FT_Face ft_face, hb_destroy_func_t destroy);
else
{
    private alias fp_hb_ft_face_create = 	hb_face_t* function (FT_Face ft_face, hb_destroy_func_t destroy);
    __gshared fp_hb_ft_face_create hb_ft_face_create;
}

	/* This version is like hb_ft_face_create(), except that it caches
	 * the hb-face using the generic pointer of the ft-face.  This means
	 * that subsequent calls to this function with the same ft-face will
	 * return the same hb-face (correctly referenced).
	 *
	 * Client is still responsible for making sure that ft-face is destroyed
	 * after hb-face is.
	 */
version(BindHB_Static)
    	hb_face_t* hb_ft_face_create_cached (FT_Face ft_face);
else
{
    private alias fp_hb_ft_face_create_cached = 	hb_face_t* function (FT_Face ft_face);
    __gshared fp_hb_ft_face_create_cached hb_ft_face_create_cached;
}

	/* This version is like hb_ft_face_create(), except that it calls
	 * FT_Reference_Face() on ft-face, as such keeping ft-face alive
	 * as long as the hb-face is.
	 *
	 * This is the most convenient version to use.  Use it unless you have
	 * very good reasons not to.
	 */
version(BindHB_Static)
    	hb_face_t* hb_ft_face_create_referenced (FT_Face ft_face);
else
{
    private alias fp_hb_ft_face_create_referenced = 	hb_face_t* function (FT_Face ft_face);
    __gshared fp_hb_ft_face_create_referenced hb_ft_face_create_referenced;
}

	/*
	 * hb-font from ft-face.
	 */

	/*
	 * Note:
	 *
	 * Set face size on ft-face before creating hb-font from it.
	 * Otherwise hb-ft would NOT pick up the font size correctly.
	 */

	/* See notes on hb_ft_face_create().  Same issues re lifecycle-management
	 * apply here.  Use hb_ft_font_create_referenced() if you can. */
version(BindHB_Static)
    	hb_font_t* hb_ft_font_create (FT_Face ft_face, hb_destroy_func_t destroy);
else
{
    private alias fp_hb_ft_font_create = 	hb_font_t* function (FT_Face ft_face, hb_destroy_func_t destroy);
    __gshared fp_hb_ft_font_create hb_ft_font_create;
}

	/* See notes on hb_ft_face_create_referenced() re lifecycle-management
	 * issues. */
version(BindHB_Static)
    	hb_font_t* hb_ft_font_create_referenced (FT_Face ft_face);
else
{
    private alias fp_hb_ft_font_create_referenced = 	hb_font_t* function (FT_Face ft_face);
    __gshared fp_hb_ft_font_create_referenced hb_ft_font_create_referenced;
}

version(BindHB_Static)
    	FT_Face hb_ft_font_get_face (hb_font_t* font);
else
{
    private alias fp_hb_ft_font_get_face = 	FT_Face function (hb_font_t* font);
    __gshared fp_hb_ft_font_get_face hb_ft_font_get_face;
}

version(BindHB_Static)
    	void hb_ft_font_set_load_flags (hb_font_t* font, int load_flags);
else
{
    private alias fp_hb_ft_font_set_load_flags = 	void function (hb_font_t* font, int load_flags);
    __gshared fp_hb_ft_font_set_load_flags hb_ft_font_set_load_flags;
}

version(BindHB_Static)
    	int hb_ft_font_get_load_flags (hb_font_t* font);
else
{
    private alias fp_hb_ft_font_get_load_flags = 	int function (hb_font_t* font);
    __gshared fp_hb_ft_font_get_load_flags hb_ft_font_get_load_flags;
}

	/* Call when size or variations settings on underlying FT_Face change. */
version(BindHB_Static)
    	void hb_ft_font_changed (hb_font_t* font);
else
{
    private alias fp_hb_ft_font_changed = 	void function (hb_font_t* font);
    __gshared fp_hb_ft_font_changed hb_ft_font_changed;
}

	/* Makes an hb_font_t use FreeType internally to implement font functions.
	 * Note: this internally creates an FT_Face.  Use it when you create your
	 * hb_face_t using hb_face_create(). */
version(BindHB_Static)
    	void hb_ft_font_set_funcs (hb_font_t* font);
else
{
    private alias fp_hb_ft_font_set_funcs = 	void function (hb_font_t* font);
    __gshared fp_hb_ft_font_set_funcs hb_ft_font_set_funcs;
}
