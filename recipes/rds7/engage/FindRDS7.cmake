#[=======================================================================[.rst:
FindRDS7
-------

Finds the RDS7 library.

Imported Targets
^^^^^^^^^^^^^^^^

This module provides the following imported targets, if found:

``RDS7::RDS7``
  The RDS7 library

Result Variables
^^^^^^^^^^^^^^^^

This will define the following variables:

``RDS7_FOUND``
  True if the system has the RDS7.
``RDS7_INCLUDE_DIR``
  The path to RDS7.h
``RDS7_INCLUDE_DIRS``
  Include directories needed to use RDS7.
``RDS7_LIBRARY``
  The libRDS7.a library.
``RDS7_LIBRARIES``
  Libraries needed to link to RDS7.
``RDS7VERSION``
  The version of the RDS7 library which was found.

Hints
^^^^^

A user may set ``RDS7_ROOT_DIR`` to a RDS7 installation root to tell this 
module where to look.
#]=======================================================================]

if(DEFINED RDS7_ROOT_DIR)
  set(_no_default_path "NO_DEFAULT_PATH")
endif()

find_library(RDS7_LIBRARY NAMES RDS7 PATHS ${RDS7_ROOT_DIR} PATH_SUFFIXES lib ${_no_default_path})
find_path(RDS7_INCLUDE_DIR NAMES RDS7.h PATHS ${RDS7_ROOT_DIR} PATH_SUFFIXES include ${_no_default_path})
find_file(VERSION_TXT NAMES rds7_version.txt PATHS ${RDS7_ROOT_DIR} ${_no_default_path})

if(NOT VERSION_TXT STREQUAL "VERSION_TXT-NOTFOUND")
  file(STRINGS "${VERSION_TXT}" RDS7_VERSION)
endif()

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(
    RDS7
  REQUIRED_VARS
    RDS7_LIBRARY
    RDS7_INCLUDE_DIR
  VERSION_VAR
    RDS7_VERSION
)

if(RDS7_FOUND AND NOT TARGET RDS7::RDS7)
  set(RDS7_INCLUDE_DIRS "${RDS7_INCLUDE_DIR}")
  set(RDS7_LIBRARIES "${RDS7_LIBRARY}")

  add_library(RDS7::RDS7 STATIC IMPORTED)
  set_target_properties(
      RDS7::RDS7
    PROPERTIES
      IMPORTED_LOCATION "${RDS7_LIBRARY}"
      INTERFACE_INCLUDE_DIRECTORIES "${RDS7_INCLUDE_DIRS}"
  )
endif()
