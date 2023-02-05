#include "error.h"

const char * const warning_name[53] = {
	NULL,
	"db-empty",
	"ea-absolute",
	"ea-dispsize",
	"float-denorm",
	"float-overflow",
	"float-toolong",
	"float-underflow",
	"forward",
	"label-orphan",
	"label-redef",
	"label-redef-late",
	"number-overflow",
	"obsolete-nop",
	"obsolete-removed",
	"obsolete-valid",
	"phase",
	"pp-else-elif",
	"pp-else-else",
	"pp-empty-braces",
	"pp-environment",
	"pp-macro-def-case-single",
	"pp-macro-def-greedy-single",
	"pp-macro-def-param-single",
	"pp-macro-defaults",
	"pp-macro-params-legacy",
	"pp-macro-params-multi",
	"pp-macro-params-single",
	"pp-macro-redef-multi",
	"pp-open-braces",
	"pp-open-brackets",
	"pp-open-string",
	"pp-rep-negative",
	"pp-sel-range",
	"pp-trailing",
	"pragma-bad",
	"pragma-empty",
	"pragma-na",
	"pragma-unknown",
	"prefix-bnd",
	"prefix-hle",
	"prefix-lock",
	"prefix-opsize",
	"prefix-seg",
	"ptr",
	"regsize",
	"unknown-warning",
	"user",
	"warn-stack-empty",
	"zeroing",
	"zext-reloc",
	"other",
	"all"
};

const struct warning_alias warning_alias[68] = {
	{ "all",                      WARN_IDX_ALL },
	{ "bad-pragma",               WARN_IDX_PRAGMA_BAD },
	{ "bnd",                      WARN_IDX_PREFIX_BND },
	{ "db-empty",                 WARN_IDX_DB_EMPTY },
	{ "ea-absolute",              WARN_IDX_EA_ABSOLUTE },
	{ "ea-dispsize",              WARN_IDX_EA_DISPSIZE },
	{ "environment",              WARN_IDX_PP_ENVIRONMENT },
	{ "float-denorm",             WARN_IDX_FLOAT_DENORM },
	{ "float-overflow",           WARN_IDX_FLOAT_OVERFLOW },
	{ "float-toolong",            WARN_IDX_FLOAT_TOOLONG },
	{ "float-underflow",          WARN_IDX_FLOAT_UNDERFLOW },
	{ "forward",                  WARN_IDX_FORWARD },
	{ "hle",                      WARN_IDX_PREFIX_HLE },
	{ "label-orphan",             WARN_IDX_LABEL_ORPHAN },
	{ "label-redef",              WARN_IDX_LABEL_REDEF },
	{ "label-redef-late",         WARN_IDX_LABEL_REDEF_LATE },
	{ "lock",                     WARN_IDX_PREFIX_LOCK },
	{ "macro-def-case-single",    WARN_IDX_PP_MACRO_DEF_CASE_SINGLE },
	{ "macro-def-greedy-single",  WARN_IDX_PP_MACRO_DEF_GREEDY_SINGLE },
	{ "macro-def-param-single",   WARN_IDX_PP_MACRO_DEF_PARAM_SINGLE },
	{ "macro-defaults",           WARN_IDX_PP_MACRO_DEFAULTS },
	{ "macro-params-legacy",      WARN_IDX_PP_MACRO_PARAMS_LEGACY },
	{ "macro-params-multi",       WARN_IDX_PP_MACRO_PARAMS_MULTI },
	{ "macro-params-single",      WARN_IDX_PP_MACRO_PARAMS_SINGLE },
	{ "negative-rep",             WARN_IDX_PP_REP_NEGATIVE },
	{ "not-my-pragma",            WARN_IDX_PRAGMA_NA },
	{ "number-overflow",          WARN_IDX_NUMBER_OVERFLOW },
	{ "obsolete-nop",             WARN_IDX_OBSOLETE_NOP },
	{ "obsolete-removed",         WARN_IDX_OBSOLETE_REMOVED },
	{ "obsolete-valid",           WARN_IDX_OBSOLETE_VALID },
	{ "orphan-labels",            WARN_IDX_LABEL_ORPHAN },
	{ "other",                    WARN_IDX_OTHER },
	{ "phase",                    WARN_IDX_PHASE },
	{ "pp-else-elif",             WARN_IDX_PP_ELSE_ELIF },
	{ "pp-else-else",             WARN_IDX_PP_ELSE_ELSE },
	{ "pp-empty-braces",          WARN_IDX_PP_EMPTY_BRACES },
	{ "pp-environment",           WARN_IDX_PP_ENVIRONMENT },
	{ "pp-macro-def-case-single", WARN_IDX_PP_MACRO_DEF_CASE_SINGLE },
	{ "pp-macro-def-greedy-single", WARN_IDX_PP_MACRO_DEF_GREEDY_SINGLE },
	{ "pp-macro-def-param-single", WARN_IDX_PP_MACRO_DEF_PARAM_SINGLE },
	{ "pp-macro-defaults",        WARN_IDX_PP_MACRO_DEFAULTS },
	{ "pp-macro-params-legacy",   WARN_IDX_PP_MACRO_PARAMS_LEGACY },
	{ "pp-macro-params-multi",    WARN_IDX_PP_MACRO_PARAMS_MULTI },
	{ "pp-macro-params-single",   WARN_IDX_PP_MACRO_PARAMS_SINGLE },
	{ "pp-macro-redef-multi",     WARN_IDX_PP_MACRO_REDEF_MULTI },
	{ "pp-open-braces",           WARN_IDX_PP_OPEN_BRACES },
	{ "pp-open-brackets",         WARN_IDX_PP_OPEN_BRACKETS },
	{ "pp-open-string",           WARN_IDX_PP_OPEN_STRING },
	{ "pp-rep-negative",          WARN_IDX_PP_REP_NEGATIVE },
	{ "pp-sel-range",             WARN_IDX_PP_SEL_RANGE },
	{ "pp-trailing",              WARN_IDX_PP_TRAILING },
	{ "pragma-bad",               WARN_IDX_PRAGMA_BAD },
	{ "pragma-empty",             WARN_IDX_PRAGMA_EMPTY },
	{ "pragma-na",                WARN_IDX_PRAGMA_NA },
	{ "pragma-unknown",           WARN_IDX_PRAGMA_UNKNOWN },
	{ "prefix-bnd",               WARN_IDX_PREFIX_BND },
	{ "prefix-hle",               WARN_IDX_PREFIX_HLE },
	{ "prefix-lock",              WARN_IDX_PREFIX_LOCK },
	{ "prefix-opsize",            WARN_IDX_PREFIX_OPSIZE },
	{ "prefix-seg",               WARN_IDX_PREFIX_SEG },
	{ "ptr",                      WARN_IDX_PTR },
	{ "regsize",                  WARN_IDX_REGSIZE },
	{ "unknown-pragma",           WARN_IDX_PRAGMA_UNKNOWN },
	{ "unknown-warning",          WARN_IDX_UNKNOWN_WARNING },
	{ "user",                     WARN_IDX_USER },
	{ "warn-stack-empty",         WARN_IDX_WARN_STACK_EMPTY },
	{ "zeroing",                  WARN_IDX_ZEROING },
	{ "zext-reloc",               WARN_IDX_ZEXT_RELOC }
};

const char * const warning_help[53] = {
	NULL,
	"no operand for data declaration",
	"absolute address cannot be RIP-relative",
	"displacement size ignored on absolute address",
	"floating point denormal",
	"floating point overflow",
	"too many digits in floating-point number",
	"floating point underflow",
	"forward reference may have unpredictable results",
	"labels alone on lines without trailing `:\'",
	"label redefined to an identical value",
	"label (re)defined during code generation",
	"numeric constant does not fit",
	"instruction obsolete and is a noop on the target CPU",
	"instruction obsolete and removed on the target CPU",
	"instruction obsolete but valid on the target CPU",
	"phase error during stabilization",
	"%elif after %else",
	"%else after %else",
	"empty %{} construct",
	"nonexistent environment variable",
	"single-line macro defined both case sensitive and insensitive",
	"single-line macro",
	"single-line macro defined with and without parameters",
	"macros with more default than optional parameters",
	"improperly calling multi-line macro for legacy support",
	"multi-line macro calls with wrong parameter count",
	"single-line macro calls with wrong parameter count",
	"redefining multi-line macro",
	"unterminated %{...}",
	"unterminated %[...]",
	"unterminated string",
	"regative %rep count",
	"%sel() argument out of range",
	"trailing garbage ignored",
	"malformed %pragma",
	"empty %pragma directive",
	"%pragma not applicable to this compilation",
	"unknown %pragma facility or directive",
	"invalid BND prefix",
	"invalid HLE prefix",
	"LOCK prefix on unlockable instructions",
	"invalid operand size prefix",
	"segment prefix ignored in 64-bit mode",
	"non-NASM keyword used in other assemblers",
	"register size specification ignored",
	"unknown warning in -W/-w or warning directive",
	"%warning directives",
	"warning stack empty",
	"RESx in initialized section becomes zero",
	"relocation zero-extended to match output format",
	"any warning not specifically mentioned above",
	"all possible warnings"
};

const uint8_t warning_default[52] = {
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_OFF,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_OFF,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_OFF,
	WARN_INIT_ERR,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_OFF,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_ERR,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_OFF,
	WARN_INIT_OFF,
	WARN_INIT_OFF,
	WARN_INIT_OFF,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_OFF,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_ON,
	WARN_INIT_ON
};

uint8_t warning_state[52];	/* Current state */
