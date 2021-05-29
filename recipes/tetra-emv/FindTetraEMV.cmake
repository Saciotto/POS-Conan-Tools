if(DEFINED TetraEMV_ROOT_DIR)
  set(search_paths_lib "${TetraEMV_ROOT_DIR}/SDKTPLUS_EmvApi/HW_TETRA/gnu_473/lib" "${TetraEMV_ROOT_DIR}/SDKTPLUS_Engine/HW_TETRA/gnu_473/lib")
  set(search_paths_inc "${TetraEMV_ROOT_DIR}/SDKTPLUS_EmvApi/HW_TETRA/gnu_473/inc" "${TetraEMV_ROOT_DIR}/SDKTPLUS_Engine/HW_TETRA/gnu_473/inc")
  set(_no_default_path "NO_DEFAULT_PATH")
else()
  set(search_paths_inc "SDKTPLUS_EmvApi/HW_TETRA/gnu_473/lib" "SDKTPLUS_Engine/HW_TETRA/gnu_473/inc")
  set(search_paths_inc "SDKTPLUS_EmvApi/HW_TETRA/gnu_473/inc" "SDKTPLUS_Engine/HW_TETRA/gnu_473/inc")
endif()

macro(tetra_emv_add_library name)
  add_library(TetraEMV::${name} UNKNOWN IMPORTED)
  set_target_properties(
      TetraEMV::${name}
    PROPERTIES
      IMPORTED_LOCATION "${TetraEMV_${name}_LIBRARY}"
      INTERFACE_INCLUDE_DIRECTORIES "${TetraEMV_${name}_INCLUDE_DIRS}"
  )
endmacro()

find_library(TetraEMV_emvapi_LIBRARY NAMES emvapi PATHS ${search_paths_lib} ${_no_default_path})
find_path(TetraEMV_emvapi_INCLUDE_DIRS NAMES EMV_Api.h PATHS ${search_paths_inc} ${_no_default_path})

find_library(TetraEMV_emvengine_LIBRARY NAMES emvengine PATHS ${search_paths_lib} ${_no_default_path})
find_path(TetraEMV_emvengine_INCLUDE_DIRS NAMES EmvEngineInterface.h PATHS ${search_paths_inc} ${_no_default_path})

find_library(TetraEMV_emvcochecksum_LIBRARY NAMES emvcochecksum PATHS ${search_paths_lib} ${_no_default_path})
find_path(TetraEMV_emvcochecksum_INCLUDE_DIRS NAMES EMV_Checksum.h PATHS ${search_paths_inc} ${_no_default_path})

set(TetraEMV_INCLUDE_DIRS ${TetraEMV_emvapi_INCLUDE_DIRS} ${TetraEMV_emvengine_INCLUDE_DIRS} ${TetraEMV_emvcochecksum_INCLUDE_DIRS})

find_file(VERSION_TXT NAMES tetra_emv_version.txt PATHS ${RDS7_ROOT_DIR} ${_no_default_path})
if(NOT VERSION_TXT STREQUAL "VERSION_TXT-NOTFOUND")
  file(STRINGS "${VERSION_TXT}" VERSION_FILE)
  string(REGEX REPLACE "^([0-9]+).*$" "\\1" TetraEMV_VERSION_MAJOR "${VERSION_FILE}")
  string(REGEX REPLACE "^[0-9]+\\.([0-9]+).*$" "\\1" TetraEMV_VERSION_MINOR  "${VERSION_FILE}")
  string(REGEX REPLACE "^[0-9]+\\.[0-9]+\\.([0-9]+).*$" "\\1" TetraEMV_VERSION_PATCH "${VERSION_FILE}")
  set(TetraEMV_VERSION "${TetraEMV_VERSION_MAJOR}.${TetraEMV_VERSION_MINOR}.${TetraEMV_VERSION_PATCH}")

  set(TetraEMV_VERSION_TWEAK "")
  if("${VERSION_FILE}" MATCHES "^[0-9]+\\.[0-9]+\\.[0-9]+\\.([0-9]+)")
    set(TetraEMV_VERSION_TWEAK "${CMAKE_MATCH_1}")
    string(APPEND TetraEMV_VERSION ".${TetraEMV_VERSION_TWEAK}")
  endif()
endif()

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(
    TetraEMV
  REQUIRED_VARS
    TetraEMV_emvapi_LIBRARY
    TetraEMV_emvcochecksum_LIBRARY
    TetraEMV_emvengine_LIBRARY
    TetraEMV_INCLUDE_DIRS
  VERSION_VAR TetraEMV_VERSION
)

if(TetraEMV_FOUND AND NOT TARGET TetraEMV::TetraEMV)
  tetra_emv_add_library(emvapi)
  tetra_emv_add_library(emvcochecksum)
  tetra_emv_add_library(emvengine)

  add_library(TetraEMV::TetraEMV INTERFACE IMPORTED)
  target_link_libraries(
      TetraEMV::TetraEMV
    INTERFACE
      TetraEMV::emvapi
      TetraEMV::emvcochecksum
      TetraEMV::emvengine
)
endif()
