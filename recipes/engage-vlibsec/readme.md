# Generate the package

> Note: This package requires engage-toolchain and engage-adk.

To generate the engage-vlibsec package:

* In the **package folder**, execute the following command to create the package:

```
conan export-pkg path/to/conanfile.py engage-vlibsec/version@user/channel -pr=path/to/verifone-engage-profile.txt
```

# Test the package

In **this folder**, execute:

```
conan test test_package engage-vlibsec/version@user/channel --profile:build=default --profile:host=path/to/verifone-engage-profile.txt
```

# Upload the package

In any folder, execute:

```
conan upload engage-vlibsec/version --all -r remote
```
