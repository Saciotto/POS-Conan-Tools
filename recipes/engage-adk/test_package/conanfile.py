import os

from conans import ConanFile, CMake


class TestEngageAdkConan(ConanFile):
    settings = "os", "arch"
    generators = "cmake_paths"

    def build(self):
        cmake = CMake(self, generator="Ninja")
        cmake.configure()
        cmake.build()

    def test(self):
        assert os.path.exists("example")
