module app;

import std.array;
import std.conv;
import std.stdio;
import std.string;
import std.format;
import std.utf;

import loader = bindbc.loader;
import bindbc.freetype;
import bindbc.freetype.bind;
import bindbc.hb;
import bindbc.hb.bind;
import bindbc.hb.bind.ft;

struct TextShape
{
	dstring str;
	string fontPath;
	hb_direction_t direction;
	hb_script_t script;
	hb_language_t language;
}

int main(string[] args)
{
	version(BindFT_Static) {}
	else
	{{
		FTSupport ft = loadFreeType();
		if (ft != ftSupport)
		{
			if (ft == FTSupport.noLibrary)
			{
				writefln("FreeType library not found.");
				return 1;
			}
			else if (ft == FTSupport.badLibrary)
			{
				writefln("%d", loadedFreeTypeVersion);
				foreach(error; loader.errors)
					writefln("%s\t%s", error.error, error.message);
				return 1;
			}
		}
		writefln("Successfully loaded FreeType library.");
	}}
	
	version(BindHB_Static) {}
	else
	{{
		HBSupport hb = loadHarfBuzz();
		if (hb != hbSupport)
		{
			if (hb == HBSupport.noLibrary)
			{
				writefln("HarfBuzz library not found.");
				return 1;
			}
			else if (hb == HBSupport.badLibrary)
			{
				writefln("%d", loadedHarfBuzzVersion);
				foreach(error; loader.errors)
					writefln("%s\t%s", error.error, error.message);
				return 1;
			}
		}
		writefln("Successfully loaded HarfBuzz library.");
	}}
	
	writefln("Harfbuzz version: %s\n", hb_version_string().fromStringz());
	
	TextShape[] texts = [
		TextShape("Pijamalı hasta yağız şoföre çabucak güvendi."d,
			`NotoSans-Regular.ttf`,
			HB_DIRECTION_LTR,
			HB_SCRIPT_LATIN,
			hb_language_from_string("tr", -1)
			),
		TextShape("𐱅𐰵𐰼𐰰"d,
			`NotoSansOldTurkic-Regular.ttf`,
			HB_DIRECTION_RTL,
			HB_SCRIPT_OLD_TURKIC,
			hb_language_from_string("otk", -1)
			),
		TextShape("نص حكيم له سر قاطع وذو شأن عظيم مكتوب على ثوب أخضر ومغلف بجلد أزرق"d,
			`NotoSansArabic-Regular.ttf`,
			HB_DIRECTION_RTL,
			HB_SCRIPT_ARABIC,
			hb_language_from_string("ar", -1)
			),
		TextShape("Portez ce vieux whisky au juge blond qui a fumé."d,
			`NotoSans-Regular.ttf`,
			HB_DIRECTION_LTR,
			HB_SCRIPT_LATIN,
			hb_language_from_string("fr", -1)
			),
		TextShape("机不可失 时不再来"d,
			`NotoSansCJKtc-Regular.otf`,
			HB_DIRECTION_TTB,
			HB_SCRIPT_HAN,
			hb_language_from_string("ch", -1)
			),
	];
	
	FT_Error error;
	FT_Library ft;
	if ((error = FT_Init_FreeType(&ft)) == FT_Err_Ok)
		writeln("Initialized FreeType.");
	else
		throw new Exception(format("Failed to initialize FreeType: %d", error));
	
	foreach (text; texts)
	{
		dstring str = text.str;
		
		write("Text: ");
		cwrite(str);
		writefln("\n    Length: %s\n    Code Points: %(%X %)\n", str.length, str);
		
		hb_buffer_t* buf = hb_buffer_create();
		hb_buffer_add_utf32(buf, str.ptr, cast(int)str.length, 0, cast(int)str.length);
		hb_buffer_set_direction(buf, text.direction);
		hb_buffer_set_script(buf, text.script);
		hb_buffer_set_language(buf, text.language);
		
		FT_Face face;
		string fontFile = text.fontPath;
		if ((error = FT_New_Face(ft, fontFile.toStringz(), 0, &face)) != FT_Err_Ok)
			throw new Exception(format("Failed to create font face from file '%s': %s", fontFile, error));
		writeln("Loaded font file: ", fontFile);
		writeln("    Font Family: ", face.family_name.fromStringz());
		writeln("    Glyph count: ", face.num_glyphs);
		writeln();
		FT_Set_Pixel_Sizes(face, 0, 16);
		
		hb_font_t* font = hb_ft_font_create_referenced(face);
		hb_shape(font, buf, null, 0);
		uint glyph_count;
		hb_glyph_info_t* glyph_info = hb_buffer_get_glyph_infos(buf, &glyph_count);
		hb_glyph_position_t* glyph_pos = hb_buffer_get_glyph_positions(buf, &glyph_count);
		
		for (size_t i = 0; i < glyph_count; i++)
		{
			writef("Glyph ID: %-6d", glyph_info[i].codepoint);
			cwrite("  ", str[glyph_info[i].cluster]);
			writef("  Offset: %5.2f, %5.2f", glyph_pos[i].x_offset / 64.0, glyph_pos[i].y_offset / 64.0);
			writef("  Advance: %5.2f, %5.2f\n", glyph_pos[i].x_advance / 64.0, glyph_pos[i].y_advance / 64.0);
		}
		writeln();
		
		hb_buffer_destroy(buf);
		hb_font_destroy(font);
		
		//FT_Done_Face(face); // Segfaults, probably because double free
	}
	
	if ((error = FT_Done_FreeType(ft)) == FT_Err_Ok)
		writeln("Terminated FreeType.");
	else
		throw new Exception(format("Failed to terminate FreeType: %d", error));
	
	version(BindHB_Static) {}
	else
	{{
		size_t lastErrorCount = loader.errorCount;
		unloadHarfBuzz();
		if (loader.errorCount == lastErrorCount)
			writefln("Successfully unloaded HarfBuzz library.");
		else
		{
			writefln("Failed to unload HarfBuzz library.");
			foreach(i; lastErrorCount .. loader.errorCount)
				writefln("%s\t%s\n", loader.errors[i].error, loader.errors[i].message);
			return 1;
		}
	}}
	
	version(BindFT_Static) {}
	else
	{{
		size_t lastErrorCount = loader.errorCount;
		unloadFreeType();
		if (loader.errorCount == lastErrorCount)
			writefln("Successfully unloaded FreeType library.");
		else
		{
			writefln("Failed to unload FreeType library.");
			foreach(i; lastErrorCount .. loader.errorCount)
				writefln("%s\t%s\n", loader.errors[i].error, loader.errors[i].message);
			return 1;
		}
	}}
	
	return 0;
}

bool isConsole(int fd)
{
	import core.sys.windows.winbase;
	import core.sys.windows.wincon;
	
	version(Posix)
	{
		import core.sys.posix.unistd;
		return cast(bool) isatty(fd);
	}
	else version(Windows)
	{
		auto hConsole = GetStdHandle(fd == 0 ? STD_INPUT_HANDLE : STD_OUTPUT_HANDLE);
		return GetFileType(hConsole) == FILE_TYPE_CHAR;
	}
	else
		static assert(0);
}

void cwrite(Args...)(Args args)
{
	version(Windows)
	{
		import core.sys.windows.winbase;
		import core.sys.windows.wincon;
		import core.sys.windows.winnls;
		
		// again, it is important to branch on output
		// being the console or redirected.
		if(isConsole(1))
		{
			foreach (arg; args)
			{
				wstring str = arg.to!string().toUTF16();
				
				// and now calling the wide char function
				if(!WriteConsoleW(GetStdHandle(STD_OUTPUT_HANDLE), str.ptr, str.length, null, null))
					throw new Exception("Failed writing to standard output: " ~ GetLastError().to!string);
			}
		}
		else
		{
			// non-console should still be utf-8, let it work normally
			// or whatever for interop (WriteConsoleW would fail here anyway)
			write(args);
		}
	}
	else
	{
		write(args);
	}
}
