cmake_minimum_required(VERSION 3.15)
project(TestPackage C)

include(${CMAKE_BINARY_DIR}/conan_paths.cmake)

find_package(TetraSDK REQUIRED)

add_library(example_lib_so SHARED example_lib_so.c)
target_link_libraries(example_lib_so PUBLIC TetraSDK::library)

add_library(example_lib_a STATIC example_lib_a.c)
target_link_libraries(example_lib_a PUBLIC TetraSDK::library)

add_executable(example_app example_app.c)
target_link_libraries(example_app PRIVATE TetraSDK::application example_lib_a)
