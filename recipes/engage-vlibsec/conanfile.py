import os

from conans import ConanFile, tools


class EngageVLibSecConan(ConanFile):
    name = 'engage-vlibsec'
    url = 'https://github.com/Saciotto/pos-conan-tools'
    author = 'Matheus Rossi Saciotto'
    description = 'Key manager for Verifone Engage'
    settings = 'os', 'arch'
    exports_sources = 'FindEngageVLibSec.cmake'

    def package(self):
        tools.save("vlibsec_version.txt", self.version)
        self.copy('*.a', dst='lib', keep_path=False , excludes=['*debug*'], ignore_case=True)
        self.copy('*.h', dst='include', keep_path=False)
        self.copy('FindEngageVLibSec.cmake')
        self.copy('vlibsec_version.txt')
        
    def package_info(self):
        self.cpp_info.includedirs = ['include']
        self.cpp_info.libdirs = ['lib']
