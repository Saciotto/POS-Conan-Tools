#[=======================================================================[.rst:
FindTetraSDK
-------

Finds the TetraSDK tools and libraries.

Imported Targets
^^^^^^^^^^^^^^^^

This module provides the following imported targets, if found:

``TetraSDK::TetraSDK``
  The TetraSDK library
``TetraSDK::TPlusEntry``
  Telium plus application entry point

Result Variables
^^^^^^^^^^^^^^^^

This will define the following variables:

``TetraSDK_FOUND``
  True if the system has the TetraSDK.
``TetraSDK_ROOT_DIR``
  The TetraSDK root directory.
``TetraSDK_INCLUDE_DIRS``
  Include directories needed to use TetraSDK.
``TetraSDK_LIBRARIES``
  Libraries needed to link to TetraSDK.
``TetraSDK_DEFINITIONS``
  Definitions needed to use TetraSDK.
``TetraSDK_VERSION``
  The version of the TetraSDK library which was found.
``TetraSDK_VERSION_MAJOR``
  The major version of the package found.
``TetraSDK_VERSION_MINOR``
  The minor version of the package found.
``TetraSDK_VERSION_PATCH``
  The patch version of the package found.
``TetraSDK_VERSION_TWEAK``
  The patch version of the package found.

Hints
^^^^^

A user may set ``TetraSDK_ROOT_DIR`` to a SDK installation root to tell 
this module where to look.
#]=======================================================================]

set(CMAKE_FIND_LIBRARY_PREFIXES "" lib)
set(CMAKE_FIND_LIBRARY_SUFFIXES .a .so .lib .T3L)

if(NOT DEFINED TetraSDK_ROOT_DIR)
  find_path(TetraSDK_ROOT_DIR NAMES SDKT3Descriptor.xml)
endif()

set(TetraSDK_LIBRARIES)

macro(tetra_add_library name)
  add_library(TetraSDK::${name} UNKNOWN IMPORTED)
  set_target_properties(
      TetraSDK::${name}
    PROPERTIES
      IMPORTED_LOCATION "${TetraSDK_${name}_LIBRARY}"
      INTERFACE_INCLUDE_DIRECTORIES "${TetraSDK_INCLUDE_DIRS}"
  )
  list(APPEND TetraSDK_LIBRARIES "${TetraSDK_${name}_LIBRARY}")
endmacro()

macro(tetra_add_shared_library name)
  add_library(TetraSDK::${name} SHARED IMPORTED)
  set_target_properties(
      TetraSDK::${name}
    PROPERTIES
      IMPORTED_LOCATION "${TetraSDK_${name}_LIBRARY}"
      INTERFACE_INCLUDE_DIRECTORIES "${TetraSDK_INCLUDE_DIRS}"
      IMPORTED_NO_SONAME TRUE
  )
  list(APPEND TetraSDK_LIBRARIES "${TetraSDK_${name}_LIBRARY}")
endmacro()

set(SDKTPLUS_STARTFILES_DIR ${TetraSDK_ROOT_DIR}/SDKTPLUS/HW_TETRA/gnu_473/startfiles)
set(SDKTPLUS_LIB_DIR ${TetraSDK_ROOT_DIR}/SDKTPLUS/HW_TETRA/gnu_473/lib/Platform)
set(SDKTPLUS_LIB_OS_DIR ${TetraSDK_ROOT_DIR}/SDKTPLUS/HW_TETRA/gnu_473/lib/OS)
set(SDKT3_LIB_DIR ${TetraSDK_ROOT_DIR}/SDKT3/HW_TETRA/gnu_473/lib/Platform)

set(SDK_TPLUS_INCLUDE_DIR ${TetraSDK_ROOT_DIR}/SDKTPLUS/HW_TETRA/inc)
set(SDK_T3_INCLUDE_DIR ${TetraSDK_ROOT_DIR}/SDKT3/HW_TETRA/inc)

set(TetraSDK_INCLUDE_DIRS
  ${SDK_TPLUS_INCLUDE_DIR}/c/OS
  ${SDK_TPLUS_INCLUDE_DIR}/c/Platform/CommonTools
  ${SDK_TPLUS_INCLUDE_DIR}/c/Platform/Communication
  ${SDK_TPLUS_INCLUDE_DIR}/c/Platform/GOAL
  ${SDK_TPLUS_INCLUDE_DIR}/c/Platform/GTL
  ${SDK_TPLUS_INCLUDE_DIR}/c/Platform/PCL
  ${SDK_TPLUS_INCLUDE_DIR}/c/Platform/SDK
  ${SDK_TPLUS_INCLUDE_DIR}/c/Platform/Security
  ${SDK_TPLUS_INCLUDE_DIR}/c/Platform/SQLite
  ${SDK_TPLUS_INCLUDE_DIR}/c/Platform/TeliumPlusEmulation
  ${SDK_TPLUS_INCLUDE_DIR}/c/Platform/TPass
  ${SDK_TPLUS_INCLUDE_DIR}/cpp
  ${SDK_TPLUS_INCLUDE_DIR}/cpp/ingenico
  ${SDK_T3_INCLUDE_DIR}/c/Platform
  ${SDK_T3_INCLUDE_DIR}/c/Platform/CommonTools
  ${SDK_T3_INCLUDE_DIR}/c/Platform/Communication
  ${SDK_T3_INCLUDE_DIR}/c/Platform/GOAL
  ${SDK_T3_INCLUDE_DIR}/c/Platform/GTL
  ${SDK_T3_INCLUDE_DIR}/c/Platform/PCL
  ${SDK_T3_INCLUDE_DIR}/c/Platform/Pinpad
  ${SDK_T3_INCLUDE_DIR}/c/Platform/SDK
  ${SDK_T3_INCLUDE_DIR}/c/Platform/SQLite
  ${SDK_T3_INCLUDE_DIR}/c/Platform/TPass
  ${SDK_T3_INCLUDE_DIR}/c/OS
  ${SDK_T3_INCLUDE_DIR}/cpp
  ${SDK_T3_INCLUDE_DIR}/cpp/google
  ${SDK_T3_INCLUDE_DIR}/cpp/ingenico
  ${TetraSDK_ROOT_DIR}/SDKT3/HW_TETRA/proto
)

# SO Libraries Tplus
find_library(TetraSDK_acl_LIBRARY NAMES libacl.so.1 PATHS ${SDKTPLUS_LIB_OS_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_attr_LIBRARY NAMES libattr.so.1 PATHS ${SDKTPLUS_LIB_OS_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_telinux_LIBRARY NAMES telinux PATHS ${SDKTPLUS_LIB_OS_DIR} NO_DEFAULT_PATH)

# SDK Libraries Tplus
find_library(TetraSDK_bluetooth_LIBRARY NAMES bluetooth PATHS ${SDKTPLUS_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_wifi_LIBRARY wifi PATHS ${SDKTPLUS_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_packip_LIBRARY NAMES packip PATHS ${SDKTPLUS_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_TmsCall_TPlus_LIBRARY NAMES TmsCall_TPlus PATHS ${SDKTPLUS_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_GRAPHICS_LIBRARY NAMES GRAPHICS PATHS ${SDKTPLUS_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_ExtraGPRS_LIBRARY NAMES ExtraGPRS PATHS ${SDKTPLUS_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_TPLUSMANAGER_LIBRARY NAMES TPLUSMANAGER PATHS ${SDKTPLUS_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_linklayer_LIBRARY NAMES linklayer PATHS ${SDKTPLUS_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_SPMCI_TPlus_LIBRARY NAMES SPMCI_TPlus PATHS ${SDKTPLUS_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_ndef_LIBRARY NAMES ndef PATHS ${SDKTPLUS_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_TlvTree_LIBRARY NAMES TlvTree PATHS ${SDKTPLUS_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_wrapper_tplus_LIBRARY NAMES wrapper_tplus PATHS ${SDKTPLUS_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_SQLITELIB_LIBRARY NAMES SQLITELIB PATHS ${SDKTPLUS_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_PROTOBUF_LIBRARY NAMES PROTOBUF PATHS ${SDKTPLUS_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_OS_LIBRARY NAMES OS PATHS ${SDKTPLUS_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_SecurityTp_LIBRARY NAMES SecurityTp PATHS ${SDKTPLUS_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_SERVICE_LIBRARY NAMES SERVICE PATHS ${SDKTPLUS_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_SVCDIRPX_LIBRARY NAMES SVCDIRPX PATHS ${SDKTPLUS_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_SVCDIRSK_LIBRARY NAMES SVCDIRSK PATHS ${SDKTPLUS_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_Sec_LIBRARY NAMES Sec PATHS ${SDKTPLUS_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_tpass_LIBRARY NAMES tpass PATHS ${SDKTPLUS_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_gtl_LIBRARY NAMES gtl PATHS ${SDKTPLUS_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_OSLAYER_LIBRARY NAMES OSLAYER PATHS ${SDKTPLUS_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_mifare_LIBRARY NAMES mifare PATHS ${SDKTPLUS_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_Heartbeat_Interface_TPLUS_LIBRARY NAMES Heartbeat_Interface_TPLUS PATHS ${SDKTPLUS_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_commmisc_LIBRARY NAMES commmisc PATHS ${SDKTPLUS_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_GRAPHICLIB_LIBRARY NAMES GRAPHICLIB PATHS ${SDKTPLUS_LIB_DIR} NO_DEFAULT_PATH)

# SDK Libraries T3
find_library(TetraSDK_wifi_t3_LIBRARY NAMES wifi PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_BATTERY_LIBRARY NAMES BATTERY PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_BLIGHT_LIBRARY NAMES BLIGHT PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_BUZZER_LIBRARY NAMES BUZZER PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_CAPTURE_LIBRARY NAMES CAPTURE PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_BIO_LIBRARY NAMES BIO PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_PPADTEXT_LIBRARY NAMES PPADTEXT PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_GPS_LIBRARY NAMES GPS PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_DESKTOP_LIBRARY NAMES DESKTOP PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_ethernet_LIBRARY NAMES ethernet PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_EXPLORER_LIBRARY NAMES EXPLORER PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_gprs_LIBRARY NAMES gprs PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_spmci_LIBRARY NAMES spmci PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_ACCELERO_LIBRARY NAMES ACCELERO PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_HEADER_LIBRARY NAMES HEADER PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_INACTIVI_LIBRARY NAMES INACTIVI PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_tmscall_LIBRARY NAMES tmscall PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_tmsdownload_LIBRARY NAMES tmsdownload PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_modem_LIBRARY NAMES modem PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_MONITOR_LIBRARY NAMES MONITOR PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_PRINTER_LIBRARY NAMES PRINTER PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_SCRSAVER_LIBRARY NAMES SCRSAVER PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_Security_LIBRARY NAMES Security PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_SETTING_LIBRARY NAMES SETTING PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_softmgt_LIBRARY NAMES softmgt PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_TrEngine_LIBRARY NAMES TrEngine PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_VIRT_KB_LIBRARY NAMES VIRT_KB PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_tlvtree_t3_LIBRARY NAMES tlvtree PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_Bridge_LIBRARY NAMES Bridge PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_MORPHO_LIBRARY NAMES MORPHO PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_1LINESCR_LIBRARY NAMES 1LINESCR PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_CASHDRAW_LIBRARY NAMES CASHDRAW PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_chip_LIBRARY NAMES chip PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_cless_LIBRARY NAMES cless PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_led_LIBRARY NAMES led PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_Ppad_LIBRARY NAMES Ppad PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_swipe_LIBRARY NAMES swipe PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_transac_LIBRARY NAMES transac PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_token_LIBRARY NAMES token PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_tmsapplication_LIBRARY NAMES tmsapplication PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_mifareProxy_LIBRARY NAMES mifareProxy PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_hbeat_LIBRARY NAMES hbeat PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)
find_library(TetraSDK_autoinit_LIBRARY NAMES autoinit PATHS ${SDKT3_LIB_DIR} NO_DEFAULT_PATH)

# Objects
find_file(TetraSDK_startup_tplusentry_LIBRARY NAMES startup_tplusentry.o PATHS ${SDKTPLUS_STARTFILES_DIR} NO_DEFAULT_PATH)
find_file(TetraSDK_stapp_legacyexitpoint_LIBRARY NAMES stapp_legacyexitpoint.o PATHS ${SDKTPLUS_STARTFILES_DIR} NO_DEFAULT_PATH)

if(EXISTS "${TetraSDK_ROOT_DIR}/tetrasdk_version.txt")
  file(STRINGS "${TetraSDK_ROOT_DIR}/tetrasdk_version.txt" VERSION_FILE)
  string(REGEX REPLACE "^([0-9]+).*$" "\\1" TetraSDK_VERSION_MAJOR "${VERSION_FILE}")
  string(REGEX REPLACE "^[0-9]+\\.([0-9]+).*$" "\\1" TetraSDK_VERSION_MINOR  "${VERSION_FILE}")
  string(REGEX REPLACE "^[0-9]+\\.[0-9]+\\.([0-9]+).*$" "\\1" TetraSDK_VERSION_PATCH "${VERSION_FILE}")
  set(TetraSDK_VERSION "${TetraSDK_VERSION_MAJOR}.${TetraSDK_VERSION_MINOR}.${TetraSDK_VERSION_PATCH}")

  set(TetraSDK_VERSION_TWEAK "")
  if("${VERSION_FILE}" MATCHES "^[0-9]+\\.[0-9]+\\.[0-9]+\\.([A-Za-z0-9]+)")
    set(TetraSDK_VERSION_TWEAK "${CMAKE_MATCH_1}")
    string(APPEND TetraSDK_VERSION ".${TetraSDK_VERSION_TWEAK}")
  endif()

  set(TetraSDK_VERSION_DEFINE "")

  set(TetraSDK_VERSION_MAJOR_DEFINE ${TetraSDK_VERSION_MAJOR})
  string(LENGTH "${TetraSDK_VERSION_MAJOR_DEFINE}" TetraSDK_VERSION_MAJOR_LENGTH)
  if(TetraSDK_VERSION_MAJOR_LENGTH LESS_EQUAL 1)
    set(TetraSDK_VERSION_MAJOR_DEFINE "0${TetraSDK_VERSION_MAJOR_DEFINE}")
  endif()
  string(APPEND TetraSDK_VERSION_DEFINE "${TetraSDK_VERSION_MAJOR_DEFINE}")

  set(TetraSDK_VERSION_MINOR_DEFINE ${TetraSDK_VERSION_MINOR})
  string(LENGTH "${TetraSDK_VERSION_MINOR_DEFINE}" TetraSDK_VERSION_MINOR_LENGTH)
  if(TetraSDK_VERSION_MINOR_LENGTH LESS_EQUAL 1)
    set(TetraSDK_VERSION_MINOR_DEFINE "0${TetraSDK_VERSION_MINOR_DEFINE}")
  endif()
  string(APPEND TetraSDK_VERSION_DEFINE "${TetraSDK_VERSION_MINOR_DEFINE}")

  set(TetraSDK_VERSION_PATCH_DEFINE ${TetraSDK_VERSION_PATCH})
  string(LENGTH "${TetraSDK_VERSION_PATCH_DEFINE}" TetraSDK_VERSION_PATCH_LENGTH)
  if(TetraSDK_VERSION_PATCH_LENGTH LESS_EQUAL 1)
    set(TetraSDK_VERSION_PATCH_DEFINE "0${TetraSDK_VERSION_PATCH_DEFINE}")
  endif()
  string(APPEND TetraSDK_VERSION_DEFINE "${TetraSDK_VERSION_PATCH_DEFINE}")
endif()

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(
    TetraSDK
  REQUIRED_VARS
    TetraSDK_ROOT_DIR
    # Includes
    TetraSDK_INCLUDE_DIRS
    # SO Libraries Tplus
    TetraSDK_acl_LIBRARY
    TetraSDK_attr_LIBRARY
    TetraSDK_telinux_LIBRARY
    # SDK Libraries Tplus
    TetraSDK_bluetooth_LIBRARY
    TetraSDK_wifi_LIBRARY
    TetraSDK_packip_LIBRARY
    TetraSDK_TmsCall_TPlus_LIBRARY
    TetraSDK_GRAPHICS_LIBRARY
    TetraSDK_ExtraGPRS_LIBRARY
    TetraSDK_TPLUSMANAGER_LIBRARY
    TetraSDK_PROTOBUF_LIBRARY
    TetraSDK_OS_LIBRARY
    TetraSDK_linklayer_LIBRARY
    TetraSDK_SecurityTp_LIBRARY
    TetraSDK_SPMCI_TPlus_LIBRARY
    TetraSDK_ndef_LIBRARY
    TetraSDK_TlvTree_LIBRARY
    TetraSDK_wrapper_tplus_LIBRARY
    TetraSDK_SQLITELIB_LIBRARY
    TetraSDK_SERVICE_LIBRARY
    TetraSDK_SVCDIRPX_LIBRARY
    TetraSDK_SVCDIRSK_LIBRARY
    TetraSDK_Sec_LIBRARY
    TetraSDK_tpass_LIBRARY
    TetraSDK_gtl_LIBRARY
    TetraSDK_OSLAYER_LIBRARY
    TetraSDK_mifare_LIBRARY
    TetraSDK_Heartbeat_Interface_TPLUS_LIBRARY
    TetraSDK_commmisc_LIBRARY
    TetraSDK_GRAPHICLIB_LIBRARY
    # SDK Libraries T3
    TetraSDK_wifi_t3_LIBRARY
    TetraSDK_BATTERY_LIBRARY
    TetraSDK_BLIGHT_LIBRARY
    TetraSDK_BUZZER_LIBRARY
    TetraSDK_CAPTURE_LIBRARY
    TetraSDK_BIO_LIBRARY
    TetraSDK_PPADTEXT_LIBRARY
    TetraSDK_GPS_LIBRARY
    TetraSDK_DESKTOP_LIBRARY
    TetraSDK_ethernet_LIBRARY
    TetraSDK_EXPLORER_LIBRARY
    TetraSDK_gprs_LIBRARY
    TetraSDK_spmci_LIBRARY
    TetraSDK_ACCELERO_LIBRARY
    TetraSDK_HEADER_LIBRARY
    TetraSDK_INACTIVI_LIBRARY
    TetraSDK_tmscall_LIBRARY
    TetraSDK_tmsdownload_LIBRARY
    TetraSDK_modem_LIBRARY
    TetraSDK_MONITOR_LIBRARY
    TetraSDK_PRINTER_LIBRARY
    TetraSDK_SCRSAVER_LIBRARY
    TetraSDK_Security_LIBRARY
    TetraSDK_SETTING_LIBRARY
    TetraSDK_softmgt_LIBRARY
    TetraSDK_TrEngine_LIBRARY
    TetraSDK_VIRT_KB_LIBRARY
    TetraSDK_tlvtree_t3_LIBRARY
    TetraSDK_Bridge_LIBRARY
    TetraSDK_MORPHO_LIBRARY
    TetraSDK_1LINESCR_LIBRARY
    TetraSDK_CASHDRAW_LIBRARY
    TetraSDK_chip_LIBRARY
    TetraSDK_cless_LIBRARY
    TetraSDK_led_LIBRARY
    TetraSDK_Ppad_LIBRARY
    TetraSDK_swipe_LIBRARY
    TetraSDK_transac_LIBRARY
    TetraSDK_token_LIBRARY
    TetraSDK_tmsapplication_LIBRARY
    TetraSDK_mifareProxy_LIBRARY
    TetraSDK_hbeat_LIBRARY
    TetraSDK_autoinit_LIBRARY
    # Objects
    TetraSDK_startup_tplusentry_LIBRARY
    TetraSDK_stapp_legacyexitpoint_LIBRARY
  VERSION_VAR TetraSDK_VERSION
)

if(TetraSDK_FOUND AND NOT TARGET TetraSDK::TetraSDK)
  # SO Libraries Tplus
  tetra_add_library(acl)
  tetra_add_library(attr)
  tetra_add_shared_library(telinux)
  # SDK Libraries Tplus
  tetra_add_library(bluetooth)
  tetra_add_library(wifi)
  tetra_add_library(packip)
  tetra_add_library(TmsCall_TPlus)
  tetra_add_library(GRAPHICS)
  tetra_add_library(ExtraGPRS)
  tetra_add_library(TPLUSMANAGER)
  tetra_add_library(PROTOBUF)
  tetra_add_library(OS)
  tetra_add_library(linklayer)
  tetra_add_library(SecurityTp)
  tetra_add_library(SPMCI_TPlus)
  tetra_add_library(ndef)
  tetra_add_library(TlvTree)
  tetra_add_library(wrapper_tplus)
  tetra_add_library(SQLITELIB)
  tetra_add_library(SERVICE)
  tetra_add_library(SVCDIRPX)
  tetra_add_library(SVCDIRSK)
  tetra_add_library(Sec)
  tetra_add_library(tpass)
  tetra_add_library(gtl)
  tetra_add_library(OSLAYER)
  tetra_add_library(mifare)
  tetra_add_library(Heartbeat_Interface_TPLUS)
  tetra_add_library(commmisc)
  tetra_add_library(GRAPHICLIB)
  # SDK Libraries T3
  tetra_add_library(wifi_t3)
  tetra_add_library(BATTERY)
  tetra_add_library(BLIGHT)
  tetra_add_library(BUZZER)
  tetra_add_library(CAPTURE)
  tetra_add_library(BIO)
  tetra_add_library(PPADTEXT)
  tetra_add_library(GPS)
  tetra_add_library(DESKTOP)
  tetra_add_library(ethernet)
  tetra_add_library(EXPLORER)
  tetra_add_library(gprs)
  tetra_add_library(spmci)
  tetra_add_library(ACCELERO)
  tetra_add_library(HEADER)
  tetra_add_library(INACTIVI)
  tetra_add_library(tmscall)
  tetra_add_library(tmsdownload)
  tetra_add_library(modem)
  tetra_add_library(MONITOR)
  tetra_add_library(PRINTER)
  tetra_add_library(SCRSAVER)
  tetra_add_library(Security)
  tetra_add_library(SETTING)
  tetra_add_library(softmgt)
  tetra_add_library(TrEngine)
  tetra_add_library(VIRT_KB)
  tetra_add_library(tlvtree_t3)
  tetra_add_library(Bridge)
  tetra_add_library(MORPHO)
  tetra_add_library(1LINESCR)
  tetra_add_library(CASHDRAW)
  tetra_add_library(chip)
  tetra_add_library(cless)
  tetra_add_library(led)
  tetra_add_library(Ppad)
  tetra_add_library(swipe)
  tetra_add_library(transac)
  tetra_add_library(token)
  tetra_add_library(tmsapplication)
  tetra_add_library(mifareProxy)
  tetra_add_library(hbeat)
  tetra_add_library(autoinit)

  # Internal dependencies
  target_link_libraries(TetraSDK::OS INTERFACE TetraSDK::PROTOBUF TetraSDK::telinux)
  target_link_libraries(TetraSDK::GRAPHICS INTERFACE TetraSDK::OS)
  target_link_libraries(TetraSDK::SERVICE INTERFACE TetraSDK::SVCDIRPX TetraSDK::OS TetraSDK::PROTOBUF TetraSDK::telinux)
  target_link_libraries(TetraSDK::SVCDIRPX INTERFACE TetraSDK::SERVICE TetraSDK::OS TetraSDK::PROTOBUF)
  target_link_libraries(TetraSDK::SVCDIRSK INTERFACE TetraSDK::SVCDIRPX TetraSDK::SERVICE TetraSDK::OS TetraSDK::PROTOBUF TetraSDK::telinux)
  target_link_libraries(TetraSDK::1LINESCR INTERFACE TetraSDK::SERVICE)
  target_link_libraries(TetraSDK::ACCELERO INTERFACE TetraSDK::SERVICE TetraSDK::PROTOBUF)
  target_link_libraries(TetraSDK::BATTERY INTERFACE TetraSDK::SERVICE TetraSDK::PROTOBUF)
  target_link_libraries(TetraSDK::BIO INTERFACE TetraSDK::SERVICE TetraSDK::PROTOBUF)
  target_link_libraries(TetraSDK::BLIGHT INTERFACE TetraSDK::SERVICE TetraSDK::PROTOBUF)
  target_link_libraries(TetraSDK::Bridge INTERFACE TetraSDK::SERVICE TetraSDK::OS TetraSDK::PROTOBUF TetraSDK::SVCDIRPX)
  target_link_libraries(TetraSDK::BUZZER INTERFACE TetraSDK::SERVICE TetraSDK::PROTOBUF)
  target_link_libraries(TetraSDK::CAPTURE INTERFACE TetraSDK::SERVICE TetraSDK::PROTOBUF)
  target_link_libraries(TetraSDK::CASHDRAW INTERFACE TetraSDK::SERVICE TetraSDK::PROTOBUF)
  target_link_libraries(TetraSDK::DESKTOP INTERFACE TetraSDK::SERVICE TetraSDK::PROTOBUF)
  target_link_libraries(TetraSDK::EXPLORER INTERFACE TetraSDK::SERVICE TetraSDK::GRAPHICS TetraSDK::OS TetraSDK::PROTOBUF TetraSDK::SETTING TetraSDK::telinux)
  target_link_libraries(TetraSDK::GPS INTERFACE TetraSDK::SERVICE TetraSDK::PROTOBUF TetraSDK::SETTING)
  target_link_libraries(TetraSDK::GRAPHICS INTERFACE TetraSDK::OS)
  target_link_libraries(TetraSDK::HEADER INTERFACE TetraSDK::SERVICE TetraSDK::PROTOBUF)
  target_link_libraries(TetraSDK::INACTIVI INTERFACE TetraSDK::SERVICE TetraSDK::PROTOBUF)
  target_link_libraries(TetraSDK::MONITOR INTERFACE TetraSDK::SERVICE TetraSDK::PROTOBUF TetraSDK::SETTING)
  target_link_libraries(TetraSDK::MORPHO INTERFACE TetraSDK::SERVICE TetraSDK::PROTOBUF)
  target_link_libraries(TetraSDK::PPADTEXT INTERFACE TetraSDK::SERVICE TetraSDK::PROTOBUF)
  target_link_libraries(TetraSDK::PRINTER INTERFACE TetraSDK::SERVICE TetraSDK::PROTOBUF TetraSDK::telinux)
  target_link_libraries(TetraSDK::SCRSAVER INTERFACE TetraSDK::SERVICE TetraSDK::PROTOBUF)
  target_link_libraries(TetraSDK::SETTING INTERFACE TetraSDK::SERVICE TetraSDK::OS TetraSDK::PROTOBUF TetraSDK::telinux)
  target_link_libraries(TetraSDK::TrEngine INTERFACE TetraSDK::SERVICE TetraSDK::OS TetraSDK::PROTOBUF TetraSDK::telinux)
  target_link_libraries(TetraSDK::VIRT_KB INTERFACE TetraSDK::SERVICE TetraSDK::PROTOBUF TetraSDK::DESKTOP)


  # Compile definitions and options
  set(TetraSDK_DEFINITIONS
    __FRAMEWORK_TELIUM_PLUS__=1
    _EXPORT_=1
    _PACKAGE_NAME_=TeliumPlusSDK
    SDK_VERSION=${TetraSDK_VERSION_DEFINE}
    __TELIUM3__=1
    __FRAMEWORK_TELIUM_3__=1
  )

  set(TetraSDK_LINK_OPTIONS
    -z noexecstack
    -Wl,--as-needed
    -Wl,-I/lib/ld-linux.so.3
    -Wl,--exclude-libs,ALL
    -Wl,--allow-shlib-undefined
  )

  add_library(TetraSDK::TetraSDK INTERFACE IMPORTED)

  target_compile_definitions(
      TetraSDK::TetraSDK
    INTERFACE
      ${TetraSDK_DEFINITIONS}
  )

  target_link_options(
      TetraSDK::TetraSDK
    INTERFACE
      ${TetraSDK_LINK_OPTIONS}
  )

  target_link_libraries(
      TetraSDK::TetraSDK
    INTERFACE
      # SO Libraries Tplus
      TetraSDK::acl
      TetraSDK::attr
      TetraSDK::telinux
      # SDK Libraries Tplus
      TetraSDK::bluetooth
      TetraSDK::wifi
      TetraSDK::packip
      TetraSDK::TmsCall_TPlus
      TetraSDK::GRAPHICS
      TetraSDK::ExtraGPRS
      TetraSDK::TPLUSMANAGER
      TetraSDK::PROTOBUF
      TetraSDK::OS
      TetraSDK::linklayer
      TetraSDK::SecurityTp
      TetraSDK::SPMCI_TPlus
      TetraSDK::ndef
      TetraSDK::TlvTree
      TetraSDK::wrapper_tplus
      TetraSDK::SQLITELIB
      TetraSDK::SERVICE
      TetraSDK::SVCDIRPX
      TetraSDK::SVCDIRSK
      TetraSDK::Sec
      TetraSDK::tpass
      TetraSDK::gtl
      TetraSDK::OSLAYER
      TetraSDK::mifare
      TetraSDK::Heartbeat_Interface_TPLUS
      TetraSDK::commmisc
      TetraSDK::GRAPHICLIB
      # SDK Libraries T3
      TetraSDK::wifi_t3
      TetraSDK::BATTERY
      TetraSDK::BLIGHT
      TetraSDK::BUZZER
      TetraSDK::BIO
      TetraSDK::PPADTEXT
      TetraSDK::GPS
      TetraSDK::DESKTOP
      TetraSDK::ethernet
      TetraSDK::EXPLORER
      TetraSDK::gprs
      TetraSDK::spmci
      TetraSDK::HEADER
      TetraSDK::INACTIVI
      TetraSDK::tmscall
      TetraSDK::tmsdownload
      TetraSDK::modem
      TetraSDK::MONITOR
      TetraSDK::PRINTER
      TetraSDK::SCRSAVER
      TetraSDK::Security
      TetraSDK::SETTING
      TetraSDK::softmgt
      TetraSDK::TrEngine
      TetraSDK::VIRT_KB
      TetraSDK::tlvtree_t3
      TetraSDK::Bridge
      TetraSDK::MORPHO
      TetraSDK::1LINESCR
      TetraSDK::CASHDRAW
      TetraSDK::chip
      TetraSDK::cless
      TetraSDK::led
      TetraSDK::Ppad
      TetraSDK::swipe
      TetraSDK::transac
      TetraSDK::token
      TetraSDK::tmsapplication
      TetraSDK::mifareProxy
      TetraSDK::hbeat
      TetraSDK::autoinit
  )

  add_library(TetraSDK::TPlusEntry INTERFACE IMPORTED)
  target_link_libraries(
      TetraSDK::TPlusEntry
    INTERFACE
      ${TetraSDK_startup_tplusentry_LIBRARY}
      ${TetraSDK_stapp_legacyexitpoint_LIBRARY}
  )

  # Helpers
  add_library(TetraSDK::application INTERFACE IMPORTED)
  target_link_libraries(
      TetraSDK::application
    INTERFACE
      TetraSDK::TPlusEntry
      TetraSDK::TetraSDK
  )

  add_library(TetraSDK::library INTERFACE IMPORTED)
  target_link_libraries(
      TetraSDK::library
    INTERFACE
      TetraSDK::TetraSDK
  )
endif()
