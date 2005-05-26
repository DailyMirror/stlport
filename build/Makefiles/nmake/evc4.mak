# Time-stamp: <04/03/31 07:55:19 ptr>
# $Id$

DEFS_COMMON = $(DEFS_COMMON) /D _WIN32_WCE=$(CEVERSION) /D UNDER_CE=$(CEVERSION) /D "UNICODE"

!if "$(TARGET_PROC)" == ""
!error No target processor configured! Please rerun configure.bat!
!endif

!if "$(CC)" == ""
!error CC not set, run the proper WCE*.bat from this shell to set it!
!endif

# All the batchfiles to setup the environment yield different
# compilers which they put into CC.
CXX = $(CC)

!if "$(TARGET_PROC)" == "arm"
DEFS_COMMON = $(DEFS_COMMON) /D "ARM" /D "_ARM_" /D "ARMV4"
OPT_COMMON =
!endif

!if "$(TARGET_PROC)" == "x86"
DEFS_COMMON = $(DEFS_COMMON) /D "x86" /D "_X86_" /D "_i386_"
OPT_COMMON = /Gs8192 /GF
!endif

!if "$(TARGET_PROC)" == "mips"
DEFS_COMMON = $(DEFS_COMMON) /D "_MIPS_" /D "MIPS"
OPT_COMMON = /GF
!endif


# exception handling support
CFLAGS_COMMON = /nologo /TC /W4 /GR /GX
CFLAGS_REL = $(CFLAGS_COMMON) $(OPT_REL)
CFLAGS_STATIC_REL = $(CFLAGS_COMMON) $(OPT_STATIC_REL)
CFLAGS_DBG = $(CFLAGS_COMMON) $(OPT_DBG)
CFLAGS_STATIC_DBG = $(CFLAGS_COMMON) $(OPT_STATIC_DBG)
CFLAGS_STLDBG = $(CFLAGS_COMMON) $(OPT_STLDBG)
CFLAGS_STATIC_STLDBG = $(CFLAGS_COMMON) $(OPT_STATIC_STLDBG)
CXXFLAGS_COMMON = /nologo /TP /W4 /GR /GX
CXXFLAGS_REL = $(CXXFLAGS_COMMON) $(OPT_REL)
CXXFLAGS_STATIC_REL = $(CXXFLAGS_COMMON) $(OPT_STATIC_REL)
CXXFLAGS_DBG = $(CXXFLAGS_COMMON) $(OPT_DBG)
CXXFLAGS_STATIC_DBG = $(CXXFLAGS_COMMON) $(OPT_STATIC_DBG)
CXXFLAGS_STLDBG = $(CXXFLAGS_COMMON) $(OPT_STLDBG)
CXXFLAGS_STATIC_STLDBG = $(CXXFLAGS_COMMON) $(OPT_STATIC_STLDBG)

!include evc-common.mak
