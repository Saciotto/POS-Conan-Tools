cmake_minimum_required(VERSION 3.15)
project(TestPackage C)

include(${CMAKE_BINARY_DIR}/conan_paths.cmake)

find_package(EngageADK REQUIRED)
find_package(EngageVLibSec REQUIRED)
target_link_libraries(EngageVLibSec::EngageVLibSec INTERFACE EngageADK::EngageADK)

add_executable(example example.c)
target_link_libraries(example PRIVATE EngageVLibSec::EngageVLibSec)
