Device configuration for generic Halium 10 systemimage
=====================================================

This repository is used to build a generic systemimage for Halium-compatible
operating systems.


Building
--------

This is a "device tree", and as such it can be built by loosely following the
instructions at [docs.halium.org](https://docs.halium.org); please see that
page for a list of build dependencies and more explicative informations on each
of the build steps.

Assuming that you have all the build dependencies and the `repo` tool, you
should run the following commands:

    # Get all the needed repositories for a Halium-based build
    repo init -u https://github.com/Halium/android -b halium-9.0 --depth=1

A copy of this very repository will be created in
`device/halium/halium_arm64/`; if you are interested in trying out a
modification or branch, apply your changes in the repo located in that
directory before proceeding:

    # Get the required repositories for this specific build
    ./halium/devices/setup halium_arm64

    # Apply Halium patches to the Android source tree
    hybris-patches/apply-patches.sh --mb

    # Setup the build environment
    source build/envsetup.sh && breakfast halium_arm64

    # Build the system image
    make systemimage

    # After quite some time, the output will be in
    # out/target/product/halium_arm64/system.img

Note: you need python 2.7 to build this; if the `python` program shipped by
your distribution is python version 3, the build will fail. Consider building
this project in a virtualenv:

    virtualenv --python 2.7 ~/python27  # adjust the path to your prefs
    source ~/python27/bin/activate

