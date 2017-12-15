HxFFI [![MIT License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE.md) [![Haxelib Version](https://img.shields.io/github/tag/TopHattedCoder/hx-ffi.svg?style=flat&label=haxelib)](http://lib.haxe.org/p/ffi) [Documentation](https://tombebbington.github.io/hx-ffi/)
=====
HxFFI is a Haxe library that allows you to quickly use native libraries quickly without any annoying wrapper functions! It does this using LibFFI, using a method similar method to JNA. This only works with languages that have C-compatible FFIs like C itself, and Rust externs.  

Supported types
---------------
 C Type                     | EasyLibrary Type              | Haxe Type             | FFI Type
----------------------------|-------------------------------|-----------------------|---------------------------
__void__                    | Void                          | Void                  | ffi.Type.VOID
__char*__                   | String                        | String                | ffi.Type.POINTER
__void*__                   | Pointer                       | ffi.Pointer           | ffi.Type.POINTER
__float__                   | Single                        | Float                 | ffi.Type.FLOAT
__double__                  | Float                         | Float                 | ffi.Type.DOUBLE
__int__                     | Int / SInt                    | Int                   | ffi.Type.INT
__uint__                    | UInt                          | Int                   | ffi.Type.UINT
__long__                    | Int64 / SInt64                | haxe.Int64            | ffi.Type.SINT64
__ulong__                   | UInt64                        | haxe.Int64            | ffi.Type.UINT64
__int32_t__                 | Int32 / SInt32                | Int                   | ffi.Type.SINT32
__uint32_t__                | UInt32                        | Int                   | ffi.Type.UINT32
__int16_t__ / __short__     | Int16 / SInt16                | Int                   | ffi.Type.SINT16
__uint16_t__ / __ushort__   | UInt16                        | Int                   | ffi.Type.UINT16
__int8_t__ / __char__       | Int8 / SInt8                  | Int                   | ffi.Type.SINT8
__uint8_t__ / __uchar__     | UInt8                         | Int                   | ffi.Type.UINT8
__struct__                  | Struct&lt;ordered types...&gt;| Array&lt;Dynamic&gt;  | ffi.Type.createStruct(...)

Usage
-----
You can use FFI easily and transparently by extending `ffi.lib.EasyLibrary`.

Using Structs
-------------
Structs can be declared for a library-wrapping class like this:

```haxe
@:struct(SDLRect => {
    var x:SInt16;
    var y:SInt16;
    var w:UInt16;
    var h:UInt16;
})
@:lib("...")
class SDL {
    ...
    public function SDL_BlitSurface(...,dest: SDLRect...):Int;
}
```
This feature does not work with C++ FFIs as structs have a different memory layout from normal C.

Supported Platforms
-------------------

+ Neko / C++ on Linux (full, tested with a global libffi-dev install)
+ Neko / C++ on Mac OS (should work, untested)
+ Neko / C++ on Windows (might work, untested)