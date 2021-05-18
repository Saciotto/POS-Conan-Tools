#[=======================================================================[.rst:
FindEngageVLibSec
-------

Finds the vlibsec library.

Imported Targets
^^^^^^^^^^^^^^^^

This module provides the following imported targets, if found:

``EngageVLibSec::EngageVLibSec``
  The vlibsec library

Result Variables
^^^^^^^^^^^^^^^^

This will define the following variables:

``EngageVLibSec_FOUND``
  True if the system has the vlibsec.
``EngageVLibSec_INCLUDE_DIR``
  The path to v-libsec.h
``EngageVLibSec_INCLUDE_DIRS``
  Include directories needed to use vlibsec.
``EngageVLibSec_LIBRARIES``
  Libraries needed to link to vlibsec.
``EngageVLibSec_VERSION``
  The version of the vlibsec library which was found.
``EngageVLibSec_VERSION_MAJOR``
  The major version of the package found.
``EngageVLibSec_VERSION_MINOR``
  The minor version of the package found.
``EngageVLibSec_VERSION_PATCH``
  The patch version of the package found.
``EngageVLibSec_VERSION_TWEAK``
  The patch version of the package found.

Hints
^^^^^

A user may set ``EngageVLibSec_ROOT_DIR`` to a vlibsec installation root 
to tell this module where to look.
#]=======================================================================]

if(DEFINED EngageVLibSec_ROOT_DIR)
  set(_no_default_path "NO_DEFAULT_PATH")
endif()

find_library(EngageVLibSec_LIBRARY NAMES vlibsec PATHS ${EngageVLibSec_ROOT_DIR} PATH_SUFFIXES release lib ${_no_default_path})
find_path(EngageVLibSec_INCLUDE_DIR NAMES v-libsec.h PATHS ${EngageVLibSec_ROOT_DIR} PATH_SUFFIXES release include ${_no_default_path})
find_path(VERSION_TXT_DIR NAMES vlibsec_version.txt PATHS ${EngageVLibSec_ROOT_DIR} ${_no_default_path})

if(NOT VERSION_TXT_DIR STREQUAL "VERSION_TXT_DIR-NOTFOUND")
  file(STRINGS "${VERSION_TXT_DIR}/vlibsec_version.txt" VERSION_FILE)
  string(REGEX REPLACE "^([0-9]+).*$" "\\1" EngageVLibSec_VERSION_MAJOR "${VERSION_FILE}")
  string(REGEX REPLACE "^[0-9]+\\.([0-9]+).*$" "\\1" EngageVLibSec_VERSION_MINOR  "${VERSION_FILE}")
  string(REGEX REPLACE "^[0-9]+\\.[0-9]+\\.([0-9]+).*$" "\\1" EngageVLibSec_VERSION_PATCH "${VERSION_FILE}")
  set(EngageVLibSec_VERSION "${EngageVLibSec_VERSION_MAJOR}.${EngageVLibSec_VERSION_MINOR}.${EngageVLibSec_VERSION_PATCH}")

  set(EngageVLibSec_VERSION_TWEAK "")
  if("${VERSION_FILE}" MATCHES "^[0-9]+\\.[0-9]+\\.[0-9]+\\.([0-9]+)")
    set(EngageVLibSec_VERSION_TWEAK "${CMAKE_MATCH_1}")
    string(APPEND EngageVLibSec_VERSION ".${EngageVLibSec_VERSION_TWEAK}")
  endif()
endif()

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(
    EngageVLibSec
  REQUIRED_VARS
    EngageVLibSec_LIBRARY
    EngageVLibSec_INCLUDE_DIR
  VERSION_VAR
    EngageVLibSec_VERSION
)

if(EngageVLibSec_FOUND AND NOT TARGET EngageVLibSec::EngageVLibSec)
  set(EngageVLibSec_INCLUDE_DIRS "${EngageVLibSec_INCLUDE_DIR}")

  add_library(EngageVLibSec::EngageVLibSec STATIC IMPORTED)
  set_target_properties(
      EngageVLibSec::EngageVLibSec
    PROPERTIES
      IMPORTED_LOCATION "${EngageVLibSec_LIBRARY}"
      INTERFACE_INCLUDE_DIRECTORIES "${EngageVLibSec_INCLUDE_DIRS}"
  )
endif()
