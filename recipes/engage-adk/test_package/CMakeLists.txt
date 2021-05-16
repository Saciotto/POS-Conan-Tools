cmake_minimum_required(VERSION 3.15)
project(TestPackage CXX)

include(${CMAKE_BINARY_DIR}/conan_paths.cmake)

find_package(EngageADK REQUIRED)

add_executable(example example.cpp)
target_link_libraries(example EngageADK::EngageADK)
