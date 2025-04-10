const std = @import("std");
const builtin = @import("builtin");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const t = target.result;

    const exe = b.addExecutable(.{
        .name = "nasm",
        .target = target,
        .optimize = optimize,
    });

    exe.addIncludePath(b.path("include"));
    exe.addIncludePath(b.path("asm"));
    exe.addIncludePath(b.path("x86"));
    exe.addIncludePath(b.path("output"));
    exe.addConfigHeader(b.addConfigHeader(.{
        .style = .blank,
        .include_path = "version.h",
    }, .{
        .NASM_MAJOR_VER = 2,
        .NASM_MINOR_VER = 16,
        .NASM_SUBMINOR_VER = 1,
        .NASM_PATCHLEVEL_VER = 0,
        .NASM_VERSION_ID = 0x02100100,
        .NASM_VER = "2.16.01",
    }));

    switch (t.os.tag) {
        .linux => exe.addConfigHeader(b.addConfigHeader(.{
            .style = .{ .autoconf = b.path("config/config.h.in") },
            .include_path = "config/config.h",
        }, .{
            .ABORT_ON_PANIC = have(optimize == .Debug),
            .AC_APPLE_UNIVERSAL_BUILD = null,
            .CFLAGS_FDATA_SECTIONS = null,
            .CFLAGS_FFUNCTION_SECTIONS = null,
            .CFLAGS_FGNU89_INLINE = null,
            .CFLAGS_FLTO = null,
            .CFLAGS_FNO_COMMON = null,
            .CFLAGS_FNO_OMIT_FRAME_POINTER = null,
            .CFLAGS_FSANITIZE_ADDRESS = null,
            .CFLAGS_FSANITIZE_UNDEFINED = null,
            .CFLAGS_FTRIVIAL_AUTO_VAR_INIT_ZERO = null,
            .CFLAGS_FVISIBILITY_HIDDEN = null,
            .CFLAGS_FWRAPV = null,
            .CFLAGS_GGDB3 = null,
            .CFLAGS_O0 = have(optimize == .Debug),
            .CFLAGS_PEDANTIC = null,
            .CFLAGS_PG = null,
            .CFLAGS_STD_C11 = null,
            .CFLAGS_STD_C17 = 1,
            .CFLAGS_STD_C99 = null,
            .CFLAGS_U_STRICT_ANSI = null,
            .CFLAGS_W = null,
            .CFLAGS_WALL = null,
            .CFLAGS_WC90_C99_COMPAT = null,
            .CFLAGS_WC99_COMPAT = null,
            .CFLAGS_WC99_EXTENSIONS = null,
            .CFLAGS_WERROR = null,
            .CFLAGS_WERROR_ATTRIBUTES = null,
            .CFLAGS_WERROR_COMMENT = null,
            .CFLAGS_WERROR_IMPLICIT = null,
            .CFLAGS_WERROR_MISSING_BRACES = null,
            .CFLAGS_WERROR_MISSING_DECLARATIONS = null,
            .CFLAGS_WERROR_MISSING_PROTOTYPES = null,
            .CFLAGS_WERROR_POINTER_ARITH = null,
            .CFLAGS_WERROR_RETURN_TYPE = null,
            .CFLAGS_WERROR_STRICT_PROTOTYPES = null,
            .CFLAGS_WERROR_TRIGRAPHS = null,
            .CFLAGS_WERROR_UNKNOWN_WARNING_OPTION = null,
            .CFLAGS_WERROR_VLA = null,
            .CFLAGS_WLONG_LONG = null,
            .CFLAGS_WPEDANTIC_MS_FORMAT = null,
            .CFLAGS_WSHIFT_NEGATIVE_VALUE = null,
            .CFLAGS_WSTRINGOP_TRUNCATION = null,
            .CFLAGS_WSUGGEST_ATTRIBUTE_COLD = null,
            .CFLAGS_WSUGGEST_ATTRIBUTE_CONST = null,
            .CFLAGS_WSUGGEST_ATTRIBUTE_FORMAT = null,
            .CFLAGS_WSUGGEST_ATTRIBUTE_MALLOC = null,
            .CFLAGS_WSUGGEST_ATTRIBUTE_NORETURN = null,
            .CFLAGS_WSUGGEST_ATTRIBUTE_PURE = null,
            .HAVE_ACCESS = 1,
            .HAVE_CANONICALIZE_FILE_NAME = null,
            .HAVE_CPU_TO_LE16 = null,
            .HAVE_CPU_TO_LE32 = null,
            .HAVE_CPU_TO_LE64 = null,
            .HAVE_DECL_STRCASECMP = 0,
            .HAVE_DECL_STRICMP = 0,
            .HAVE_DECL_STRLCPY = 0,
            .HAVE_DECL_STRNCASECMP = 0,
            .HAVE_DECL_STRNICMP = 0,
            .HAVE_DECL_STRNLEN = 0,
            .HAVE_DECL_STRRCHRNUL = 0,
            .HAVE_DECL_STRSEP = 0,
            .HAVE_ENDIAN_H = 1,
            .HAVE_FACCESSAT = 1,
            .HAVE_FCNTL_H = 1,
            .HAVE_FILENO = 1,
            .HAVE_FSEEKO = 1,
            .HAVE_FSTAT = 1,
            .HAVE_FTRUNCATE = 1,
            .HAVE_FUNC_ATTRIBUTE1_ALLOC_SIZE = 1,
            .HAVE_FUNC_ATTRIBUTE2_ALLOC_SIZE = null,
            .HAVE_FUNC_ATTRIBUTE3_FORMAT = 1,
            .HAVE_FUNC_ATTRIBUTE_COLD = 1,
            .HAVE_FUNC_ATTRIBUTE_CONST = 1,
            .HAVE_FUNC_ATTRIBUTE_ERROR = 1,
            .HAVE_FUNC_ATTRIBUTE_MALLOC = 1,
            .HAVE_FUNC_ATTRIBUTE_NORETURN = 1,
            .HAVE_FUNC_ATTRIBUTE_PURE = 1,
            .HAVE_FUNC_ATTRIBUTE_RETURNS_NONNULL = 1,
            .HAVE_FUNC_ATTRIBUTE_SENTINEL = 1,
            .HAVE_FUNC_ATTRIBUTE_UNUSED = 1,
            .HAVE_FUNC_PTR_ATTRIBUTE1_ALLOC_SIZE = 1,
            .HAVE_FUNC_PTR_ATTRIBUTE2_ALLOC_SIZE = null,
            .HAVE_FUNC_PTR_ATTRIBUTE3_FORMAT = 1,
            .HAVE_FUNC_PTR_ATTRIBUTE_COLD = null,
            .HAVE_FUNC_PTR_ATTRIBUTE_CONST = 1,
            .HAVE_FUNC_PTR_ATTRIBUTE_MALLOC = null,
            .HAVE_FUNC_PTR_ATTRIBUTE_NORETURN = 1,
            .HAVE_FUNC_PTR_ATTRIBUTE_PURE = null,
            .HAVE_FUNC_PTR_ATTRIBUTE_RETURNS_NONNULL = 1,
            .HAVE_FUNC_PTR_ATTRIBUTE_SENTINEL = 1,
            .HAVE_FUNC_PTR_ATTRIBUTE_UNUSED = 1,
            .HAVE_GETGID = null,
            .HAVE_GETPAGESIZE = null,
            .HAVE_GETRLIMIT = null,
            .HAVE_GETUID = null,
            .HAVE_HTOLE16 = null,
            .HAVE_HTOLE32 = null,
            .HAVE_HTOLE64 = null,
            .HAVE_INTRIN_H = 1,
            .HAVE_INTTYPES_H = 1,
            .HAVE_IO_H = null,
            .HAVE_ISASCII = 1,
            .HAVE_ISCNTRL = 1,
            .HAVE_MACHINE_ENDIAN_H = 0,
            .HAVE_MEMPCPY = 1,
            .HAVE_MEMPSET = null,
            .HAVE_MINIX_CONFIG_H = null,
            .HAVE_MMAP = 1,
            .HAVE_PATHCONF = null,
            .HAVE_REALPATH = 1,
            .HAVE_SNPRINTF = 1,
            .HAVE_STAT = 1,
            .HAVE_STDARG_H = 1,
            .HAVE_STDBOOL_H = 1,
            .HAVE_STDC_INLINE = 1,
            .HAVE_STDINT_H = 1,
            .HAVE_STDIO_H = 1,
            .HAVE_STDLIB_H = 1,
            .HAVE_STDNORETURN_H = 1,
            .HAVE_STRCASECMP = 1,
            .HAVE_STRICMP = 1,
            .HAVE_STRINGS_H = 1,
            .HAVE_STRING_H = 1,
            .HAVE_STRLCPY = null,
            .HAVE_STRNCASECMP = 1,
            .HAVE_STRNICMP = 1,
            .HAVE_STRNLEN = null,
            .HAVE_STRRCHRNUL = null,
            .HAVE_STRSEP = null,
            .HAVE_STRUCT_STAT = null,
            .HAVE_STRUCT__STATI64 = null,
            .HAVE_SYSCONF = null,
            .HAVE_SYS_ENDIAN_H = null,
            .HAVE_SYS_MMAN_H = 1,
            .HAVE_SYS_PARAM_H = null,
            .HAVE_SYS_RESOURCE_H = null,
            .HAVE_SYS_STAT_H = 1,
            .HAVE_SYS_TYPES_H = 1,
            .HAVE_S_ISREG = null,
            .HAVE_TYPEOF = null,
            .HAVE_UINTPTR_T = 1,
            .HAVE_UNISTD_H = null,
            .HAVE_VSNPRINTF = null,
            .HAVE_WCHAR_H = null,
            .HAVE__ACCESS = null,
            .HAVE__BITSCANREVERSE = null,
            .HAVE__BITSCANREVERSE64 = null,
            .HAVE__BOOL = 1,
            .HAVE__BYTESWAP_UINT64 = null,
            .HAVE__BYTESWAP_ULONG = null,
            .HAVE__BYTESWAP_USHORT = null,
            .HAVE__CHSIZE = null,
            .HAVE__CHSIZE_S = null,
            .HAVE__FILENO = null,
            .HAVE__FSEEKI64 = null,
            .HAVE__FSTATI64 = null,
            .HAVE__FULLPATH = null,
            .HAVE__STATI64 = null,
            .HAVE__FILELENGTHI64 = null,
            .HAVE___BSWAP_16 = 1,
            .HAVE___BSWAP_32 = 1,
            .HAVE___BSWAP_64 = 1,
            .HAVE___BUILTIN_BSWAP16 = 1,
            .HAVE___BUILTIN_BSWAP32 = 1,
            .HAVE___BUILTIN_BSWAP64 = 1,
            .HAVE___BUILTIN_CHOOSE_EXPR = 1,
            .HAVE___BUILTIN_CLZ = 1,
            .HAVE___BUILTIN_CLZL = 1,
            .HAVE___BUILTIN_CLZLL = 1,
            .HAVE___BUILTIN_CONSTANT_P = 1,
            .HAVE___BUILTIN_EXPECT = 1,
            .HAVE___CPU_TO_LE16 = null,
            .HAVE___CPU_TO_LE32 = null,
            .HAVE___CPU_TO_LE64 = null,
            .LDFLAGS_WL_GC_SECTIONS = null,
            .PACKAGE_BUGREPORT = "",
            .PACKAGE_NAME = "",
            .PACKAGE_STRING = "",
            .PACKAGE_TARNAME = "",
            .PACKAGE_URL = "",
            .PACKAGE_VERSION = "",
            .STDC_HEADERS = 1,
            ._ALL_SOURCE = 1,
            ._DARWIN_C_SOURCE = 1,
            .__EXTENSIONS__ = 1,
            ._GNU_SOURCE = 1,
            ._HPUX_ALT_XOPEN_SOCKET_API = 1,
            ._MINIX = null,
            ._NETBSD_SOURCE = 1,
            ._OPENBSD_SOURCE = 1,
            ._POSIX_SOURCE = null,
            ._POSIX_1_SOURCE = null,
            ._POSIX_PTHREAD_SEMANTICS = 1,
            .__STDC_WANT_IEC_60559_ATTRIBS_EXT__ = 1,
            .__STDC_WANT_IEC_60559_BFP_EXT__ = 1,
            .__STDC_WANT_IEC_60559_DFP_EXT__ = 1,
            .__STDC_WANT_IEC_60559_FUNCS_EXT__ = 1,
            .__STDC_WANT_IEC_60559_TYPES_EXT__ = 1,
            .__STDC_WANT_LIB_EXT2__ = 1,
            .__STDC_WANT_MATH_SPEC_FUNCS__ = 1,
            ._TANDEM_SOURCE = 1,
            ._XOPEN_SOURCE = null,
            .WORDS_BIGENDIAN = have(t.cpu.arch.endian() == .big),
            .WORDS_LITTLEENDIAN = have(t.cpu.arch.endian() != .big),
            ._FILE_OFFSET_BITS = null,
            ._LARGEFILE_SOURCE = null,
            ._LARGE_FILES = null,
            .@"const" = .@"const",
            .@"inline" = .@"inline",
            .restrict = .restrict,
            .size_t = null,
            .snprintf = null,
            .typeof = .__typeof,
            .uintptr_t = null,
            .vsnprintf = null,
        })),
        .macos => exe.addConfigHeader(b.addConfigHeader(.{
            .style = .{ .autoconf = b.path("config/config.h.in") },
            .include_path = "config/config.h",
        }, .{
            .ABORT_ON_PANIC = have(optimize == .Debug),
            .AC_APPLE_UNIVERSAL_BUILD = null,
            .CFLAGS_FDATA_SECTIONS = null,
            .CFLAGS_FFUNCTION_SECTIONS = null,
            .CFLAGS_FGNU89_INLINE = null,
            .CFLAGS_FLTO = null,
            .CFLAGS_FNO_COMMON = null,
            .CFLAGS_FNO_OMIT_FRAME_POINTER = null,
            .CFLAGS_FSANITIZE_ADDRESS = null,
            .CFLAGS_FSANITIZE_UNDEFINED = null,
            .CFLAGS_FTRIVIAL_AUTO_VAR_INIT_ZERO = null,
            .CFLAGS_FVISIBILITY_HIDDEN = null,
            .CFLAGS_FWRAPV = null,
            .CFLAGS_GGDB3 = null,
            .CFLAGS_O0 = have(optimize == .Debug),
            .CFLAGS_PEDANTIC = null,
            .CFLAGS_PG = null,
            .CFLAGS_STD_C11 = null,
            .CFLAGS_STD_C17 = 1,
            .CFLAGS_STD_C99 = null,
            .CFLAGS_U_STRICT_ANSI = null,
            .CFLAGS_W = null,
            .CFLAGS_WALL = null,
            .CFLAGS_WC90_C99_COMPAT = null,
            .CFLAGS_WC99_COMPAT = null,
            .CFLAGS_WC99_EXTENSIONS = null,
            .CFLAGS_WERROR = null,
            .CFLAGS_WERROR_ATTRIBUTES = null,
            .CFLAGS_WERROR_COMMENT = null,
            .CFLAGS_WERROR_IMPLICIT = null,
            .CFLAGS_WERROR_MISSING_BRACES = null,
            .CFLAGS_WERROR_MISSING_DECLARATIONS = null,
            .CFLAGS_WERROR_MISSING_PROTOTYPES = null,
            .CFLAGS_WERROR_POINTER_ARITH = null,
            .CFLAGS_WERROR_RETURN_TYPE = null,
            .CFLAGS_WERROR_STRICT_PROTOTYPES = null,
            .CFLAGS_WERROR_TRIGRAPHS = null,
            .CFLAGS_WERROR_UNKNOWN_WARNING_OPTION = null,
            .CFLAGS_WERROR_VLA = null,
            .CFLAGS_WLONG_LONG = null,
            .CFLAGS_WPEDANTIC_MS_FORMAT = null,
            .CFLAGS_WSHIFT_NEGATIVE_VALUE = null,
            .CFLAGS_WSTRINGOP_TRUNCATION = null,
            .CFLAGS_WSUGGEST_ATTRIBUTE_COLD = null,
            .CFLAGS_WSUGGEST_ATTRIBUTE_CONST = null,
            .CFLAGS_WSUGGEST_ATTRIBUTE_FORMAT = null,
            .CFLAGS_WSUGGEST_ATTRIBUTE_MALLOC = null,
            .CFLAGS_WSUGGEST_ATTRIBUTE_NORETURN = null,
            .CFLAGS_WSUGGEST_ATTRIBUTE_PURE = null,
            .HAVE_ACCESS = 1,
            .HAVE_CANONICALIZE_FILE_NAME = null,
            .HAVE_CPU_TO_LE16 = null,
            .HAVE_CPU_TO_LE32 = null,
            .HAVE_CPU_TO_LE64 = null,
            .HAVE_DECL_STRCASECMP = 1,
            .HAVE_DECL_STRICMP = 0,
            .HAVE_DECL_STRLCPY = 1,
            .HAVE_DECL_STRNCASECMP = 1,
            .HAVE_DECL_STRNICMP = 0,
            .HAVE_DECL_STRNLEN = 1,
            .HAVE_DECL_STRRCHRNUL = 0,
            .HAVE_DECL_STRSEP = 1,
            .HAVE_ENDIAN_H = null,
            .HAVE_FACCESSAT = 1,
            .HAVE_FCNTL_H = 1,
            .HAVE_FILENO = 1,
            .HAVE_FSEEKO = 1,
            .HAVE_FSTAT = 1,
            .HAVE_FTRUNCATE = 1,
            .HAVE_FUNC_ATTRIBUTE1_ALLOC_SIZE = 1,
            .HAVE_FUNC_ATTRIBUTE2_ALLOC_SIZE = 1,
            .HAVE_FUNC_ATTRIBUTE3_FORMAT = 1,
            .HAVE_FUNC_ATTRIBUTE_COLD = 1,
            .HAVE_FUNC_ATTRIBUTE_CONST = 1,
            .HAVE_FUNC_ATTRIBUTE_ERROR = 1,
            .HAVE_FUNC_ATTRIBUTE_MALLOC = 1,
            .HAVE_FUNC_ATTRIBUTE_NORETURN = 1,
            .HAVE_FUNC_ATTRIBUTE_PURE = 1,
            .HAVE_FUNC_ATTRIBUTE_RETURNS_NONNULL = 1,
            .HAVE_FUNC_ATTRIBUTE_SENTINEL = 1,
            .HAVE_FUNC_ATTRIBUTE_UNUSED = 1,
            .HAVE_FUNC_PTR_ATTRIBUTE1_ALLOC_SIZE = 1,
            .HAVE_FUNC_PTR_ATTRIBUTE2_ALLOC_SIZE = 1,
            .HAVE_FUNC_PTR_ATTRIBUTE3_FORMAT = 1,
            .HAVE_FUNC_PTR_ATTRIBUTE_COLD = null,
            .HAVE_FUNC_PTR_ATTRIBUTE_CONST = 1,
            .HAVE_FUNC_PTR_ATTRIBUTE_MALLOC = null,
            .HAVE_FUNC_PTR_ATTRIBUTE_NORETURN = 1,
            .HAVE_FUNC_PTR_ATTRIBUTE_PURE = 1,
            .HAVE_FUNC_PTR_ATTRIBUTE_RETURNS_NONNULL = null,
            .HAVE_FUNC_PTR_ATTRIBUTE_SENTINEL = null,
            .HAVE_FUNC_PTR_ATTRIBUTE_UNUSED = 1,
            .HAVE_GETGID = 1,
            .HAVE_GETPAGESIZE = 1,
            .HAVE_GETRLIMIT = 1,
            .HAVE_GETUID = 1,
            .HAVE_HTOLE16 = null,
            .HAVE_HTOLE32 = null,
            .HAVE_HTOLE64 = null,
            .HAVE_INTRIN_H = null,
            .HAVE_INTTYPES_H = 1,
            .HAVE_IO_H = null,
            .HAVE_ISASCII = 1,
            .HAVE_ISCNTRL = 1,
            .HAVE_MACHINE_ENDIAN_H = 1,
            .HAVE_MEMPCPY = null,
            .HAVE_MEMPSET = null,
            .HAVE_MINIX_CONFIG_H = null,
            .HAVE_MMAP = 1,
            .HAVE_PATHCONF = 1,
            .HAVE_REALPATH = 1,
            .HAVE_SNPRINTF = 1,
            .HAVE_STAT = 1,
            .HAVE_STDARG_H = 1,
            .HAVE_STDBOOL_H = 1,
            .HAVE_STDC_INLINE = 1,
            .HAVE_STDINT_H = 1,
            .HAVE_STDIO_H = 1,
            .HAVE_STDLIB_H = 1,
            .HAVE_STDNORETURN_H = 1,
            .HAVE_STRCASECMP = 1,
            .HAVE_STRICMP = null,
            .HAVE_STRINGS_H = 1,
            .HAVE_STRING_H = 1,
            .HAVE_STRLCPY = 1,
            .HAVE_STRNCASECMP = 1,
            .HAVE_STRNICMP = null,
            .HAVE_STRNLEN = 1,
            .HAVE_STRRCHRNUL = null,
            .HAVE_STRSEP = 1,
            .HAVE_STRUCT_STAT = 1,
            .HAVE_STRUCT__STATI64 = null,
            .HAVE_SYSCONF = 1,
            .HAVE_SYS_ENDIAN_H = null,
            .HAVE_SYS_MMAN_H = 1,
            .HAVE_SYS_PARAM_H = 1,
            .HAVE_SYS_RESOURCE_H = 1,
            .HAVE_SYS_STAT_H = 1,
            .HAVE_SYS_TYPES_H = 1,
            .HAVE_S_ISREG = null,
            .HAVE_TYPEOF = 1,
            .HAVE_UINTPTR_T = 1,
            .HAVE_UNISTD_H = 1,
            .HAVE_VSNPRINTF = 1,
            .HAVE_WCHAR_H = 1,
            .HAVE__ACCESS = null,
            .HAVE__BITSCANREVERSE = null,
            .HAVE__BITSCANREVERSE64 = null,
            .HAVE__BOOL = 1,
            .HAVE__BYTESWAP_UINT64 = null,
            .HAVE__BYTESWAP_ULONG = null,
            .HAVE__BYTESWAP_USHORT = null,
            .HAVE__CHSIZE = null,
            .HAVE__CHSIZE_S = null,
            .HAVE__FILENO = null,
            .HAVE__FSEEKI64 = null,
            .HAVE__FSTATI64 = null,
            .HAVE__FULLPATH = null,
            .HAVE__STATI64 = null,
            .HAVE__FILELENGTHI64 = null,
            .HAVE___BSWAP_16 = null,
            .HAVE___BSWAP_32 = null,
            .HAVE___BSWAP_64 = null,
            .HAVE___BUILTIN_BSWAP16 = 1,
            .HAVE___BUILTIN_BSWAP32 = 1,
            .HAVE___BUILTIN_BSWAP64 = 1,
            .HAVE___BUILTIN_CHOOSE_EXPR = 1,
            .HAVE___BUILTIN_CLZ = 1,
            .HAVE___BUILTIN_CLZL = 1,
            .HAVE___BUILTIN_CLZLL = 1,
            .HAVE___BUILTIN_CONSTANT_P = 1,
            .HAVE___BUILTIN_EXPECT = 1,
            .HAVE___CPU_TO_LE16 = null,
            .HAVE___CPU_TO_LE32 = null,
            .HAVE___CPU_TO_LE64 = null,
            .LDFLAGS_WL_GC_SECTIONS = null,
            .PACKAGE_BUGREPORT = "",
            .PACKAGE_NAME = "",
            .PACKAGE_STRING = "",
            .PACKAGE_TARNAME = "",
            .PACKAGE_URL = "",
            .PACKAGE_VERSION = "",
            .STDC_HEADERS = 1,
            ._ALL_SOURCE = 1,
            ._DARWIN_C_SOURCE = 1,
            .__EXTENSIONS__ = 1,
            ._GNU_SOURCE = 1,
            ._HPUX_ALT_XOPEN_SOCKET_API = 1,
            ._MINIX = null,
            ._NETBSD_SOURCE = 1,
            ._OPENBSD_SOURCE = 1,
            ._POSIX_SOURCE = null,
            ._POSIX_1_SOURCE = null,
            ._POSIX_PTHREAD_SEMANTICS = 1,
            .__STDC_WANT_IEC_60559_ATTRIBS_EXT__ = 1,
            .__STDC_WANT_IEC_60559_BFP_EXT__ = 1,
            .__STDC_WANT_IEC_60559_DFP_EXT__ = 1,
            .__STDC_WANT_IEC_60559_FUNCS_EXT__ = 1,
            .__STDC_WANT_IEC_60559_TYPES_EXT__ = 1,
            .__STDC_WANT_LIB_EXT2__ = 1,
            .__STDC_WANT_MATH_SPEC_FUNCS__ = 1,
            ._TANDEM_SOURCE = 1,
            ._XOPEN_SOURCE = null,
            .WORDS_BIGENDIAN = have(t.cpu.arch.endian() == .big),
            .WORDS_LITTLEENDIAN = have(t.cpu.arch.endian() != .big),
            ._FILE_OFFSET_BITS = null,
            ._LARGEFILE_SOURCE = null,
            ._LARGE_FILES = null,
            .@"const" = .@"const",
            .@"inline" = .@"inline",
            .restrict = .restrict,
            .size_t = null,
            .snprintf = null,
            .typeof = .__typeof,
            .uintptr_t = null,
            .vsnprintf = null,
        })),
        .windows => exe.addConfigHeader(b.addConfigHeader(.{
            .style = .{ .autoconf = b.path("config/config.h.in") },
            .include_path = "config/config.h",
        }, .{
            .ABORT_ON_PANIC = have(optimize == .Debug),
            .AC_APPLE_UNIVERSAL_BUILD = null,
            .CFLAGS_FDATA_SECTIONS = null,
            .CFLAGS_FFUNCTION_SECTIONS = null,
            .CFLAGS_FGNU89_INLINE = null,
            .CFLAGS_FLTO = null,
            .CFLAGS_FNO_COMMON = null,
            .CFLAGS_FNO_OMIT_FRAME_POINTER = null,
            .CFLAGS_FSANITIZE_ADDRESS = null,
            .CFLAGS_FSANITIZE_UNDEFINED = null,
            .CFLAGS_FTRIVIAL_AUTO_VAR_INIT_ZERO = null,
            .CFLAGS_FVISIBILITY_HIDDEN = null,
            .CFLAGS_FWRAPV = null,
            .CFLAGS_GGDB3 = null,
            .CFLAGS_O0 = have(optimize == .Debug),
            .CFLAGS_PEDANTIC = null,
            .CFLAGS_PG = null,
            .CFLAGS_STD_C11 = null,
            .CFLAGS_STD_C17 = 1,
            .CFLAGS_STD_C99 = null,
            .CFLAGS_U_STRICT_ANSI = null,
            .CFLAGS_W = null,
            .CFLAGS_WALL = null,
            .CFLAGS_WC90_C99_COMPAT = null,
            .CFLAGS_WC99_COMPAT = null,
            .CFLAGS_WC99_EXTENSIONS = null,
            .CFLAGS_WERROR = null,
            .CFLAGS_WERROR_ATTRIBUTES = null,
            .CFLAGS_WERROR_COMMENT = null,
            .CFLAGS_WERROR_IMPLICIT = null,
            .CFLAGS_WERROR_MISSING_BRACES = null,
            .CFLAGS_WERROR_MISSING_DECLARATIONS = null,
            .CFLAGS_WERROR_MISSING_PROTOTYPES = null,
            .CFLAGS_WERROR_POINTER_ARITH = null,
            .CFLAGS_WERROR_RETURN_TYPE = null,
            .CFLAGS_WERROR_STRICT_PROTOTYPES = null,
            .CFLAGS_WERROR_TRIGRAPHS = null,
            .CFLAGS_WERROR_UNKNOWN_WARNING_OPTION = null,
            .CFLAGS_WERROR_VLA = null,
            .CFLAGS_WLONG_LONG = null,
            .CFLAGS_WPEDANTIC_MS_FORMAT = null,
            .CFLAGS_WSHIFT_NEGATIVE_VALUE = null,
            .CFLAGS_WSTRINGOP_TRUNCATION = null,
            .CFLAGS_WSUGGEST_ATTRIBUTE_COLD = null,
            .CFLAGS_WSUGGEST_ATTRIBUTE_CONST = null,
            .CFLAGS_WSUGGEST_ATTRIBUTE_FORMAT = null,
            .CFLAGS_WSUGGEST_ATTRIBUTE_MALLOC = null,
            .CFLAGS_WSUGGEST_ATTRIBUTE_NORETURN = null,
            .CFLAGS_WSUGGEST_ATTRIBUTE_PURE = null,
            .HAVE_ACCESS = 1,
            .HAVE_CANONICALIZE_FILE_NAME = null,
            .HAVE_CPU_TO_LE16 = null,
            .HAVE_CPU_TO_LE32 = null,
            .HAVE_CPU_TO_LE64 = null,
            .HAVE_DECL_STRCASECMP = null,
            .HAVE_DECL_STRICMP = 1,
            .HAVE_DECL_STRLCPY = null,
            .HAVE_DECL_STRNCASECMP = null,
            .HAVE_DECL_STRNICMP = 1,
            .HAVE_DECL_STRNLEN = null,
            .HAVE_DECL_STRRCHRNUL = null,
            .HAVE_DECL_STRSEP = null,
            .HAVE_ENDIAN_H = null,
            .HAVE_FACCESSAT = null,
            .HAVE_FCNTL_H = 1,
            .HAVE_FILENO = null,
            .HAVE_FSEEKO = null,
            .HAVE_FSTAT = null,
            .HAVE_FTRUNCATE = null,
            .HAVE_FUNC_ATTRIBUTE1_ALLOC_SIZE = null,
            .HAVE_FUNC_ATTRIBUTE2_ALLOC_SIZE = null,
            .HAVE_FUNC_ATTRIBUTE3_FORMAT = null,
            .HAVE_FUNC_ATTRIBUTE_COLD = null,
            .HAVE_FUNC_ATTRIBUTE_CONST = null,
            .HAVE_FUNC_ATTRIBUTE_ERROR = null,
            .HAVE_FUNC_ATTRIBUTE_MALLOC = null,
            .HAVE_FUNC_ATTRIBUTE_NORETURN = null,
            .HAVE_FUNC_ATTRIBUTE_PURE = null,
            .HAVE_FUNC_ATTRIBUTE_RETURNS_NONNULL = null,
            .HAVE_FUNC_ATTRIBUTE_SENTINEL = null,
            .HAVE_FUNC_ATTRIBUTE_UNUSED = null,
            .HAVE_FUNC_PTR_ATTRIBUTE1_ALLOC_SIZE = null,
            .HAVE_FUNC_PTR_ATTRIBUTE2_ALLOC_SIZE = null,
            .HAVE_FUNC_PTR_ATTRIBUTE3_FORMAT = null,
            .HAVE_FUNC_PTR_ATTRIBUTE_COLD = null,
            .HAVE_FUNC_PTR_ATTRIBUTE_CONST = null,
            .HAVE_FUNC_PTR_ATTRIBUTE_MALLOC = null,
            .HAVE_FUNC_PTR_ATTRIBUTE_NORETURN = null,
            .HAVE_FUNC_PTR_ATTRIBUTE_PURE = null,
            .HAVE_FUNC_PTR_ATTRIBUTE_RETURNS_NONNULL = null,
            .HAVE_FUNC_PTR_ATTRIBUTE_SENTINEL = null,
            .HAVE_FUNC_PTR_ATTRIBUTE_UNUSED = null,
            .HAVE_GETGID = null,
            .HAVE_GETPAGESIZE = null,
            .HAVE_GETRLIMIT = null,
            .HAVE_GETUID = null,
            .HAVE_HTOLE16 = null,
            .HAVE_HTOLE32 = null,
            .HAVE_HTOLE64 = null,
            .HAVE_INTRIN_H = null,
            .HAVE_INTTYPES_H = null,
            .HAVE_IO_H = 1,
            .HAVE_ISASCII = null,
            .HAVE_ISCNTRL = null,
            .HAVE_MACHINE_ENDIAN_H = null,
            .HAVE_MEMPCPY = 1,
            .HAVE_MEMPSET = null,
            .HAVE_MINIX_CONFIG_H = null,
            .HAVE_MMAP = null,
            .HAVE_PATHCONF = null,
            .HAVE_REALPATH = null,
            .HAVE_SNPRINTF = 1,
            .HAVE_STAT = null,
            .HAVE_STDARG_H = null,
            .HAVE_STDBOOL_H = null,
            .HAVE_STDC_INLINE = null,
            .HAVE_STDINT_H = 1,
            .HAVE_STDIO_H = null,
            .HAVE_STDLIB_H = 1,
            .HAVE_STDNORETURN_H = null,
            .HAVE_STRCASECMP = null,
            .HAVE_STRICMP = 1,
            .HAVE_STRINGS_H = null,
            .HAVE_STRING_H = 1,
            .HAVE_STRLCPY = null,
            .HAVE_STRNCASECMP = null,
            .HAVE_STRNICMP = 1,
            .HAVE_STRNLEN = 1,
            .HAVE_STRRCHRNUL = null,
            .HAVE_STRSEP = null,
            .HAVE_STRUCT_STAT = null,
            .HAVE_STRUCT__STATI64 = null,
            .HAVE_SYSCONF = null,
            .HAVE_SYS_ENDIAN_H = null,
            .HAVE_SYS_MMAN_H = null,
            .HAVE_SYS_PARAM_H = null,
            .HAVE_SYS_RESOURCE_H = null,
            .HAVE_SYS_STAT_H = 1,
            .HAVE_SYS_TYPES_H = 1,
            .HAVE_S_ISREG = null,
            .HAVE_TYPEOF = null,
            .HAVE_UINTPTR_T = null,
            .HAVE_UNISTD_H = null,
            .HAVE_VSNPRINTF = 1,
            .HAVE_WCHAR_H = null,
            .HAVE__ACCESS = null,
            .HAVE__BITSCANREVERSE = null,
            .HAVE__BITSCANREVERSE64 = null,
            .HAVE__BOOL = null,
            .HAVE__BYTESWAP_UINT64 = null,
            .HAVE__BYTESWAP_ULONG = null,
            .HAVE__BYTESWAP_USHORT = null,
            .HAVE__CHSIZE = 1,
            .HAVE__CHSIZE_S = null,
            .HAVE__FILENO = 1,
            .HAVE__FSEEKI64 = 1,
            .HAVE__FSTATI64 = 1,
            .HAVE__FULLPATH = 1,
            .HAVE__STATI64 = 1,
            .HAVE__FILELENGTHI64 = 1,
            .HAVE___BSWAP_16 = null,
            .HAVE___BSWAP_32 = null,
            .HAVE___BSWAP_64 = null,
            .HAVE___BUILTIN_BSWAP16 = null,
            .HAVE___BUILTIN_BSWAP32 = null,
            .HAVE___BUILTIN_BSWAP64 = null,
            .HAVE___BUILTIN_CHOOSE_EXPR = null,
            .HAVE___BUILTIN_CLZ = null,
            .HAVE___BUILTIN_CLZL = null,
            .HAVE___BUILTIN_CLZLL = null,
            .HAVE___BUILTIN_CONSTANT_P = null,
            .HAVE___BUILTIN_EXPECT = null,
            .HAVE___CPU_TO_LE16 = null,
            .HAVE___CPU_TO_LE32 = null,
            .HAVE___CPU_TO_LE64 = null,
            .LDFLAGS_WL_GC_SECTIONS = null,
            .PACKAGE_BUGREPORT = "",
            .PACKAGE_NAME = "",
            .PACKAGE_STRING = "",
            .PACKAGE_TARNAME = "",
            .PACKAGE_URL = "",
            .PACKAGE_VERSION = "",
            .STDC_HEADERS = 1,
            ._ALL_SOURCE = 1,
            ._DARWIN_C_SOURCE = 1,
            .__EXTENSIONS__ = 1,
            ._GNU_SOURCE = 1,
            ._HPUX_ALT_XOPEN_SOCKET_API = 1,
            ._MINIX = null,
            ._NETBSD_SOURCE = 1,
            ._OPENBSD_SOURCE = 1,
            ._POSIX_SOURCE = null,
            ._POSIX_1_SOURCE = null,
            ._POSIX_PTHREAD_SEMANTICS = 1,
            .__STDC_WANT_IEC_60559_ATTRIBS_EXT__ = 1,
            .__STDC_WANT_IEC_60559_BFP_EXT__ = 1,
            .__STDC_WANT_IEC_60559_DFP_EXT__ = 1,
            .__STDC_WANT_IEC_60559_FUNCS_EXT__ = 1,
            .__STDC_WANT_IEC_60559_TYPES_EXT__ = 1,
            .__STDC_WANT_LIB_EXT2__ = 1,
            .__STDC_WANT_MATH_SPEC_FUNCS__ = 1,
            ._TANDEM_SOURCE = 1,
            ._XOPEN_SOURCE = null,
            .WORDS_BIGENDIAN = have(t.cpu.arch.endian() == .big),
            .WORDS_LITTLEENDIAN = have(t.cpu.arch.endian() != .big),
            ._FILE_OFFSET_BITS = null,
            ._LARGEFILE_SOURCE = null,
            ._LARGE_FILES = null,
            .@"const" = .@"const",
            .@"inline" = .@"inline",
            .restrict = .__restrict,
            .size_t = null,
            .snprintf = null,
            .typeof = .__typeof,
            .uintptr_t = null,
            .vsnprintf = null,
        })),
        else => @panic("os not supported"),
    }
    const files = [_][]const u8{
        "nasmlib/alloc.c",
        "nasmlib/asprintf.c",
        "nasmlib/badenum.c",
        "nasmlib/bsi.c",
        "nasmlib/crc32.c",
        "nasmlib/crc64.c",
        "nasmlib/file.c",
        "nasmlib/filename.c",
        "nasmlib/ilog2.c",
        "nasmlib/hashtbl.c",
        "nasmlib/md5c.c",
        "nasmlib/mmap.c",
        "nasmlib/nctype.c",
        "nasmlib/path.c",
        "nasmlib/perfhash.c",
        "nasmlib/raa.c",
        "nasmlib/rbtree.c",
        "nasmlib/readnum.c",
        "nasmlib/realpath.c",
        "nasmlib/rlimit.c",
        "nasmlib/saa.c",
        "nasmlib/string.c",
        "nasmlib/strlist.c",
        "nasmlib/ver.c",
        "nasmlib/zerobuf.c",

        "asm/assemble.c",
        "asm/directbl.c",
        "asm/directiv.c",
        "asm/error.c",
        "asm/eval.c",
        "asm/exprdump.c",
        "asm/exprlib.c",
        "asm/floats.c",
        "asm/labels.c",
        "asm/listing.c",
        "asm/nasm.c",
        "asm/parser.c",
        "asm/pptok.c",
        "asm/pragma.c",
        "asm/preproc.c",
        "asm/quote.c",
        "asm/rdstrnum.c",
        "asm/segalloc.c",
        "asm/srcfile.c",
        "asm/stdscan.c",
        "asm/strfunc.c",
        "asm/tokhash.c",
        "asm/warnings.c",

        "stdlib/snprintf.c",
        "stdlib/strlcpy.c",
        "stdlib/strnlen.c",
        "stdlib/strrchrnul.c",
        "stdlib/vsnprintf.c",

        "x86/disp8.c",
        "x86/iflag.c",
        "x86/insnsa.c",
        "x86/insnsb.c",
        "x86/insnsd.c",
        "x86/insnsn.c",
        "x86/regflags.c",
        "x86/regs.c",
        "x86/regvals.c",

        "common/common.c",

        "macros/macros.c",

        "output/codeview.c",
        "output/legacy.c",
        "output/nulldbg.c",
        "output/nullout.c",
        "output/outaout.c",
        "output/outas86.c",
        "output/outbin.c",
        "output/outcoff.c",
        "output/outdbg.c",
        "output/outelf.c",
        "output/outform.c",
        "output/outieee.c",
        "output/outlib.c",
        "output/outmacho.c",
        "output/outobj.c",
    };

    const flags = [_][]const u8{
        "-DHAVE_CONFIG_H",
        "-std=c17",
        "-Wno-implicit-function-declaration",
    };

    exe.addCSourceFiles(.{
        .files = &files,
        .flags = &flags,
    });

    exe.linkLibC();

    b.installArtifact(exe);
}

fn have(c: bool) ?c_int {
    return if (c) 1 else null;
}
