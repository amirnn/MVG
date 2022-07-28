# MVGCPP

A playground for MVG Course and its exercises.

----------

## Dependency install

To install the dependencies run the command below for your desired platform: (TODO: Linux Profiles)

```console
# Run following commands in a shell environment
cd conan/deploy
# Choose profile based on the platform and compiler
conan install .. --profile=../profiles/profile-macos --build=missing
# or in windows 
conan install .. --profile=..//profiles//windows-vs --build=missing
```
