#[=======================================================================[.rst:
FindEngageADK
-------

Finds the EngageADK tools and libraries.

Imported Targets
^^^^^^^^^^^^^^^^

This module provides the following imported targets, if found:

``EngageADK::EngageADK``
  The EngageADK library

Result Variables
^^^^^^^^^^^^^^^^

This will define the following variables:

``EngageADK_FOUND``
  True if the system has the EngageADK.
``EngageADK_ROOT_DIR``
  The EngageADK root directory.
``EngageADK_INCLUDE_DIRS``
  Include directories needed to use EngageADK.
``EngageADK_LIBRARIES``
  Libraries needed to link to EngageADK.
``EngageADK_DEFINITIONS``
  Definitions needed to use EngageADK.
``EngageADK_VERSION``
  The version of the EngageADK library which was found.
``EngageADK_VERSION_MAJOR``
  The major version of the package found.
``EngageADK_VERSION_MINOR``
  The minor version of the package found.
``EngageADK_VERSION_PATCH``
  The patch version of the package found.
``EngageADK_VERSION_TWEAK``
  The patch version of the package found.

Hints
^^^^^

A user may set ``EngageADK_ROOT_DIR`` to a ADK installation root to tell this
module where to look.

#]=======================================================================]

if(NOT DEFINED EngageADK_ROOT_DIR)
    set(EngageADK_ROOT_DIR "${CMAKE_SYSROOT}")
endif()

set(EngageADK_INCLUDE_DIRS
    "${EngageADK_ROOT_DIR}/include"
    "${EngageADK_ROOT_DIR}/usr/include"
    "${EngageADK_ROOT_DIR}/usr/local/include"
)

set(EngageADK_LIBRARIES)

macro(adk_add_library name)
    add_library(EngageADK::${name} UNKNOWN IMPORTED)
    set_target_properties(
        EngageADK::${name}
      PROPERTIES
        IMPORTED_LOCATION "${EngageADK_${name}_LIBRARY}"
        INTERFACE_INCLUDE_DIRECTORIES "${EngageADK_INCLUDE_DIRS}"
    )
    list(APPEND EngageADK_LIBRARIES "${EngageADK_${name}_LIBRARY}")
endmacro()

macro(adk_add_shared_library name)
    add_library(EngageADK::${name} SHARED IMPORTED)
    set_target_properties(
        EngageADK::${name}
      PROPERTIES
        IMPORTED_LOCATION "${EngageADK_${name}_LIBRARY}"
        INTERFACE_INCLUDE_DIRECTORIES "${EngageADK_INCLUDE_DIRS}"
        IMPORTED_NO_SONAME TRUE
    )
    list(APPEND EngageADK_LIBRARIES "${EngageADK_${name}_LIBRARY}")
endmacro()

find_library(EngageADK_com_LIBRARY NAMES com)
find_library(EngageADK_dl_LIBRARY NAMES dl)
find_library(EngageADK_emv_ct_client_LIBRARY NAMES emv_ct_client)
find_library(EngageADK_emv_ct_framework_LIBRARY NAMES emv_ct_framework)
find_library(EngageADK_emv_ct_link_LIBRARY NAMES emv_ct_link)
find_library(EngageADK_emv_ctls_client_LIBRARY NAMES emv_ctls_client)
find_library(EngageADK_emv_ctls_framework_LIBRARY NAMES emv_ctls_framework)
find_library(EngageADK_emv_ctls_link_LIBRARY NAMES emv_ctls_link)
find_library(EngageADK_evt_LIBRARY NAMES evt)
find_library(EngageADK_expat_LIBRARY NAMES expat)
find_library(EngageADK_inf_LIBRARY NAMES inf)
find_library(EngageADK_log_LIBRARY NAMES log)
find_library(EngageADK_msr_LIBRARY NAMES msr)
find_library(EngageADK_pthread_LIBRARY NAMES pthread)
find_library(EngageADK_rt_LIBRARY NAMES rt)
find_library(EngageADK_sqlite_LIBRARY NAMES sqlite)
find_library(EngageADK_ssl_LIBRARY NAMES ssl)
find_library(EngageADK_svc_tms_LIBRARY NAMES svc_tms)
find_library(EngageADK_tlv_util_LIBRARY NAMES tlv_util)
find_library(EngageADK_vfibuzzer_LIBRARY NAMES vfibuzzer)
find_library(EngageADK_vfiguiprt_LIBRARY NAMES vfiguiprt)
find_library(EngageADK_vfiipc_LIBRARY NAMES vfiipc)
find_library(EngageADK_vfimac_LIBRARY NAMES vfimac)
find_library(EngageADK_vfisec_LIBRARY NAMES vfisec)
find_library(EngageADK_vfisysinfo_LIBRARY NAMES vfisysinfo)
find_library(EngageADK_crypto_LIBRARY NAMES crypto)
find_library(EngageADK_vfigsm_LIBRARY NAMES vfigsm)
find_library(EngageADK_vfisyspm_LIBRARY NAMES vfisyspm)
find_library(EngageADK_z_LIBRARY NAMES z)
find_library(EngageADK_svc_logmgr_LIBRARY NAMES svc_logmgr PATH_SUFFIXES svcmgr)
find_library(EngageADK_svc_led_LIBRARY NAMES svc_led PATH_SUFFIXES svcmgr)
find_library(EngageADK_svc_event_LIBRARY NAMES svc_event PATH_SUFFIXES svcmgr)
find_library(EngageADK_svc_netloader_LIBRARY NAMES svc_netloader PATH_SUFFIXES svcmgr)
find_library(EngageADK_svc_security_LIBRARY NAMES svc_security PATH_SUFFIXES svcmgr)
find_library(EngageADK_svc_sound_LIBRARY NAMES svc_sound PATH_SUFFIXES svcmgr)
find_library(EngageADK_svc_utility_LIBRARY NAMES svc_utility PATH_SUFFIXES svcmgr)

set (EngageADK_DEFINITIONS
    VFI_PLATAFORM_VOS
    _VOS
    _VOS2
)

if(EXISTS "${EngageADK_ROOT_DIR}/version.txt")
    file(STRINGS "${EngageADK_ROOT_DIR}/version.txt" VERSION_FILE)
    string(REGEX REPLACE "^([0-9]+).*$" "\\1" EngageADK_VERSION_MAJOR "${VERSION_FILE}")
    string(REGEX REPLACE "^[0-9]+\\.([0-9]+).*$" "\\1" EngageADK_VERSION_MINOR  "${VERSION_FILE}")
    string(REGEX REPLACE "^[0-9]+\\.[0-9]+\\.([0-9]+).*$" "\\1" EngageADK_VERSION_PATCH "${VERSION_FILE}")
    set(EngageADK_VERSION "${EngageADK_VERSION_MAJOR}.${EngageADK_VERSION_MINOR}.${EngageADK_VERSION_PATCH}")

    set(EngageADK_VERSION_TWEAK "")
    if("${VERSION_FILE}" MATCHES "^[0-9]+\\.[0-9]+\\.[0-9]+\\.([0-9]+)")
        set(EngageADK_VERSION_TWEAK "${CMAKE_MATCH_1}")
        string(APPEND EngageADK_VERSION ".${EngageADK_VERSION_TWEAK}")
    endif()
endif()

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(
    EngageADK
  REQUIRED_VARS
    EngageADK_ROOT_DIR
    EngageADK_com_LIBRARY
    EngageADK_dl_LIBRARY
    EngageADK_emv_ct_client_LIBRARY
    EngageADK_emv_ct_framework_LIBRARY
    EngageADK_emv_ct_link_LIBRARY
    EngageADK_emv_ctls_client_LIBRARY
    EngageADK_emv_ctls_framework_LIBRARY
    EngageADK_emv_ctls_link_LIBRARY
    EngageADK_evt_LIBRARY
    EngageADK_expat_LIBRARY
    EngageADK_inf_LIBRARY
    EngageADK_log_LIBRARY
    EngageADK_msr_LIBRARY
    EngageADK_pthread_LIBRARY
    EngageADK_rt_LIBRARY
    EngageADK_sqlite_LIBRARY
    EngageADK_ssl_LIBRARY
    EngageADK_svc_tms_LIBRARY
    EngageADK_tlv_util_LIBRARY
    EngageADK_vfibuzzer_LIBRARY
    EngageADK_vfiguiprt_LIBRARY
    EngageADK_vfiipc_LIBRARY
    EngageADK_vfimac_LIBRARY
    EngageADK_vfisec_LIBRARY
    EngageADK_vfisysinfo_LIBRARY
    EngageADK_crypto_LIBRARY
    EngageADK_vfigsm_LIBRARY
    EngageADK_vfisyspm_LIBRARY
    EngageADK_z_LIBRARY
    EngageADK_svc_logmgr_LIBRARY
    EngageADK_svc_led_LIBRARY
    EngageADK_svc_event_LIBRARY
    EngageADK_svc_netloader_LIBRARY
    EngageADK_svc_security_LIBRARY
    EngageADK_svc_sound_LIBRARY
    EngageADK_svc_utility_LIBRARY
  VERSION_VAR 
    EngageADK_VERSION
)

if(EngageADK_FOUND AND NOT TARGET EngageADK::EngageADK)
    adk_add_shared_library(com)
    adk_add_shared_library(dl)
    adk_add_library(emv_ct_client)
    adk_add_shared_library(emv_ct_framework)
    adk_add_shared_library(emv_ct_link)
    adk_add_library(emv_ctls_client)
    adk_add_shared_library(emv_ctls_framework)
    adk_add_shared_library(emv_ctls_link)
    adk_add_shared_library(evt)
    adk_add_shared_library(expat)
    adk_add_shared_library(inf)
    adk_add_shared_library(log)
    adk_add_shared_library(msr)
    adk_add_shared_library(pthread)
    adk_add_shared_library(rt)
    adk_add_shared_library(sqlite)
    adk_add_shared_library(ssl)
    adk_add_shared_library(svc_tms)
    adk_add_shared_library(tlv_util)
    adk_add_shared_library(vfibuzzer)
    adk_add_shared_library(vfiguiprt)
    adk_add_shared_library(vfiipc)
    adk_add_shared_library(vfimac)
    adk_add_shared_library(vfisec)
    adk_add_shared_library(vfisysinfo)
    adk_add_shared_library(crypto)
    adk_add_shared_library(vfigsm)
    adk_add_shared_library(vfisyspm)
    adk_add_shared_library(z)
    adk_add_shared_library(svc_logmgr)
    adk_add_shared_library(svc_led)
    adk_add_shared_library(svc_event)
    adk_add_shared_library(svc_netloader)
    adk_add_shared_library(svc_security)
    adk_add_shared_library(svc_sound)
    adk_add_shared_library(svc_utility)

    add_library(EngageADK::definitions INTERFACE IMPORTED)
    target_compile_definitions(
        EngageADK::definitions
      INTERFACE
        VFI_PLATAFORM_VOS
        _VOS
        _VOS2
    )

    add_library(EngageADK::EngageADK INTERFACE IMPORTED)

    target_compile_definitions(
        EngageADK::definitions
      INTERFACE
        ${EngageADK_DEFINITIONS}
    )

    target_link_libraries(
        EngageADK::EngageADK
      INTERFACE
        EngageADK::definitions
        EngageADK::com
        EngageADK::dl
        EngageADK::emv_ct_client
        EngageADK::emv_ct_framework
        EngageADK::emv_ct_link
        EngageADK::emv_ctls_client
        EngageADK::emv_ctls_framework
        EngageADK::emv_ctls_link
        EngageADK::evt
        EngageADK::expat
        EngageADK::inf
        EngageADK::log
        EngageADK::msr
        EngageADK::pthread
        EngageADK::rt
        EngageADK::sqlite
        EngageADK::ssl
        EngageADK::svc_tms
        EngageADK::tlv_util
        EngageADK::vfibuzzer
        EngageADK::vfiguiprt
        EngageADK::vfiipc
        EngageADK::vfimac
        EngageADK::vfisec
        EngageADK::vfisysinfo
        EngageADK::crypto
        EngageADK::vfigsm
        EngageADK::vfisyspm
        EngageADK::z
        EngageADK::svc_logmgr
        EngageADK::svc_led
        EngageADK::svc_event
        EngageADK::svc_netloader
        EngageADK::svc_security
        EngageADK::svc_sound
        EngageADK::svc_utility
    )
endif()
