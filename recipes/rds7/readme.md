# Generate the package

> Note: This package requires engage-toolchain and engage-adk or tetra-toolchain and tetra-sdk.

To generate the RDS7 package for Verifone Engage terminals:

* In the **package folder**, execute the following command to create the package:

```
conan export-pkg path/to/conanfile.py rds7/version@user/channel -pr=path/to/profile.txt
```

# Test the package

In **this folder**, execute:

```
conan test test_package_model rds7/version@user/channel --profile:build=default --profile:host=path/to/profile.txt
```

# Upload the package

In any folder, execute:

```
conan upload rds7/version --all -r remote
```
