from conans import ConanFile, tools

class TestEngageToolchainConan(ConanFile):
    settings = "os", "arch"

    def build(self):
        pass

    def test(self):
        if not tools.cross_building(self):
            if self.settings.os == "Windows":
                self.run("arm-linux-gnueabihf-g++.exe --version", run_environment=True)
            else:
                self.run("arm-linux-gnueabihf-g++ --version", run_environment=True)
