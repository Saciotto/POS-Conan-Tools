cmake_minimum_required(VERSION 3.15)
project(TestPackage C)

include(${CMAKE_BINARY_DIR}/conan_paths.cmake)

find_package(EngageADK REQUIRED)
find_package(RDS7 REQUIRED)

add_executable(example example.c)
target_link_libraries(example PRIVATE RDS7::RDS7 EngageADK::EngageADK)
