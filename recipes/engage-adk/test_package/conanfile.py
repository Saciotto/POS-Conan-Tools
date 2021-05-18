import os

from conans import ConanFile, CMake


class TestEngageAdkConan(ConanFile):
    settings = "os", "arch"
    generators = "cmake_paths"
    build_requires = "engage-toolchain/13.03"

    def build(self):
        cmake = CMake(self, generator="Ninja")
        cmake.configure()
        cmake.build()

    def test(self):
        assert os.path.exists("example")
