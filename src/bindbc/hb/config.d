
//          Copyright Ahmet Sait 2020.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

module bindbc.hb.config;

enum HBSupport {
	noLibrary,
	badLibrary,
	v2_6_3 = 20603,
	v1_7_2 = 10702,	/// Compatible up to 1.6.0
}

version(HB_2_6_3)
{
	enum HARFBUZZ_MAJOR = 2;
	enum HARFBUZZ_MINOR = 6;
	enum HARFBUZZ_PATCH = 3;
	enum hbSupport = HBSupport.v2_6_3;
}
else // Lowest version supported
{
	enum HARFBUZZ_MAJOR = 1;
	enum HARFBUZZ_MINOR = 7;
	enum HARFBUZZ_PATCH = 2;
	enum hbSupport = HBSupport.v1_7_2;
}
