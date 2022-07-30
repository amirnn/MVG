cmake_minimum_required(VERSION 3.0.0)
project(MVG VERSION 0.1.0)

#  CPP Settings
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
# set(CMAKE_CXX_FLAGS "-Wall -Wextra")
# set(CMAKE_CXX_FLAGS_DEBUG "-g -O0")

# try to prevent in-source builds
if("${PROJECT_SOURCE_DIR}" STREQUAL "${PROJECT_BINARY_DIR}")
    message(FATAL_ERROR "In-source builds are not allowed. Please create a separate 'build' directory and build in there.")
endif()

#------- tweaks for an improved build experience -------

# so language servers like clangd know what the buildsystem does
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# windows needs "exported" symbols for linking
set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)

# display many warnings during compilation
# they usually help you find some bugs
if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang|AppleClang")
    add_compile_options(-Wall -Wextra -Wconversion -pedantic -Wfatal-errors)
elseif(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
    add_compile_options(/W3 /WX)

    # so the dll files are alongside the executables
    # and the windows loader is happy (no more error 0xc0000135)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
endif()

# Conan Settings
include(${CMAKE_SOURCE_DIR}/conan/deploy/conanbuildinfo.cmake)
conan_basic_setup()

# set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin)
# set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/lib)
# set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/lib)
include_directories(${CMAKE_SOURCE_DIR}/include)


add_subdirectory("src")

# Tests
# include(CTest)
enable_testing()
add_subdirectory("tests")

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
