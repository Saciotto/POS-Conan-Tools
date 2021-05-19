import os

from conans import ConanFile, tools


class RDS7Conan(ConanFile):
    name = 'rds7'
    url = 'https://github.com/Saciotto/pos-conan-tools'
    author = 'Matheus Rossi Saciotto'
    description = 'Suftware update manager'
    settings = 'os', 'arch', 'manufacturer'
    exports_sources = 'FindRDS7.cmake'

    def package(self):
        tools.save("rds7_version.txt", self.version)
        self.copy('*.a', dst='lib', keep_path=False , excludes=['export/*'], ignore_case=True)
        self.copy('*.h', dst='include', keep_path=False)
        self.copy('export/*')
        self.copy('FindRDS7.cmake')
        self.copy('rds7_version.txt')
        
    def package_info(self):
        self.cpp_info.includedirs = ['include']
        self.cpp_info.libdirs = ['lib']
