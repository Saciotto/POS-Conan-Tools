# Generate the package

To generate the engage-toolchain package:

* Copy all folders in toolchain folder to the root of the package, the package will look like this:

```
toolchain
├───arm-linux-gnueabihf
│   ├───bin
│   ├───debug-root
│   ├───include
│   └───libc
├───bin
├───lib
│   └───gcc
└───libexec
    └───gcc
```

* In the **package folder**, execute the following command to create the package:

```
conan export-pkg path/to/conanfile.py engage-toolchain/version@user/channel
```

# Test the package

In **this folder**, execute:

```
conan test test_package engage-toolchain/version@user/channel --profile:build=default
```

# Upload the package

In any folder, execute:

```
conan upload engage-toolchain/version --all -r remote
```
