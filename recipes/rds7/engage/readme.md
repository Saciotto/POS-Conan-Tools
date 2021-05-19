# Generate the package

> Note: This package requires engage-toolchain and engage-adk.

To generate the RDS7 package for Verifone Engage terminals:

* In the **package folder**, execute the following command to create the package:

```
conan export-pkg path/to/conanfile.py rds7/version@user/channel -pr=path/to/verifone-engage-profile.txt

conan export-pkg C:/Workspace/pos-conan-tools/recipes/rds7/engage/conanfile.py rds7/304A@getnet/stable -pr=C:/Workspace/pos-conan-tools/models/verifone-engage-profile.txt
```

# Test the package

In **this folder**, execute:

```
conan test test_package rds7/version@user/channel --profile:build=default --profile:host=path/to/verifone-engage-profile.txt

conan test test_package rds7/304A@getnet/stable --profile:build=default --profile:host=C:/Workspace/pos-conan-tools/models/verifone-engage-profile.txt
```

# Upload the package

In any folder, execute:

```
conan upload rds7/version --all -r remote
```
