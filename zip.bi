#pragma once

#include once "crt/long.bi"
#include once "crt/errno.bi"
#include once "crt/stdio.bi"
#include once "crt/sys/types.bi"
#include once "crt/time.bi"
#include once "crt/string.bi"

extern "C"

#inclib "zip"

#define _HAD_ZIPINT_H
#define HAD_CONFIG_H
#define _HAD_ZIPCONF_H
#define LIBZIP_VERSION "1.10.1"
const LIBZIP_VERSION_MAJOR = 1
const LIBZIP_VERSION_MINOR = 10
const LIBZIP_VERSION_MICRO = 1
#define _Nullable
#define _Nonnull
const __STDC_FORMAT_MACROS = 1

type zip_int8_t as byte
type zip_uint8_t as ubyte
type zip_int16_t as short
type zip_uint16_t as ushort
type zip_int32_t as long
type zip_uint32_t as ulong
type zip_int64_t as longint
type zip_uint64_t as ulongint

#define ZIP_INT8_MIN ((-ZIP_INT8_MAX) - 1)
const ZIP_INT8_MAX = &h7f
const ZIP_UINT8_MAX = &hff
#define ZIP_INT16_MIN ((-ZIP_INT16_MAX) - 1)
const ZIP_INT16_MAX = &h7fff
const ZIP_UINT16_MAX = &hffff
#define ZIP_INT32_MIN ((-ZIP_INT32_MAX) - cast(clong, 1))
const ZIP_INT32_MAX = cast(clong, &h7fffffff)
const ZIP_UINT32_MAX = cast(culong, &hffffffff)
#define ZIP_INT64_MIN ((-ZIP_INT64_MAX) - 1ll)
const ZIP_INT64_MAX = &h7fffffffffffffffll
const ZIP_UINT64_MAX = &hffffffffffffffffull
#define ENABLE_FDOPEN
#define HAVE__CLOSE
#define HAVE__DUP
#define HAVE__FDOPEN
#define HAVE__FILENO
#define HAVE__SETMODE
#define HAVE__SNPRINTF
#define HAVE__SNPRINTF_S
#define HAVE__SNWPRINTF_S
#define HAVE__STRDUP
#define HAVE__STRICMP
#define HAVE__STRTOI64
#define HAVE__STRTOUI64
#define HAVE__UNLINK
#define HAVE_CRYPTO
#define HAVE_FILENO
#define HAVE_FSEEKO
#define HAVE_FTELLO
#define HAVE_LIBBZ2
#define HAVE_LIBLZMA
#define HAVE_LIBZSTD
#define HAVE_LOCALTIME_S
#define HAVE_MEMCPY_S
#define HAVE_SETMODE
#define HAVE_SNPRINTF
#define HAVE_STRCASECMP
#define HAVE_STRDUP
#define HAVE_STRERROR_S
#define HAVE_STRICMP
#define HAVE_STRNCPY_S
#define HAVE_STRTOLL
#define HAVE_STRTOULL
#define HAVE_STDBOOL_H
#define HAVE_STRINGS_H
#define HAVE_UNISTD_H
#define HAVE_WINDOWS_CRYPTO
const SIZEOF_OFF_T = 4

#ifdef __FB_64BIT__
  '64-bit
  const SIZEOF_SIZE_T = 8
#else
  '32-bit
  const SIZEOF_SIZE_T = 4
#endif

#define HAVE_SHARED
#define PACKAGE "libzip"
#define VERSION_ "1.10.1"
#define _HAD_LIBZIP_COMPAT_H
#define __STDC_LIMIT_MACROS
const __STDC_WANT_LIB_EXT1__ = 1
#define ZIP_EXTERN __declspec(dllexport)
#define EOPNOTSUPP EINVAL
#define EOVERFLOW EFBIG
const O_CLOEXEC = 0
'#define close_ _close
#define dup _dup
#define fdopen _fdopen
#undef strdup
#define strdup _strdup
#define unlink _unlink
#define zip_localtime(t, tm) iif(localtime_s((tm), (t)) = 0, tm, NULL)
#define snprintf_s(buf, bufsz, fmt, __VA_ARGS__...) _snprintf_s((buf), (bufsz), (bufsz), (fmt), __VA_ARGS__)
#define strerrorlen_s(errnum) 8192
const ZIP_OFF_MAX = ZIP_INT32_MAX
#define ZIP_OFF_MIN ZIP_INT32_MIN
const ZIP_FSEEK_MAX = ZIP_OFF_MAX
#define ZIP_FSEEK_MIN ZIP_OFF_MIN

#ifdef __FB_64BIT__
  '64-bit
  const SIZE_MAX = ZIP_INT64_MAX
#else
  '32-bit
  const SIZE_MAX = ZIP_INT32_MAX
#endif

#define PRId64 "lld"
#define PRIu64 "llu"
#define S_ISDIR(mode) (((mode) and S_IFMT) = S_IFDIR)
#define S_ISREG(mode) (((mode) and S_IFMT) = S_IFREG)
#define ZIP_DISABLE_DEPRECATED
#define _HAD_ZIP_H
const ZIP_CREATE = 1
const ZIP_EXCL = 2
const ZIP_CHECKCONS = 4
const ZIP_TRUNCATE = 8
const ZIP_RDONLY = 16
const ZIP_FL_NOCASE = 1u
const ZIP_FL_NODIR = 2u
const ZIP_FL_COMPRESSED = 4u
const ZIP_FL_UNCHANGED = 8u
const ZIP_FL_ENCRYPTED = 32u
const ZIP_FL_ENC_GUESS = 0u
const ZIP_FL_ENC_RAW = 64u
const ZIP_FL_ENC_STRICT = 128u
const ZIP_FL_LOCAL = 256u
const ZIP_FL_CENTRAL = 512u
const ZIP_FL_ENC_UTF_8 = 2048u
const ZIP_FL_ENC_CP437 = 4096u
const ZIP_FL_OVERWRITE = 8192u
const ZIP_AFL_RDONLY = 2u
const ZIP_AFL_IS_TORRENTZIP = 4u
const ZIP_AFL_WANT_TORRENTZIP = 8u
const ZIP_AFL_CREATE_OR_KEEP_FILE_FOR_EMPTY_ARCHIVE = 16u
const ZIP_EXTRA_FIELD_ALL = ZIP_UINT16_MAX
const ZIP_EXTRA_FIELD_NEW = ZIP_UINT16_MAX
const ZIP_LENGTH_TO_END = 0
const ZIP_LENGTH_UNCHECKED = -2
const ZIP_ER_OK = 0
const ZIP_ER_MULTIDISK = 1
const ZIP_ER_RENAME = 2
const ZIP_ER_CLOSE = 3
const ZIP_ER_SEEK = 4
const ZIP_ER_READ = 5
const ZIP_ER_WRITE = 6
const ZIP_ER_CRC = 7
const ZIP_ER_ZIPCLOSED = 8
const ZIP_ER_NOENT = 9
const ZIP_ER_EXISTS = 10
const ZIP_ER_OPEN = 11
const ZIP_ER_TMPOPEN = 12
const ZIP_ER_ZLIB = 13
const ZIP_ER_MEMORY = 14
const ZIP_ER_CHANGED = 15
const ZIP_ER_COMPNOTSUPP = 16
const ZIP_ER_EOF = 17
const ZIP_ER_INVAL = 18
const ZIP_ER_NOZIP = 19
const ZIP_ER_INTERNAL = 20
const ZIP_ER_INCONS = 21
const ZIP_ER_REMOVE = 22
const ZIP_ER_DELETED = 23
const ZIP_ER_ENCRNOTSUPP = 24
const ZIP_ER_RDONLY = 25
const ZIP_ER_NOPASSWD = 26
const ZIP_ER_WRONGPASSWD = 27
const ZIP_ER_OPNOTSUPP = 28
const ZIP_ER_INUSE = 29
const ZIP_ER_TELL = 30
const ZIP_ER_COMPRESSED_DATA = 31
const ZIP_ER_CANCELLED = 32
const ZIP_ER_DATA_LENGTH = 33
const ZIP_ER_NOT_ALLOWED = 34
const ZIP_ET_NONE = 0
const ZIP_ET_SYS = 1
const ZIP_ET_ZLIB = 2
const ZIP_ET_LIBZIP = 3
const ZIP_CM_DEFAULT = -1
const ZIP_CM_STORE = 0
const ZIP_CM_SHRINK = 1
const ZIP_CM_REDUCE_1 = 2
const ZIP_CM_REDUCE_2 = 3
const ZIP_CM_REDUCE_3 = 4
const ZIP_CM_REDUCE_4 = 5
const ZIP_CM_IMPLODE = 6
const ZIP_CM_DEFLATE = 8
const ZIP_CM_DEFLATE64 = 9
const ZIP_CM_PKWARE_IMPLODE = 10
const ZIP_CM_BZIP2 = 12
const ZIP_CM_LZMA = 14
const ZIP_CM_TERSE = 18
const ZIP_CM_LZ77 = 19
const ZIP_CM_LZMA2 = 33
const ZIP_CM_ZSTD = 93
const ZIP_CM_XZ = 95
const ZIP_CM_JPEG = 96
const ZIP_CM_WAVPACK = 97
const ZIP_CM_PPMD = 98
const ZIP_EM_NONE = 0
const ZIP_EM_TRAD_PKWARE = 1
const ZIP_EM_AES_128 = &h0101
const ZIP_EM_AES_192 = &h0102
const ZIP_EM_AES_256 = &h0103
const ZIP_EM_UNKNOWN = &hffff
const ZIP_OPSYS_DOS = &h00u
const ZIP_OPSYS_AMIGA = &h01u
const ZIP_OPSYS_OPENVMS = &h02u
const ZIP_OPSYS_UNIX = &h03u
const ZIP_OPSYS_VM_CMS = &h04u
const ZIP_OPSYS_ATARI_ST = &h05u
const ZIP_OPSYS_OS_2 = &h06u
const ZIP_OPSYS_MACINTOSH = &h07u
const ZIP_OPSYS_Z_SYSTEM = &h08u
const ZIP_OPSYS_CPM = &h09u
const ZIP_OPSYS_WINDOWS_NTFS = &h0au
const ZIP_OPSYS_MVS = &h0bu
const ZIP_OPSYS_VSE = &h0cu
const ZIP_OPSYS_ACORN_RISC = &h0du
const ZIP_OPSYS_VFAT = &h0eu
const ZIP_OPSYS_ALTERNATE_MVS = &h0fu
const ZIP_OPSYS_BEOS = &h10u
const ZIP_OPSYS_TANDEM = &h11u
const ZIP_OPSYS_OS_400 = &h12u
const ZIP_OPSYS_OS_X = &h13u
const ZIP_OPSYS_DEFAULT = ZIP_OPSYS_UNIX

type zip_source_cmd as long
enum
	ZIP_SOURCE_OPEN_
	ZIP_SOURCE_READ_
	ZIP_SOURCE_CLOSE_
	ZIP_SOURCE_STAT_
	ZIP_SOURCE_ERROR_
	ZIP_SOURCE_FREE_
	ZIP_SOURCE_SEEK_
	ZIP_SOURCE_TELL_
	ZIP_SOURCE_BEGIN_WRITE_
	ZIP_SOURCE_COMMIT_WRITE_
	ZIP_SOURCE_ROLLBACK_WRITE_
	ZIP_SOURCE_WRITE_
	ZIP_SOURCE_SEEK_WRITE_
	ZIP_SOURCE_TELL_WRITE_
	ZIP_SOURCE_SUPPORTS_
	ZIP_SOURCE_REMOVE_
	ZIP_SOURCE_RESERVED_1_
	ZIP_SOURCE_BEGIN_WRITE_CLONING_
	ZIP_SOURCE_ACCEPT_EMPTY_
	ZIP_SOURCE_GET_FILE_ATTRIBUTES_
	ZIP_SOURCE_SUPPORTS_REOPEN_
end enum

type zip_source_cmd_t as zip_source_cmd
#define ZIP_SOURCE_MAKE_COMMAND_BITMASK(cmd) (cast(zip_int64_t, 1) shl (cmd))
#define ZIP_SOURCE_CHECK_SUPPORTED(supported, cmd) (((supported) and ZIP_SOURCE_MAKE_COMMAND_BITMASK(cmd)) <> 0)
#define ZIP_SOURCE_SUPPORTS_READABLE (((((ZIP_SOURCE_MAKE_COMMAND_BITMASK(ZIP_SOURCE_OPEN_) or ZIP_SOURCE_MAKE_COMMAND_BITMASK(ZIP_SOURCE_READ_)) or ZIP_SOURCE_MAKE_COMMAND_BITMASK(ZIP_SOURCE_CLOSE_)) or ZIP_SOURCE_MAKE_COMMAND_BITMASK(ZIP_SOURCE_STAT_)) or ZIP_SOURCE_MAKE_COMMAND_BITMASK(ZIP_SOURCE_ERROR_)) or ZIP_SOURCE_MAKE_COMMAND_BITMASK(ZIP_SOURCE_FREE_))
#define ZIP_SOURCE_SUPPORTS_SEEKABLE (((ZIP_SOURCE_SUPPORTS_READABLE or ZIP_SOURCE_MAKE_COMMAND_BITMASK(ZIP_SOURCE_SEEK_)) or ZIP_SOURCE_MAKE_COMMAND_BITMASK(ZIP_SOURCE_TELL_)) or ZIP_SOURCE_MAKE_COMMAND_BITMASK(ZIP_SOURCE_SUPPORTS_))
#define ZIP_SOURCE_SUPPORTS_WRITABLE (((((((ZIP_SOURCE_SUPPORTS_SEEKABLE or ZIP_SOURCE_MAKE_COMMAND_BITMASK(ZIP_SOURCE_BEGIN_WRITE_)) or ZIP_SOURCE_MAKE_COMMAND_BITMASK(ZIP_SOURCE_COMMIT_WRITE_)) or ZIP_SOURCE_MAKE_COMMAND_BITMASK(ZIP_SOURCE_ROLLBACK_WRITE_)) or ZIP_SOURCE_MAKE_COMMAND_BITMASK(ZIP_SOURCE_WRITE_)) or ZIP_SOURCE_MAKE_COMMAND_BITMASK(ZIP_SOURCE_SEEK_WRITE_)) or ZIP_SOURCE_MAKE_COMMAND_BITMASK(ZIP_SOURCE_TELL_WRITE_)) or ZIP_SOURCE_MAKE_COMMAND_BITMASK(ZIP_SOURCE_REMOVE_))

type zip_source_args_seek
	offset as zip_int64_t
	whence as long
end type

type zip_source_args_seek_t as zip_source_args_seek
'' TODO: #define ZIP_SOURCE_GET_ARGS(type, data, len, error) ((len) < sizeof(type) ? zip_error_set((error), ZIP_ER_INVAL, 0), (type *)NULL : (type *)(data))

type zip_error
	zip_err as long
	sys_err as long
	str as zstring ptr
end type

const ZIP_STAT_NAME = &h0001u
const ZIP_STAT_INDEX_ = &h0002u
const ZIP_STAT_SIZE = &h0004u
const ZIP_STAT_COMP_SIZE = &h0008u
const ZIP_STAT_MTIME = &h0010u
const ZIP_STAT_CRC = &h0020u
const ZIP_STAT_COMP_METHOD = &h0040u
const ZIP_STAT_ENCRYPTION_METHOD = &h0080u
const ZIP_STAT_FLAGS = &h0100u

type zip_stat
	valid as zip_uint64_t
	name as const zstring ptr
	index as zip_uint64_t
	size as zip_uint64_t
	comp_size as zip_uint64_t
	mtime as time_t
	crc as zip_uint32_t
	comp_method as zip_uint16_t
	encryption_method as zip_uint16_t
	flags as zip_uint32_t
end type

type zip_buffer_fragment
	data as zip_uint8_t ptr
	length as zip_uint64_t
end type

type zip_file_attributes
	valid as zip_uint64_t
	version as zip_uint8_t
	host_system as zip_uint8_t
	ascii as zip_uint8_t
	version_needed as zip_uint8_t
	external_file_attributes as zip_uint32_t
	general_purpose_bit_flags as zip_uint16_t
	general_purpose_bit_mask as zip_uint16_t
end type

const ZIP_FILE_ATTRIBUTES_HOST_SYSTEM = &h0001u
const ZIP_FILE_ATTRIBUTES_ASCII = &h0002u
const ZIP_FILE_ATTRIBUTES_VERSION_NEEDED = &h0004u
const ZIP_FILE_ATTRIBUTES_EXTERNAL_FILE_ATTRIBUTES = &h0008u
const ZIP_FILE_ATTRIBUTES_GENERAL_PURPOSE_BIT_FLAGS = &h0010u

type zip_t as zip
type zip_error_t as zip_error
type zip_file_t as zip_file
type zip_file_attributes_t as zip_file_attributes
type zip_source_t as zip_source
type zip_stat_t as zip_stat
type zip_buffer_fragment_t as zip_buffer_fragment
type zip_flags_t as zip_uint32_t
type zip_source_callback as function(byval as any ptr, byval as any ptr, byval as zip_uint64_t, byval as zip_source_cmd_t) as zip_int64_t
type zip_source_layered_callback as function(byval as zip_source_t ptr, byval as any ptr, byval as any ptr, byval as zip_uint64_t, byval as zip_source_cmd) as zip_int64_t
type zip_progress_callback as sub(byval as zip_t ptr, byval as double, byval as any ptr)
type zip_cancel_callback as function(byval as zip_t ptr, byval as any ptr) as long

declare function zip_close(byval as zip_t ptr) as long
declare function zip_delete(byval as zip_t ptr, byval as zip_uint64_t) as long
declare function zip_dir_add(byval as zip_t ptr, byval as const zstring ptr, byval as zip_flags_t) as zip_int64_t
declare sub zip_discard(byval as zip_t ptr)
declare function zip_get_error(byval as zip_t ptr) as zip_error_t ptr
declare sub zip_error_clear(byval as zip_t ptr)
declare function zip_error_code_zip(byval as const zip_error_t ptr) as long
declare function zip_error_code_system(byval as const zip_error_t ptr) as long
declare sub zip_error_fini(byval as zip_error_t ptr)
declare sub zip_error_init(byval as zip_error_t ptr)
declare sub zip_error_init_with_code(byval as zip_error_t ptr, byval as long)
declare sub zip_error_set(byval as zip_error_t ptr, byval as long, byval as long)
declare sub zip_error_set_from_source(byval as zip_error_t ptr, byval as zip_source_t ptr)
declare function zip_error_strerror(byval as zip_error_t ptr) as const zstring ptr
declare function zip_error_system_type(byval as const zip_error_t ptr) as long
declare function zip_error_to_data(byval as const zip_error_t ptr, byval as any ptr, byval as zip_uint64_t) as zip_int64_t
declare function zip_fclose(byval as zip_file_t ptr) as long
declare function zip_fdopen(byval as long, byval as long, byval as long ptr) as zip_t ptr
declare function zip_file_add(byval as zip_t ptr, byval as const zstring ptr, byval as zip_source_t ptr, byval as zip_flags_t) as zip_int64_t
declare sub zip_file_attributes_init(byval as zip_file_attributes_t ptr)
declare sub zip_file_error_clear(byval as zip_file_t ptr)
declare function zip_file_extra_field_delete(byval as zip_t ptr, byval as zip_uint64_t, byval as zip_uint16_t, byval as zip_flags_t) as long
declare function zip_file_extra_field_delete_by_id(byval as zip_t ptr, byval as zip_uint64_t, byval as zip_uint16_t, byval as zip_uint16_t, byval as zip_flags_t) as long
declare function zip_file_extra_field_set(byval as zip_t ptr, byval as zip_uint64_t, byval as zip_uint16_t, byval as zip_uint16_t, byval as const zip_uint8_t ptr, byval as zip_uint16_t, byval as zip_flags_t) as long
declare function zip_file_extra_fields_count(byval as zip_t ptr, byval as zip_uint64_t, byval as zip_flags_t) as zip_int16_t
declare function zip_file_extra_fields_count_by_id(byval as zip_t ptr, byval as zip_uint64_t, byval as zip_uint16_t, byval as zip_flags_t) as zip_int16_t
declare function zip_file_extra_field_get(byval as zip_t ptr, byval as zip_uint64_t, byval as zip_uint16_t, byval as zip_uint16_t ptr, byval as zip_uint16_t ptr, byval as zip_flags_t) as const zip_uint8_t ptr
declare function zip_file_extra_field_get_by_id(byval as zip_t ptr, byval as zip_uint64_t, byval as zip_uint16_t, byval as zip_uint16_t, byval as zip_uint16_t ptr, byval as zip_flags_t) as const zip_uint8_t ptr
declare function zip_file_get_comment(byval as zip_t ptr, byval as zip_uint64_t, byval as zip_uint32_t ptr, byval as zip_flags_t) as const zstring ptr
declare function zip_file_get_error(byval as zip_file_t ptr) as zip_error_t ptr
declare function zip_file_get_external_attributes(byval as zip_t ptr, byval as zip_uint64_t, byval as zip_flags_t, byval as zip_uint8_t ptr, byval as zip_uint32_t ptr) as long
declare function zip_file_is_seekable(byval as zip_file_t ptr) as long
declare function zip_file_rename(byval as zip_t ptr, byval as zip_uint64_t, byval as const zstring ptr, byval as zip_flags_t) as long
declare function zip_file_replace(byval as zip_t ptr, byval as zip_uint64_t, byval as zip_source_t ptr, byval as zip_flags_t) as long
declare function zip_file_set_comment(byval as zip_t ptr, byval as zip_uint64_t, byval as const zstring ptr, byval as zip_uint16_t, byval as zip_flags_t) as long
declare function zip_file_set_dostime(byval as zip_t ptr, byval as zip_uint64_t, byval as zip_uint16_t, byval as zip_uint16_t, byval as zip_flags_t) as long
declare function zip_file_set_encryption(byval as zip_t ptr, byval as zip_uint64_t, byval as zip_uint16_t, byval as const zstring ptr) as long
declare function zip_file_set_external_attributes(byval as zip_t ptr, byval as zip_uint64_t, byval as zip_flags_t, byval as zip_uint8_t, byval as zip_uint32_t) as long
declare function zip_file_set_mtime(byval as zip_t ptr, byval as zip_uint64_t, byval as time_t, byval as zip_flags_t) as long
declare function zip_file_strerror(byval as zip_file_t ptr) as const zstring ptr
declare function zip_fopen(byval as zip_t ptr, byval as const zstring ptr, byval as zip_flags_t) as zip_file_t ptr
declare function zip_fopen_encrypted(byval as zip_t ptr, byval as const zstring ptr, byval as zip_flags_t, byval as const zstring ptr) as zip_file_t ptr
declare function zip_fopen_index(byval as zip_t ptr, byval as zip_uint64_t, byval as zip_flags_t) as zip_file_t ptr
declare function zip_fopen_index_encrypted(byval as zip_t ptr, byval as zip_uint64_t, byval as zip_flags_t, byval as const zstring ptr) as zip_file_t ptr
declare function zip_fread(byval as zip_file_t ptr, byval as any ptr, byval as zip_uint64_t) as zip_int64_t
declare function zip_fseek(byval as zip_file_t ptr, byval as zip_int64_t, byval as long) as zip_int8_t
declare function zip_ftell(byval as zip_file_t ptr) as zip_int64_t
declare function zip_get_archive_comment(byval as zip_t ptr, byval as long ptr, byval as zip_flags_t) as const zstring ptr
declare function zip_get_archive_flag(byval as zip_t ptr, byval as zip_flags_t, byval as zip_flags_t) as long
declare function zip_get_name(byval as zip_t ptr, byval as zip_uint64_t, byval as zip_flags_t) as const zstring ptr
declare function zip_get_num_entries(byval as zip_t ptr, byval as zip_flags_t) as zip_int64_t
declare function zip_libzip_version() as const zstring ptr
declare function zip_name_locate(byval as zip_t ptr, byval as const zstring ptr, byval as zip_flags_t) as zip_int64_t
declare function zip_open(byval as const zstring ptr, byval as long, byval as long ptr) as zip_t ptr
declare function zip_open_from_source(byval as zip_source_t ptr, byval as long, byval as zip_error_t ptr) as zip_t ptr
declare function zip_register_progress_callback_with_state(byval as zip_t ptr, byval as double, byval as zip_progress_callback, byval as sub(byval as any ptr), byval as any ptr) as long
declare function zip_register_cancel_callback_with_state(byval as zip_t ptr, byval as zip_cancel_callback, byval as sub(byval as any ptr), byval as any ptr) as long
declare function zip_set_archive_comment(byval as zip_t ptr, byval as const zstring ptr, byval as zip_uint16_t) as long
declare function zip_set_archive_flag(byval as zip_t ptr, byval as zip_flags_t, byval as long) as long
declare function zip_set_default_password(byval as zip_t ptr, byval as const zstring ptr) as long
declare function zip_set_file_compression(byval as zip_t ptr, byval as zip_uint64_t, byval as zip_int32_t, byval as zip_uint32_t) as long
declare function zip_source_begin_write(byval as zip_source_t ptr) as long
declare function zip_source_begin_write_cloning(byval as zip_source_t ptr, byval as zip_uint64_t) as long
declare function zip_source_buffer(byval as zip_t ptr, byval as const any ptr, byval as zip_uint64_t, byval as long) as zip_source_t ptr
declare function zip_source_buffer_create(byval as const any ptr, byval as zip_uint64_t, byval as long, byval as zip_error_t ptr) as zip_source_t ptr
declare function zip_source_buffer_fragment(byval as zip_t ptr, byval as const zip_buffer_fragment_t ptr, byval as zip_uint64_t, byval as long) as zip_source_t ptr
declare function zip_source_buffer_fragment_create(byval as const zip_buffer_fragment_t ptr, byval as zip_uint64_t, byval as long, byval as zip_error_t ptr) as zip_source_t ptr
declare function zip_source_close(byval as zip_source_t ptr) as long
declare function zip_source_commit_write(byval as zip_source_t ptr) as long
declare function zip_source_error(byval as zip_source_t ptr) as zip_error_t ptr
declare function zip_source_file(byval as zip_t ptr, byval as const zstring ptr, byval as zip_uint64_t, byval as zip_int64_t) as zip_source_t ptr
declare function zip_source_file_create(byval as const zstring ptr, byval as zip_uint64_t, byval as zip_int64_t, byval as zip_error_t ptr) as zip_source_t ptr
declare function zip_source_filep(byval as zip_t ptr, byval as FILE ptr, byval as zip_uint64_t, byval as zip_int64_t) as zip_source_t ptr
declare function zip_source_filep_create(byval as FILE ptr, byval as zip_uint64_t, byval as zip_int64_t, byval as zip_error_t ptr) as zip_source_t ptr
declare sub zip_source_free(byval as zip_source_t ptr)
declare function zip_source_function(byval as zip_t ptr, byval as zip_source_callback, byval as any ptr) as zip_source_t ptr
declare function zip_source_function_create(byval as zip_source_callback, byval as any ptr, byval as zip_error_t ptr) as zip_source_t ptr
declare function zip_source_get_file_attributes(byval as zip_source_t ptr, byval as zip_file_attributes_t ptr) as long
declare function zip_source_is_deleted(byval as zip_source_t ptr) as long
declare function zip_source_is_seekable(byval as zip_source_t ptr) as long
declare sub zip_source_keep(byval as zip_source_t ptr)
declare function zip_source_layered(byval as zip_t ptr, byval as zip_source_t ptr, byval as zip_source_layered_callback, byval as any ptr) as zip_source_t ptr
declare function zip_source_layered_create(byval as zip_source_t ptr, byval as zip_source_layered_callback, byval as any ptr, byval as zip_error_t ptr) as zip_source_t ptr
declare function zip_source_make_command_bitmap(byval as zip_source_cmd_t, ...) as zip_int64_t
declare function zip_source_open(byval as zip_source_t ptr) as long
declare function zip_source_pass_to_lower_layer(byval as zip_source_t ptr, byval as any ptr, byval as zip_uint64_t, byval as zip_source_cmd_t) as zip_int64_t
declare function zip_source_read(byval as zip_source_t ptr, byval as any ptr, byval as zip_uint64_t) as zip_int64_t
declare sub zip_source_rollback_write(byval as zip_source_t ptr)
declare function zip_source_seek(byval as zip_source_t ptr, byval as zip_int64_t, byval as long) as long
declare function zip_source_seek_compute_offset(byval as zip_uint64_t, byval as zip_uint64_t, byval as any ptr, byval as zip_uint64_t, byval as zip_error_t ptr) as zip_int64_t
declare function zip_source_seek_write(byval as zip_source_t ptr, byval as zip_int64_t, byval as long) as long
declare function zip_source_stat(byval as zip_source_t ptr, byval as zip_stat_t ptr) as long
declare function zip_source_tell(byval as zip_source_t ptr) as zip_int64_t
declare function zip_source_tell_write(byval as zip_source_t ptr) as zip_int64_t
declare function zip_source_win32a(byval as zip_t ptr, byval as const zstring ptr, byval as zip_uint64_t, byval as zip_int64_t) as zip_source_t ptr
declare function zip_source_win32a_create(byval as const zstring ptr, byval as zip_uint64_t, byval as zip_int64_t, byval as zip_error_t ptr) as zip_source_t ptr
declare function zip_source_win32handle(byval as zip_t ptr, byval as any ptr, byval as zip_uint64_t, byval as zip_int64_t) as zip_source_t ptr
declare function zip_source_win32handle_create(byval as any ptr, byval as zip_uint64_t, byval as zip_int64_t, byval as zip_error_t ptr) as zip_source_t ptr
declare function zip_source_win32w(byval as zip_t ptr, byval as const wstring ptr, byval as zip_uint64_t, byval as zip_int64_t) as zip_source_t ptr
declare function zip_source_win32w_create(byval as const wstring ptr, byval as zip_uint64_t, byval as zip_int64_t, byval as zip_error_t ptr) as zip_source_t ptr
declare function zip_source_window_create(byval as zip_source_t ptr, byval as zip_uint64_t, byval as zip_int64_t, byval as zip_error_t ptr) as zip_source_t ptr
declare function zip_source_write(byval as zip_source_t ptr, byval as const any ptr, byval as zip_uint64_t) as zip_int64_t
declare function zip_source_zip_file(byval as zip_t ptr, byval as zip_t ptr, byval as zip_uint64_t, byval as zip_flags_t, byval as zip_uint64_t, byval as zip_int64_t, byval as const zstring ptr) as zip_source_t ptr
declare function zip_source_zip_file_create(byval as zip_t ptr, byval as zip_uint64_t, byval as zip_flags_t, byval as zip_uint64_t, byval as zip_int64_t, byval as const zstring ptr, byval as zip_error_t ptr) as zip_source_t ptr
declare function zip_stat(byval as zip_t ptr, byval as const zstring ptr, byval as zip_flags_t, byval as zip_stat_t ptr) as long
declare function zip_stat_index(byval as zip_t ptr, byval as zip_uint64_t, byval as zip_flags_t, byval as zip_stat_t ptr) as long
declare sub zip_stat_init(byval as zip_stat_t ptr)
declare function zip_strerror(byval as zip_t ptr) as const zstring ptr
declare function zip_unchange(byval as zip_t ptr, byval as zip_uint64_t) as long
declare function zip_unchange_all(byval as zip_t ptr) as long
declare function zip_unchange_archive(byval as zip_t ptr) as long
declare function zip_compression_method_supported(byval method as zip_int32_t, byval compress as long) as long
declare function zip_encryption_method_supported(byval method as zip_uint16_t, byval encode as long) as long

#define CENTRAL_MAGIC !"PK\1\2"
#define LOCAL_MAGIC !"PK\3\4"
#define EOCD_MAGIC !"PK\5\6"
#define DATADES_MAGIC !"PK\a\b"
#define EOCD64LOC_MAGIC !"PK\6\a"
#define EOCD64_MAGIC !"PK\6\6"
const CDENTRYSIZE = 46u
const LENTRYSIZE = 30
const MAXCOMLEN = 65536
const MAXEXTLEN = 65536
const EOCDLEN = 22
const EOCD64LOCLEN = 20
const EOCD64LEN = 56
const CDBUFSIZE = (MAXCOMLEN + EOCDLEN) + EOCD64LOCLEN
const BUFSIZE = 8192
const EFZIP64SIZE = 28
const EF_WINZIP_AES_SIZE = 7
const MAX_DATA_DESCRIPTOR_LENGTH = 24
#define TORRENTZIP_SIGNATURE "TORRENTZIPPED-"
const TORRENTZIP_SIGNATURE_LENGTH = 14
const TORRENTZIP_CRC_LENGTH = 8
const TORRENTZIP_MEM_LEVEL = 8
const TORRENTZIP_COMPRESSION_FLAGS = ZIP_UINT16_MAX
const ZIP_CRYPTO_PKWARE_HEADERLEN = 12
const ZIP_CM_REPLACED_DEFAULT = -2
const ZIP_CM_WINZIP_AES = 99
const WINZIP_AES_PASSWORD_VERIFY_LENGTH = 2
const WINZIP_AES_MAX_HEADER_LENGTH = 16 + WINZIP_AES_PASSWORD_VERIFY_LENGTH
const AES_BLOCK_SIZE = 16
const HMAC_LENGTH = 10
#define SALT_LENGTH(method) iif((method) = ZIP_EM_AES_128, 8, iif((method) = ZIP_EM_AES_192, 12, 16))
#define ZIP_CM_IS_DEFAULT(x) (((x) = ZIP_CM_DEFAULT) orelse ((x) = ZIP_CM_REPLACED_DEFAULT))
#define ZIP_CM_ACTUAL(x) cast(zip_uint16_t, iif(ZIP_CM_IS_DEFAULT(x), ZIP_CM_DEFLATE, (x)))
const ZIP_EF_UTF_8_COMMENT = &h6375
const ZIP_EF_UTF_8_NAME = &h7075
const ZIP_EF_WINZIP_AES = &h9901
const ZIP_EF_ZIP64 = &h0001
#define ZIP_EF_IS_INTERNAL(id) (((((id) = ZIP_EF_UTF_8_COMMENT) orelse ((id) = ZIP_EF_UTF_8_NAME)) orelse ((id) = ZIP_EF_WINZIP_AES)) orelse ((id) = ZIP_EF_ZIP64))
const ZIP_EXT_ATTRIB_DEFAULT = culng(&o100666u shl 16)
const ZIP_EXT_ATTRIB_DEFAULT_DIR = culng(&o040777u shl 16)
const ZIP_FILE_ATTRIBUTES_GENERAL_PURPOSE_BIT_FLAGS_ALLOWED_MASK = &h0836
#define ZIP_MAX(a, b) iif((a) > (b), (a), (b))
#define ZIP_MIN(a, b) iif((a) < (b), (a), (b))
const ZIP_CODEC_DECODE = 0
const ZIP_CODEC_ENCODE = 1
type zip_encryption_implementation as function(byval as zip_t ptr, byval as zip_source_t ptr, byval as zip_uint16_t, byval as long, byval as const zstring ptr) as zip_source_t ptr
declare function _zip_get_encryption_implementation(byval method as zip_uint16_t, byval operation as long) as zip_encryption_implementation

type zip_compression_status as long
enum
	ZIP_COMPRESSION_OK
	ZIP_COMPRESSION_END
	ZIP_COMPRESSION_ERROR
	ZIP_COMPRESSION_NEED_DATA
end enum

type zip_compression_status_t as zip_compression_status

type zip_compression_algorithm
	maximum_compressed_size as function(byval uncompressed_size as zip_uint64_t) as zip_uint64_t
	allocate as function(byval method as zip_uint16_t, byval compression_flags as zip_uint32_t, byval error as zip_error_t ptr) as any ptr
	deallocate as sub(byval ctx as any ptr)
	general_purpose_bit_flags as function(byval ctx as any ptr) as zip_uint16_t
	version_needed as zip_uint8_t
	start as function(byval ctx as any ptr, byval st as zip_stat_t ptr, byval attributes as zip_file_attributes_t ptr) as boolean
	as function(byval ctx as any ptr) as boolean end
	input as function(byval ctx as any ptr, byval data as zip_uint8_t ptr, byval length as zip_uint64_t) as boolean
	end_of_input as sub(byval ctx as any ptr)
	process as function(byval ctx as any ptr, byval data as zip_uint8_t ptr, byval length as zip_uint64_t ptr) as zip_compression_status_t
end type

type zip_compression_algorithm_t as zip_compression_algorithm
extern zip_algorithm_bzip2_compress as zip_compression_algorithm_t
extern zip_algorithm_bzip2_decompress as zip_compression_algorithm_t
extern zip_algorithm_deflate_compress as zip_compression_algorithm_t
extern zip_algorithm_deflate_decompress as zip_compression_algorithm_t
extern zip_algorithm_xz_compress as zip_compression_algorithm_t
extern zip_algorithm_xz_decompress as zip_compression_algorithm_t
extern zip_algorithm_zstd_compress as zip_compression_algorithm_t
extern zip_algorithm_zstd_decompress as zip_compression_algorithm_t

declare function _zip_get_compression_algorithm(byval method as zip_int32_t, byval compress as boolean) as zip_compression_algorithm_t ptr
declare function zip_get_extra_field_by_id(byval as zip_t ptr, byval as long, byval as long, byval as zip_uint16_t, byval as long, byval as zip_uint16_t ptr) as const zip_uint8_t ptr
declare function zip_source_compress(byval za as zip_t ptr, byval src as zip_source_t ptr, byval cm as zip_int32_t, byval compression_flags as zip_uint32_t) as zip_source_t ptr
declare function zip_source_crc_create(byval as zip_source_t ptr, byval as long, byval error as zip_error_t ptr) as zip_source_t ptr
declare function zip_source_decompress(byval za as zip_t ptr, byval src as zip_source_t ptr, byval cm as zip_int32_t) as zip_source_t ptr
declare function zip_source_pkware_decode(byval as zip_t ptr, byval as zip_source_t ptr, byval as zip_uint16_t, byval as long, byval as const zstring ptr) as zip_source_t ptr
declare function zip_source_pkware_encode(byval as zip_t ptr, byval as zip_source_t ptr, byval as zip_uint16_t, byval as long, byval as const zstring ptr) as zip_source_t ptr
declare function zip_source_remove(byval as zip_source_t ptr) as long
declare function zip_source_supports(byval src as zip_source_t ptr) as zip_int64_t
declare function zip_source_supports_reopen(byval src as zip_source_t ptr) as boolean
declare function zip_source_winzip_aes_decode(byval as zip_t ptr, byval as zip_source_t ptr, byval as zip_uint16_t, byval as long, byval as const zstring ptr) as zip_source_t ptr
declare function zip_source_winzip_aes_encode(byval as zip_t ptr, byval as zip_source_t ptr, byval as zip_uint16_t, byval as long, byval as const zstring ptr) as zip_source_t ptr
declare function zip_source_buffer_with_attributes(byval za as zip_t ptr, byval data as const any ptr, byval len as zip_uint64_t, byval freep as long, byval attributes as zip_file_attributes_t ptr) as zip_source_t ptr
declare function zip_source_buffer_with_attributes_create(byval data as const any ptr, byval len as zip_uint64_t, byval freep as long, byval attributes as zip_file_attributes_t ptr, byval error as zip_error_t ptr) as zip_source_t ptr

type zip_les as long
enum
	ZIP_LES_NONE
	ZIP_LES_UPPER
	ZIP_LES_LOWER
	ZIP_LES_INVAL
end enum

const ZIP_DETAIL_ET_GLOBAL = 0
const ZIP_DETAIL_ET_ENTRY = 1

type _zip_err_info
	as long type
	description as const zstring ptr
end type

'extern _zip_err_str(0 to ...) as const _zip_err_info
EXTERN AS CONST ZSTRING CONST PTR _zip_err_str
extern _zip_err_str_count as const long
'extern _zip_err_details(0 to ...) as const _zip_err_info
EXTERN AS CONST ZSTRING CONST PTR _zip_err_details
extern _zip_err_details_count as const long

const MAX_DETAIL_INDEX = &h7fffff
#define MAKE_DETAIL_WITH_INDEX(error, index) ((iif((index) > MAX_DETAIL_INDEX, MAX_DETAIL_INDEX, clng(index)) shl 8) or (error))
#define GET_INDEX_FROM_DETAIL(error) (((error) shr 8) and MAX_DETAIL_INDEX)
#define GET_ERROR_FROM_DETAIL(error) ((error) and &hff)
#define ADD_INDEX_TO_DETAIL(error, index) MAKE_DETAIL_WITH_INDEX(GET_ERROR_FROM_DETAIL(error), (index))
const ZIP_ER_DETAIL_NO_DETAIL = 0
const ZIP_ER_DETAIL_CDIR_OVERLAPS_EOCD = 1
const ZIP_ER_DETAIL_COMMENT_LENGTH_INVALID = 2
const ZIP_ER_DETAIL_CDIR_LENGTH_INVALID = 3
const ZIP_ER_DETAIL_CDIR_ENTRY_INVALID = 4
const ZIP_ER_DETAIL_CDIR_WRONG_ENTRIES_COUNT = 5
const ZIP_ER_DETAIL_ENTRY_HEADER_MISMATCH = 6
const ZIP_ER_DETAIL_EOCD_LENGTH_INVALID = 7
const ZIP_ER_DETAIL_EOCD64_OVERLAPS_EOCD = 8
const ZIP_ER_DETAIL_EOCD64_WRONG_MAGIC = 9
const ZIP_ER_DETAIL_EOCD64_MISMATCH = 10
const ZIP_ER_DETAIL_CDIR_INVALID = 11
const ZIP_ER_DETAIL_VARIABLE_SIZE_OVERFLOW = 12
const ZIP_ER_DETAIL_INVALID_UTF8_IN_FILENAME = 13
const ZIP_ER_DETAIL_INVALID_UTF8_IN_COMMENT = 13
const ZIP_ER_DETAIL_INVALID_ZIP64_EF = 14
const ZIP_ER_DETAIL_INVALID_WINZIPAES_EF = 14
const ZIP_ER_DETAIL_EF_TRAILING_GARBAGE = 15
const ZIP_ER_DETAIL_INVALID_EF_LENGTH = 16
const ZIP_ER_DETAIL_INVALID_FILE_LENGTH = 17
const ZIP_GPBF_ENCRYPTED = &h0001u
const ZIP_GPBF_DATA_DESCRIPTOR = &h0008u
const ZIP_GPBF_STRONG_ENCRYPTION = &h0040u
const ZIP_GPBF_ENCODING_UTF_8 = &h0800u
const ZIP_EF_LOCAL = ZIP_FL_LOCAL
const ZIP_EF_CENTRAL = ZIP_FL_CENTRAL
const ZIP_EF_BOTH = culng(ZIP_EF_LOCAL or ZIP_EF_CENTRAL)
const ZIP_FL_FORCE_ZIP64 = 1024
const ZIP_FL_ENCODING_ALL = culng(culng(ZIP_FL_ENC_GUESS or ZIP_FL_ENC_CP437) or ZIP_FL_ENC_UTF_8)

type zip_encoding_type as long
enum
	ZIP_ENCODING_UNKNOWN
	ZIP_ENCODING_ASCII
	ZIP_ENCODING_UTF8_KNOWN
	ZIP_ENCODING_UTF8_GUESSED
	ZIP_ENCODING_CP437
	ZIP_ENCODING_ERROR
end enum

type zip_encoding_type_t as zip_encoding_type
type zip_cdir_t as zip_cdir
type zip_dirent_t as zip_dirent
type zip_entry_t as zip_entry
type zip_extra_field_t as zip_extra_field
type zip_string_t as zip_string
type zip_buffer_t as zip_buffer
type zip_hash_t as zip_hash
type zip_progress_t as zip_progress

type zip
	src as zip_source_t ptr
	open_flags as ulong
	error as zip_error_t
	flags as ulong
	ch_flags as ulong
	default_password as zstring ptr
	comment_orig as zip_string_t ptr
	comment_changes as zip_string_t ptr
	comment_changed as boolean
	nentry as zip_uint64_t
	nentry_alloc as zip_uint64_t
	entry as zip_entry_t ptr
	nopen_source as ulong
	nopen_source_alloc as ulong
	open_source as zip_source_t ptr ptr
	names as zip_hash_t ptr
	progress as zip_progress_t ptr
	write_crc as zip_uint32_t ptr
end type

type zip_file
	error as zip_error_t
	src as zip_source_t ptr
end type

const ZIP_DIRENT_COMP_METHOD = &h0001u
const ZIP_DIRENT_FILENAME = &h0002u
const ZIP_DIRENT_COMMENT = &h0004u
const ZIP_DIRENT_EXTRA_FIELD = &h0008u
const ZIP_DIRENT_ATTRIBUTES = &h0010u
const ZIP_DIRENT_LAST_MOD = &h0020u
const ZIP_DIRENT_ENCRYPTION_METHOD = &h0040u
const ZIP_DIRENT_PASSWORD = &h0080u
const ZIP_DIRENT_ALL = ZIP_UINT32_MAX

type zip_dirent
	changed as zip_uint32_t
	local_extra_fields_read as boolean
	cloned as boolean
	crc_valid as boolean
	version_madeby as zip_uint16_t
	version_needed as zip_uint16_t
	bitflags as zip_uint16_t
	comp_method as zip_int32_t
	last_mod as time_t
	crc as zip_uint32_t
	comp_size as zip_uint64_t
	uncomp_size as zip_uint64_t
	filename as zip_string_t ptr
	extra_fields as zip_extra_field_t ptr
	comment as zip_string_t ptr
	disk_number as zip_uint32_t
	int_attrib as zip_uint16_t
	ext_attrib as zip_uint32_t
	offset as zip_uint64_t
	compression_level as zip_uint32_t
	encryption_method as zip_uint16_t
	password as zstring ptr
end type

type zip_cdir
	entry as zip_entry_t ptr
	nentry as zip_uint64_t
	nentry_alloc as zip_uint64_t
	size as zip_uint64_t
	offset as zip_uint64_t
	comment as zip_string_t ptr
	is_zip64 as boolean
end type

type zip_extra_field
	next as zip_extra_field_t ptr
	flags as zip_flags_t
	id as zip_uint16_t
	size as zip_uint16_t
	data as zip_uint8_t ptr
end type

type zip_source_write_state as long
enum
	ZIP_SOURCE_WRITE_CLOSED
	ZIP_SOURCE_WRITE_OPEN
	ZIP_SOURCE_WRITE_FAILED
	ZIP_SOURCE_WRITE_REMOVED
end enum

type zip_source_write_state_t as zip_source_write_state

union zip_source_cb
	f as zip_source_callback
	l as zip_source_layered_callback
end union

type zip_source
	src as zip_source_t ptr
	cb as zip_source_cb
	ud as any ptr
	error as zip_error_t
	supports as zip_int64_t
	open_count as ulong
	write_state as zip_source_write_state_t
	source_closed as boolean
	source_archive as zip_t ptr
	refcount as ulong
	eof as boolean
	had_read_error as boolean
	bytes_read as zip_uint64_t
end type

#define ZIP_SOURCE_IS_OPEN_READING(src) ((src)->open_count > 0)
#define ZIP_SOURCE_IS_OPEN_WRITING(src) ((src)->write_state = ZIP_SOURCE_WRITE_OPEN)
#define ZIP_SOURCE_IS_LAYERED(src) ((src)->src <> NULL)

type zip_entry
	orig as zip_dirent_t ptr
	changes as zip_dirent_t ptr
	source as zip_source_t ptr
	deleted as boolean
end type

type zip_string
	raw as zip_uint8_t ptr
	length as zip_uint16_t
	encoding as zip_encoding_type
	converted as zip_uint8_t ptr
	converted_length as zip_uint32_t
end type

'' TODO: #define DEFINE_BYTE_ARRAY(buf, size) zip_uint8_t buf[size]
#define byte_array_init(buf, size) 1
#define byte_array_fini(buf) 0

type zip_buffer
	ok as boolean
	free_data as boolean
	data as zip_uint8_t ptr
	size as zip_uint64_t
	offset as zip_uint64_t
end type

type zip_filelist
	idx as zip_uint64_t
	name as const zstring ptr
end type

type zip_filelist_t as zip_filelist
type zip_winzip_aes_t as _zip_winzip_aes

type _zip_pkware_keys
	key(0 to 2) as zip_uint32_t
end type

type zip_pkware_keys_t as _zip_pkware_keys
'#define ZIP_MAX(a, b) iif((a) > (b), (a), (b))
'#define ZIP_MIN(a, b) iif((a) < (b), (a), (b))
#define ZIP_ENTRY_CHANGED(e, f) ((e)->changes andalso ((e)->changes->changed and (f)))
#define ZIP_ENTRY_DATA_CHANGED(x) ((x)->source <> NULL)
#define ZIP_ENTRY_HAS_CHANGES(e) ((ZIP_ENTRY_DATA_CHANGED(e) orelse (e)->deleted) orelse ZIP_ENTRY_CHANGED((e), ZIP_DIRENT_ALL))
#define ZIP_IS_RDONLY(za) ((za)->ch_flags and ZIP_AFL_RDONLY)
#define ZIP_IS_TORRENTZIP(za) ((za)->flags and ZIP_AFL_IS_TORRENTZIP)
#define ZIP_WANT_TORRENTZIP(za) ((za)->ch_flags and ZIP_AFL_WANT_TORRENTZIP)
#define _zip_crypto_clear(b, l) memset((b), 0, (l))

declare function _zip_add_entry(byval as zip_t ptr) as zip_int64_t
declare function _zip_buffer_data(byval buffer as zip_buffer_t ptr) as zip_uint8_t ptr
declare function _zip_buffer_eof(byval buffer as zip_buffer_t ptr) as boolean
declare sub _zip_buffer_free(byval buffer as zip_buffer_t ptr)
declare function _zip_buffer_get(byval buffer as zip_buffer_t ptr, byval length as zip_uint64_t) as zip_uint8_t ptr
declare function _zip_buffer_get_16(byval buffer as zip_buffer_t ptr) as zip_uint16_t
declare function _zip_buffer_get_32(byval buffer as zip_buffer_t ptr) as zip_uint32_t
declare function _zip_buffer_get_64(byval buffer as zip_buffer_t ptr) as zip_uint64_t
declare function _zip_buffer_get_8(byval buffer as zip_buffer_t ptr) as zip_uint8_t
declare function _zip_buffer_left(byval buffer as zip_buffer_t ptr) as zip_uint64_t
declare function _zip_buffer_new(byval data as zip_uint8_t ptr, byval size as zip_uint64_t) as zip_buffer_t ptr
declare function _zip_buffer_new_from_source(byval src as zip_source_t ptr, byval size as zip_uint64_t, byval buf as zip_uint8_t ptr, byval error as zip_error_t ptr) as zip_buffer_t ptr
declare function _zip_buffer_offset(byval buffer as zip_buffer_t ptr) as zip_uint64_t
declare function _zip_buffer_ok(byval buffer as zip_buffer_t ptr) as boolean
declare function _zip_buffer_peek(byval buffer as zip_buffer_t ptr, byval length as zip_uint64_t) as zip_uint8_t ptr
declare function _zip_buffer_put(byval buffer as zip_buffer_t ptr, byval src as const any ptr, byval length as uinteger) as long
declare function _zip_buffer_put_16(byval buffer as zip_buffer_t ptr, byval i as zip_uint16_t) as long
declare function _zip_buffer_put_32(byval buffer as zip_buffer_t ptr, byval i as zip_uint32_t) as long
declare function _zip_buffer_put_64(byval buffer as zip_buffer_t ptr, byval i as zip_uint64_t) as long
declare function _zip_buffer_put_8(byval buffer as zip_buffer_t ptr, byval i as zip_uint8_t) as long
declare function _zip_buffer_read(byval buffer as zip_buffer_t ptr, byval data as zip_uint8_t ptr, byval length as zip_uint64_t) as zip_uint64_t
declare function _zip_buffer_skip(byval buffer as zip_buffer_t ptr, byval length as zip_uint64_t) as long
declare function _zip_buffer_set_offset(byval buffer as zip_buffer_t ptr, byval offset as zip_uint64_t) as long
declare function _zip_buffer_size(byval buffer as zip_buffer_t ptr) as zip_uint64_t
declare sub _zip_cdir_free(byval as zip_cdir_t ptr)
declare function _zip_cdir_grow(byval cd as zip_cdir_t ptr, byval additional_entries as zip_uint64_t, byval error as zip_error_t ptr) as boolean
declare function _zip_cdir_new(byval as zip_uint64_t, byval as zip_error_t ptr) as zip_cdir_t ptr
declare function _zip_cdir_write(byval za as zip_t ptr, byval filelist as const zip_filelist_t ptr, byval survivors as zip_uint64_t) as zip_int64_t
declare function _zip_d2u_time(byval as zip_uint16_t, byval as zip_uint16_t) as time_t
declare sub _zip_deregister_source(byval za as zip_t ptr, byval src as zip_source_t ptr)
declare sub _zip_dirent_apply_attributes(byval as zip_dirent_t ptr, byval as zip_file_attributes_t ptr, byval as boolean, byval as zip_uint32_t)
declare function _zip_dirent_clone(byval as const zip_dirent_t ptr) as zip_dirent_t ptr
declare sub _zip_dirent_free(byval as zip_dirent_t ptr)
declare sub _zip_dirent_finalize(byval as zip_dirent_t ptr)
declare sub _zip_dirent_init(byval as zip_dirent_t ptr)
declare function _zip_dirent_needs_zip64(byval as const zip_dirent_t ptr, byval as zip_flags_t) as boolean
declare function _zip_dirent_new() as zip_dirent_t ptr
declare function zip_dirent_process_ef_zip64(byval zde as zip_dirent_t ptr, byval ef as const zip_uint8_t ptr, byval got_len as zip_uint64_t, byval local as boolean, byval error as zip_error_t ptr) as boolean
declare function _zip_dirent_read(byval zde as zip_dirent_t ptr, byval src as zip_source_t ptr, byval buffer as zip_buffer_t ptr, byval local as boolean, byval error as zip_error_t ptr) as zip_int64_t
declare sub _zip_dirent_set_version_needed(byval de as zip_dirent_t ptr, byval force_zip64 as boolean)
declare sub zip_dirent_torrentzip_normalize(byval de as zip_dirent_t ptr)
declare function _zip_dirent_size(byval src as zip_source_t ptr, byval as zip_uint16_t, byval as zip_error_t ptr) as zip_int32_t
declare function _zip_dirent_write(byval za as zip_t ptr, byval dirent as zip_dirent_t ptr, byval flags as zip_flags_t) as long
declare function _zip_ef_clone(byval as const zip_extra_field_t ptr, byval as zip_error_t ptr) as zip_extra_field_t ptr
declare function _zip_ef_delete_by_id(byval as zip_extra_field_t ptr, byval as zip_uint16_t, byval as zip_uint16_t, byval as zip_flags_t) as zip_extra_field_t ptr
declare sub _zip_ef_free(byval as zip_extra_field_t ptr)
declare function _zip_ef_get_by_id(byval as const zip_extra_field_t ptr, byval as zip_uint16_t ptr, byval as zip_uint16_t, byval as zip_uint16_t, byval as zip_flags_t, byval as zip_error_t ptr) as const zip_uint8_t ptr
declare function _zip_ef_merge(byval as zip_extra_field_t ptr, byval as zip_extra_field_t ptr) as zip_extra_field_t ptr
declare function _zip_ef_new(byval as zip_uint16_t, byval as zip_uint16_t, byval as const zip_uint8_t ptr, byval as zip_flags_t) as zip_extra_field_t ptr
declare function _zip_ef_parse(byval as const zip_uint8_t ptr, byval as zip_uint16_t, byval as zip_flags_t, byval as zip_extra_field_t ptr ptr, byval as zip_error_t ptr) as boolean
declare function _zip_ef_remove_internal(byval as zip_extra_field_t ptr) as zip_extra_field_t ptr
declare function _zip_ef_size(byval as const zip_extra_field_t ptr, byval as zip_flags_t) as zip_uint16_t
declare function _zip_ef_write(byval za as zip_t ptr, byval ef as const zip_extra_field_t ptr, byval flags as zip_flags_t) as long
declare sub _zip_entry_finalize(byval as zip_entry_t ptr)
declare sub _zip_entry_init(byval as zip_entry_t ptr)
declare sub _zip_error_clear(byval as zip_error_t ptr)
declare sub _zip_error_get(byval as const zip_error_t ptr, byval as long ptr, byval as long ptr)
declare sub _zip_error_copy(byval dst as zip_error_t ptr, byval src as const zip_error_t ptr)
declare function _zip_extract_extra_field_by_id(byval as zip_error_t ptr, byval as zip_uint16_t, byval as long, byval as const zip_uint8_t ptr, byval as zip_uint16_t, byval as zip_uint16_t ptr) as const zip_uint8_t ptr
declare function _zip_file_extra_field_prepare_for_change(byval as zip_t ptr, byval as zip_uint64_t) as long
declare function _zip_file_fillbuf(byval as any ptr, byval as uinteger, byval as zip_file_t ptr) as long
declare function _zip_file_get_end(byval za as const zip_t ptr, byval index as zip_uint64_t, byval error as zip_error_t ptr) as zip_uint64_t
declare function _zip_file_get_offset(byval as const zip_t ptr, byval as zip_uint64_t, byval as zip_error_t ptr) as zip_uint64_t
declare function _zip_get_dirent(byval as zip_t ptr, byval as zip_uint64_t, byval as zip_flags_t, byval as zip_error_t ptr) as zip_dirent_t ptr
declare function _zip_guess_encoding(byval as zip_string_t ptr, byval as zip_encoding_type) as zip_encoding_type
declare function _zip_cp437_to_utf8(byval as const zip_uint8_t const ptr, byval as zip_uint32_t, byval as zip_uint32_t ptr, byval as zip_error_t ptr) as zip_uint8_t ptr
declare function _zip_hash_add(byval hash as zip_hash_t ptr, byval name as const zip_uint8_t ptr, byval index as zip_uint64_t, byval flags as zip_flags_t, byval error as zip_error_t ptr) as boolean
declare function _zip_hash_delete(byval hash as zip_hash_t ptr, byval key as const zip_uint8_t ptr, byval error as zip_error_t ptr) as boolean
declare sub _zip_hash_free(byval hash as zip_hash_t ptr)
declare function _zip_hash_lookup(byval hash as zip_hash_t ptr, byval name as const zip_uint8_t ptr, byval flags as zip_flags_t, byval error as zip_error_t ptr) as zip_int64_t
declare function _zip_hash_new(byval error as zip_error_t ptr) as zip_hash_t ptr
declare function _zip_hash_reserve_capacity(byval hash as zip_hash_t ptr, byval capacity as zip_uint64_t, byval error as zip_error_t ptr) as boolean
declare function _zip_hash_revert(byval hash as zip_hash_t ptr, byval error as zip_error_t ptr) as boolean
declare function _zip_mkstempm(byval path as zstring ptr, byval mode as long, byval create_file as boolean) as long
declare function _zip_open(byval as zip_source_t ptr, byval as ulong, byval as zip_error_t ptr) as zip_t ptr
declare sub _zip_progress_end(byval progress as zip_progress_t ptr)
declare sub _zip_progress_free(byval progress as zip_progress_t ptr)
declare function _zip_progress_start(byval progress as zip_progress_t ptr) as long
declare function _zip_progress_subrange(byval progress as zip_progress_t ptr, byval start as double, byval end as double) as long
declare function _zip_progress_update(byval progress as zip_progress_t ptr, byval value as double) as long
declare function zip_secure_random(byval buffer as zip_uint8_t ptr, byval length as zip_uint16_t) as boolean
declare function zip_random_uint32() as zip_uint32_t
declare function _zip_read(byval src as zip_source_t ptr, byval data as zip_uint8_t ptr, byval length as zip_uint64_t, byval error as zip_error_t ptr) as long
declare function _zip_read_at_offset(byval src as zip_source_t ptr, byval offset as zip_uint64_t, byval b as ubyte ptr, byval length as uinteger, byval error as zip_error_t ptr) as long
declare function _zip_read_data(byval buffer as zip_buffer_t ptr, byval src as zip_source_t ptr, byval length as uinteger, byval nulp as boolean, byval error as zip_error_t ptr) as zip_uint8_t ptr
declare function _zip_read_local_ef(byval as zip_t ptr, byval as zip_uint64_t) as long
declare function _zip_read_string(byval buffer as zip_buffer_t ptr, byval src as zip_source_t ptr, byval length as zip_uint16_t, byval nulp as boolean, byval error as zip_error_t ptr) as zip_string_t ptr
declare function _zip_register_source(byval za as zip_t ptr, byval src as zip_source_t ptr) as long
declare sub _zip_set_open_error(byval zep as long ptr, byval err as const zip_error_t ptr, byval ze as long)
declare function zip_source_accept_empty(byval src as zip_source_t ptr) as boolean
declare function _zip_source_call(byval src as zip_source_t ptr, byval data as any ptr, byval length as zip_uint64_t, byval command as zip_source_cmd_t) as zip_int64_t
declare function _zip_source_eof(byval as zip_source_t ptr) as boolean
declare function _zip_source_file_or_p(byval as const zstring ptr, byval as FILE ptr, byval as zip_uint64_t, byval as zip_int64_t, byval as const zip_stat_t ptr, byval error as zip_error_t ptr) as zip_source_t ptr
declare function _zip_source_had_error(byval as zip_source_t ptr) as boolean
declare sub _zip_source_invalidate(byval src as zip_source_t ptr)
declare function _zip_source_new(byval error as zip_error_t ptr) as zip_source_t ptr
declare function _zip_source_set_source_archive(byval as zip_source_t ptr, byval as zip_t ptr) as long
declare function _zip_source_window_new(byval src as zip_source_t ptr, byval start as zip_uint64_t, byval length as zip_int64_t, byval st as zip_stat_t ptr, byval st_invalid as zip_uint64_t, byval attributes as zip_file_attributes_t ptr, byval source_archive as zip_t ptr, byval source_index as zip_uint64_t, byval take_ownership as boolean, byval error as zip_error_t ptr) as zip_source_t ptr
declare function _zip_stat_merge(byval dst as zip_stat_t ptr, byval src as const zip_stat_t ptr, byval error as zip_error_t ptr) as long
declare function _zip_string_equal(byval a as const zip_string_t ptr, byval b as const zip_string_t ptr) as long
declare sub _zip_string_free(byval string as zip_string_t ptr)
declare function _zip_string_crc32(byval string as const zip_string_t ptr) as zip_uint32_t
declare function _zip_string_get(byval string as zip_string_t ptr, byval lenp as zip_uint32_t ptr, byval flags as zip_flags_t, byval error as zip_error_t ptr) as const zip_uint8_t ptr
declare function _zip_string_length(byval string as const zip_string_t ptr) as zip_uint16_t
declare function _zip_string_new(byval raw as const zip_uint8_t ptr, byval length as zip_uint16_t, byval flags as zip_flags_t, byval error as zip_error_t ptr) as zip_string_t ptr
declare function _zip_string_write(byval za as zip_t ptr, byval string as const zip_string_t ptr) as long
declare function _zip_winzip_aes_decrypt(byval ctx as zip_winzip_aes_t ptr, byval data as zip_uint8_t ptr, byval length as zip_uint64_t) as boolean
declare function _zip_winzip_aes_encrypt(byval ctx as zip_winzip_aes_t ptr, byval data as zip_uint8_t ptr, byval length as zip_uint64_t) as boolean
declare function _zip_winzip_aes_finish(byval ctx as zip_winzip_aes_t ptr, byval hmac as zip_uint8_t ptr) as boolean
declare sub _zip_winzip_aes_free(byval ctx as zip_winzip_aes_t ptr)
declare function _zip_winzip_aes_new(byval password as const zip_uint8_t ptr, byval password_length as zip_uint64_t, byval salt as const zip_uint8_t ptr, byval key_size as zip_uint16_t, byval password_verify as zip_uint8_t ptr, byval error as zip_error_t ptr) as zip_winzip_aes_t ptr
declare sub _zip_pkware_encrypt(byval keys as zip_pkware_keys_t ptr, byval out as zip_uint8_t ptr, byval in as const zip_uint8_t ptr, byval len as zip_uint64_t)
declare sub _zip_pkware_decrypt(byval keys as zip_pkware_keys_t ptr, byval out as zip_uint8_t ptr, byval in as const zip_uint8_t ptr, byval len as zip_uint64_t)
declare function _zip_pkware_keys_new(byval error as zip_error_t ptr) as zip_pkware_keys_t ptr
declare sub _zip_pkware_keys_free(byval keys as zip_pkware_keys_t ptr)
declare sub _zip_pkware_keys_reset(byval keys as zip_pkware_keys_t ptr)
declare function _zip_changed(byval as const zip_t ptr, byval as zip_uint64_t ptr) as long
declare function _zip_get_name(byval as zip_t ptr, byval as zip_uint64_t, byval as zip_flags_t, byval as zip_error_t ptr) as const zstring ptr
declare function _zip_local_header_read(byval as zip_t ptr, byval as long) as long
declare function _zip_memdup(byval as const any ptr, byval as uinteger, byval as zip_error_t ptr) as any ptr
declare function _zip_name_locate(byval as zip_t ptr, byval as const zstring ptr, byval as zip_flags_t, byval as zip_error_t ptr) as zip_int64_t
declare function _zip_new(byval as zip_error_t ptr) as zip_t ptr
declare function _zip_file_replace(byval as zip_t ptr, byval as zip_uint64_t, byval as const zstring ptr, byval as zip_source_t ptr, byval as zip_flags_t) as zip_int64_t
declare function _zip_set_name(byval as zip_t ptr, byval as zip_uint64_t, byval as const zstring ptr, byval as zip_flags_t) as long
declare sub _zip_u2d_time(byval as time_t, byval as zip_uint16_t ptr, byval as zip_uint16_t ptr)
declare function _zip_unchange(byval as zip_t ptr, byval as zip_uint64_t, byval as long) as long
declare sub _zip_unchange_data(byval as zip_entry_t ptr)
declare function _zip_write(byval za as zip_t ptr, byval data as const any ptr, byval length as zip_uint64_t) as long

end extern
