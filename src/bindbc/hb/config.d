module bindbc.hb.config;

enum HBSupport {
    noLibrary,
    badLibrary,
    hb26	= 26
}

enum HARFBUZZ_MAJOR = 2;
enum HARFBUZZ_MINOR = 6;
enum HARFBUZZ_PATCH = 1;
enum hbSupport = HBSupport.hb26;
