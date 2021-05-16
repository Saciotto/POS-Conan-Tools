# Generate the package

> Note: This package requires engage-toolchain.

To generate the engage-adk package:

* Copy all folders in `adk-full-ext-xxx/vos2` folder to the root of the package, the package will look like this:

```
├───abi
├───bin
├───include
├───lib
├───load
├───tools
├───usr
│   ├───include
│   ├───lib
│   ├───local
│   └───share
└───www
```

* In the **package folder**, execute the following command to create the package:

```
conan export-pkg path/to/conanfile.py engage-adk/version@user/channel -pr=path/to/verifone-engage-profile.txt
```

# Test the package

In **this folder**, execute:

```
conan test test_package engage-adk/version@user/channel --profile:build=default --profile:host=path/to/verifone-engage-profile.txt
```

# Upload the package

In any folder, execute:

```
conan upload engage-adk/version --all -r remote
```
