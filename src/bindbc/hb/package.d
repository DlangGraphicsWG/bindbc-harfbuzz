
//          Copyright Ahmet Sait Koçak 2019.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)

module bindbc.hb;

public import bindbc.hb.config,
              bindbc.hb.bind;

version(BindHB_Static) {}
else public import bindbc.hb.dynload;
