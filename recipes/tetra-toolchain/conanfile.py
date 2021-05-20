import os

from conans import ConanFile


class TetraToolchainConan(ConanFile):
    name = 'tetra-toolchain'
    url = 'https://github.com/Saciotto/pos-conan-tools'
    author = 'Matheus Rossi Saciotto'
    description = 'Toolchain for Ingenico Telium Tetra terminals'
    settings = 'os', 'arch'

    def _tool_name(self, tool):
        suffix = '.exe' if self.settings_build.os == 'Windows' else ''
        return f'{tool}{suffix}'

    def package(self):
        self.copy('arm-islero-linux-gnueabi/*')
        self.copy('bin/*')
        self.copy('include/*')
        self.copy('lib/*')
        self.copy('libexec/*')
        self.copy('share/*')
        self.copy('isystem.txt')
        self.copy('toolchain.properties')
        
    def package_info(self):
        bin_folder = os.path.join(self.package_folder, 'bin')
        self.output.info(f'Adding folder to path: {bin_folder}')
        self.env_info.PATH.append(bin_folder)
        
        cc = os.path.join(bin_folder, self._tool_name('arm-islero-linux-gnueabi-gcc'))
        self.output.info(f'Creating self.env_info.CC: {cc}')
        self.env_info.CC = cc

        cxx = os.path.join(bin_folder, self._tool_name('arm-islero-linux-gnueabi-g++'))
        self.output.info(f'Creating self.env_info.CXX: {cxx}')
        self.env_info.CXX = cxx

        sysroot = os.path.join(bin_folder, 'arm-islero-linux-gnueabi/sysroot')
        self.output.info(f'Creating self.env_info.SYSROOT: {sysroot}')
        self.env_info.SYSROOT = sysroot
        self.output.info(f'Creating self.env_info.CONAN_CMAKE_FIND_ROOT_PATH: {sysroot}')
        self.env_info.CONAN_CMAKE_FIND_ROOT_PATH = sysroot
        self.output.info(f'Creating self.cpp_info.sysroot: {sysroot}')
        self.cpp_info.sysroot = sysroot

        self.env_info.CMAKE_SKIP_BUILD_RPATH = 'TRUE'
        
        self.env_info.CMAKE_FIND_ROOT_PATH_MODE_PROGRAM = 'NEVER'
        self.env_info.CMAKE_FIND_ROOT_PATH_MODE_LIBRARY = 'BOTH'
        self.env_info.CMAKE_FIND_ROOT_PATH_MODE_INCLUDE = 'BOTH'
        self.env_info.CMAKE_FIND_ROOT_PATH_MODE_PACKAGE = 'BOTH'
