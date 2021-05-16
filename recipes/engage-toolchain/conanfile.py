import os

from conans import ConanFile, tools


class EngageToolchainConan(ConanFile):
    name = 'engage-toolchain'
    url = 'https://github.com/Saciotto/pos-conan-tools'
    author = 'Matheus Rossi Saciotto'
    description = 'Toolchain for Verifone Engage terminals'
    settings = 'os', 'arch'

    def _tool_name(self, tool):
        suffix = '.exe' if self.settings_build.os == 'Windows' else ''
        return f'{tool}{suffix}'

    def package(self):
        self.copy('arm-linux-gnueabihf/*')
        self.copy('bin/*')
        self.copy('lib/*')
        self.copy('libexec/*')
        
    def package_info(self):
        bin_folder = os.path.join(self.package_folder, 'bin')
        self.output.info(f'Adding folder to path: {bin_folder}')
        self.env_info.PATH.append(bin_folder)
        
        cc = os.path.join(bin_folder, self._tool_name('arm-linux-gnueabihf-gcc'))
        self.output.info(f'Creating self.env_info.CC: {cc}')
        self.env_info.CC = cc

        cxx = os.path.join(bin_folder, self._tool_name('arm-linux-gnueabihf-g++'))
        self.output.info(f'Creating self.env_info.CXX: {cxx}')
        self.env_info.CXX = cxx

        self.env_info.CMAKE_BUILD_WITH_INSTALL_RPATH = 'TRUE'
        self.env_info.CMAKE_INSTALL_RPATH = '/home/usr1'

        self.env_info.CMAKE_FIND_ROOT_PATH_MODE_PROGRAM = 'NEVER'
        self.env_info.CMAKE_FIND_ROOT_PATH_MODE_LIBRARY = 'BOTH'
        self.env_info.CMAKE_FIND_ROOT_PATH_MODE_INCLUDE = 'BOTH'
        self.env_info.CMAKE_FIND_ROOT_PATH_MODE_PACKAGE = 'BOTH'
