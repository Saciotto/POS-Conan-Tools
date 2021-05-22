import os

from conans import ConanFile, tools


class EngageAdkConan(ConanFile):
    name = 'engage-adk'
    url = 'https://github.com/Saciotto/pos-conan-tools'
    author = 'Matheus Rossi Saciotto'
    description = 'Core libraries for Verifone Engage'
    settings = 'os', 'arch', 'manufacturer'
    exports_sources = "FindEngageADK.cmake"

    def package(self):
        tools.save("version.txt", self.version)
        self.copy('*', excludes=["conanfile.py", "test_package, readme.md"])
        
    def package_info(self):
        self.output.info(f'Creating self.env_info.SYSROOT: {self.package_folder}')
        self.env_info.SYSROOT = self.package_folder
        self.output.info(f'Creating self.env_info.CONAN_CMAKE_FIND_ROOT_PATH: {self.package_folder}')
        self.env_info.CONAN_CMAKE_FIND_ROOT_PATH = self.package_folder
        self.output.info(f'Creating self.cpp_info.sysroot: {self.package_folder}')
        self.cpp_info.sysroot = self.package_folder
