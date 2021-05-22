# Generate the package

> Note: This package requires engage-toolchain and engage-adk or tetra-toolchain and tetra-sdk.

To generate the RDS7 package:

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

# Examples

* Verifone Engage:

```
# Generate
conan export-pkg C:/Workspace/pos-conan-tools/recipes/rds7/conanfile.py rds7/304A@pos/stable -pr=C:/Workspace/pos-conan-tools/profiles/verifone-engage.txt

# Test
conan test test_package_engage rds7/304A@pos/stable --profile:build=default --profile:host=C:/Workspace/pos-conan-tools/profiles/verifone-engage.txt

# Upload
conan upload rds7/304A --all -r local
```

* Ingenico Tetra:

```
# Generate
conan export-pkg C:/Workspace/pos-conan-tools/recipes/rds7/conanfile.py rds7/404B@pos/stable -pr=C:/Workspace/pos-conan-tools/profiles/ingenico-tetra.txt

# Test
conan test test_package_tetra rds7/404B@pos/stable --profile:build=default --profile:host=C:/Workspace/pos-conan-tools/profiles/ingenico-tetra.txt

# Upload
conan upload rds7/404B --all -r local
```
