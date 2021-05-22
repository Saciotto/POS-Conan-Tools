# Generate the package

> Note: This package requires engage-toolchain and engage-adk.

To generate the engage-vlibsec package:

* In the **package folder**, execute the following command to create the package:

```
conan export-pkg path/to/conanfile.py engage-vlibsec/version@user/channel -pr=path/to/profile/verifone-engage.txt
```

# Test the package

In **this folder**, execute:

```
conan test test_package engage-vlibsec/version@user/channel --profile:build=default --profile:host=path/to/profile/verifone-engage.txt
```

# Upload the package

In any folder, execute:

```
conan upload engage-vlibsec/version --all -r remote
```

# Examples

```
# Generate
conan export-pkg C:/Workspace/pos-conan-tools/recipes/engage-vlibsec/conanfile.py engage-vlibsec/1.0.25@pos/stable -pr=C:/Workspace/pos-conan-tools/profiles/verifone-engage.txt

# Test
conan test test_package engage-vlibsec/1.0.25@pos/stable --profile:build=default --profile:host=C:/Workspace/pos-conan-tools/profiles/verifone-engage.txt

# Upload
conan upload engage-vlibsec/1.0.25 --all -r local
```