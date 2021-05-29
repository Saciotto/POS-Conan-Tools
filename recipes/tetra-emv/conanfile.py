import os

from conans import ConanFile, tools


class IngenicoTetraEmvConan(ConanFile):
    name = "ingenico-tetra-emv"
    author = "Matheus Rossi Saciotto"
    description = "Ingenico EMV kernel for Telium Tetra terminals"
    settings = "os", "arch", 'manufacturer'
    exports_sources = 'FindTetraEMV.cmake'

    def package(self):
        self.copy("*")
        
    def package_info(self):
        pass
