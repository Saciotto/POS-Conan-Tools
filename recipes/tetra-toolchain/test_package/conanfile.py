from conans import ConanFile, tools


class TestTetraToolchainConan(ConanFile):
    settings = 'os', 'arch'

    def build(self):
        pass

    def test(self):
        if not tools.cross_building(self):
            if self.settings.os == 'Windows':
                self.run('arm-islero-linux-gnueabi-gcc.exe --version', run_environment=True)
            else:
                self.run('arm-islero-linux-gnueabi-gcc --version', run_environment=True)
