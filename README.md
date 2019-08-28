# bindbc-harfbuzz
This project provides both static and dynamic bindings to the [HarfBuzz library](https://github.com/harfbuzz/harfbuzz). They are `@nogc` and `nothrow` compatible can be compiled for compatibility with `-betterC`.

## Usage
By default, `bindbc-harfbuzz` is configured to compile as a dynamic binding that is not `-betterC` compatible. The dynamic binding has no link-time dependency on the HarfBuzz library, so the HarfBuzz shared library must be manually loaded at runtime. When configured as a static binding, there is a link-time dependency on the HarfBuzz library---either the static library or the appropriate file for linking with shared libraries on your platform (see below).

When using DUB to manage your project, the static binding can be enabled via a DUB `subConfiguration` statement in your project's package file. `-betterC` compatibility is also enabled via subconfigurations.

To use HarfBuzz, add `bindbc-harfbuzz` as a dependency to your project's package config file. For example, the following is configured to HarfBuzz as a dynamic binding that is not `-betterC` compatible:

__dub.json__
```
dependencies {
    "bindbc-harfbuzz": "~>0.1.0",
}
```

__dub.sdl__
```
dependency "bindbc-harfbuzz" version="~>0.1.0"
```

### The dynamic binding
The dynamic binding requires no special configuration when using DUB to manage your project. There is no link-time dependency. At runtime, the HarfBuzz shared library is required to be on the shared library search path of the user's system. On Windows, this is typically handled by distributing the HarfBuzz DLL with your program. On other systems, it usually means the user must install the HarfBuzz runtime library through a package manager.

To load the shared library, you need to call the `loadHarfBuzz` function. This returns a member of the `HBSupport` enumeration (See [the README for `bindbc.loader`](https://github.com/BindBC/bindbc-loader/blob/master/README.md) for the error handling API):

* `HBSupport.noLibrary` indicating that the library failed to load (it couldn't be found)
* `HBSupport.badLibrary` indicating that one or more symbols in the library failed to load
* a member of `HBSupport` indicating a version number that matches the version of HarfBuzz that `bindbc-harfbuzz` was configured at compile-time to load. By default, that is `HBSupport.hb26`, but can be configured via a version identifier (see below). This value will match the global manifest constant, `hbSupport`.

```d
import bindbc.harfbuzz;

/*
This version attempts to load the HarfBuzz shared library using well-known variations
of the library name for the host system.
*/
HBSupport ret = loadHarfBuzz();
if(ret != hbSupport) {

    // Handle error. For most use cases, its reasonable to use the the error handling API in
    // bindbc-loader to retrieve error messages for logging and then abort. If necessary, it's
    // possible to determine the root cause via the return value:

    if(ret == HBSupport.noLibrary) {
        // HarfBuzz shared library failed to load
    }
    else if(HBSupport.badLibrary) {
        // One or more symbols failed to load. The likely cause is that the
        // shared library is for a lower version than bindbc-harfbuzz was configured
        // to load (via HB_26, etc.)
    }
}
/*
This version attempts to load the HarfBuzz library using a user-supplied file name.
Usually, the name and/or path used will be platform specific, as in this example
which attempts to load `harfbuzz.dll` from the `libs` subdirectory, relative
to the executable, only on Windows.
*/
// version(Windows) loadHarfBuzz("libs/harfbuzz.dll")
```
By default, the `bindbc-harfbuzz` binding is configured to compile to load HarfBuzz 2.6. This is currently the only supported version. This behavior can be overridden via the `-version` compiler switch or the `versions` DUB directive with the desired HarfBuzz version number. It is recommended that you always select the minimum version you require _and no higher_. In this example, the HarfBuzz dynamic binding is compiled to support HarfBuzz 2.6 manually:

__dub.json__
```
"dependencies": {
    "bindbc-harfbuzz": "~>0.1.0"
},
"versions": ["HB_26"]
```

__dub.sdl__
```
dependency "bindbc-harfbuzz" version="~>0.1.0"
versions "HB_26"
```

With this example configuration, `hbSupport == HBSupport.hb26`. If HarfBuzz 2.6 or later is installed on the user's system, `loadHarfBuzz` will return `HBSupport.hb26`. If only HarfBuzz 2.5 is installed, `loadHarfBuzz` will return `HBSupport.badLibrary`. In this scenario, calling `loadedHarfBuzzVersion()` will return a `HBSupport` member indicating which version of HarfBuzz, if any, actually loaded. If a lower version was loaded, it's still possible to call functions from that version of HarfBuzz, but any calls to functions from higher versions will result in a null pointer access. For this reason, it's recommended to always specify your required version of the HarfBuzz library at compile time and abort when you receive a `HBSupport.badLibrary` return value from `loadHarfBuzz`.

No matter which version was configured, the successfully loaded version can be obtained via a call to `loadedHarfBuzzVersion`. It returns one of the following:

* `HBSupport.noLibrary` if `loadHarfBuzz` returned `HBSupport.noLibrary`
* `HBSupport.badLibrary` if `loadHarfBuzz` returned `HBSupport.badLibrary` and no version of HarfBuzz successfully loaded
* a member of `HBSupport` indicating the version of HarfBuzz that successfully loaded. When `loadHarfBuzz` returns `HBSupport.badLibrary`, this will be a version number lower than that configured at compile time. Otherwise, it will be the same as the manifest constant `hbSupport`.

The function `isHarfBuzzLoaded` returns `true` if any version of HarfBuzz was successfully loaded and `false` otherwise.

Following are the supported versions of HarfBuzz, the corresponding version IDs to pass to the compiler, and the corresponding `HBSupport` members.

| Library & Version  | Version ID       | `HBSupport` Member |
|--------------------|------------------|--------------------|
|HarfBuzz 2.6.1      | Default          | `HBSupport.hb26`   |

## The static binding
The static binding has a link-time dependency on either the shared or the static HarfBuzz library. On Windows, you can link with the static library or, to use the shared library (`harfbuzz.dll`), with the import library. On other systems, you can link with either the static library or directly with the shared library. This requires the HarfBuzz development package be installed on your system at compile time, either by compiling the HarfBuzz source yourself, downloading the HarfBuzz precompiled binaries for Windows, or installing via a system package manager. [See the HarfBuzz documentation](https://harfbuzz.github.io/install-harfbuzz.html) for details.

When linking with the static library, there is no runtime dependency on HarfBuzz. When linking with the shared library (or the import library on Windows), the runtime dependency is the same as the dynamic binding, the difference being that the shared library is no longer loaded manually---loading is handled automatically by the system when the program is launched.

Enabling the static binding can be done in two ways.

### Via the compiler's `-version` switch or DUB's `versions` directive
Pass the `BindHB_Static` version to the compiler and link with the appropriate library.

When using the compiler command line or a build system that doesn't support DUB, this is the only option. The `-version=BindHB_Static` option should be passed to the compiler when building your program. All of the required C libraries, as well as the `bindbc-harfbuzz` and `bindbc-loader` static libraries must also be passed to the compiler on the command line or via your build system's configuration.

When using DUB, its `versions` directive is an option. For example, when using the static binding:

__dub.json__
```
"dependencies": {
    "bindbc-harfbuzz": "~>0.1.0"
},
"versions": ["BindHB_Static"],
"libs": ["harfbuzz"]
```

__dub.sdl__
```
dependency "bindbc-harfbuzz" version="~>0.1.0"
versions "BindHB_Static"
libs "harfbuzz"
```

### Via DUB subconfigurations
Instead of using DUB's `versions` directive, a `subConfiguration` can be used. Enable the `static` subconfiguration for the `bindbc-harfbuzz` dependency:

__dub.json__
```
"dependencies": {
    "bindbc-harfbuzz": "~>0.1.0"
},
"subConfigurations": {
    "bindbc-harfbuzz": "static"
},
"libs": ["harfbuzz"]
```

__dub.sdl__
```
dependency "bindbc-harfbuzz" version="~>0.1.0"
subConfiguration "bindbc-harfbuzz" "static"
libs "harfbuzz"
```

This has the benefit that it completely excludes from the build any source modules related to the dynamic binding, i.e. they will never be passed to the compiler.

## `betterC` support

`betterC` support is enabled via the `dynamicBC` and `staticBC` subconfigurations, for dynamic and static bindings respectively. To enable the static binding with `-betterC` support:

__dub.json__
```
"dependencies": {
    "bindbc-harfbuzz": "~>0.1.0"
},
"subConfigurations": {
    "bindbc-harfbuzz": "staticBC"
},
"libs": ["harfbuzz"]
```

__dub.sdl__
```
dependency "bindbc-harfbuzz" version="~>0.1.0"
subConfiguration "bindbc-harfbuzz" "staticBC"
libs "harfbuzz"
```

When not using DUB to manage your project, first use DUB to compile the BindBC libraries with the `dynamicBC` or `staticBC` configuration, then pass `-betterC` to the compiler when building your project.