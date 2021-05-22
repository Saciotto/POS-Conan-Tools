# Generate the package

To generate the tetra-toolchain package:

* Copy all folders in `IngeDev_xxx/toolchains/gnuArm47v7a-4` folder to the root of the package, the package will look like this:

```
toolchain
├───arm-islero-linux-gnueabi
├───bin
├───include
├───lib
├───libexec
├───share
├───share
├───isystem.txt
└───toolchain.properties
```

* In the **package folder**, execute the following command to create the package:

```
conan export-pkg path/to/conanfile.py tetra-toolchain/version@user/channel
```

# Test the package

In **this folder**, execute:

```
conan test test_package tetra-toolchain/version@user/channel --profile:build=default
```

# Upload the package

In any folder, execute:

```
conan upload tetra-toolchain/version --all -r remote
```

# Examples

```
# Generate
conan export-pkg C:/Workspace/pos-conan-tools/recipes/tetra-toolchain/conanfile.py tetra-toolchain/8.20.26@pos/stable

# Test
conan test test_package tetra-toolchain/8.20.26@pos/stable --profile:build=default

# Upload
conan upload tetra-toolchain/8.20.26 --all -r local
```
