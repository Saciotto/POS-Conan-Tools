# Generate the package

> Note: This package requires tetra-toolchain.

To generate the tetra-sdk package:

```
conan export-pkg path/to/conanfile.py tetra-sdk/version@user/channel -pr=path/to/ingenico-tetra-profile.txt
```

# Test the package

In **this folder**, execute:

```
conan test test_package tetra-sdk/version@user/channel --profile:build=default --profile:host=path/to/ingenico-tetra-profile.txt
```

# Upload the package

In any folder, execute:

```
conan upload tetra-sdk/version --all -r remote
```
