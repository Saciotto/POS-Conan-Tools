import os

from conans import ConanFile, tools


class TetraSdkConan(ConanFile):
    name = 'tetra-sdk'
    url = 'https://github.com/Saciotto/pos-conan-tools'
    author = 'Matheus Rossi Saciotto'
    description = 'Core libraries for Ingenico Telium Tetra'
    settings = 'os', 'arch', 'manufacturer'
    exports_sources = 'FindTetraSDK.cmake'

    def package(self):
        tools.save('tetrasdk_version.txt', self.version)
        self.copy('SDKT3/*')
        self.copy('SDKTPLUS/*')
        self.copy('*Descriptor.xml')
        self.copy('tetrasdk_version.txt')
        self.copy('FindTetraSDK.cmake')
