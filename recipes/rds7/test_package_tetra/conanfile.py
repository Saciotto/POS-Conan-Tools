import os

from conans import ConanFile, CMake


class TestRDS7Conan(ConanFile):
    settings = "os", "arch"
    generators = "cmake_paths"
    requires = 'tetra-sdk/11.20.3.Patch0A@pos/stable'

    def build(self):
        cmake = CMake(self, generator="Ninja")
        cmake.configure()
        cmake.build()

    def test(self):
        assert os.path.exists("example")
