
//          Copyright Ahmet Sait 2019.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

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
