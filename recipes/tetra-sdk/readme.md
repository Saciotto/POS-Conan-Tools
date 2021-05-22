# Generate the package

> Note: This package requires tetra-toolchain.

To generate the tetra-sdk package:

```
conan export-pkg path/to/conanfile.py tetra-sdk/version@user/channel -pr=path/to/profile/ingenico-tetra.txt
```

# Test the package

In **this folder**, execute:

```
conan test test_package tetra-sdk/version@user/channel --profile:build=default --profile:host=path/to/profile/ingenico-tetra.txt
```

# Upload the package

In any folder, execute:

```
conan upload tetra-sdk/version --all -r remote
```

# Examples

```
# Generate
conan export-pkg C:/Workspace/pos-conan-tools/recipes/tetra-sdk/conanfile.py tetra-sdk/11.20.3.Patch0A@pos/stable -pr=C:/Workspace/pos-conan-tools/profiles/ingenico-tetra.txt

# Test
conan test test_package tetra-sdk/11.20.3.Patch0A@pos/stable --profile:build=default --profile:host=C:/Workspace/pos-conan-tools/profiles/ingenico-tetra.txt

# Upload
conan upload tetra-sdk/11.20.3.Patch0A@pos/stable --all -r local
```
