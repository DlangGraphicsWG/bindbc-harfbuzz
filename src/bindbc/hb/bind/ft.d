module bindbc.hb.bind.ft;

import bindbc.hb.bind.common;
import bindbc.hb.bind.face;
import bindbc.hb.bind.font;
import bindbc.freetype : FT_Face;

extern(C) @nogc nothrow:


version(BindHB_Static)
	hb_face_t* hb_ft_face_create (FT_Face ft_face, hb_destroy_func_t destroy);
else
{
    private alias fp_hb_ft_face_create = hb_face_t* function (FT_Face ft_face, hb_destroy_func_t destroy);
    __gshared fp_hb_ft_face_create hb_ft_face_create;
}

version(BindHB_Static)
	hb_face_t* hb_ft_face_create_cached (FT_Face ft_face);
else
{
	private alias fp_hb_ft_face_create_cached = hb_face_t* function(FT_Face ft_face);
	__gshared fp_hb_ft_face_create_cached hb_ft_face_create_cached;
}


version(BindHB_Static)
	hb_face_t* hb_ft_face_create_referenced (FT_Face ft_face);
else
{
	private alias fp_hb_ft_face_create_referenced = hb_face_t* function(FT_Face ft_face);
	__gshared fp_hb_ft_face_create_referenced hb_ft_face_create_referenced;
}


version(BindHB_Static)
	hb_font_t* hb_ft_font_create (FT_Face ft_face,hb_destroy_func_t destroy);
else
{
	private alias fp_hb_ft_font_create = hb_font_t* function(FT_Face ft_face,hb_destroy_func_t destroy);
	__gshared fp_hb_ft_font_create hb_ft_font_create;
}


version(BindHB_Static)
	hb_font_t* hb_ft_font_create_referenced (FT_Face ft_face);
else
{
	private alias fp_hb_ft_font_create_referenced = hb_font_t* function(FT_Face ft_face);
	__gshared fp_hb_ft_font_create_referenced hb_ft_font_create_referenced;
}


version(BindHB_Static)
	FT_Face hb_ft_font_get_face (hb_font_t *font);
else
{
	private alias fp_hb_ft_font_get_face = FT_Face function(hb_font_t *font);
	__gshared fp_hb_ft_font_get_face hb_ft_font_get_face;
}


version(BindHB_Static)
	void hb_ft_font_set_load_flags (hb_font_t *font, int load_flags);
else
{
	private alias fp_hb_ft_font_set_load_flags = void function(hb_font_t *font, int load_flags);
	__gshared fp_hb_ft_font_set_load_flags hb_ft_font_set_load_flags;
}


version(BindHB_Static)
	int hb_ft_font_get_load_flags (hb_font_t *font);
else
{
	private alias fp_hb_ft_font_get_load_flags = void function(hb_font_t *font);
	__gshared fp_hb_ft_font_get_load_flags hb_ft_font_get_load_flags;
}


version(BindHB_Static)
	void hb_ft_font_changed (hb_font_t *font);
else
{
	private alias fp_hb_ft_font_changed = void function(hb_font_t *font);
	__gshared fp_hb_ft_font_changed hb_ft_font_changed;
}


version(BindHB_Static)
	void hb_ft_font_set_funcs (hb_font_t *font);
else
{
	private alias fp_hb_ft_font_set_funcs = void function(hb_font_t *font);
	__gshared fp_hb_ft_font_set_funcs hb_ft_font_set_funcs;
}

