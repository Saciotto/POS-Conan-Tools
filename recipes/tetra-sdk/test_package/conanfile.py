import os

from conans import ConanFile, CMake


class TestEngageAdkConan(ConanFile):
    settings = "os", "arch"
    generators = "cmake_paths"
    build_requires = "tetra-toolchain/8.20.26@getnet/stable"

    def build(self):
        cmake = CMake(self, generator="Ninja")
        cmake.configure()
        cmake.build()

    def test(self):
        assert os.path.exists("example_app")
        assert os.path.exists("libexample_lib_so.so")
