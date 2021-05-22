import os

from conans import ConanFile, tools


class TetraSdkConan(ConanFile):
    name = 'tetra-sdk'
    url = 'https://github.com/Saciotto/pos-conan-tools'
    author = 'Matheus Rossi Saciotto'
    description = 'Core libraries for Ingenico Telium Tetra'
    settings = 'os', 'arch'
    exports_sources = "FindTetraSDK.cmake"

    def package(self):
        tools.save("tetrasdk_version.txt", self.version)
        self.copy('*', excludes=["conanfile.py", "test_package, readme.md"])
