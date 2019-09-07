
//          Copyright Ahmet Sait Koçak 2019.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

module bindbc.hb.bind.common;

extern(C) @nogc nothrow:

/* !__cplusplus */
/* !__cplusplus */

/* VS 2010 (_MSC_VER 1600) has stdint.h */

alias hb_bool_t = int;

alias hb_codepoint_t = uint;
alias hb_position_t = int;
alias hb_mask_t = uint;

union _hb_var_int_t
{
    uint u32;
    int i32;
    ushort[2] u16;
    short[2] i16;
    ubyte[4] u8;
    byte[4] i8;
}

alias hb_var_int_t = _hb_var_int_t;

/* hb_tag_t */

alias hb_tag_t = uint;

extern (D) auto HB_TAG(T0, T1, T2, T3)(auto ref T0 c1, auto ref T1 c2, auto ref T2 c3, auto ref T3 c4)
{
    return cast(hb_tag_t) ((cast(uint) c1 & 0xFF) << 24) | ((cast(uint) c2 & 0xFF) << 16) | ((cast(uint) c3 & 0xFF) << 8) | (cast(uint) c4 & 0xFF);
}

enum HB_TAG_NONE = HB_TAG(0, 0, 0, 0);
enum HB_TAG_MAX = HB_TAG(0xff, 0xff, 0xff, 0xff);
enum HB_TAG_MAX_SIGNED = HB_TAG(0x7f, 0xff, 0xff, 0xff);

/* len=-1 means str is NUL-terminated. */
version(BindHB_Static)
    hb_tag_t hb_tag_from_string (const(char)* str, int len);
else
{
    private alias fp_hb_tag_from_string = hb_tag_t function (const(char)* str, int len);
    __gshared fp_hb_tag_from_string hb_tag_from_string;
}

/* buf should have 4 bytes. */
version(BindHB_Static)
    void hb_tag_to_string (hb_tag_t tag, char* buf);
else
{
    private alias fp_hb_tag_to_string = void function (hb_tag_t tag, char* buf);
    __gshared fp_hb_tag_to_string hb_tag_to_string;
}

/**
 * hb_direction_t:
 * @HB_DIRECTION_INVALID: Initial, unset direction.
 * @HB_DIRECTION_LTR: Text is set horizontally from left to right.
 * @HB_DIRECTION_RTL: Text is set horizontally from right to left.
 * @HB_DIRECTION_TTB: Text is set vertically from top to bottom.
 * @HB_DIRECTION_BTT: Text is set vertically from bottom to top.
 */
enum hb_direction_t
{
    HB_DIRECTION_INVALID = 0,
    HB_DIRECTION_LTR = 4,
    HB_DIRECTION_RTL = 5,
    HB_DIRECTION_TTB = 6,
    HB_DIRECTION_BTT = 7
}

/* len=-1 means str is NUL-terminated */
version(BindHB_Static)
    hb_direction_t hb_direction_from_string (const(char)* str, int len);
else
{
    private alias fp_hb_direction_from_string = hb_direction_t function (const(char)* str, int len);
    __gshared fp_hb_direction_from_string hb_direction_from_string;
}

version(BindHB_Static)
    const(char)* hb_direction_to_string (hb_direction_t direction);
else
{
    private alias fp_hb_direction_to_string = const(char)* function (hb_direction_t direction);
    __gshared fp_hb_direction_to_string hb_direction_to_string;
}

extern (D) auto HB_DIRECTION_IS_VALID(T)(auto ref T dir)
{
    return ((cast(uint) dir) & ~3U) == 4;
}

/* Direction must be valid for the following */
extern (D) auto HB_DIRECTION_IS_HORIZONTAL(T)(auto ref T dir)
{
    return ((cast(uint) dir) & ~1U) == 4;
}

extern (D) auto HB_DIRECTION_IS_VERTICAL(T)(auto ref T dir)
{
    return ((cast(uint) dir) & ~1U) == 6;
}

extern (D) auto HB_DIRECTION_IS_FORWARD(T)(auto ref T dir)
{
    return ((cast(uint) dir) & ~2U) == 4;
}

extern (D) auto HB_DIRECTION_IS_BACKWARD(T)(auto ref T dir)
{
    return ((cast(uint) dir) & ~2U) == 5;
}

extern (D) auto HB_DIRECTION_REVERSE(T)(auto ref T dir)
{
    return cast(hb_direction_t) (cast(uint) dir) ^ 1;
}

/* hb_language_t */

struct hb_language_impl_t;
alias hb_language_t = const(hb_language_impl_t)*;

version(BindHB_Static)
    hb_language_t hb_language_from_string (const(char)* str, int len);
else
{
    private alias fp_hb_language_from_string = hb_language_t function (const(char)* str, int len);
    __gshared fp_hb_language_from_string hb_language_from_string;
}

version(BindHB_Static)
    const(char)* hb_language_to_string (hb_language_t language);
else
{
    private alias fp_hb_language_to_string = const(char)* function (hb_language_t language);
    __gshared fp_hb_language_to_string hb_language_to_string;
}

enum HB_LANGUAGE_INVALID = cast(hb_language_t) 0;

version(BindHB_Static)
    hb_language_t hb_language_get_default ();
else
{
    private alias fp_hb_language_get_default = hb_language_t function ();
    __gshared fp_hb_language_get_default hb_language_get_default;
}

/* hb_script_t */

/* https://unicode.org/iso15924/ */
/* https://docs.google.com/spreadsheets/d/1Y90M0Ie3MUJ6UVCRDOypOtijlMDLNNyyLk36T6iMu0o */
/* Unicode Character Database property: Script (sc) */
enum hb_script_t
{
    /*1.1*/
    HB_SCRIPT_COMMON = HB_TAG('Z', 'y', 'y', 'y'),
    /*1.1*/
    HB_SCRIPT_INHERITED = HB_TAG('Z', 'i', 'n', 'h'),
    /*5.0*/
    HB_SCRIPT_UNKNOWN = HB_TAG('Z', 'z', 'z', 'z'),

    /*1.1*/
    HB_SCRIPT_ARABIC = HB_TAG('A', 'r', 'a', 'b'),
    /*1.1*/
    HB_SCRIPT_ARMENIAN = HB_TAG('A', 'r', 'm', 'n'),
    /*1.1*/
    HB_SCRIPT_BENGALI = HB_TAG('B', 'e', 'n', 'g'),
    /*1.1*/
    HB_SCRIPT_CYRILLIC = HB_TAG('C', 'y', 'r', 'l'),
    /*1.1*/
    HB_SCRIPT_DEVANAGARI = HB_TAG('D', 'e', 'v', 'a'),
    /*1.1*/
    HB_SCRIPT_GEORGIAN = HB_TAG('G', 'e', 'o', 'r'),
    /*1.1*/
    HB_SCRIPT_GREEK = HB_TAG('G', 'r', 'e', 'k'),
    /*1.1*/
    HB_SCRIPT_GUJARATI = HB_TAG('G', 'u', 'j', 'r'),
    /*1.1*/
    HB_SCRIPT_GURMUKHI = HB_TAG('G', 'u', 'r', 'u'),
    /*1.1*/
    HB_SCRIPT_HANGUL = HB_TAG('H', 'a', 'n', 'g'),
    /*1.1*/
    HB_SCRIPT_HAN = HB_TAG('H', 'a', 'n', 'i'),
    /*1.1*/
    HB_SCRIPT_HEBREW = HB_TAG('H', 'e', 'b', 'r'),
    /*1.1*/
    HB_SCRIPT_HIRAGANA = HB_TAG('H', 'i', 'r', 'a'),
    /*1.1*/
    HB_SCRIPT_KANNADA = HB_TAG('K', 'n', 'd', 'a'),
    /*1.1*/
    HB_SCRIPT_KATAKANA = HB_TAG('K', 'a', 'n', 'a'),
    /*1.1*/
    HB_SCRIPT_LAO = HB_TAG('L', 'a', 'o', 'o'),
    /*1.1*/
    HB_SCRIPT_LATIN = HB_TAG('L', 'a', 't', 'n'),
    /*1.1*/
    HB_SCRIPT_MALAYALAM = HB_TAG('M', 'l', 'y', 'm'),
    /*1.1*/
    HB_SCRIPT_ORIYA = HB_TAG('O', 'r', 'y', 'a'),
    /*1.1*/
    HB_SCRIPT_TAMIL = HB_TAG('T', 'a', 'm', 'l'),
    /*1.1*/
    HB_SCRIPT_TELUGU = HB_TAG('T', 'e', 'l', 'u'),
    /*1.1*/
    HB_SCRIPT_THAI = HB_TAG('T', 'h', 'a', 'i'),

    /*2.0*/
    HB_SCRIPT_TIBETAN = HB_TAG('T', 'i', 'b', 't'),

    /*3.0*/
    HB_SCRIPT_BOPOMOFO = HB_TAG('B', 'o', 'p', 'o'),
    /*3.0*/
    HB_SCRIPT_BRAILLE = HB_TAG('B', 'r', 'a', 'i'),
    /*3.0*/
    HB_SCRIPT_CANADIAN_SYLLABICS = HB_TAG('C', 'a', 'n', 's'),
    /*3.0*/
    HB_SCRIPT_CHEROKEE = HB_TAG('C', 'h', 'e', 'r'),
    /*3.0*/
    HB_SCRIPT_ETHIOPIC = HB_TAG('E', 't', 'h', 'i'),
    /*3.0*/
    HB_SCRIPT_KHMER = HB_TAG('K', 'h', 'm', 'r'),
    /*3.0*/
    HB_SCRIPT_MONGOLIAN = HB_TAG('M', 'o', 'n', 'g'),
    /*3.0*/
    HB_SCRIPT_MYANMAR = HB_TAG('M', 'y', 'm', 'r'),
    /*3.0*/
    HB_SCRIPT_OGHAM = HB_TAG('O', 'g', 'a', 'm'),
    /*3.0*/
    HB_SCRIPT_RUNIC = HB_TAG('R', 'u', 'n', 'r'),
    /*3.0*/
    HB_SCRIPT_SINHALA = HB_TAG('S', 'i', 'n', 'h'),
    /*3.0*/
    HB_SCRIPT_SYRIAC = HB_TAG('S', 'y', 'r', 'c'),
    /*3.0*/
    HB_SCRIPT_THAANA = HB_TAG('T', 'h', 'a', 'a'),
    /*3.0*/
    HB_SCRIPT_YI = HB_TAG('Y', 'i', 'i', 'i'),

    /*3.1*/
    HB_SCRIPT_DESERET = HB_TAG('D', 's', 'r', 't'),
    /*3.1*/
    HB_SCRIPT_GOTHIC = HB_TAG('G', 'o', 't', 'h'),
    /*3.1*/
    HB_SCRIPT_OLD_ITALIC = HB_TAG('I', 't', 'a', 'l'),

    /*3.2*/
    HB_SCRIPT_BUHID = HB_TAG('B', 'u', 'h', 'd'),
    /*3.2*/
    HB_SCRIPT_HANUNOO = HB_TAG('H', 'a', 'n', 'o'),
    /*3.2*/
    HB_SCRIPT_TAGALOG = HB_TAG('T', 'g', 'l', 'g'),
    /*3.2*/
    HB_SCRIPT_TAGBANWA = HB_TAG('T', 'a', 'g', 'b'),

    /*4.0*/
    HB_SCRIPT_CYPRIOT = HB_TAG('C', 'p', 'r', 't'),
    /*4.0*/
    HB_SCRIPT_LIMBU = HB_TAG('L', 'i', 'm', 'b'),
    /*4.0*/
    HB_SCRIPT_LINEAR_B = HB_TAG('L', 'i', 'n', 'b'),
    /*4.0*/
    HB_SCRIPT_OSMANYA = HB_TAG('O', 's', 'm', 'a'),
    /*4.0*/
    HB_SCRIPT_SHAVIAN = HB_TAG('S', 'h', 'a', 'w'),
    /*4.0*/
    HB_SCRIPT_TAI_LE = HB_TAG('T', 'a', 'l', 'e'),
    /*4.0*/
    HB_SCRIPT_UGARITIC = HB_TAG('U', 'g', 'a', 'r'),

    /*4.1*/
    HB_SCRIPT_BUGINESE = HB_TAG('B', 'u', 'g', 'i'),
    /*4.1*/
    HB_SCRIPT_COPTIC = HB_TAG('C', 'o', 'p', 't'),
    /*4.1*/
    HB_SCRIPT_GLAGOLITIC = HB_TAG('G', 'l', 'a', 'g'),
    /*4.1*/
    HB_SCRIPT_KHAROSHTHI = HB_TAG('K', 'h', 'a', 'r'),
    /*4.1*/
    HB_SCRIPT_NEW_TAI_LUE = HB_TAG('T', 'a', 'l', 'u'),
    /*4.1*/
    HB_SCRIPT_OLD_PERSIAN = HB_TAG('X', 'p', 'e', 'o'),
    /*4.1*/
    HB_SCRIPT_SYLOTI_NAGRI = HB_TAG('S', 'y', 'l', 'o'),
    /*4.1*/
    HB_SCRIPT_TIFINAGH = HB_TAG('T', 'f', 'n', 'g'),

    /*5.0*/
    HB_SCRIPT_BALINESE = HB_TAG('B', 'a', 'l', 'i'),
    /*5.0*/
    HB_SCRIPT_CUNEIFORM = HB_TAG('X', 's', 'u', 'x'),
    /*5.0*/
    HB_SCRIPT_NKO = HB_TAG('N', 'k', 'o', 'o'),
    /*5.0*/
    HB_SCRIPT_PHAGS_PA = HB_TAG('P', 'h', 'a', 'g'),
    /*5.0*/
    HB_SCRIPT_PHOENICIAN = HB_TAG('P', 'h', 'n', 'x'),

    /*5.1*/
    HB_SCRIPT_CARIAN = HB_TAG('C', 'a', 'r', 'i'),
    /*5.1*/
    HB_SCRIPT_CHAM = HB_TAG('C', 'h', 'a', 'm'),
    /*5.1*/
    HB_SCRIPT_KAYAH_LI = HB_TAG('K', 'a', 'l', 'i'),
    /*5.1*/
    HB_SCRIPT_LEPCHA = HB_TAG('L', 'e', 'p', 'c'),
    /*5.1*/
    HB_SCRIPT_LYCIAN = HB_TAG('L', 'y', 'c', 'i'),
    /*5.1*/
    HB_SCRIPT_LYDIAN = HB_TAG('L', 'y', 'd', 'i'),
    /*5.1*/
    HB_SCRIPT_OL_CHIKI = HB_TAG('O', 'l', 'c', 'k'),
    /*5.1*/
    HB_SCRIPT_REJANG = HB_TAG('R', 'j', 'n', 'g'),
    /*5.1*/
    HB_SCRIPT_SAURASHTRA = HB_TAG('S', 'a', 'u', 'r'),
    /*5.1*/
    HB_SCRIPT_SUNDANESE = HB_TAG('S', 'u', 'n', 'd'),
    /*5.1*/
    HB_SCRIPT_VAI = HB_TAG('V', 'a', 'i', 'i'),

    /*5.2*/
    HB_SCRIPT_AVESTAN = HB_TAG('A', 'v', 's', 't'),
    /*5.2*/
    HB_SCRIPT_BAMUM = HB_TAG('B', 'a', 'm', 'u'),
    /*5.2*/
    HB_SCRIPT_EGYPTIAN_HIEROGLYPHS = HB_TAG('E', 'g', 'y', 'p'),
    /*5.2*/
    HB_SCRIPT_IMPERIAL_ARAMAIC = HB_TAG('A', 'r', 'm', 'i'),
    /*5.2*/
    HB_SCRIPT_INSCRIPTIONAL_PAHLAVI = HB_TAG('P', 'h', 'l', 'i'),
    /*5.2*/
    HB_SCRIPT_INSCRIPTIONAL_PARTHIAN = HB_TAG('P', 'r', 't', 'i'),
    /*5.2*/
    HB_SCRIPT_JAVANESE = HB_TAG('J', 'a', 'v', 'a'),
    /*5.2*/
    HB_SCRIPT_KAITHI = HB_TAG('K', 't', 'h', 'i'),
    /*5.2*/
    HB_SCRIPT_LISU = HB_TAG('L', 'i', 's', 'u'),
    /*5.2*/
    HB_SCRIPT_MEETEI_MAYEK = HB_TAG('M', 't', 'e', 'i'),
    /*5.2*/
    HB_SCRIPT_OLD_SOUTH_ARABIAN = HB_TAG('S', 'a', 'r', 'b'),
    /*5.2*/
    HB_SCRIPT_OLD_TURKIC = HB_TAG('O', 'r', 'k', 'h'),
    /*5.2*/
    HB_SCRIPT_SAMARITAN = HB_TAG('S', 'a', 'm', 'r'),
    /*5.2*/
    HB_SCRIPT_TAI_THAM = HB_TAG('L', 'a', 'n', 'a'),
    /*5.2*/
    HB_SCRIPT_TAI_VIET = HB_TAG('T', 'a', 'v', 't'),

    /*6.0*/
    HB_SCRIPT_BATAK = HB_TAG('B', 'a', 't', 'k'),
    /*6.0*/
    HB_SCRIPT_BRAHMI = HB_TAG('B', 'r', 'a', 'h'),
    /*6.0*/
    HB_SCRIPT_MANDAIC = HB_TAG('M', 'a', 'n', 'd'),

    /*6.1*/
    HB_SCRIPT_CHAKMA = HB_TAG('C', 'a', 'k', 'm'),
    /*6.1*/
    HB_SCRIPT_MEROITIC_CURSIVE = HB_TAG('M', 'e', 'r', 'c'),
    /*6.1*/
    HB_SCRIPT_MEROITIC_HIEROGLYPHS = HB_TAG('M', 'e', 'r', 'o'),
    /*6.1*/
    HB_SCRIPT_MIAO = HB_TAG('P', 'l', 'r', 'd'),
    /*6.1*/
    HB_SCRIPT_SHARADA = HB_TAG('S', 'h', 'r', 'd'),
    /*6.1*/
    HB_SCRIPT_SORA_SOMPENG = HB_TAG('S', 'o', 'r', 'a'),
    /*6.1*/
    HB_SCRIPT_TAKRI = HB_TAG('T', 'a', 'k', 'r'),

    /*
     * Since: 0.9.30
     */
    /*7.0*/
    HB_SCRIPT_BASSA_VAH = HB_TAG('B', 'a', 's', 's'),
    /*7.0*/
    HB_SCRIPT_CAUCASIAN_ALBANIAN = HB_TAG('A', 'g', 'h', 'b'),
    /*7.0*/
    HB_SCRIPT_DUPLOYAN = HB_TAG('D', 'u', 'p', 'l'),
    /*7.0*/
    HB_SCRIPT_ELBASAN = HB_TAG('E', 'l', 'b', 'a'),
    /*7.0*/
    HB_SCRIPT_GRANTHA = HB_TAG('G', 'r', 'a', 'n'),
    /*7.0*/
    HB_SCRIPT_KHOJKI = HB_TAG('K', 'h', 'o', 'j'),
    /*7.0*/
    HB_SCRIPT_KHUDAWADI = HB_TAG('S', 'i', 'n', 'd'),
    /*7.0*/
    HB_SCRIPT_LINEAR_A = HB_TAG('L', 'i', 'n', 'a'),
    /*7.0*/
    HB_SCRIPT_MAHAJANI = HB_TAG('M', 'a', 'h', 'j'),
    /*7.0*/
    HB_SCRIPT_MANICHAEAN = HB_TAG('M', 'a', 'n', 'i'),
    /*7.0*/
    HB_SCRIPT_MENDE_KIKAKUI = HB_TAG('M', 'e', 'n', 'd'),
    /*7.0*/
    HB_SCRIPT_MODI = HB_TAG('M', 'o', 'd', 'i'),
    /*7.0*/
    HB_SCRIPT_MRO = HB_TAG('M', 'r', 'o', 'o'),
    /*7.0*/
    HB_SCRIPT_NABATAEAN = HB_TAG('N', 'b', 'a', 't'),
    /*7.0*/
    HB_SCRIPT_OLD_NORTH_ARABIAN = HB_TAG('N', 'a', 'r', 'b'),
    /*7.0*/
    HB_SCRIPT_OLD_PERMIC = HB_TAG('P', 'e', 'r', 'm'),
    /*7.0*/
    HB_SCRIPT_PAHAWH_HMONG = HB_TAG('H', 'm', 'n', 'g'),
    /*7.0*/
    HB_SCRIPT_PALMYRENE = HB_TAG('P', 'a', 'l', 'm'),
    /*7.0*/
    HB_SCRIPT_PAU_CIN_HAU = HB_TAG('P', 'a', 'u', 'c'),
    /*7.0*/
    HB_SCRIPT_PSALTER_PAHLAVI = HB_TAG('P', 'h', 'l', 'p'),
    /*7.0*/
    HB_SCRIPT_SIDDHAM = HB_TAG('S', 'i', 'd', 'd'),
    /*7.0*/
    HB_SCRIPT_TIRHUTA = HB_TAG('T', 'i', 'r', 'h'),
    /*7.0*/
    HB_SCRIPT_WARANG_CITI = HB_TAG('W', 'a', 'r', 'a'),

    /*8.0*/
    HB_SCRIPT_AHOM = HB_TAG('A', 'h', 'o', 'm'),
    /*8.0*/
    HB_SCRIPT_ANATOLIAN_HIEROGLYPHS = HB_TAG('H', 'l', 'u', 'w'),
    /*8.0*/
    HB_SCRIPT_HATRAN = HB_TAG('H', 'a', 't', 'r'),
    /*8.0*/
    HB_SCRIPT_MULTANI = HB_TAG('M', 'u', 'l', 't'),
    /*8.0*/
    HB_SCRIPT_OLD_HUNGARIAN = HB_TAG('H', 'u', 'n', 'g'),
    /*8.0*/
    HB_SCRIPT_SIGNWRITING = HB_TAG('S', 'g', 'n', 'w'),

    /*
     * Since 1.3.0
     */
    /*9.0*/
    HB_SCRIPT_ADLAM = HB_TAG('A', 'd', 'l', 'm'),
    /*9.0*/
    HB_SCRIPT_BHAIKSUKI = HB_TAG('B', 'h', 'k', 's'),
    /*9.0*/
    HB_SCRIPT_MARCHEN = HB_TAG('M', 'a', 'r', 'c'),
    /*9.0*/
    HB_SCRIPT_OSAGE = HB_TAG('O', 's', 'g', 'e'),
    /*9.0*/
    HB_SCRIPT_TANGUT = HB_TAG('T', 'a', 'n', 'g'),
    /*9.0*/
    HB_SCRIPT_NEWA = HB_TAG('N', 'e', 'w', 'a'),

    /*
     * Since 1.6.0
     */
    /*10.0*/
    HB_SCRIPT_MASARAM_GONDI = HB_TAG('G', 'o', 'n', 'm'),
    /*10.0*/
    HB_SCRIPT_NUSHU = HB_TAG('N', 's', 'h', 'u'),
    /*10.0*/
    HB_SCRIPT_SOYOMBO = HB_TAG('S', 'o', 'y', 'o'),
    /*10.0*/
    HB_SCRIPT_ZANABAZAR_SQUARE = HB_TAG('Z', 'a', 'n', 'b'),

    /*
     * Since 1.8.0
     */
    /*11.0*/
    HB_SCRIPT_DOGRA = HB_TAG('D', 'o', 'g', 'r'),
    /*11.0*/
    HB_SCRIPT_GUNJALA_GONDI = HB_TAG('G', 'o', 'n', 'g'),
    /*11.0*/
    HB_SCRIPT_HANIFI_ROHINGYA = HB_TAG('R', 'o', 'h', 'g'),
    /*11.0*/
    HB_SCRIPT_MAKASAR = HB_TAG('M', 'a', 'k', 'a'),
    /*11.0*/
    HB_SCRIPT_MEDEFAIDRIN = HB_TAG('M', 'e', 'd', 'f'),
    /*11.0*/
    HB_SCRIPT_OLD_SOGDIAN = HB_TAG('S', 'o', 'g', 'o'),
    /*11.0*/
    HB_SCRIPT_SOGDIAN = HB_TAG('S', 'o', 'g', 'd'),

    /*
     * Since 2.4.0
     */
    /*12.0*/
    HB_SCRIPT_ELYMAIC = HB_TAG('E', 'l', 'y', 'm'),
    /*12.0*/
    HB_SCRIPT_NANDINAGARI = HB_TAG('N', 'a', 'n', 'd'),
    /*12.0*/
    HB_SCRIPT_NYIAKENG_PUACHUE_HMONG = HB_TAG('H', 'm', 'n', 'p'),
    /*12.0*/
    HB_SCRIPT_WANCHO = HB_TAG('W', 'c', 'h', 'o'),

    /* No script set. */
    HB_SCRIPT_INVALID = HB_TAG_NONE,

    /* Dummy values to ensure any hb_tag_t value can be passed/stored as hb_script_t
     * without risking undefined behavior.  We have two, for historical reasons.
     * HB_TAG_MAX used to be unsigned, but that was invalid Ansi C, so was changed
     * to _HB_SCRIPT_MAX_VALUE to be equal to HB_TAG_MAX_SIGNED as well.
     *
     * See this thread for technicalities:
     *
     *   https://lists.freedesktop.org/archives/harfbuzz/2014-March/004150.html
     */
    _HB_SCRIPT_MAX_VALUE = HB_TAG_MAX_SIGNED, /*< skip >*/
    _HB_SCRIPT_MAX_VALUE_SIGNED = HB_TAG_MAX_SIGNED /*< skip >*/
}

/* Script functions */

version(BindHB_Static)
    hb_script_t hb_script_from_iso15924_tag (hb_tag_t tag);
else
{
    private alias fp_hb_script_from_iso15924_tag = hb_script_t function (hb_tag_t tag);
    __gshared fp_hb_script_from_iso15924_tag hb_script_from_iso15924_tag;
}

version(BindHB_Static)
    hb_script_t hb_script_from_string (const(char)* str, int len);
else
{
    private alias fp_hb_script_from_string = hb_script_t function (const(char)* str, int len);
    __gshared fp_hb_script_from_string hb_script_from_string;
}

version(BindHB_Static)
    hb_tag_t hb_script_to_iso15924_tag (hb_script_t script);
else
{
    private alias fp_hb_script_to_iso15924_tag = hb_tag_t function (hb_script_t script);
    __gshared fp_hb_script_to_iso15924_tag hb_script_to_iso15924_tag;
}

version(BindHB_Static)
    hb_direction_t hb_script_get_horizontal_direction (hb_script_t script);
else
{
    private alias fp_hb_script_get_horizontal_direction = hb_direction_t function (hb_script_t script);
    __gshared fp_hb_script_get_horizontal_direction hb_script_get_horizontal_direction;
}

/* User data */

struct hb_user_data_key_t
{
    /*< private >*/
    char unused;
}

alias hb_destroy_func_t = void function (void* user_data);

/* Font features and variations. */

/**
 * HB_FEATURE_GLOBAL_START
 *
 * Since: 2.0.0
 */
enum HB_FEATURE_GLOBAL_START = 0;
/**
 * HB_FEATURE_GLOBAL_END
 *
 * Since: 2.0.0
 */
enum HB_FEATURE_GLOBAL_END = cast(uint) -1;

struct hb_feature_t
{
    hb_tag_t tag;
    uint value;
    uint start;
    uint end;
}

version(BindHB_Static)
    hb_bool_t hb_feature_from_string (
        const(char)* str,
        int len,
        hb_feature_t* feature);
else
{
    private alias fp_hb_feature_from_string = hb_bool_t function (
        const(char)* str,
        int len,
        hb_feature_t* feature);
    __gshared fp_hb_feature_from_string hb_feature_from_string;
}

version(BindHB_Static)
    void hb_feature_to_string (hb_feature_t* feature, char* buf, uint size);
else
{
    private alias fp_hb_feature_to_string = void function (hb_feature_t* feature, char* buf, uint size);
    __gshared fp_hb_feature_to_string hb_feature_to_string;
}

/**
 * hb_variation_t:
 *
 * Since: 1.4.2
 */
struct hb_variation_t
{
    hb_tag_t tag;
    float value;
}

version(BindHB_Static)
    hb_bool_t hb_variation_from_string (
        const(char)* str,
        int len,
        hb_variation_t* variation);
else
{
    private alias fp_hb_variation_from_string = hb_bool_t function (
        const(char)* str,
        int len,
        hb_variation_t* variation);
    __gshared fp_hb_variation_from_string hb_variation_from_string;
}

version(BindHB_Static)
    void hb_variation_to_string (hb_variation_t* variation, char* buf, uint size);
else
{
    private alias fp_hb_variation_to_string = void function (hb_variation_t* variation, char* buf, uint size);
    __gshared fp_hb_variation_to_string hb_variation_to_string;
}

/**
 * hb_color_t:
 *
 * Data type for holding color values.
 *
 * Since: 2.1.0
 */
alias hb_color_t = uint;

extern (D) auto HB_COLOR(T0, T1, T2, T3)(auto ref T0 b, auto ref T1 g, auto ref T2 r, auto ref T3 a)
{
    return cast(hb_color_t) HB_TAG(b, g, r, a);
}

//version(BindHB_Static)
//    ubyte hb_color_get_alpha (hb_color_t color);
//else
//{
//    private alias fp_hb_color_get_alpha = ubyte function (hb_color_t color);
//    __gshared fp_hb_color_get_alpha hb_color_get_alpha;
//}

extern (D) auto hb_color_get_alpha(T)(auto ref T color)
{
    return color & 0xFF;
}

//version(BindHB_Static)
//    ubyte hb_color_get_red (hb_color_t color);
//else
//{
//    private alias fp_hb_color_get_red = ubyte function (hb_color_t color);
//    __gshared fp_hb_color_get_red hb_color_get_red;
//}

extern (D) auto hb_color_get_red(T)(auto ref T color)
{
    return (color >> 8) & 0xFF;
}

//version(BindHB_Static)
//    ubyte hb_color_get_green (hb_color_t color);
//else
//{
//    private alias fp_hb_color_get_green = ubyte function (hb_color_t color);
//    __gshared fp_hb_color_get_green hb_color_get_green;
//}

extern (D) auto hb_color_get_green(T)(auto ref T color)
{
    return (color >> 16) & 0xFF;
}

//version(BindHB_Static)
//    ubyte hb_color_get_blue (hb_color_t color);
//else
//{
//    private alias fp_hb_color_get_blue = ubyte function (hb_color_t color);
//    __gshared fp_hb_color_get_blue hb_color_get_blue;
//}

extern (D) auto hb_color_get_blue(T)(auto ref T color)
{
    return (color >> 24) & 0xFF;
}

/* HB_COMMON_H */
