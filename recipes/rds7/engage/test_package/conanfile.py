import os

from conans import ConanFile, CMake


class TestRDS7Conan(ConanFile):
    settings = "os", "arch"
    generators = "cmake_paths"
    build_requires = 'engage-toolchain/13.03'
    requires = 'engage-adk/4.7.5.879@getnet/stable'

    def build(self):
        cmake = CMake(self, generator="Ninja")
        cmake.configure()
        cmake.build()

    def test(self):
        assert os.path.exists("example")
