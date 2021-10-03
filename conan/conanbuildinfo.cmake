include(CMakeParseArguments)

macro(conan_find_apple_frameworks FRAMEWORKS_FOUND FRAMEWORKS SUFFIX BUILD_TYPE)
    if(APPLE)
        if(CMAKE_BUILD_TYPE)
            set(_BTYPE ${CMAKE_BUILD_TYPE})
        elseif(NOT BUILD_TYPE STREQUAL "")
            set(_BTYPE ${BUILD_TYPE})
        endif()
        if(_BTYPE)
            if(${_BTYPE} MATCHES "Debug|_DEBUG")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_DEBUG} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_DEBUG} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "Release|_RELEASE")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_RELEASE} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_RELEASE} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "RelWithDebInfo|_RELWITHDEBINFO")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_RELWITHDEBINFO} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_RELWITHDEBINFO} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "MinSizeRel|_MINSIZEREL")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_MINSIZEREL} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_MINSIZEREL} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            endif()
        endif()
        foreach(_FRAMEWORK ${FRAMEWORKS})
            # https://cmake.org/pipermail/cmake-developers/2017-August/030199.html
            find_library(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND NAME ${_FRAMEWORK} PATHS ${CONAN_FRAMEWORK_DIRS${SUFFIX}} CMAKE_FIND_ROOT_PATH_BOTH)
            if(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND)
                list(APPEND ${FRAMEWORKS_FOUND} ${CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND})
            else()
                message(FATAL_ERROR "Framework library ${_FRAMEWORK} not found in paths: ${CONAN_FRAMEWORK_DIRS${SUFFIX}}")
            endif()
        endforeach()
    endif()
endmacro()


#################
###  OPENCV
#################
set(CONAN_OPENCV_ROOT "/Users/amirnourinia/.conan/data/opencv/4.5.3/_/_/package/e40a8152015db40ac54b2f47955f57460439f1db")
set(CONAN_INCLUDE_DIRS_OPENCV "/Users/amirnourinia/.conan/data/opencv/4.5.3/_/_/package/e40a8152015db40ac54b2f47955f57460439f1db/include"
			"/Users/amirnourinia/.conan/data/opencv/4.5.3/_/_/package/e40a8152015db40ac54b2f47955f57460439f1db/include/opencv4")
set(CONAN_LIB_DIRS_OPENCV "/Users/amirnourinia/.conan/data/opencv/4.5.3/_/_/package/e40a8152015db40ac54b2f47955f57460439f1db/lib")
set(CONAN_BIN_DIRS_OPENCV "/Users/amirnourinia/.conan/data/opencv/4.5.3/_/_/package/e40a8152015db40ac54b2f47955f57460439f1db/bin")
set(CONAN_RES_DIRS_OPENCV "/Users/amirnourinia/.conan/data/opencv/4.5.3/_/_/package/e40a8152015db40ac54b2f47955f57460439f1db/res")
set(CONAN_SRC_DIRS_OPENCV )
set(CONAN_BUILD_DIRS_OPENCV "/Users/amirnourinia/.conan/data/opencv/4.5.3/_/_/package/e40a8152015db40ac54b2f47955f57460439f1db/"
			"/Users/amirnourinia/.conan/data/opencv/4.5.3/_/_/package/e40a8152015db40ac54b2f47955f57460439f1db/lib/cmake")
set(CONAN_FRAMEWORK_DIRS_OPENCV )
set(CONAN_LIBS_OPENCV opencv_ml opencv_photo opencv_highgui opencv_videoio opencv_imgcodecs opencv_objdetect opencv_stitching opencv_dnn opencv_gapi opencv_video opencv_calib3d opencv_features2d opencv_flann opencv_imgproc opencv_core)
set(CONAN_PKG_LIBS_OPENCV opencv_ml opencv_photo opencv_highgui opencv_videoio opencv_imgcodecs opencv_objdetect opencv_stitching opencv_dnn opencv_gapi opencv_video opencv_calib3d opencv_features2d opencv_flann opencv_imgproc opencv_core)
set(CONAN_SYSTEM_LIBS_OPENCV )
set(CONAN_FRAMEWORKS_OPENCV Cocoa Accelerate AVFoundation CoreGraphics CoreMedia CoreVideo QuartzCore)
set(CONAN_FRAMEWORKS_FOUND_OPENCV "")  # Will be filled later
set(CONAN_DEFINES_OPENCV )
set(CONAN_BUILD_MODULES_PATHS_OPENCV )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_OPENCV )

set(CONAN_C_FLAGS_OPENCV "")
set(CONAN_CXX_FLAGS_OPENCV "")
set(CONAN_SHARED_LINKER_FLAGS_OPENCV "")
set(CONAN_EXE_LINKER_FLAGS_OPENCV "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_OPENCV_LIST "")
set(CONAN_CXX_FLAGS_OPENCV_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_OPENCV_LIST "")
set(CONAN_EXE_LINKER_FLAGS_OPENCV_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_OPENCV "${CONAN_FRAMEWORKS_OPENCV}" "_OPENCV" "")
# Append to aggregated values variable
set(CONAN_LIBS_OPENCV ${CONAN_PKG_LIBS_OPENCV} ${CONAN_SYSTEM_LIBS_OPENCV} ${CONAN_FRAMEWORKS_FOUND_OPENCV})


#################
###  GTEST
#################
set(CONAN_GTEST_ROOT "/Users/amirnourinia/.conan/data/gtest/cci.20210126/_/_/package/1f92fc047be6947dccdb4e320225e324379c858d")
set(CONAN_INCLUDE_DIRS_GTEST "/Users/amirnourinia/.conan/data/gtest/cci.20210126/_/_/package/1f92fc047be6947dccdb4e320225e324379c858d/include")
set(CONAN_LIB_DIRS_GTEST "/Users/amirnourinia/.conan/data/gtest/cci.20210126/_/_/package/1f92fc047be6947dccdb4e320225e324379c858d/lib")
set(CONAN_BIN_DIRS_GTEST )
set(CONAN_RES_DIRS_GTEST )
set(CONAN_SRC_DIRS_GTEST )
set(CONAN_BUILD_DIRS_GTEST "/Users/amirnourinia/.conan/data/gtest/cci.20210126/_/_/package/1f92fc047be6947dccdb4e320225e324379c858d/")
set(CONAN_FRAMEWORK_DIRS_GTEST )
set(CONAN_LIBS_GTEST gtest_main gmock_main gmock gtest)
set(CONAN_PKG_LIBS_GTEST gtest_main gmock_main gmock gtest)
set(CONAN_SYSTEM_LIBS_GTEST )
set(CONAN_FRAMEWORKS_GTEST )
set(CONAN_FRAMEWORKS_FOUND_GTEST "")  # Will be filled later
set(CONAN_DEFINES_GTEST )
set(CONAN_BUILD_MODULES_PATHS_GTEST )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_GTEST )

set(CONAN_C_FLAGS_GTEST "")
set(CONAN_CXX_FLAGS_GTEST "")
set(CONAN_SHARED_LINKER_FLAGS_GTEST "")
set(CONAN_EXE_LINKER_FLAGS_GTEST "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_GTEST_LIST "")
set(CONAN_CXX_FLAGS_GTEST_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_GTEST_LIST "")
set(CONAN_EXE_LINKER_FLAGS_GTEST_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_GTEST "${CONAN_FRAMEWORKS_GTEST}" "_GTEST" "")
# Append to aggregated values variable
set(CONAN_LIBS_GTEST ${CONAN_PKG_LIBS_GTEST} ${CONAN_SYSTEM_LIBS_GTEST} ${CONAN_FRAMEWORKS_FOUND_GTEST})


#################
###  BOOST
#################
set(CONAN_BOOST_ROOT "/Users/amirnourinia/.conan/data/boost/1.77.0/_/_/package/c5da5260a03de8416b30cdf8d910ad9bd46ff2b3")
set(CONAN_INCLUDE_DIRS_BOOST "/Users/amirnourinia/.conan/data/boost/1.77.0/_/_/package/c5da5260a03de8416b30cdf8d910ad9bd46ff2b3/include")
set(CONAN_LIB_DIRS_BOOST "/Users/amirnourinia/.conan/data/boost/1.77.0/_/_/package/c5da5260a03de8416b30cdf8d910ad9bd46ff2b3/lib")
set(CONAN_BIN_DIRS_BOOST )
set(CONAN_RES_DIRS_BOOST )
set(CONAN_SRC_DIRS_BOOST )
set(CONAN_BUILD_DIRS_BOOST "/Users/amirnourinia/.conan/data/boost/1.77.0/_/_/package/c5da5260a03de8416b30cdf8d910ad9bd46ff2b3/")
set(CONAN_FRAMEWORK_DIRS_BOOST )
set(CONAN_LIBS_BOOST boost_contract boost_coroutine boost_context boost_iostreams boost_locale boost_log_setup boost_log boost_program_options boost_random boost_regex boost_stacktrace_addr2line boost_stacktrace_backtrace boost_stacktrace_basic boost_stacktrace_noop boost_timer boost_type_erasure boost_thread boost_chrono boost_container boost_date_time boost_unit_test_framework boost_prg_exec_monitor boost_test_exec_monitor boost_exception boost_wave boost_filesystem boost_atomic boost_wserialization boost_serialization)
set(CONAN_PKG_LIBS_BOOST boost_contract boost_coroutine boost_context boost_iostreams boost_locale boost_log_setup boost_log boost_program_options boost_random boost_regex boost_stacktrace_addr2line boost_stacktrace_backtrace boost_stacktrace_basic boost_stacktrace_noop boost_timer boost_type_erasure boost_thread boost_chrono boost_container boost_date_time boost_unit_test_framework boost_prg_exec_monitor boost_test_exec_monitor boost_exception boost_wave boost_filesystem boost_atomic boost_wserialization boost_serialization)
set(CONAN_SYSTEM_LIBS_BOOST )
set(CONAN_FRAMEWORKS_BOOST )
set(CONAN_FRAMEWORKS_FOUND_BOOST "")  # Will be filled later
set(CONAN_DEFINES_BOOST "-DBOOST_STACKTRACE_ADDR2LINE_LOCATION=\"/usr/bin/addr2line\""
			"-DBOOST_STACKTRACE_USE_ADDR2LINE"
			"-DBOOST_STACKTRACE_USE_BACKTRACE"
			"-DBOOST_STACKTRACE_USE_NOOP"
			"-DBOOST_STACKTRACE_GNU_SOURCE_NOT_REQUIRED")
set(CONAN_BUILD_MODULES_PATHS_BOOST )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BOOST "BOOST_STACKTRACE_ADDR2LINE_LOCATION=\"/usr/bin/addr2line\""
			"BOOST_STACKTRACE_USE_ADDR2LINE"
			"BOOST_STACKTRACE_USE_BACKTRACE"
			"BOOST_STACKTRACE_USE_NOOP"
			"BOOST_STACKTRACE_GNU_SOURCE_NOT_REQUIRED")

set(CONAN_C_FLAGS_BOOST "")
set(CONAN_CXX_FLAGS_BOOST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BOOST_LIST "")
set(CONAN_CXX_FLAGS_BOOST_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BOOST_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BOOST_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BOOST "${CONAN_FRAMEWORKS_BOOST}" "_BOOST" "")
# Append to aggregated values variable
set(CONAN_LIBS_BOOST ${CONAN_PKG_LIBS_BOOST} ${CONAN_SYSTEM_LIBS_BOOST} ${CONAN_FRAMEWORKS_FOUND_BOOST})


#################
###  EIGEN
#################
set(CONAN_EIGEN_ROOT "/Users/amirnourinia/.conan/data/eigen/3.4.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_EIGEN "/Users/amirnourinia/.conan/data/eigen/3.4.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include/eigen3")
set(CONAN_LIB_DIRS_EIGEN )
set(CONAN_BIN_DIRS_EIGEN )
set(CONAN_RES_DIRS_EIGEN )
set(CONAN_SRC_DIRS_EIGEN )
set(CONAN_BUILD_DIRS_EIGEN "/Users/amirnourinia/.conan/data/eigen/3.4.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_EIGEN )
set(CONAN_LIBS_EIGEN )
set(CONAN_PKG_LIBS_EIGEN )
set(CONAN_SYSTEM_LIBS_EIGEN )
set(CONAN_FRAMEWORKS_EIGEN )
set(CONAN_FRAMEWORKS_FOUND_EIGEN "")  # Will be filled later
set(CONAN_DEFINES_EIGEN )
set(CONAN_BUILD_MODULES_PATHS_EIGEN )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_EIGEN )

set(CONAN_C_FLAGS_EIGEN "")
set(CONAN_CXX_FLAGS_EIGEN "")
set(CONAN_SHARED_LINKER_FLAGS_EIGEN "")
set(CONAN_EXE_LINKER_FLAGS_EIGEN "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_EIGEN_LIST "")
set(CONAN_CXX_FLAGS_EIGEN_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_EIGEN_LIST "")
set(CONAN_EXE_LINKER_FLAGS_EIGEN_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_EIGEN "${CONAN_FRAMEWORKS_EIGEN}" "_EIGEN" "")
# Append to aggregated values variable
set(CONAN_LIBS_EIGEN ${CONAN_PKG_LIBS_EIGEN} ${CONAN_SYSTEM_LIBS_EIGEN} ${CONAN_FRAMEWORKS_FOUND_EIGEN})


#################
###  JASPER
#################
set(CONAN_JASPER_ROOT "/Users/amirnourinia/.conan/data/jasper/2.0.32/_/_/package/ca60d77822ab7b8702b6e2f8b7fd5ba525fa935d")
set(CONAN_INCLUDE_DIRS_JASPER "/Users/amirnourinia/.conan/data/jasper/2.0.32/_/_/package/ca60d77822ab7b8702b6e2f8b7fd5ba525fa935d/include")
set(CONAN_LIB_DIRS_JASPER "/Users/amirnourinia/.conan/data/jasper/2.0.32/_/_/package/ca60d77822ab7b8702b6e2f8b7fd5ba525fa935d/lib")
set(CONAN_BIN_DIRS_JASPER )
set(CONAN_RES_DIRS_JASPER )
set(CONAN_SRC_DIRS_JASPER )
set(CONAN_BUILD_DIRS_JASPER "/Users/amirnourinia/.conan/data/jasper/2.0.32/_/_/package/ca60d77822ab7b8702b6e2f8b7fd5ba525fa935d/"
			"/Users/amirnourinia/.conan/data/jasper/2.0.32/_/_/package/ca60d77822ab7b8702b6e2f8b7fd5ba525fa935d/lib/cmake")
set(CONAN_FRAMEWORK_DIRS_JASPER )
set(CONAN_LIBS_JASPER jasper)
set(CONAN_PKG_LIBS_JASPER jasper)
set(CONAN_SYSTEM_LIBS_JASPER )
set(CONAN_FRAMEWORKS_JASPER )
set(CONAN_FRAMEWORKS_FOUND_JASPER "")  # Will be filled later
set(CONAN_DEFINES_JASPER )
set(CONAN_BUILD_MODULES_PATHS_JASPER )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_JASPER )

set(CONAN_C_FLAGS_JASPER "")
set(CONAN_CXX_FLAGS_JASPER "")
set(CONAN_SHARED_LINKER_FLAGS_JASPER "")
set(CONAN_EXE_LINKER_FLAGS_JASPER "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_JASPER_LIST "")
set(CONAN_CXX_FLAGS_JASPER_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_JASPER_LIST "")
set(CONAN_EXE_LINKER_FLAGS_JASPER_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_JASPER "${CONAN_FRAMEWORKS_JASPER}" "_JASPER" "")
# Append to aggregated values variable
set(CONAN_LIBS_JASPER ${CONAN_PKG_LIBS_JASPER} ${CONAN_SYSTEM_LIBS_JASPER} ${CONAN_FRAMEWORKS_FOUND_JASPER})


#################
###  LIBPNG
#################
set(CONAN_LIBPNG_ROOT "/Users/amirnourinia/.conan/data/libpng/1.6.37/_/_/package/aa5d2c35e57d031363e527ecb0b07150ed151373")
set(CONAN_INCLUDE_DIRS_LIBPNG "/Users/amirnourinia/.conan/data/libpng/1.6.37/_/_/package/aa5d2c35e57d031363e527ecb0b07150ed151373/include")
set(CONAN_LIB_DIRS_LIBPNG "/Users/amirnourinia/.conan/data/libpng/1.6.37/_/_/package/aa5d2c35e57d031363e527ecb0b07150ed151373/lib")
set(CONAN_BIN_DIRS_LIBPNG )
set(CONAN_RES_DIRS_LIBPNG )
set(CONAN_SRC_DIRS_LIBPNG )
set(CONAN_BUILD_DIRS_LIBPNG "/Users/amirnourinia/.conan/data/libpng/1.6.37/_/_/package/aa5d2c35e57d031363e527ecb0b07150ed151373/")
set(CONAN_FRAMEWORK_DIRS_LIBPNG )
set(CONAN_LIBS_LIBPNG png16)
set(CONAN_PKG_LIBS_LIBPNG png16)
set(CONAN_SYSTEM_LIBS_LIBPNG )
set(CONAN_FRAMEWORKS_LIBPNG )
set(CONAN_FRAMEWORKS_FOUND_LIBPNG "")  # Will be filled later
set(CONAN_DEFINES_LIBPNG )
set(CONAN_BUILD_MODULES_PATHS_LIBPNG )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBPNG )

set(CONAN_C_FLAGS_LIBPNG "")
set(CONAN_CXX_FLAGS_LIBPNG "")
set(CONAN_SHARED_LINKER_FLAGS_LIBPNG "")
set(CONAN_EXE_LINKER_FLAGS_LIBPNG "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBPNG_LIST "")
set(CONAN_CXX_FLAGS_LIBPNG_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBPNG_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBPNG_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBPNG "${CONAN_FRAMEWORKS_LIBPNG}" "_LIBPNG" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBPNG ${CONAN_PKG_LIBS_LIBPNG} ${CONAN_SYSTEM_LIBS_LIBPNG} ${CONAN_FRAMEWORKS_FOUND_LIBPNG})


#################
###  OPENEXR
#################
set(CONAN_OPENEXR_ROOT "/Users/amirnourinia/.conan/data/openexr/2.5.7/_/_/package/d48d63454535b8eb845e0e3cfda364a192ff153f")
set(CONAN_INCLUDE_DIRS_OPENEXR "/Users/amirnourinia/.conan/data/openexr/2.5.7/_/_/package/d48d63454535b8eb845e0e3cfda364a192ff153f/include"
			"/Users/amirnourinia/.conan/data/openexr/2.5.7/_/_/package/d48d63454535b8eb845e0e3cfda364a192ff153f/include/OpenEXR")
set(CONAN_LIB_DIRS_OPENEXR "/Users/amirnourinia/.conan/data/openexr/2.5.7/_/_/package/d48d63454535b8eb845e0e3cfda364a192ff153f/lib")
set(CONAN_BIN_DIRS_OPENEXR )
set(CONAN_RES_DIRS_OPENEXR )
set(CONAN_SRC_DIRS_OPENEXR )
set(CONAN_BUILD_DIRS_OPENEXR "/Users/amirnourinia/.conan/data/openexr/2.5.7/_/_/package/d48d63454535b8eb845e0e3cfda364a192ff153f/"
			"/Users/amirnourinia/.conan/data/openexr/2.5.7/_/_/package/d48d63454535b8eb845e0e3cfda364a192ff153f/lib/cmake")
set(CONAN_FRAMEWORK_DIRS_OPENEXR )
set(CONAN_LIBS_OPENEXR IlmImfUtil-2_5 IlmImf-2_5 Imath-2_5 Half-2_5 IexMath-2_5 IlmThread-2_5 Iex-2_5)
set(CONAN_PKG_LIBS_OPENEXR IlmImfUtil-2_5 IlmImf-2_5 Imath-2_5 Half-2_5 IexMath-2_5 IlmThread-2_5 Iex-2_5)
set(CONAN_SYSTEM_LIBS_OPENEXR c++)
set(CONAN_FRAMEWORKS_OPENEXR )
set(CONAN_FRAMEWORKS_FOUND_OPENEXR "")  # Will be filled later
set(CONAN_DEFINES_OPENEXR )
set(CONAN_BUILD_MODULES_PATHS_OPENEXR )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_OPENEXR )

set(CONAN_C_FLAGS_OPENEXR "")
set(CONAN_CXX_FLAGS_OPENEXR "")
set(CONAN_SHARED_LINKER_FLAGS_OPENEXR "")
set(CONAN_EXE_LINKER_FLAGS_OPENEXR "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_OPENEXR_LIST "")
set(CONAN_CXX_FLAGS_OPENEXR_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_OPENEXR_LIST "")
set(CONAN_EXE_LINKER_FLAGS_OPENEXR_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_OPENEXR "${CONAN_FRAMEWORKS_OPENEXR}" "_OPENEXR" "")
# Append to aggregated values variable
set(CONAN_LIBS_OPENEXR ${CONAN_PKG_LIBS_OPENEXR} ${CONAN_SYSTEM_LIBS_OPENEXR} ${CONAN_FRAMEWORKS_FOUND_OPENEXR})


#################
###  LIBTIFF
#################
set(CONAN_LIBTIFF_ROOT "/Users/amirnourinia/.conan/data/libtiff/4.3.0/_/_/package/c224669e2dbb0423acde0d9fde34e4a30bc1950a")
set(CONAN_INCLUDE_DIRS_LIBTIFF "/Users/amirnourinia/.conan/data/libtiff/4.3.0/_/_/package/c224669e2dbb0423acde0d9fde34e4a30bc1950a/include")
set(CONAN_LIB_DIRS_LIBTIFF "/Users/amirnourinia/.conan/data/libtiff/4.3.0/_/_/package/c224669e2dbb0423acde0d9fde34e4a30bc1950a/lib")
set(CONAN_BIN_DIRS_LIBTIFF )
set(CONAN_RES_DIRS_LIBTIFF )
set(CONAN_SRC_DIRS_LIBTIFF )
set(CONAN_BUILD_DIRS_LIBTIFF "/Users/amirnourinia/.conan/data/libtiff/4.3.0/_/_/package/c224669e2dbb0423acde0d9fde34e4a30bc1950a/")
set(CONAN_FRAMEWORK_DIRS_LIBTIFF )
set(CONAN_LIBS_LIBTIFF tiffxx tiff)
set(CONAN_PKG_LIBS_LIBTIFF tiffxx tiff)
set(CONAN_SYSTEM_LIBS_LIBTIFF )
set(CONAN_FRAMEWORKS_LIBTIFF )
set(CONAN_FRAMEWORKS_FOUND_LIBTIFF "")  # Will be filled later
set(CONAN_DEFINES_LIBTIFF )
set(CONAN_BUILD_MODULES_PATHS_LIBTIFF )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBTIFF )

set(CONAN_C_FLAGS_LIBTIFF "")
set(CONAN_CXX_FLAGS_LIBTIFF "")
set(CONAN_SHARED_LINKER_FLAGS_LIBTIFF "")
set(CONAN_EXE_LINKER_FLAGS_LIBTIFF "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBTIFF_LIST "")
set(CONAN_CXX_FLAGS_LIBTIFF_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBTIFF_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBTIFF_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBTIFF "${CONAN_FRAMEWORKS_LIBTIFF}" "_LIBTIFF" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBTIFF ${CONAN_PKG_LIBS_LIBTIFF} ${CONAN_SYSTEM_LIBS_LIBTIFF} ${CONAN_FRAMEWORKS_FOUND_LIBTIFF})


#################
###  QUIRC
#################
set(CONAN_QUIRC_ROOT "/Users/amirnourinia/.conan/data/quirc/1.1/_/_/package/12049c68720dc394cb072460cad4e1b7157d043c")
set(CONAN_INCLUDE_DIRS_QUIRC "/Users/amirnourinia/.conan/data/quirc/1.1/_/_/package/12049c68720dc394cb072460cad4e1b7157d043c/include")
set(CONAN_LIB_DIRS_QUIRC "/Users/amirnourinia/.conan/data/quirc/1.1/_/_/package/12049c68720dc394cb072460cad4e1b7157d043c/lib")
set(CONAN_BIN_DIRS_QUIRC )
set(CONAN_RES_DIRS_QUIRC )
set(CONAN_SRC_DIRS_QUIRC )
set(CONAN_BUILD_DIRS_QUIRC "/Users/amirnourinia/.conan/data/quirc/1.1/_/_/package/12049c68720dc394cb072460cad4e1b7157d043c/")
set(CONAN_FRAMEWORK_DIRS_QUIRC )
set(CONAN_LIBS_QUIRC quirc)
set(CONAN_PKG_LIBS_QUIRC quirc)
set(CONAN_SYSTEM_LIBS_QUIRC )
set(CONAN_FRAMEWORKS_QUIRC )
set(CONAN_FRAMEWORKS_FOUND_QUIRC "")  # Will be filled later
set(CONAN_DEFINES_QUIRC )
set(CONAN_BUILD_MODULES_PATHS_QUIRC )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_QUIRC )

set(CONAN_C_FLAGS_QUIRC "")
set(CONAN_CXX_FLAGS_QUIRC "")
set(CONAN_SHARED_LINKER_FLAGS_QUIRC "")
set(CONAN_EXE_LINKER_FLAGS_QUIRC "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_QUIRC_LIST "")
set(CONAN_CXX_FLAGS_QUIRC_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_QUIRC_LIST "")
set(CONAN_EXE_LINKER_FLAGS_QUIRC_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_QUIRC "${CONAN_FRAMEWORKS_QUIRC}" "_QUIRC" "")
# Append to aggregated values variable
set(CONAN_LIBS_QUIRC ${CONAN_PKG_LIBS_QUIRC} ${CONAN_SYSTEM_LIBS_QUIRC} ${CONAN_FRAMEWORKS_FOUND_QUIRC})


#################
###  PROTOBUF
#################
set(CONAN_PROTOBUF_ROOT "/Users/amirnourinia/.conan/data/protobuf/3.17.1/_/_/package/80f87b689c44329240fa96fdf4da01af5da79798")
set(CONAN_INCLUDE_DIRS_PROTOBUF "/Users/amirnourinia/.conan/data/protobuf/3.17.1/_/_/package/80f87b689c44329240fa96fdf4da01af5da79798/include")
set(CONAN_LIB_DIRS_PROTOBUF "/Users/amirnourinia/.conan/data/protobuf/3.17.1/_/_/package/80f87b689c44329240fa96fdf4da01af5da79798/lib")
set(CONAN_BIN_DIRS_PROTOBUF "/Users/amirnourinia/.conan/data/protobuf/3.17.1/_/_/package/80f87b689c44329240fa96fdf4da01af5da79798/bin")
set(CONAN_RES_DIRS_PROTOBUF )
set(CONAN_SRC_DIRS_PROTOBUF )
set(CONAN_BUILD_DIRS_PROTOBUF "/Users/amirnourinia/.conan/data/protobuf/3.17.1/_/_/package/80f87b689c44329240fa96fdf4da01af5da79798/"
			"/Users/amirnourinia/.conan/data/protobuf/3.17.1/_/_/package/80f87b689c44329240fa96fdf4da01af5da79798/lib/cmake/protobuf")
set(CONAN_FRAMEWORK_DIRS_PROTOBUF )
set(CONAN_LIBS_PROTOBUF protoc protobuf)
set(CONAN_PKG_LIBS_PROTOBUF protoc protobuf)
set(CONAN_SYSTEM_LIBS_PROTOBUF )
set(CONAN_FRAMEWORKS_PROTOBUF )
set(CONAN_FRAMEWORKS_FOUND_PROTOBUF "")  # Will be filled later
set(CONAN_DEFINES_PROTOBUF )
set(CONAN_BUILD_MODULES_PATHS_PROTOBUF "/Users/amirnourinia/.conan/data/protobuf/3.17.1/_/_/package/80f87b689c44329240fa96fdf4da01af5da79798/lib/cmake/protobuf/protobuf-generate.cmake"
			"/Users/amirnourinia/.conan/data/protobuf/3.17.1/_/_/package/80f87b689c44329240fa96fdf4da01af5da79798/lib/cmake/protobuf/protobuf-module.cmake"
			"/Users/amirnourinia/.conan/data/protobuf/3.17.1/_/_/package/80f87b689c44329240fa96fdf4da01af5da79798/lib/cmake/protobuf/protobuf-options.cmake")
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_PROTOBUF )

set(CONAN_C_FLAGS_PROTOBUF "")
set(CONAN_CXX_FLAGS_PROTOBUF "")
set(CONAN_SHARED_LINKER_FLAGS_PROTOBUF "")
set(CONAN_EXE_LINKER_FLAGS_PROTOBUF "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_PROTOBUF_LIST "")
set(CONAN_CXX_FLAGS_PROTOBUF_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_PROTOBUF_LIST "")
set(CONAN_EXE_LINKER_FLAGS_PROTOBUF_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_PROTOBUF "${CONAN_FRAMEWORKS_PROTOBUF}" "_PROTOBUF" "")
# Append to aggregated values variable
set(CONAN_LIBS_PROTOBUF ${CONAN_PKG_LIBS_PROTOBUF} ${CONAN_SYSTEM_LIBS_PROTOBUF} ${CONAN_FRAMEWORKS_FOUND_PROTOBUF})


#################
###  ADE
#################
set(CONAN_ADE_ROOT "/Users/amirnourinia/.conan/data/ade/0.1.1f/_/_/package/1aff124b71f6d938138ecd7179ff075f4304a85d")
set(CONAN_INCLUDE_DIRS_ADE "/Users/amirnourinia/.conan/data/ade/0.1.1f/_/_/package/1aff124b71f6d938138ecd7179ff075f4304a85d/include")
set(CONAN_LIB_DIRS_ADE "/Users/amirnourinia/.conan/data/ade/0.1.1f/_/_/package/1aff124b71f6d938138ecd7179ff075f4304a85d/lib")
set(CONAN_BIN_DIRS_ADE )
set(CONAN_RES_DIRS_ADE )
set(CONAN_SRC_DIRS_ADE )
set(CONAN_BUILD_DIRS_ADE "/Users/amirnourinia/.conan/data/ade/0.1.1f/_/_/package/1aff124b71f6d938138ecd7179ff075f4304a85d/")
set(CONAN_FRAMEWORK_DIRS_ADE )
set(CONAN_LIBS_ADE ade)
set(CONAN_PKG_LIBS_ADE ade)
set(CONAN_SYSTEM_LIBS_ADE )
set(CONAN_FRAMEWORKS_ADE )
set(CONAN_FRAMEWORKS_FOUND_ADE "")  # Will be filled later
set(CONAN_DEFINES_ADE )
set(CONAN_BUILD_MODULES_PATHS_ADE )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_ADE )

set(CONAN_C_FLAGS_ADE "")
set(CONAN_CXX_FLAGS_ADE "")
set(CONAN_SHARED_LINKER_FLAGS_ADE "")
set(CONAN_EXE_LINKER_FLAGS_ADE "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_ADE_LIST "")
set(CONAN_CXX_FLAGS_ADE_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_ADE_LIST "")
set(CONAN_EXE_LINKER_FLAGS_ADE_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_ADE "${CONAN_FRAMEWORKS_ADE}" "_ADE" "")
# Append to aggregated values variable
set(CONAN_LIBS_ADE ${CONAN_PKG_LIBS_ADE} ${CONAN_SYSTEM_LIBS_ADE} ${CONAN_FRAMEWORKS_FOUND_ADE})


#################
###  BZIP2
#################
set(CONAN_BZIP2_ROOT "/Users/amirnourinia/.conan/data/bzip2/1.0.8/_/_/package/f2848f95be36a5d770fc8e833993b621f703b507")
set(CONAN_INCLUDE_DIRS_BZIP2 "/Users/amirnourinia/.conan/data/bzip2/1.0.8/_/_/package/f2848f95be36a5d770fc8e833993b621f703b507/include")
set(CONAN_LIB_DIRS_BZIP2 "/Users/amirnourinia/.conan/data/bzip2/1.0.8/_/_/package/f2848f95be36a5d770fc8e833993b621f703b507/lib")
set(CONAN_BIN_DIRS_BZIP2 "/Users/amirnourinia/.conan/data/bzip2/1.0.8/_/_/package/f2848f95be36a5d770fc8e833993b621f703b507/bin")
set(CONAN_RES_DIRS_BZIP2 )
set(CONAN_SRC_DIRS_BZIP2 )
set(CONAN_BUILD_DIRS_BZIP2 "/Users/amirnourinia/.conan/data/bzip2/1.0.8/_/_/package/f2848f95be36a5d770fc8e833993b621f703b507/"
			"/Users/amirnourinia/.conan/data/bzip2/1.0.8/_/_/package/f2848f95be36a5d770fc8e833993b621f703b507/lib/cmake")
set(CONAN_FRAMEWORK_DIRS_BZIP2 )
set(CONAN_LIBS_BZIP2 bz2)
set(CONAN_PKG_LIBS_BZIP2 bz2)
set(CONAN_SYSTEM_LIBS_BZIP2 )
set(CONAN_FRAMEWORKS_BZIP2 )
set(CONAN_FRAMEWORKS_FOUND_BZIP2 "")  # Will be filled later
set(CONAN_DEFINES_BZIP2 )
set(CONAN_BUILD_MODULES_PATHS_BZIP2 )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BZIP2 )

set(CONAN_C_FLAGS_BZIP2 "")
set(CONAN_CXX_FLAGS_BZIP2 "")
set(CONAN_SHARED_LINKER_FLAGS_BZIP2 "")
set(CONAN_EXE_LINKER_FLAGS_BZIP2 "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BZIP2_LIST "")
set(CONAN_CXX_FLAGS_BZIP2_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BZIP2_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BZIP2_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BZIP2 "${CONAN_FRAMEWORKS_BZIP2}" "_BZIP2" "")
# Append to aggregated values variable
set(CONAN_LIBS_BZIP2 ${CONAN_PKG_LIBS_BZIP2} ${CONAN_SYSTEM_LIBS_BZIP2} ${CONAN_FRAMEWORKS_FOUND_BZIP2})


#################
###  LIBBACKTRACE
#################
set(CONAN_LIBBACKTRACE_ROOT "/Users/amirnourinia/.conan/data/libbacktrace/cci.20210118/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc")
set(CONAN_INCLUDE_DIRS_LIBBACKTRACE "/Users/amirnourinia/.conan/data/libbacktrace/cci.20210118/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include")
set(CONAN_LIB_DIRS_LIBBACKTRACE "/Users/amirnourinia/.conan/data/libbacktrace/cci.20210118/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib")
set(CONAN_BIN_DIRS_LIBBACKTRACE )
set(CONAN_RES_DIRS_LIBBACKTRACE )
set(CONAN_SRC_DIRS_LIBBACKTRACE )
set(CONAN_BUILD_DIRS_LIBBACKTRACE "/Users/amirnourinia/.conan/data/libbacktrace/cci.20210118/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/")
set(CONAN_FRAMEWORK_DIRS_LIBBACKTRACE )
set(CONAN_LIBS_LIBBACKTRACE backtrace)
set(CONAN_PKG_LIBS_LIBBACKTRACE backtrace)
set(CONAN_SYSTEM_LIBS_LIBBACKTRACE )
set(CONAN_FRAMEWORKS_LIBBACKTRACE )
set(CONAN_FRAMEWORKS_FOUND_LIBBACKTRACE "")  # Will be filled later
set(CONAN_DEFINES_LIBBACKTRACE )
set(CONAN_BUILD_MODULES_PATHS_LIBBACKTRACE )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBBACKTRACE )

set(CONAN_C_FLAGS_LIBBACKTRACE "")
set(CONAN_CXX_FLAGS_LIBBACKTRACE "")
set(CONAN_SHARED_LINKER_FLAGS_LIBBACKTRACE "")
set(CONAN_EXE_LINKER_FLAGS_LIBBACKTRACE "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBBACKTRACE_LIST "")
set(CONAN_CXX_FLAGS_LIBBACKTRACE_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBBACKTRACE_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBBACKTRACE_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBBACKTRACE "${CONAN_FRAMEWORKS_LIBBACKTRACE}" "_LIBBACKTRACE" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBBACKTRACE ${CONAN_PKG_LIBS_LIBBACKTRACE} ${CONAN_SYSTEM_LIBS_LIBBACKTRACE} ${CONAN_FRAMEWORKS_FOUND_LIBBACKTRACE})


#################
###  LIBICONV
#################
set(CONAN_LIBICONV_ROOT "/Users/amirnourinia/.conan/data/libiconv/1.16/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc")
set(CONAN_INCLUDE_DIRS_LIBICONV "/Users/amirnourinia/.conan/data/libiconv/1.16/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include")
set(CONAN_LIB_DIRS_LIBICONV "/Users/amirnourinia/.conan/data/libiconv/1.16/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib")
set(CONAN_BIN_DIRS_LIBICONV "/Users/amirnourinia/.conan/data/libiconv/1.16/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/bin")
set(CONAN_RES_DIRS_LIBICONV )
set(CONAN_SRC_DIRS_LIBICONV )
set(CONAN_BUILD_DIRS_LIBICONV "/Users/amirnourinia/.conan/data/libiconv/1.16/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/")
set(CONAN_FRAMEWORK_DIRS_LIBICONV )
set(CONAN_LIBS_LIBICONV iconv charset)
set(CONAN_PKG_LIBS_LIBICONV iconv charset)
set(CONAN_SYSTEM_LIBS_LIBICONV )
set(CONAN_FRAMEWORKS_LIBICONV )
set(CONAN_FRAMEWORKS_FOUND_LIBICONV "")  # Will be filled later
set(CONAN_DEFINES_LIBICONV )
set(CONAN_BUILD_MODULES_PATHS_LIBICONV )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBICONV )

set(CONAN_C_FLAGS_LIBICONV "")
set(CONAN_CXX_FLAGS_LIBICONV "")
set(CONAN_SHARED_LINKER_FLAGS_LIBICONV "")
set(CONAN_EXE_LINKER_FLAGS_LIBICONV "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBICONV_LIST "")
set(CONAN_CXX_FLAGS_LIBICONV_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBICONV_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBICONV_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBICONV "${CONAN_FRAMEWORKS_LIBICONV}" "_LIBICONV" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBICONV ${CONAN_PKG_LIBS_LIBICONV} ${CONAN_SYSTEM_LIBS_LIBICONV} ${CONAN_FRAMEWORKS_FOUND_LIBICONV})


#################
###  ZLIB
#################
set(CONAN_ZLIB_ROOT "/Users/amirnourinia/.conan/data/zlib/1.2.11/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc")
set(CONAN_INCLUDE_DIRS_ZLIB "/Users/amirnourinia/.conan/data/zlib/1.2.11/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include")
set(CONAN_LIB_DIRS_ZLIB "/Users/amirnourinia/.conan/data/zlib/1.2.11/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib")
set(CONAN_BIN_DIRS_ZLIB )
set(CONAN_RES_DIRS_ZLIB )
set(CONAN_SRC_DIRS_ZLIB )
set(CONAN_BUILD_DIRS_ZLIB "/Users/amirnourinia/.conan/data/zlib/1.2.11/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/")
set(CONAN_FRAMEWORK_DIRS_ZLIB )
set(CONAN_LIBS_ZLIB z)
set(CONAN_PKG_LIBS_ZLIB z)
set(CONAN_SYSTEM_LIBS_ZLIB )
set(CONAN_FRAMEWORKS_ZLIB )
set(CONAN_FRAMEWORKS_FOUND_ZLIB "")  # Will be filled later
set(CONAN_DEFINES_ZLIB )
set(CONAN_BUILD_MODULES_PATHS_ZLIB )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_ZLIB )

set(CONAN_C_FLAGS_ZLIB "")
set(CONAN_CXX_FLAGS_ZLIB "")
set(CONAN_SHARED_LINKER_FLAGS_ZLIB "")
set(CONAN_EXE_LINKER_FLAGS_ZLIB "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_ZLIB_LIST "")
set(CONAN_CXX_FLAGS_ZLIB_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_ZLIB_LIST "")
set(CONAN_EXE_LINKER_FLAGS_ZLIB_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_ZLIB "${CONAN_FRAMEWORKS_ZLIB}" "_ZLIB" "")
# Append to aggregated values variable
set(CONAN_LIBS_ZLIB ${CONAN_PKG_LIBS_ZLIB} ${CONAN_SYSTEM_LIBS_ZLIB} ${CONAN_FRAMEWORKS_FOUND_ZLIB})


#################
###  LIBJPEG
#################
set(CONAN_LIBJPEG_ROOT "/Users/amirnourinia/.conan/data/libjpeg/9d/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc")
set(CONAN_INCLUDE_DIRS_LIBJPEG "/Users/amirnourinia/.conan/data/libjpeg/9d/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include")
set(CONAN_LIB_DIRS_LIBJPEG "/Users/amirnourinia/.conan/data/libjpeg/9d/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib")
set(CONAN_BIN_DIRS_LIBJPEG )
set(CONAN_RES_DIRS_LIBJPEG "/Users/amirnourinia/.conan/data/libjpeg/9d/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/res")
set(CONAN_SRC_DIRS_LIBJPEG )
set(CONAN_BUILD_DIRS_LIBJPEG "/Users/amirnourinia/.conan/data/libjpeg/9d/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/")
set(CONAN_FRAMEWORK_DIRS_LIBJPEG )
set(CONAN_LIBS_LIBJPEG jpeg)
set(CONAN_PKG_LIBS_LIBJPEG jpeg)
set(CONAN_SYSTEM_LIBS_LIBJPEG )
set(CONAN_FRAMEWORKS_LIBJPEG )
set(CONAN_FRAMEWORKS_FOUND_LIBJPEG "")  # Will be filled later
set(CONAN_DEFINES_LIBJPEG "-DLIBJPEG_STATIC")
set(CONAN_BUILD_MODULES_PATHS_LIBJPEG )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBJPEG "LIBJPEG_STATIC")

set(CONAN_C_FLAGS_LIBJPEG "")
set(CONAN_CXX_FLAGS_LIBJPEG "")
set(CONAN_SHARED_LINKER_FLAGS_LIBJPEG "")
set(CONAN_EXE_LINKER_FLAGS_LIBJPEG "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBJPEG_LIST "")
set(CONAN_CXX_FLAGS_LIBJPEG_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBJPEG_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBJPEG_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBJPEG "${CONAN_FRAMEWORKS_LIBJPEG}" "_LIBJPEG" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBJPEG ${CONAN_PKG_LIBS_LIBJPEG} ${CONAN_SYSTEM_LIBS_LIBJPEG} ${CONAN_FRAMEWORKS_FOUND_LIBJPEG})


#################
###  LIBDEFLATE
#################
set(CONAN_LIBDEFLATE_ROOT "/Users/amirnourinia/.conan/data/libdeflate/1.8/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc")
set(CONAN_INCLUDE_DIRS_LIBDEFLATE "/Users/amirnourinia/.conan/data/libdeflate/1.8/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include")
set(CONAN_LIB_DIRS_LIBDEFLATE "/Users/amirnourinia/.conan/data/libdeflate/1.8/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib")
set(CONAN_BIN_DIRS_LIBDEFLATE )
set(CONAN_RES_DIRS_LIBDEFLATE )
set(CONAN_SRC_DIRS_LIBDEFLATE )
set(CONAN_BUILD_DIRS_LIBDEFLATE "/Users/amirnourinia/.conan/data/libdeflate/1.8/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/")
set(CONAN_FRAMEWORK_DIRS_LIBDEFLATE )
set(CONAN_LIBS_LIBDEFLATE deflate)
set(CONAN_PKG_LIBS_LIBDEFLATE deflate)
set(CONAN_SYSTEM_LIBS_LIBDEFLATE )
set(CONAN_FRAMEWORKS_LIBDEFLATE )
set(CONAN_FRAMEWORKS_FOUND_LIBDEFLATE "")  # Will be filled later
set(CONAN_DEFINES_LIBDEFLATE )
set(CONAN_BUILD_MODULES_PATHS_LIBDEFLATE )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBDEFLATE )

set(CONAN_C_FLAGS_LIBDEFLATE "")
set(CONAN_CXX_FLAGS_LIBDEFLATE "")
set(CONAN_SHARED_LINKER_FLAGS_LIBDEFLATE "")
set(CONAN_EXE_LINKER_FLAGS_LIBDEFLATE "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBDEFLATE_LIST "")
set(CONAN_CXX_FLAGS_LIBDEFLATE_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBDEFLATE_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBDEFLATE_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBDEFLATE "${CONAN_FRAMEWORKS_LIBDEFLATE}" "_LIBDEFLATE" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBDEFLATE ${CONAN_PKG_LIBS_LIBDEFLATE} ${CONAN_SYSTEM_LIBS_LIBDEFLATE} ${CONAN_FRAMEWORKS_FOUND_LIBDEFLATE})


#################
###  XZ_UTILS
#################
set(CONAN_XZ_UTILS_ROOT "/Users/amirnourinia/.conan/data/xz_utils/5.2.5/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc")
set(CONAN_INCLUDE_DIRS_XZ_UTILS "/Users/amirnourinia/.conan/data/xz_utils/5.2.5/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include")
set(CONAN_LIB_DIRS_XZ_UTILS "/Users/amirnourinia/.conan/data/xz_utils/5.2.5/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib")
set(CONAN_BIN_DIRS_XZ_UTILS "/Users/amirnourinia/.conan/data/xz_utils/5.2.5/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/bin")
set(CONAN_RES_DIRS_XZ_UTILS )
set(CONAN_SRC_DIRS_XZ_UTILS )
set(CONAN_BUILD_DIRS_XZ_UTILS "/Users/amirnourinia/.conan/data/xz_utils/5.2.5/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/"
			"/Users/amirnourinia/.conan/data/xz_utils/5.2.5/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib/cmake")
set(CONAN_FRAMEWORK_DIRS_XZ_UTILS )
set(CONAN_LIBS_XZ_UTILS lzma)
set(CONAN_PKG_LIBS_XZ_UTILS lzma)
set(CONAN_SYSTEM_LIBS_XZ_UTILS )
set(CONAN_FRAMEWORKS_XZ_UTILS )
set(CONAN_FRAMEWORKS_FOUND_XZ_UTILS "")  # Will be filled later
set(CONAN_DEFINES_XZ_UTILS "-DLZMA_API_STATIC")
set(CONAN_BUILD_MODULES_PATHS_XZ_UTILS )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_XZ_UTILS "LZMA_API_STATIC")

set(CONAN_C_FLAGS_XZ_UTILS "")
set(CONAN_CXX_FLAGS_XZ_UTILS "")
set(CONAN_SHARED_LINKER_FLAGS_XZ_UTILS "")
set(CONAN_EXE_LINKER_FLAGS_XZ_UTILS "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_XZ_UTILS_LIST "")
set(CONAN_CXX_FLAGS_XZ_UTILS_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_XZ_UTILS_LIST "")
set(CONAN_EXE_LINKER_FLAGS_XZ_UTILS_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_XZ_UTILS "${CONAN_FRAMEWORKS_XZ_UTILS}" "_XZ_UTILS" "")
# Append to aggregated values variable
set(CONAN_LIBS_XZ_UTILS ${CONAN_PKG_LIBS_XZ_UTILS} ${CONAN_SYSTEM_LIBS_XZ_UTILS} ${CONAN_FRAMEWORKS_FOUND_XZ_UTILS})


#################
###  JBIG
#################
set(CONAN_JBIG_ROOT "/Users/amirnourinia/.conan/data/jbig/20160605/_/_/package/004c156104209a65ece6cc9d71d8115366dd9d08")
set(CONAN_INCLUDE_DIRS_JBIG "/Users/amirnourinia/.conan/data/jbig/20160605/_/_/package/004c156104209a65ece6cc9d71d8115366dd9d08/include")
set(CONAN_LIB_DIRS_JBIG "/Users/amirnourinia/.conan/data/jbig/20160605/_/_/package/004c156104209a65ece6cc9d71d8115366dd9d08/lib")
set(CONAN_BIN_DIRS_JBIG "/Users/amirnourinia/.conan/data/jbig/20160605/_/_/package/004c156104209a65ece6cc9d71d8115366dd9d08/bin")
set(CONAN_RES_DIRS_JBIG )
set(CONAN_SRC_DIRS_JBIG )
set(CONAN_BUILD_DIRS_JBIG "/Users/amirnourinia/.conan/data/jbig/20160605/_/_/package/004c156104209a65ece6cc9d71d8115366dd9d08/")
set(CONAN_FRAMEWORK_DIRS_JBIG )
set(CONAN_LIBS_JBIG jbig)
set(CONAN_PKG_LIBS_JBIG jbig)
set(CONAN_SYSTEM_LIBS_JBIG )
set(CONAN_FRAMEWORKS_JBIG )
set(CONAN_FRAMEWORKS_FOUND_JBIG "")  # Will be filled later
set(CONAN_DEFINES_JBIG )
set(CONAN_BUILD_MODULES_PATHS_JBIG )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_JBIG )

set(CONAN_C_FLAGS_JBIG "")
set(CONAN_CXX_FLAGS_JBIG "")
set(CONAN_SHARED_LINKER_FLAGS_JBIG "")
set(CONAN_EXE_LINKER_FLAGS_JBIG "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_JBIG_LIST "")
set(CONAN_CXX_FLAGS_JBIG_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_JBIG_LIST "")
set(CONAN_EXE_LINKER_FLAGS_JBIG_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_JBIG "${CONAN_FRAMEWORKS_JBIG}" "_JBIG" "")
# Append to aggregated values variable
set(CONAN_LIBS_JBIG ${CONAN_PKG_LIBS_JBIG} ${CONAN_SYSTEM_LIBS_JBIG} ${CONAN_FRAMEWORKS_FOUND_JBIG})


#################
###  ZSTD
#################
set(CONAN_ZSTD_ROOT "/Users/amirnourinia/.conan/data/zstd/1.5.0/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc")
set(CONAN_INCLUDE_DIRS_ZSTD "/Users/amirnourinia/.conan/data/zstd/1.5.0/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include")
set(CONAN_LIB_DIRS_ZSTD "/Users/amirnourinia/.conan/data/zstd/1.5.0/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib")
set(CONAN_BIN_DIRS_ZSTD )
set(CONAN_RES_DIRS_ZSTD )
set(CONAN_SRC_DIRS_ZSTD )
set(CONAN_BUILD_DIRS_ZSTD "/Users/amirnourinia/.conan/data/zstd/1.5.0/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/")
set(CONAN_FRAMEWORK_DIRS_ZSTD )
set(CONAN_LIBS_ZSTD zstd)
set(CONAN_PKG_LIBS_ZSTD zstd)
set(CONAN_SYSTEM_LIBS_ZSTD )
set(CONAN_FRAMEWORKS_ZSTD )
set(CONAN_FRAMEWORKS_FOUND_ZSTD "")  # Will be filled later
set(CONAN_DEFINES_ZSTD )
set(CONAN_BUILD_MODULES_PATHS_ZSTD )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_ZSTD )

set(CONAN_C_FLAGS_ZSTD "")
set(CONAN_CXX_FLAGS_ZSTD "")
set(CONAN_SHARED_LINKER_FLAGS_ZSTD "")
set(CONAN_EXE_LINKER_FLAGS_ZSTD "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_ZSTD_LIST "")
set(CONAN_CXX_FLAGS_ZSTD_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_ZSTD_LIST "")
set(CONAN_EXE_LINKER_FLAGS_ZSTD_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_ZSTD "${CONAN_FRAMEWORKS_ZSTD}" "_ZSTD" "")
# Append to aggregated values variable
set(CONAN_LIBS_ZSTD ${CONAN_PKG_LIBS_ZSTD} ${CONAN_SYSTEM_LIBS_ZSTD} ${CONAN_FRAMEWORKS_FOUND_ZSTD})


#################
###  LIBWEBP
#################
set(CONAN_LIBWEBP_ROOT "/Users/amirnourinia/.conan/data/libwebp/1.2.0/_/_/package/e5887d58ca6f87178ea5a08021ef37a0e5371fd1")
set(CONAN_INCLUDE_DIRS_LIBWEBP "/Users/amirnourinia/.conan/data/libwebp/1.2.0/_/_/package/e5887d58ca6f87178ea5a08021ef37a0e5371fd1/include")
set(CONAN_LIB_DIRS_LIBWEBP "/Users/amirnourinia/.conan/data/libwebp/1.2.0/_/_/package/e5887d58ca6f87178ea5a08021ef37a0e5371fd1/lib")
set(CONAN_BIN_DIRS_LIBWEBP )
set(CONAN_RES_DIRS_LIBWEBP )
set(CONAN_SRC_DIRS_LIBWEBP )
set(CONAN_BUILD_DIRS_LIBWEBP "/Users/amirnourinia/.conan/data/libwebp/1.2.0/_/_/package/e5887d58ca6f87178ea5a08021ef37a0e5371fd1/")
set(CONAN_FRAMEWORK_DIRS_LIBWEBP )
set(CONAN_LIBS_LIBWEBP webpdecoder webpdemux webpmux webp)
set(CONAN_PKG_LIBS_LIBWEBP webpdecoder webpdemux webpmux webp)
set(CONAN_SYSTEM_LIBS_LIBWEBP )
set(CONAN_FRAMEWORKS_LIBWEBP )
set(CONAN_FRAMEWORKS_FOUND_LIBWEBP "")  # Will be filled later
set(CONAN_DEFINES_LIBWEBP )
set(CONAN_BUILD_MODULES_PATHS_LIBWEBP )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBWEBP )

set(CONAN_C_FLAGS_LIBWEBP "")
set(CONAN_CXX_FLAGS_LIBWEBP "")
set(CONAN_SHARED_LINKER_FLAGS_LIBWEBP "")
set(CONAN_EXE_LINKER_FLAGS_LIBWEBP "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBWEBP_LIST "")
set(CONAN_CXX_FLAGS_LIBWEBP_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBWEBP_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBWEBP_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBWEBP "${CONAN_FRAMEWORKS_LIBWEBP}" "_LIBWEBP" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBWEBP ${CONAN_PKG_LIBS_LIBWEBP} ${CONAN_SYSTEM_LIBS_LIBWEBP} ${CONAN_FRAMEWORKS_FOUND_LIBWEBP})


### Definition of global aggregated variables ###

set(CONAN_PACKAGE_NAME None)
set(CONAN_PACKAGE_VERSION None)

set(CONAN_SETTINGS_ARCH "x86_64")
set(CONAN_SETTINGS_ARCH_BUILD "x86_64")
set(CONAN_SETTINGS_BUILD_TYPE "Release")
set(CONAN_SETTINGS_COMPILER "apple-clang")
set(CONAN_SETTINGS_COMPILER_LIBCXX "libc++")
set(CONAN_SETTINGS_COMPILER_VERSION "13.0")
set(CONAN_SETTINGS_OS "Macos")
set(CONAN_SETTINGS_OS_BUILD "Macos")

set(CONAN_DEPENDENCIES opencv gtest boost eigen jasper libpng openexr libtiff quirc protobuf ade bzip2 libbacktrace libiconv zlib libjpeg libdeflate xz_utils jbig zstd libwebp)
# Storing original command line args (CMake helper) flags
set(CONAN_CMD_CXX_FLAGS ${CONAN_CXX_FLAGS})

set(CONAN_CMD_SHARED_LINKER_FLAGS ${CONAN_SHARED_LINKER_FLAGS})
set(CONAN_CMD_C_FLAGS ${CONAN_C_FLAGS})
# Defining accumulated conan variables for all deps

set(CONAN_INCLUDE_DIRS "/Users/amirnourinia/.conan/data/opencv/4.5.3/_/_/package/e40a8152015db40ac54b2f47955f57460439f1db/include"
			"/Users/amirnourinia/.conan/data/opencv/4.5.3/_/_/package/e40a8152015db40ac54b2f47955f57460439f1db/include/opencv4"
			"/Users/amirnourinia/.conan/data/gtest/cci.20210126/_/_/package/1f92fc047be6947dccdb4e320225e324379c858d/include"
			"/Users/amirnourinia/.conan/data/boost/1.77.0/_/_/package/c5da5260a03de8416b30cdf8d910ad9bd46ff2b3/include"
			"/Users/amirnourinia/.conan/data/eigen/3.4.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include/eigen3"
			"/Users/amirnourinia/.conan/data/jasper/2.0.32/_/_/package/ca60d77822ab7b8702b6e2f8b7fd5ba525fa935d/include"
			"/Users/amirnourinia/.conan/data/libpng/1.6.37/_/_/package/aa5d2c35e57d031363e527ecb0b07150ed151373/include"
			"/Users/amirnourinia/.conan/data/openexr/2.5.7/_/_/package/d48d63454535b8eb845e0e3cfda364a192ff153f/include"
			"/Users/amirnourinia/.conan/data/openexr/2.5.7/_/_/package/d48d63454535b8eb845e0e3cfda364a192ff153f/include/OpenEXR"
			"/Users/amirnourinia/.conan/data/libtiff/4.3.0/_/_/package/c224669e2dbb0423acde0d9fde34e4a30bc1950a/include"
			"/Users/amirnourinia/.conan/data/quirc/1.1/_/_/package/12049c68720dc394cb072460cad4e1b7157d043c/include"
			"/Users/amirnourinia/.conan/data/protobuf/3.17.1/_/_/package/80f87b689c44329240fa96fdf4da01af5da79798/include"
			"/Users/amirnourinia/.conan/data/ade/0.1.1f/_/_/package/1aff124b71f6d938138ecd7179ff075f4304a85d/include"
			"/Users/amirnourinia/.conan/data/bzip2/1.0.8/_/_/package/f2848f95be36a5d770fc8e833993b621f703b507/include"
			"/Users/amirnourinia/.conan/data/libbacktrace/cci.20210118/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include"
			"/Users/amirnourinia/.conan/data/libiconv/1.16/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include"
			"/Users/amirnourinia/.conan/data/zlib/1.2.11/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include"
			"/Users/amirnourinia/.conan/data/libjpeg/9d/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include"
			"/Users/amirnourinia/.conan/data/libdeflate/1.8/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include"
			"/Users/amirnourinia/.conan/data/xz_utils/5.2.5/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include"
			"/Users/amirnourinia/.conan/data/jbig/20160605/_/_/package/004c156104209a65ece6cc9d71d8115366dd9d08/include"
			"/Users/amirnourinia/.conan/data/zstd/1.5.0/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/include"
			"/Users/amirnourinia/.conan/data/libwebp/1.2.0/_/_/package/e5887d58ca6f87178ea5a08021ef37a0e5371fd1/include" ${CONAN_INCLUDE_DIRS})
set(CONAN_LIB_DIRS "/Users/amirnourinia/.conan/data/opencv/4.5.3/_/_/package/e40a8152015db40ac54b2f47955f57460439f1db/lib"
			"/Users/amirnourinia/.conan/data/gtest/cci.20210126/_/_/package/1f92fc047be6947dccdb4e320225e324379c858d/lib"
			"/Users/amirnourinia/.conan/data/boost/1.77.0/_/_/package/c5da5260a03de8416b30cdf8d910ad9bd46ff2b3/lib"
			"/Users/amirnourinia/.conan/data/jasper/2.0.32/_/_/package/ca60d77822ab7b8702b6e2f8b7fd5ba525fa935d/lib"
			"/Users/amirnourinia/.conan/data/libpng/1.6.37/_/_/package/aa5d2c35e57d031363e527ecb0b07150ed151373/lib"
			"/Users/amirnourinia/.conan/data/openexr/2.5.7/_/_/package/d48d63454535b8eb845e0e3cfda364a192ff153f/lib"
			"/Users/amirnourinia/.conan/data/libtiff/4.3.0/_/_/package/c224669e2dbb0423acde0d9fde34e4a30bc1950a/lib"
			"/Users/amirnourinia/.conan/data/quirc/1.1/_/_/package/12049c68720dc394cb072460cad4e1b7157d043c/lib"
			"/Users/amirnourinia/.conan/data/protobuf/3.17.1/_/_/package/80f87b689c44329240fa96fdf4da01af5da79798/lib"
			"/Users/amirnourinia/.conan/data/ade/0.1.1f/_/_/package/1aff124b71f6d938138ecd7179ff075f4304a85d/lib"
			"/Users/amirnourinia/.conan/data/bzip2/1.0.8/_/_/package/f2848f95be36a5d770fc8e833993b621f703b507/lib"
			"/Users/amirnourinia/.conan/data/libbacktrace/cci.20210118/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib"
			"/Users/amirnourinia/.conan/data/libiconv/1.16/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib"
			"/Users/amirnourinia/.conan/data/zlib/1.2.11/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib"
			"/Users/amirnourinia/.conan/data/libjpeg/9d/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib"
			"/Users/amirnourinia/.conan/data/libdeflate/1.8/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib"
			"/Users/amirnourinia/.conan/data/xz_utils/5.2.5/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib"
			"/Users/amirnourinia/.conan/data/jbig/20160605/_/_/package/004c156104209a65ece6cc9d71d8115366dd9d08/lib"
			"/Users/amirnourinia/.conan/data/zstd/1.5.0/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib"
			"/Users/amirnourinia/.conan/data/libwebp/1.2.0/_/_/package/e5887d58ca6f87178ea5a08021ef37a0e5371fd1/lib" ${CONAN_LIB_DIRS})
set(CONAN_BIN_DIRS "/Users/amirnourinia/.conan/data/opencv/4.5.3/_/_/package/e40a8152015db40ac54b2f47955f57460439f1db/bin"
			"/Users/amirnourinia/.conan/data/protobuf/3.17.1/_/_/package/80f87b689c44329240fa96fdf4da01af5da79798/bin"
			"/Users/amirnourinia/.conan/data/bzip2/1.0.8/_/_/package/f2848f95be36a5d770fc8e833993b621f703b507/bin"
			"/Users/amirnourinia/.conan/data/libiconv/1.16/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/bin"
			"/Users/amirnourinia/.conan/data/xz_utils/5.2.5/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/bin"
			"/Users/amirnourinia/.conan/data/jbig/20160605/_/_/package/004c156104209a65ece6cc9d71d8115366dd9d08/bin" ${CONAN_BIN_DIRS})
set(CONAN_RES_DIRS "/Users/amirnourinia/.conan/data/opencv/4.5.3/_/_/package/e40a8152015db40ac54b2f47955f57460439f1db/res"
			"/Users/amirnourinia/.conan/data/libjpeg/9d/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/res" ${CONAN_RES_DIRS})
set(CONAN_FRAMEWORK_DIRS  ${CONAN_FRAMEWORK_DIRS})
set(CONAN_LIBS opencv_ml opencv_photo opencv_highgui opencv_videoio opencv_imgcodecs opencv_objdetect opencv_stitching opencv_dnn opencv_gapi opencv_video opencv_calib3d opencv_features2d opencv_flann opencv_imgproc opencv_core gtest_main gmock_main gmock gtest boost_contract boost_coroutine boost_context boost_iostreams boost_locale boost_log_setup boost_log boost_program_options boost_random boost_regex boost_stacktrace_addr2line boost_stacktrace_backtrace boost_stacktrace_basic boost_stacktrace_noop boost_timer boost_type_erasure boost_thread boost_chrono boost_container boost_date_time boost_unit_test_framework boost_prg_exec_monitor boost_test_exec_monitor boost_exception boost_wave boost_filesystem boost_atomic boost_wserialization boost_serialization jasper png16 IlmImfUtil-2_5 IlmImf-2_5 Imath-2_5 Half-2_5 IexMath-2_5 IlmThread-2_5 Iex-2_5 tiffxx tiff quirc protoc protobuf ade bz2 backtrace iconv charset z jpeg deflate lzma jbig zstd webpdecoder webpdemux webpmux webp ${CONAN_LIBS})
set(CONAN_PKG_LIBS opencv_ml opencv_photo opencv_highgui opencv_videoio opencv_imgcodecs opencv_objdetect opencv_stitching opencv_dnn opencv_gapi opencv_video opencv_calib3d opencv_features2d opencv_flann opencv_imgproc opencv_core gtest_main gmock_main gmock gtest boost_contract boost_coroutine boost_context boost_iostreams boost_locale boost_log_setup boost_log boost_program_options boost_random boost_regex boost_stacktrace_addr2line boost_stacktrace_backtrace boost_stacktrace_basic boost_stacktrace_noop boost_timer boost_type_erasure boost_thread boost_chrono boost_container boost_date_time boost_unit_test_framework boost_prg_exec_monitor boost_test_exec_monitor boost_exception boost_wave boost_filesystem boost_atomic boost_wserialization boost_serialization jasper png16 IlmImfUtil-2_5 IlmImf-2_5 Imath-2_5 Half-2_5 IexMath-2_5 IlmThread-2_5 Iex-2_5 tiffxx tiff quirc protoc protobuf ade bz2 backtrace iconv charset z jpeg deflate lzma jbig zstd webpdecoder webpdemux webpmux webp ${CONAN_PKG_LIBS})
set(CONAN_SYSTEM_LIBS c++ ${CONAN_SYSTEM_LIBS})
set(CONAN_FRAMEWORKS Cocoa Accelerate AVFoundation CoreGraphics CoreMedia CoreVideo QuartzCore ${CONAN_FRAMEWORKS})
set(CONAN_FRAMEWORKS_FOUND "")  # Will be filled later
set(CONAN_DEFINES "-DLZMA_API_STATIC"
			"-DLIBJPEG_STATIC"
			"-DBOOST_STACKTRACE_ADDR2LINE_LOCATION=\"/usr/bin/addr2line\""
			"-DBOOST_STACKTRACE_USE_ADDR2LINE"
			"-DBOOST_STACKTRACE_USE_BACKTRACE"
			"-DBOOST_STACKTRACE_USE_NOOP"
			"-DBOOST_STACKTRACE_GNU_SOURCE_NOT_REQUIRED" ${CONAN_DEFINES})
set(CONAN_BUILD_MODULES_PATHS "/Users/amirnourinia/.conan/data/protobuf/3.17.1/_/_/package/80f87b689c44329240fa96fdf4da01af5da79798/lib/cmake/protobuf/protobuf-generate.cmake"
			"/Users/amirnourinia/.conan/data/protobuf/3.17.1/_/_/package/80f87b689c44329240fa96fdf4da01af5da79798/lib/cmake/protobuf/protobuf-module.cmake"
			"/Users/amirnourinia/.conan/data/protobuf/3.17.1/_/_/package/80f87b689c44329240fa96fdf4da01af5da79798/lib/cmake/protobuf/protobuf-options.cmake" ${CONAN_BUILD_MODULES_PATHS})
set(CONAN_CMAKE_MODULE_PATH "/Users/amirnourinia/.conan/data/opencv/4.5.3/_/_/package/e40a8152015db40ac54b2f47955f57460439f1db/"
			"/Users/amirnourinia/.conan/data/opencv/4.5.3/_/_/package/e40a8152015db40ac54b2f47955f57460439f1db/lib/cmake"
			"/Users/amirnourinia/.conan/data/gtest/cci.20210126/_/_/package/1f92fc047be6947dccdb4e320225e324379c858d/"
			"/Users/amirnourinia/.conan/data/boost/1.77.0/_/_/package/c5da5260a03de8416b30cdf8d910ad9bd46ff2b3/"
			"/Users/amirnourinia/.conan/data/eigen/3.4.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/Users/amirnourinia/.conan/data/jasper/2.0.32/_/_/package/ca60d77822ab7b8702b6e2f8b7fd5ba525fa935d/"
			"/Users/amirnourinia/.conan/data/jasper/2.0.32/_/_/package/ca60d77822ab7b8702b6e2f8b7fd5ba525fa935d/lib/cmake"
			"/Users/amirnourinia/.conan/data/libpng/1.6.37/_/_/package/aa5d2c35e57d031363e527ecb0b07150ed151373/"
			"/Users/amirnourinia/.conan/data/openexr/2.5.7/_/_/package/d48d63454535b8eb845e0e3cfda364a192ff153f/"
			"/Users/amirnourinia/.conan/data/openexr/2.5.7/_/_/package/d48d63454535b8eb845e0e3cfda364a192ff153f/lib/cmake"
			"/Users/amirnourinia/.conan/data/libtiff/4.3.0/_/_/package/c224669e2dbb0423acde0d9fde34e4a30bc1950a/"
			"/Users/amirnourinia/.conan/data/quirc/1.1/_/_/package/12049c68720dc394cb072460cad4e1b7157d043c/"
			"/Users/amirnourinia/.conan/data/protobuf/3.17.1/_/_/package/80f87b689c44329240fa96fdf4da01af5da79798/"
			"/Users/amirnourinia/.conan/data/protobuf/3.17.1/_/_/package/80f87b689c44329240fa96fdf4da01af5da79798/lib/cmake/protobuf"
			"/Users/amirnourinia/.conan/data/ade/0.1.1f/_/_/package/1aff124b71f6d938138ecd7179ff075f4304a85d/"
			"/Users/amirnourinia/.conan/data/bzip2/1.0.8/_/_/package/f2848f95be36a5d770fc8e833993b621f703b507/"
			"/Users/amirnourinia/.conan/data/bzip2/1.0.8/_/_/package/f2848f95be36a5d770fc8e833993b621f703b507/lib/cmake"
			"/Users/amirnourinia/.conan/data/libbacktrace/cci.20210118/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/"
			"/Users/amirnourinia/.conan/data/libiconv/1.16/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/"
			"/Users/amirnourinia/.conan/data/zlib/1.2.11/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/"
			"/Users/amirnourinia/.conan/data/libjpeg/9d/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/"
			"/Users/amirnourinia/.conan/data/libdeflate/1.8/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/"
			"/Users/amirnourinia/.conan/data/xz_utils/5.2.5/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/"
			"/Users/amirnourinia/.conan/data/xz_utils/5.2.5/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/lib/cmake"
			"/Users/amirnourinia/.conan/data/jbig/20160605/_/_/package/004c156104209a65ece6cc9d71d8115366dd9d08/"
			"/Users/amirnourinia/.conan/data/zstd/1.5.0/_/_/package/e4fbacdee83eb1a2e68227ffe19f6e9a61b36cbc/"
			"/Users/amirnourinia/.conan/data/libwebp/1.2.0/_/_/package/e5887d58ca6f87178ea5a08021ef37a0e5371fd1/" ${CONAN_CMAKE_MODULE_PATH})

set(CONAN_CXX_FLAGS " ${CONAN_CXX_FLAGS}")
set(CONAN_SHARED_LINKER_FLAGS " ${CONAN_SHARED_LINKER_FLAGS}")
set(CONAN_EXE_LINKER_FLAGS " ${CONAN_EXE_LINKER_FLAGS}")
set(CONAN_C_FLAGS " ${CONAN_C_FLAGS}")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND "${CONAN_FRAMEWORKS}" "" "")
# Append to aggregated values variable: Use CONAN_LIBS instead of CONAN_PKG_LIBS to include user appended vars
set(CONAN_LIBS ${CONAN_LIBS} ${CONAN_SYSTEM_LIBS} ${CONAN_FRAMEWORKS_FOUND})


###  Definition of macros and functions ###

macro(conan_define_targets)
    if(${CMAKE_VERSION} VERSION_LESS "3.1.2")
        message(FATAL_ERROR "TARGETS not supported by your CMake version!")
    endif()  # CMAKE > 3.x
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CONAN_CMD_CXX_FLAGS}")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CONAN_CMD_C_FLAGS}")
    set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${CONAN_CMD_SHARED_LINKER_FLAGS}")


    set(_CONAN_PKG_LIBS_OPENCV_DEPENDENCIES "${CONAN_SYSTEM_LIBS_OPENCV} ${CONAN_FRAMEWORKS_FOUND_OPENCV} CONAN_PKG::zlib CONAN_PKG::libjpeg CONAN_PKG::jasper CONAN_PKG::libpng CONAN_PKG::openexr CONAN_PKG::libtiff CONAN_PKG::eigen CONAN_PKG::libwebp CONAN_PKG::quirc CONAN_PKG::protobuf CONAN_PKG::ade")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENCV_DEPENDENCIES "${_CONAN_PKG_LIBS_OPENCV_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENCV}" "${CONAN_LIB_DIRS_OPENCV}"
                                  CONAN_PACKAGE_TARGETS_OPENCV "${_CONAN_PKG_LIBS_OPENCV_DEPENDENCIES}"
                                  "" opencv)
    set(_CONAN_PKG_LIBS_OPENCV_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_OPENCV_DEBUG} ${CONAN_FRAMEWORKS_FOUND_OPENCV_DEBUG} CONAN_PKG::zlib CONAN_PKG::libjpeg CONAN_PKG::jasper CONAN_PKG::libpng CONAN_PKG::openexr CONAN_PKG::libtiff CONAN_PKG::eigen CONAN_PKG::libwebp CONAN_PKG::quirc CONAN_PKG::protobuf CONAN_PKG::ade")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENCV_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_OPENCV_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENCV_DEBUG}" "${CONAN_LIB_DIRS_OPENCV_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_OPENCV_DEBUG "${_CONAN_PKG_LIBS_OPENCV_DEPENDENCIES_DEBUG}"
                                  "debug" opencv)
    set(_CONAN_PKG_LIBS_OPENCV_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_OPENCV_RELEASE} ${CONAN_FRAMEWORKS_FOUND_OPENCV_RELEASE} CONAN_PKG::zlib CONAN_PKG::libjpeg CONAN_PKG::jasper CONAN_PKG::libpng CONAN_PKG::openexr CONAN_PKG::libtiff CONAN_PKG::eigen CONAN_PKG::libwebp CONAN_PKG::quirc CONAN_PKG::protobuf CONAN_PKG::ade")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENCV_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_OPENCV_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENCV_RELEASE}" "${CONAN_LIB_DIRS_OPENCV_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_OPENCV_RELEASE "${_CONAN_PKG_LIBS_OPENCV_DEPENDENCIES_RELEASE}"
                                  "release" opencv)
    set(_CONAN_PKG_LIBS_OPENCV_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_OPENCV_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_OPENCV_RELWITHDEBINFO} CONAN_PKG::zlib CONAN_PKG::libjpeg CONAN_PKG::jasper CONAN_PKG::libpng CONAN_PKG::openexr CONAN_PKG::libtiff CONAN_PKG::eigen CONAN_PKG::libwebp CONAN_PKG::quirc CONAN_PKG::protobuf CONAN_PKG::ade")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENCV_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPENCV_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENCV_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_OPENCV_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_OPENCV_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPENCV_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" opencv)
    set(_CONAN_PKG_LIBS_OPENCV_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_OPENCV_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_OPENCV_MINSIZEREL} CONAN_PKG::zlib CONAN_PKG::libjpeg CONAN_PKG::jasper CONAN_PKG::libpng CONAN_PKG::openexr CONAN_PKG::libtiff CONAN_PKG::eigen CONAN_PKG::libwebp CONAN_PKG::quirc CONAN_PKG::protobuf CONAN_PKG::ade")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENCV_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_OPENCV_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENCV_MINSIZEREL}" "${CONAN_LIB_DIRS_OPENCV_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_OPENCV_MINSIZEREL "${_CONAN_PKG_LIBS_OPENCV_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" opencv)

    add_library(CONAN_PKG::opencv INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::opencv PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_OPENCV} ${_CONAN_PKG_LIBS_OPENCV_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENCV_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENCV_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENCV_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_OPENCV_RELEASE} ${_CONAN_PKG_LIBS_OPENCV_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENCV_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENCV_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENCV_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_OPENCV_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_OPENCV_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENCV_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENCV_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENCV_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_OPENCV_MINSIZEREL} ${_CONAN_PKG_LIBS_OPENCV_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENCV_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENCV_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENCV_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_OPENCV_DEBUG} ${_CONAN_PKG_LIBS_OPENCV_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENCV_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENCV_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENCV_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::opencv PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_OPENCV}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_OPENCV_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_OPENCV_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_OPENCV_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_OPENCV_DEBUG}>)
    set_property(TARGET CONAN_PKG::opencv PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_OPENCV}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_OPENCV_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_OPENCV_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_OPENCV_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_OPENCV_DEBUG}>)
    set_property(TARGET CONAN_PKG::opencv PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_OPENCV_LIST} ${CONAN_CXX_FLAGS_OPENCV_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_OPENCV_RELEASE_LIST} ${CONAN_CXX_FLAGS_OPENCV_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_OPENCV_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_OPENCV_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_OPENCV_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_OPENCV_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_OPENCV_DEBUG_LIST}  ${CONAN_CXX_FLAGS_OPENCV_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_GTEST_DEPENDENCIES "${CONAN_SYSTEM_LIBS_GTEST} ${CONAN_FRAMEWORKS_FOUND_GTEST} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GTEST_DEPENDENCIES "${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GTEST}" "${CONAN_LIB_DIRS_GTEST}"
                                  CONAN_PACKAGE_TARGETS_GTEST "${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES}"
                                  "" gtest)
    set(_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_GTEST_DEBUG} ${CONAN_FRAMEWORKS_FOUND_GTEST_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GTEST_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GTEST_DEBUG}" "${CONAN_LIB_DIRS_GTEST_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_GTEST_DEBUG "${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_DEBUG}"
                                  "debug" gtest)
    set(_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_GTEST_RELEASE} ${CONAN_FRAMEWORKS_FOUND_GTEST_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GTEST_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GTEST_RELEASE}" "${CONAN_LIB_DIRS_GTEST_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_GTEST_RELEASE "${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_RELEASE}"
                                  "release" gtest)
    set(_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_GTEST_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_GTEST_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GTEST_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GTEST_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_GTEST_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_GTEST_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" gtest)
    set(_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_GTEST_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_GTEST_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GTEST_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GTEST_MINSIZEREL}" "${CONAN_LIB_DIRS_GTEST_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_GTEST_MINSIZEREL "${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" gtest)

    add_library(CONAN_PKG::gtest INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::gtest PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_GTEST} ${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GTEST_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GTEST_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GTEST_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_GTEST_RELEASE} ${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GTEST_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GTEST_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GTEST_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_GTEST_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GTEST_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GTEST_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GTEST_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_GTEST_MINSIZEREL} ${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GTEST_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GTEST_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GTEST_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_GTEST_DEBUG} ${_CONAN_PKG_LIBS_GTEST_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GTEST_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GTEST_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GTEST_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::gtest PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_GTEST}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_GTEST_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_GTEST_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_GTEST_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_GTEST_DEBUG}>)
    set_property(TARGET CONAN_PKG::gtest PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_GTEST}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_GTEST_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_GTEST_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_GTEST_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_GTEST_DEBUG}>)
    set_property(TARGET CONAN_PKG::gtest PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_GTEST_LIST} ${CONAN_CXX_FLAGS_GTEST_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_GTEST_RELEASE_LIST} ${CONAN_CXX_FLAGS_GTEST_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_GTEST_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_GTEST_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_GTEST_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_GTEST_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_GTEST_DEBUG_LIST}  ${CONAN_CXX_FLAGS_GTEST_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_BOOST_DEPENDENCIES "${CONAN_SYSTEM_LIBS_BOOST} ${CONAN_FRAMEWORKS_FOUND_BOOST} CONAN_PKG::zlib CONAN_PKG::bzip2 CONAN_PKG::libbacktrace CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BOOST_DEPENDENCIES "${_CONAN_PKG_LIBS_BOOST_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BOOST}" "${CONAN_LIB_DIRS_BOOST}"
                                  CONAN_PACKAGE_TARGETS_BOOST "${_CONAN_PKG_LIBS_BOOST_DEPENDENCIES}"
                                  "" boost)
    set(_CONAN_PKG_LIBS_BOOST_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_BOOST_DEBUG} ${CONAN_FRAMEWORKS_FOUND_BOOST_DEBUG} CONAN_PKG::zlib CONAN_PKG::bzip2 CONAN_PKG::libbacktrace CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BOOST_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_BOOST_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BOOST_DEBUG}" "${CONAN_LIB_DIRS_BOOST_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BOOST_DEBUG "${_CONAN_PKG_LIBS_BOOST_DEPENDENCIES_DEBUG}"
                                  "debug" boost)
    set(_CONAN_PKG_LIBS_BOOST_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_BOOST_RELEASE} ${CONAN_FRAMEWORKS_FOUND_BOOST_RELEASE} CONAN_PKG::zlib CONAN_PKG::bzip2 CONAN_PKG::libbacktrace CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BOOST_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_BOOST_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BOOST_RELEASE}" "${CONAN_LIB_DIRS_BOOST_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BOOST_RELEASE "${_CONAN_PKG_LIBS_BOOST_DEPENDENCIES_RELEASE}"
                                  "release" boost)
    set(_CONAN_PKG_LIBS_BOOST_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BOOST_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_BOOST_RELWITHDEBINFO} CONAN_PKG::zlib CONAN_PKG::bzip2 CONAN_PKG::libbacktrace CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BOOST_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_BOOST_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BOOST_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BOOST_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BOOST_RELWITHDEBINFO "${_CONAN_PKG_LIBS_BOOST_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" boost)
    set(_CONAN_PKG_LIBS_BOOST_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_BOOST_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_BOOST_MINSIZEREL} CONAN_PKG::zlib CONAN_PKG::bzip2 CONAN_PKG::libbacktrace CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BOOST_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_BOOST_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BOOST_MINSIZEREL}" "${CONAN_LIB_DIRS_BOOST_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BOOST_MINSIZEREL "${_CONAN_PKG_LIBS_BOOST_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" boost)

    add_library(CONAN_PKG::boost INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::boost PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BOOST} ${_CONAN_PKG_LIBS_BOOST_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BOOST_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BOOST_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BOOST_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BOOST_RELEASE} ${_CONAN_PKG_LIBS_BOOST_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BOOST_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BOOST_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BOOST_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BOOST_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_BOOST_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BOOST_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BOOST_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BOOST_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BOOST_MINSIZEREL} ${_CONAN_PKG_LIBS_BOOST_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BOOST_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BOOST_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BOOST_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BOOST_DEBUG} ${_CONAN_PKG_LIBS_BOOST_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BOOST_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BOOST_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BOOST_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::boost PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BOOST}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BOOST_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BOOST_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BOOST_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BOOST_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BOOST}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BOOST_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BOOST_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BOOST_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BOOST_DEBUG}>)
    set_property(TARGET CONAN_PKG::boost PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BOOST_LIST} ${CONAN_CXX_FLAGS_BOOST_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BOOST_RELEASE_LIST} ${CONAN_CXX_FLAGS_BOOST_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BOOST_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BOOST_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BOOST_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BOOST_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BOOST_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BOOST_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_EIGEN_DEPENDENCIES "${CONAN_SYSTEM_LIBS_EIGEN} ${CONAN_FRAMEWORKS_FOUND_EIGEN} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_EIGEN_DEPENDENCIES "${_CONAN_PKG_LIBS_EIGEN_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_EIGEN}" "${CONAN_LIB_DIRS_EIGEN}"
                                  CONAN_PACKAGE_TARGETS_EIGEN "${_CONAN_PKG_LIBS_EIGEN_DEPENDENCIES}"
                                  "" eigen)
    set(_CONAN_PKG_LIBS_EIGEN_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_EIGEN_DEBUG} ${CONAN_FRAMEWORKS_FOUND_EIGEN_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_EIGEN_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_EIGEN_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_EIGEN_DEBUG}" "${CONAN_LIB_DIRS_EIGEN_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_EIGEN_DEBUG "${_CONAN_PKG_LIBS_EIGEN_DEPENDENCIES_DEBUG}"
                                  "debug" eigen)
    set(_CONAN_PKG_LIBS_EIGEN_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_EIGEN_RELEASE} ${CONAN_FRAMEWORKS_FOUND_EIGEN_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_EIGEN_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_EIGEN_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_EIGEN_RELEASE}" "${CONAN_LIB_DIRS_EIGEN_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_EIGEN_RELEASE "${_CONAN_PKG_LIBS_EIGEN_DEPENDENCIES_RELEASE}"
                                  "release" eigen)
    set(_CONAN_PKG_LIBS_EIGEN_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_EIGEN_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_EIGEN_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_EIGEN_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_EIGEN_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_EIGEN_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_EIGEN_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_EIGEN_RELWITHDEBINFO "${_CONAN_PKG_LIBS_EIGEN_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" eigen)
    set(_CONAN_PKG_LIBS_EIGEN_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_EIGEN_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_EIGEN_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_EIGEN_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_EIGEN_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_EIGEN_MINSIZEREL}" "${CONAN_LIB_DIRS_EIGEN_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_EIGEN_MINSIZEREL "${_CONAN_PKG_LIBS_EIGEN_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" eigen)

    add_library(CONAN_PKG::eigen INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::eigen PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_EIGEN} ${_CONAN_PKG_LIBS_EIGEN_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EIGEN_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EIGEN_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_EIGEN_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_EIGEN_RELEASE} ${_CONAN_PKG_LIBS_EIGEN_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EIGEN_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EIGEN_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_EIGEN_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_EIGEN_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_EIGEN_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EIGEN_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EIGEN_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_EIGEN_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_EIGEN_MINSIZEREL} ${_CONAN_PKG_LIBS_EIGEN_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EIGEN_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EIGEN_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_EIGEN_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_EIGEN_DEBUG} ${_CONAN_PKG_LIBS_EIGEN_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EIGEN_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EIGEN_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_EIGEN_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::eigen PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_EIGEN}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_EIGEN_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_EIGEN_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_EIGEN_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_EIGEN_DEBUG}>)
    set_property(TARGET CONAN_PKG::eigen PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_EIGEN}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_EIGEN_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_EIGEN_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_EIGEN_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_EIGEN_DEBUG}>)
    set_property(TARGET CONAN_PKG::eigen PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_EIGEN_LIST} ${CONAN_CXX_FLAGS_EIGEN_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_EIGEN_RELEASE_LIST} ${CONAN_CXX_FLAGS_EIGEN_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_EIGEN_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_EIGEN_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_EIGEN_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_EIGEN_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_EIGEN_DEBUG_LIST}  ${CONAN_CXX_FLAGS_EIGEN_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_JASPER_DEPENDENCIES "${CONAN_SYSTEM_LIBS_JASPER} ${CONAN_FRAMEWORKS_FOUND_JASPER} CONAN_PKG::libjpeg")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_JASPER_DEPENDENCIES "${_CONAN_PKG_LIBS_JASPER_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_JASPER}" "${CONAN_LIB_DIRS_JASPER}"
                                  CONAN_PACKAGE_TARGETS_JASPER "${_CONAN_PKG_LIBS_JASPER_DEPENDENCIES}"
                                  "" jasper)
    set(_CONAN_PKG_LIBS_JASPER_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_JASPER_DEBUG} ${CONAN_FRAMEWORKS_FOUND_JASPER_DEBUG} CONAN_PKG::libjpeg")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_JASPER_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_JASPER_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_JASPER_DEBUG}" "${CONAN_LIB_DIRS_JASPER_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_JASPER_DEBUG "${_CONAN_PKG_LIBS_JASPER_DEPENDENCIES_DEBUG}"
                                  "debug" jasper)
    set(_CONAN_PKG_LIBS_JASPER_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_JASPER_RELEASE} ${CONAN_FRAMEWORKS_FOUND_JASPER_RELEASE} CONAN_PKG::libjpeg")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_JASPER_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_JASPER_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_JASPER_RELEASE}" "${CONAN_LIB_DIRS_JASPER_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_JASPER_RELEASE "${_CONAN_PKG_LIBS_JASPER_DEPENDENCIES_RELEASE}"
                                  "release" jasper)
    set(_CONAN_PKG_LIBS_JASPER_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_JASPER_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_JASPER_RELWITHDEBINFO} CONAN_PKG::libjpeg")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_JASPER_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_JASPER_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_JASPER_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_JASPER_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_JASPER_RELWITHDEBINFO "${_CONAN_PKG_LIBS_JASPER_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" jasper)
    set(_CONAN_PKG_LIBS_JASPER_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_JASPER_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_JASPER_MINSIZEREL} CONAN_PKG::libjpeg")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_JASPER_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_JASPER_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_JASPER_MINSIZEREL}" "${CONAN_LIB_DIRS_JASPER_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_JASPER_MINSIZEREL "${_CONAN_PKG_LIBS_JASPER_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" jasper)

    add_library(CONAN_PKG::jasper INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::jasper PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_JASPER} ${_CONAN_PKG_LIBS_JASPER_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JASPER_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JASPER_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_JASPER_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_JASPER_RELEASE} ${_CONAN_PKG_LIBS_JASPER_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JASPER_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JASPER_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_JASPER_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_JASPER_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_JASPER_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JASPER_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JASPER_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_JASPER_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_JASPER_MINSIZEREL} ${_CONAN_PKG_LIBS_JASPER_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JASPER_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JASPER_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_JASPER_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_JASPER_DEBUG} ${_CONAN_PKG_LIBS_JASPER_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JASPER_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JASPER_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_JASPER_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::jasper PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_JASPER}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_JASPER_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_JASPER_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_JASPER_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_JASPER_DEBUG}>)
    set_property(TARGET CONAN_PKG::jasper PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_JASPER}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_JASPER_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_JASPER_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_JASPER_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_JASPER_DEBUG}>)
    set_property(TARGET CONAN_PKG::jasper PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_JASPER_LIST} ${CONAN_CXX_FLAGS_JASPER_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_JASPER_RELEASE_LIST} ${CONAN_CXX_FLAGS_JASPER_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_JASPER_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_JASPER_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_JASPER_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_JASPER_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_JASPER_DEBUG_LIST}  ${CONAN_CXX_FLAGS_JASPER_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBPNG} ${CONAN_FRAMEWORKS_FOUND_LIBPNG} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPNG}" "${CONAN_LIB_DIRS_LIBPNG}"
                                  CONAN_PACKAGE_TARGETS_LIBPNG "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES}"
                                  "" libpng)
    set(_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBPNG_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBPNG_DEBUG} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPNG_DEBUG}" "${CONAN_LIB_DIRS_LIBPNG_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBPNG_DEBUG "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_DEBUG}"
                                  "debug" libpng)
    set(_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBPNG_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBPNG_RELEASE} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPNG_RELEASE}" "${CONAN_LIB_DIRS_LIBPNG_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBPNG_RELEASE "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELEASE}"
                                  "release" libpng)
    set(_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBPNG_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBPNG_RELWITHDEBINFO} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPNG_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBPNG_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBPNG_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libpng)
    set(_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBPNG_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBPNG_MINSIZEREL} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPNG_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBPNG_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBPNG_MINSIZEREL "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libpng)

    add_library(CONAN_PKG::libpng INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libpng PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBPNG} ${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPNG_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBPNG_RELEASE} ${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPNG_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBPNG_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPNG_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBPNG_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPNG_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBPNG_DEBUG} ${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPNG_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libpng PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBPNG}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBPNG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBPNG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBPNG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBPNG_DEBUG}>)
    set_property(TARGET CONAN_PKG::libpng PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBPNG}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBPNG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBPNG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBPNG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBPNG_DEBUG}>)
    set_property(TARGET CONAN_PKG::libpng PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBPNG_LIST} ${CONAN_CXX_FLAGS_LIBPNG_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBPNG_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBPNG_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBPNG_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBPNG_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBPNG_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBPNG_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBPNG_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBPNG_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_OPENEXR_DEPENDENCIES "${CONAN_SYSTEM_LIBS_OPENEXR} ${CONAN_FRAMEWORKS_FOUND_OPENEXR} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENEXR_DEPENDENCIES "${_CONAN_PKG_LIBS_OPENEXR_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENEXR}" "${CONAN_LIB_DIRS_OPENEXR}"
                                  CONAN_PACKAGE_TARGETS_OPENEXR "${_CONAN_PKG_LIBS_OPENEXR_DEPENDENCIES}"
                                  "" openexr)
    set(_CONAN_PKG_LIBS_OPENEXR_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_OPENEXR_DEBUG} ${CONAN_FRAMEWORKS_FOUND_OPENEXR_DEBUG} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENEXR_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_OPENEXR_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENEXR_DEBUG}" "${CONAN_LIB_DIRS_OPENEXR_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_OPENEXR_DEBUG "${_CONAN_PKG_LIBS_OPENEXR_DEPENDENCIES_DEBUG}"
                                  "debug" openexr)
    set(_CONAN_PKG_LIBS_OPENEXR_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_OPENEXR_RELEASE} ${CONAN_FRAMEWORKS_FOUND_OPENEXR_RELEASE} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENEXR_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_OPENEXR_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENEXR_RELEASE}" "${CONAN_LIB_DIRS_OPENEXR_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_OPENEXR_RELEASE "${_CONAN_PKG_LIBS_OPENEXR_DEPENDENCIES_RELEASE}"
                                  "release" openexr)
    set(_CONAN_PKG_LIBS_OPENEXR_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_OPENEXR_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_OPENEXR_RELWITHDEBINFO} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENEXR_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPENEXR_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENEXR_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_OPENEXR_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_OPENEXR_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPENEXR_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" openexr)
    set(_CONAN_PKG_LIBS_OPENEXR_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_OPENEXR_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_OPENEXR_MINSIZEREL} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENEXR_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_OPENEXR_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENEXR_MINSIZEREL}" "${CONAN_LIB_DIRS_OPENEXR_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_OPENEXR_MINSIZEREL "${_CONAN_PKG_LIBS_OPENEXR_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" openexr)

    add_library(CONAN_PKG::openexr INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::openexr PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_OPENEXR} ${_CONAN_PKG_LIBS_OPENEXR_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENEXR_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENEXR_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENEXR_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_OPENEXR_RELEASE} ${_CONAN_PKG_LIBS_OPENEXR_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENEXR_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENEXR_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENEXR_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_OPENEXR_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_OPENEXR_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENEXR_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENEXR_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENEXR_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_OPENEXR_MINSIZEREL} ${_CONAN_PKG_LIBS_OPENEXR_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENEXR_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENEXR_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENEXR_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_OPENEXR_DEBUG} ${_CONAN_PKG_LIBS_OPENEXR_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENEXR_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENEXR_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENEXR_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::openexr PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_OPENEXR}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_OPENEXR_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_OPENEXR_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_OPENEXR_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_OPENEXR_DEBUG}>)
    set_property(TARGET CONAN_PKG::openexr PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_OPENEXR}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_OPENEXR_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_OPENEXR_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_OPENEXR_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_OPENEXR_DEBUG}>)
    set_property(TARGET CONAN_PKG::openexr PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_OPENEXR_LIST} ${CONAN_CXX_FLAGS_OPENEXR_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_OPENEXR_RELEASE_LIST} ${CONAN_CXX_FLAGS_OPENEXR_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_OPENEXR_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_OPENEXR_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_OPENEXR_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_OPENEXR_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_OPENEXR_DEBUG_LIST}  ${CONAN_CXX_FLAGS_OPENEXR_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBTIFF} ${CONAN_FRAMEWORKS_FOUND_LIBTIFF} CONAN_PKG::zlib CONAN_PKG::libdeflate CONAN_PKG::xz_utils CONAN_PKG::libjpeg CONAN_PKG::jbig CONAN_PKG::zstd CONAN_PKG::libwebp")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBTIFF}" "${CONAN_LIB_DIRS_LIBTIFF}"
                                  CONAN_PACKAGE_TARGETS_LIBTIFF "${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES}"
                                  "" libtiff)
    set(_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBTIFF_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBTIFF_DEBUG} CONAN_PKG::zlib CONAN_PKG::libdeflate CONAN_PKG::xz_utils CONAN_PKG::libjpeg CONAN_PKG::jbig CONAN_PKG::zstd CONAN_PKG::libwebp")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBTIFF_DEBUG}" "${CONAN_LIB_DIRS_LIBTIFF_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBTIFF_DEBUG "${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_DEBUG}"
                                  "debug" libtiff)
    set(_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBTIFF_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBTIFF_RELEASE} CONAN_PKG::zlib CONAN_PKG::libdeflate CONAN_PKG::xz_utils CONAN_PKG::libjpeg CONAN_PKG::jbig CONAN_PKG::zstd CONAN_PKG::libwebp")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBTIFF_RELEASE}" "${CONAN_LIB_DIRS_LIBTIFF_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBTIFF_RELEASE "${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_RELEASE}"
                                  "release" libtiff)
    set(_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBTIFF_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBTIFF_RELWITHDEBINFO} CONAN_PKG::zlib CONAN_PKG::libdeflate CONAN_PKG::xz_utils CONAN_PKG::libjpeg CONAN_PKG::jbig CONAN_PKG::zstd CONAN_PKG::libwebp")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBTIFF_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBTIFF_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBTIFF_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libtiff)
    set(_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBTIFF_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBTIFF_MINSIZEREL} CONAN_PKG::zlib CONAN_PKG::libdeflate CONAN_PKG::xz_utils CONAN_PKG::libjpeg CONAN_PKG::jbig CONAN_PKG::zstd CONAN_PKG::libwebp")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBTIFF_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBTIFF_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBTIFF_MINSIZEREL "${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libtiff)

    add_library(CONAN_PKG::libtiff INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libtiff PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBTIFF} ${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBTIFF_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBTIFF_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBTIFF_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBTIFF_RELEASE} ${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBTIFF_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBTIFF_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBTIFF_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBTIFF_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBTIFF_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBTIFF_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBTIFF_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBTIFF_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBTIFF_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBTIFF_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBTIFF_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBTIFF_DEBUG} ${_CONAN_PKG_LIBS_LIBTIFF_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBTIFF_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBTIFF_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBTIFF_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libtiff PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBTIFF}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBTIFF_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBTIFF_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBTIFF_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBTIFF_DEBUG}>)
    set_property(TARGET CONAN_PKG::libtiff PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBTIFF}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBTIFF_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBTIFF_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBTIFF_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBTIFF_DEBUG}>)
    set_property(TARGET CONAN_PKG::libtiff PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBTIFF_LIST} ${CONAN_CXX_FLAGS_LIBTIFF_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBTIFF_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBTIFF_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBTIFF_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBTIFF_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBTIFF_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBTIFF_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBTIFF_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBTIFF_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_QUIRC_DEPENDENCIES "${CONAN_SYSTEM_LIBS_QUIRC} ${CONAN_FRAMEWORKS_FOUND_QUIRC} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_QUIRC_DEPENDENCIES "${_CONAN_PKG_LIBS_QUIRC_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_QUIRC}" "${CONAN_LIB_DIRS_QUIRC}"
                                  CONAN_PACKAGE_TARGETS_QUIRC "${_CONAN_PKG_LIBS_QUIRC_DEPENDENCIES}"
                                  "" quirc)
    set(_CONAN_PKG_LIBS_QUIRC_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_QUIRC_DEBUG} ${CONAN_FRAMEWORKS_FOUND_QUIRC_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_QUIRC_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_QUIRC_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_QUIRC_DEBUG}" "${CONAN_LIB_DIRS_QUIRC_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_QUIRC_DEBUG "${_CONAN_PKG_LIBS_QUIRC_DEPENDENCIES_DEBUG}"
                                  "debug" quirc)
    set(_CONAN_PKG_LIBS_QUIRC_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_QUIRC_RELEASE} ${CONAN_FRAMEWORKS_FOUND_QUIRC_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_QUIRC_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_QUIRC_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_QUIRC_RELEASE}" "${CONAN_LIB_DIRS_QUIRC_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_QUIRC_RELEASE "${_CONAN_PKG_LIBS_QUIRC_DEPENDENCIES_RELEASE}"
                                  "release" quirc)
    set(_CONAN_PKG_LIBS_QUIRC_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_QUIRC_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_QUIRC_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_QUIRC_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_QUIRC_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_QUIRC_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_QUIRC_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_QUIRC_RELWITHDEBINFO "${_CONAN_PKG_LIBS_QUIRC_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" quirc)
    set(_CONAN_PKG_LIBS_QUIRC_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_QUIRC_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_QUIRC_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_QUIRC_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_QUIRC_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_QUIRC_MINSIZEREL}" "${CONAN_LIB_DIRS_QUIRC_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_QUIRC_MINSIZEREL "${_CONAN_PKG_LIBS_QUIRC_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" quirc)

    add_library(CONAN_PKG::quirc INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::quirc PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_QUIRC} ${_CONAN_PKG_LIBS_QUIRC_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QUIRC_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QUIRC_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_QUIRC_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_QUIRC_RELEASE} ${_CONAN_PKG_LIBS_QUIRC_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QUIRC_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QUIRC_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_QUIRC_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_QUIRC_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_QUIRC_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QUIRC_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QUIRC_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_QUIRC_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_QUIRC_MINSIZEREL} ${_CONAN_PKG_LIBS_QUIRC_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QUIRC_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QUIRC_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_QUIRC_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_QUIRC_DEBUG} ${_CONAN_PKG_LIBS_QUIRC_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QUIRC_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QUIRC_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_QUIRC_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::quirc PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_QUIRC}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_QUIRC_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_QUIRC_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_QUIRC_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_QUIRC_DEBUG}>)
    set_property(TARGET CONAN_PKG::quirc PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_QUIRC}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_QUIRC_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_QUIRC_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_QUIRC_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_QUIRC_DEBUG}>)
    set_property(TARGET CONAN_PKG::quirc PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_QUIRC_LIST} ${CONAN_CXX_FLAGS_QUIRC_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_QUIRC_RELEASE_LIST} ${CONAN_CXX_FLAGS_QUIRC_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_QUIRC_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_QUIRC_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_QUIRC_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_QUIRC_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_QUIRC_DEBUG_LIST}  ${CONAN_CXX_FLAGS_QUIRC_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES "${CONAN_SYSTEM_LIBS_PROTOBUF} ${CONAN_FRAMEWORKS_FOUND_PROTOBUF} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES "${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PROTOBUF}" "${CONAN_LIB_DIRS_PROTOBUF}"
                                  CONAN_PACKAGE_TARGETS_PROTOBUF "${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES}"
                                  "" protobuf)
    set(_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_PROTOBUF_DEBUG} ${CONAN_FRAMEWORKS_FOUND_PROTOBUF_DEBUG} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PROTOBUF_DEBUG}" "${CONAN_LIB_DIRS_PROTOBUF_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_PROTOBUF_DEBUG "${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_DEBUG}"
                                  "debug" protobuf)
    set(_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_PROTOBUF_RELEASE} ${CONAN_FRAMEWORKS_FOUND_PROTOBUF_RELEASE} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PROTOBUF_RELEASE}" "${CONAN_LIB_DIRS_PROTOBUF_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_PROTOBUF_RELEASE "${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_RELEASE}"
                                  "release" protobuf)
    set(_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_PROTOBUF_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_PROTOBUF_RELWITHDEBINFO} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PROTOBUF_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_PROTOBUF_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_PROTOBUF_RELWITHDEBINFO "${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" protobuf)
    set(_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_PROTOBUF_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_PROTOBUF_MINSIZEREL} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PROTOBUF_MINSIZEREL}" "${CONAN_LIB_DIRS_PROTOBUF_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_PROTOBUF_MINSIZEREL "${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" protobuf)

    add_library(CONAN_PKG::protobuf INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::protobuf PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_PROTOBUF} ${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROTOBUF_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROTOBUF_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PROTOBUF_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_PROTOBUF_RELEASE} ${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROTOBUF_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROTOBUF_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PROTOBUF_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_PROTOBUF_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROTOBUF_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROTOBUF_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PROTOBUF_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_PROTOBUF_MINSIZEREL} ${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROTOBUF_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROTOBUF_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PROTOBUF_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_PROTOBUF_DEBUG} ${_CONAN_PKG_LIBS_PROTOBUF_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROTOBUF_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PROTOBUF_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PROTOBUF_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::protobuf PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_PROTOBUF}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_PROTOBUF_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_PROTOBUF_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_PROTOBUF_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_PROTOBUF_DEBUG}>)
    set_property(TARGET CONAN_PKG::protobuf PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_PROTOBUF}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_PROTOBUF_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_PROTOBUF_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_PROTOBUF_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_PROTOBUF_DEBUG}>)
    set_property(TARGET CONAN_PKG::protobuf PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_PROTOBUF_LIST} ${CONAN_CXX_FLAGS_PROTOBUF_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_PROTOBUF_RELEASE_LIST} ${CONAN_CXX_FLAGS_PROTOBUF_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_PROTOBUF_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_PROTOBUF_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_PROTOBUF_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_PROTOBUF_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_PROTOBUF_DEBUG_LIST}  ${CONAN_CXX_FLAGS_PROTOBUF_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_ADE_DEPENDENCIES "${CONAN_SYSTEM_LIBS_ADE} ${CONAN_FRAMEWORKS_FOUND_ADE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ADE_DEPENDENCIES "${_CONAN_PKG_LIBS_ADE_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ADE}" "${CONAN_LIB_DIRS_ADE}"
                                  CONAN_PACKAGE_TARGETS_ADE "${_CONAN_PKG_LIBS_ADE_DEPENDENCIES}"
                                  "" ade)
    set(_CONAN_PKG_LIBS_ADE_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_ADE_DEBUG} ${CONAN_FRAMEWORKS_FOUND_ADE_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ADE_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_ADE_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ADE_DEBUG}" "${CONAN_LIB_DIRS_ADE_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_ADE_DEBUG "${_CONAN_PKG_LIBS_ADE_DEPENDENCIES_DEBUG}"
                                  "debug" ade)
    set(_CONAN_PKG_LIBS_ADE_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_ADE_RELEASE} ${CONAN_FRAMEWORKS_FOUND_ADE_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ADE_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_ADE_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ADE_RELEASE}" "${CONAN_LIB_DIRS_ADE_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_ADE_RELEASE "${_CONAN_PKG_LIBS_ADE_DEPENDENCIES_RELEASE}"
                                  "release" ade)
    set(_CONAN_PKG_LIBS_ADE_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_ADE_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_ADE_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ADE_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ADE_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ADE_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_ADE_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_ADE_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ADE_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" ade)
    set(_CONAN_PKG_LIBS_ADE_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_ADE_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_ADE_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ADE_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_ADE_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ADE_MINSIZEREL}" "${CONAN_LIB_DIRS_ADE_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_ADE_MINSIZEREL "${_CONAN_PKG_LIBS_ADE_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" ade)

    add_library(CONAN_PKG::ade INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::ade PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_ADE} ${_CONAN_PKG_LIBS_ADE_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ADE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ADE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ADE_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_ADE_RELEASE} ${_CONAN_PKG_LIBS_ADE_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ADE_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ADE_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ADE_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_ADE_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_ADE_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ADE_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ADE_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ADE_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_ADE_MINSIZEREL} ${_CONAN_PKG_LIBS_ADE_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ADE_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ADE_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ADE_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_ADE_DEBUG} ${_CONAN_PKG_LIBS_ADE_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ADE_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ADE_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ADE_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::ade PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_ADE}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_ADE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_ADE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_ADE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_ADE_DEBUG}>)
    set_property(TARGET CONAN_PKG::ade PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_ADE}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_ADE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_ADE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_ADE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_ADE_DEBUG}>)
    set_property(TARGET CONAN_PKG::ade PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_ADE_LIST} ${CONAN_CXX_FLAGS_ADE_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_ADE_RELEASE_LIST} ${CONAN_CXX_FLAGS_ADE_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_ADE_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_ADE_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_ADE_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_ADE_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_ADE_DEBUG_LIST}  ${CONAN_CXX_FLAGS_ADE_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES "${CONAN_SYSTEM_LIBS_BZIP2} ${CONAN_FRAMEWORKS_FOUND_BZIP2} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2}" "${CONAN_LIB_DIRS_BZIP2}"
                                  CONAN_PACKAGE_TARGETS_BZIP2 "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES}"
                                  "" bzip2)
    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_BZIP2_DEBUG} ${CONAN_FRAMEWORKS_FOUND_BZIP2_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2_DEBUG}" "${CONAN_LIB_DIRS_BZIP2_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_DEBUG "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG}"
                                  "debug" bzip2)
    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_BZIP2_RELEASE} ${CONAN_FRAMEWORKS_FOUND_BZIP2_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2_RELEASE}" "${CONAN_LIB_DIRS_BZIP2_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_RELEASE "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE}"
                                  "release" bzip2)
    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BZIP2_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_BZIP2_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BZIP2_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_RELWITHDEBINFO "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" bzip2)
    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_BZIP2_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_BZIP2_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2_MINSIZEREL}" "${CONAN_LIB_DIRS_BZIP2_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_MINSIZEREL "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" bzip2)

    add_library(CONAN_PKG::bzip2 INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BZIP2} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BZIP2_RELEASE} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BZIP2_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BZIP2_MINSIZEREL} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BZIP2_DEBUG} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BZIP2}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BZIP2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BZIP2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BZIP2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BZIP2_DEBUG}>)
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BZIP2}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BZIP2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BZIP2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BZIP2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BZIP2_DEBUG}>)
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BZIP2_LIST} ${CONAN_CXX_FLAGS_BZIP2_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BZIP2_RELEASE_LIST} ${CONAN_CXX_FLAGS_BZIP2_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BZIP2_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BZIP2_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BZIP2_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BZIP2_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BZIP2_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBBACKTRACE_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBBACKTRACE} ${CONAN_FRAMEWORKS_FOUND_LIBBACKTRACE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBBACKTRACE_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBBACKTRACE_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBBACKTRACE}" "${CONAN_LIB_DIRS_LIBBACKTRACE}"
                                  CONAN_PACKAGE_TARGETS_LIBBACKTRACE "${_CONAN_PKG_LIBS_LIBBACKTRACE_DEPENDENCIES}"
                                  "" libbacktrace)
    set(_CONAN_PKG_LIBS_LIBBACKTRACE_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBBACKTRACE_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBBACKTRACE_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBBACKTRACE_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBBACKTRACE_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBBACKTRACE_DEBUG}" "${CONAN_LIB_DIRS_LIBBACKTRACE_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBBACKTRACE_DEBUG "${_CONAN_PKG_LIBS_LIBBACKTRACE_DEPENDENCIES_DEBUG}"
                                  "debug" libbacktrace)
    set(_CONAN_PKG_LIBS_LIBBACKTRACE_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBBACKTRACE_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBBACKTRACE_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBBACKTRACE_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBBACKTRACE_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBBACKTRACE_RELEASE}" "${CONAN_LIB_DIRS_LIBBACKTRACE_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBBACKTRACE_RELEASE "${_CONAN_PKG_LIBS_LIBBACKTRACE_DEPENDENCIES_RELEASE}"
                                  "release" libbacktrace)
    set(_CONAN_PKG_LIBS_LIBBACKTRACE_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBBACKTRACE_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBBACKTRACE_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBBACKTRACE_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBBACKTRACE_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBBACKTRACE_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBBACKTRACE_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBBACKTRACE_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBBACKTRACE_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libbacktrace)
    set(_CONAN_PKG_LIBS_LIBBACKTRACE_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBBACKTRACE_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBBACKTRACE_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBBACKTRACE_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBBACKTRACE_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBBACKTRACE_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBBACKTRACE_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBBACKTRACE_MINSIZEREL "${_CONAN_PKG_LIBS_LIBBACKTRACE_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libbacktrace)

    add_library(CONAN_PKG::libbacktrace INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libbacktrace PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBBACKTRACE} ${_CONAN_PKG_LIBS_LIBBACKTRACE_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBBACKTRACE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBBACKTRACE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBBACKTRACE_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBBACKTRACE_RELEASE} ${_CONAN_PKG_LIBS_LIBBACKTRACE_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBBACKTRACE_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBBACKTRACE_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBBACKTRACE_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBBACKTRACE_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBBACKTRACE_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBBACKTRACE_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBBACKTRACE_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBBACKTRACE_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBBACKTRACE_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBBACKTRACE_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBBACKTRACE_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBBACKTRACE_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBBACKTRACE_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBBACKTRACE_DEBUG} ${_CONAN_PKG_LIBS_LIBBACKTRACE_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBBACKTRACE_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBBACKTRACE_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBBACKTRACE_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libbacktrace PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBBACKTRACE}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBBACKTRACE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBBACKTRACE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBBACKTRACE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBBACKTRACE_DEBUG}>)
    set_property(TARGET CONAN_PKG::libbacktrace PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBBACKTRACE}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBBACKTRACE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBBACKTRACE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBBACKTRACE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBBACKTRACE_DEBUG}>)
    set_property(TARGET CONAN_PKG::libbacktrace PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBBACKTRACE_LIST} ${CONAN_CXX_FLAGS_LIBBACKTRACE_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBBACKTRACE_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBBACKTRACE_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBBACKTRACE_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBBACKTRACE_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBBACKTRACE_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBBACKTRACE_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBBACKTRACE_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBBACKTRACE_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBICONV} ${CONAN_FRAMEWORKS_FOUND_LIBICONV} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBICONV}" "${CONAN_LIB_DIRS_LIBICONV}"
                                  CONAN_PACKAGE_TARGETS_LIBICONV "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES}"
                                  "" libiconv)
    set(_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBICONV_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBICONV_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBICONV_DEBUG}" "${CONAN_LIB_DIRS_LIBICONV_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBICONV_DEBUG "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_DEBUG}"
                                  "debug" libiconv)
    set(_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBICONV_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBICONV_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBICONV_RELEASE}" "${CONAN_LIB_DIRS_LIBICONV_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBICONV_RELEASE "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELEASE}"
                                  "release" libiconv)
    set(_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBICONV_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBICONV_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBICONV_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBICONV_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBICONV_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libiconv)
    set(_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBICONV_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBICONV_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBICONV_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBICONV_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBICONV_MINSIZEREL "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libiconv)

    add_library(CONAN_PKG::libiconv INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libiconv PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBICONV} ${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBICONV_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBICONV_RELEASE} ${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBICONV_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBICONV_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBICONV_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBICONV_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBICONV_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBICONV_DEBUG} ${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBICONV_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libiconv PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBICONV}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBICONV_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBICONV_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBICONV_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBICONV_DEBUG}>)
    set_property(TARGET CONAN_PKG::libiconv PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBICONV}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBICONV_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBICONV_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBICONV_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBICONV_DEBUG}>)
    set_property(TARGET CONAN_PKG::libiconv PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBICONV_LIST} ${CONAN_CXX_FLAGS_LIBICONV_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBICONV_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBICONV_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBICONV_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBICONV_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBICONV_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBICONV_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBICONV_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBICONV_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES "${CONAN_SYSTEM_LIBS_ZLIB} ${CONAN_FRAMEWORKS_FOUND_ZLIB} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB}" "${CONAN_LIB_DIRS_ZLIB}"
                                  CONAN_PACKAGE_TARGETS_ZLIB "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES}"
                                  "" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_ZLIB_DEBUG} ${CONAN_FRAMEWORKS_FOUND_ZLIB_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_DEBUG}" "${CONAN_LIB_DIRS_ZLIB_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_DEBUG "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG}"
                                  "debug" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_ZLIB_RELEASE} ${CONAN_FRAMEWORKS_FOUND_ZLIB_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_RELEASE}" "${CONAN_LIB_DIRS_ZLIB_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_RELEASE "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE}"
                                  "release" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_ZLIB_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_ZLIB_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_ZLIB_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_ZLIB_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_ZLIB_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_MINSIZEREL}" "${CONAN_LIB_DIRS_ZLIB_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_MINSIZEREL "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" zlib)

    add_library(CONAN_PKG::zlib INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_ZLIB} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_ZLIB_RELEASE} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_ZLIB_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_ZLIB_MINSIZEREL} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_ZLIB_DEBUG} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_ZLIB}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_ZLIB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_ZLIB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_ZLIB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_ZLIB_DEBUG}>)
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_ZLIB}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_ZLIB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_ZLIB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_ZLIB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_ZLIB_DEBUG}>)
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_ZLIB_LIST} ${CONAN_CXX_FLAGS_ZLIB_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_ZLIB_RELEASE_LIST} ${CONAN_CXX_FLAGS_ZLIB_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_ZLIB_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_ZLIB_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_ZLIB_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_ZLIB_DEBUG_LIST}  ${CONAN_CXX_FLAGS_ZLIB_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBJPEG} ${CONAN_FRAMEWORKS_FOUND_LIBJPEG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBJPEG}" "${CONAN_LIB_DIRS_LIBJPEG}"
                                  CONAN_PACKAGE_TARGETS_LIBJPEG "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES}"
                                  "" libjpeg)
    set(_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBJPEG_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBJPEG_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBJPEG_DEBUG}" "${CONAN_LIB_DIRS_LIBJPEG_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBJPEG_DEBUG "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_DEBUG}"
                                  "debug" libjpeg)
    set(_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBJPEG_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBJPEG_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBJPEG_RELEASE}" "${CONAN_LIB_DIRS_LIBJPEG_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBJPEG_RELEASE "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELEASE}"
                                  "release" libjpeg)
    set(_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBJPEG_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBJPEG_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBJPEG_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBJPEG_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBJPEG_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libjpeg)
    set(_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBJPEG_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBJPEG_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBJPEG_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBJPEG_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBJPEG_MINSIZEREL "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libjpeg)

    add_library(CONAN_PKG::libjpeg INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libjpeg PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBJPEG} ${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBJPEG_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBJPEG_RELEASE} ${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBJPEG_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBJPEG_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBJPEG_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBJPEG_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBJPEG_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBJPEG_DEBUG} ${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBJPEG_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libjpeg PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBJPEG}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBJPEG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBJPEG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBJPEG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBJPEG_DEBUG}>)
    set_property(TARGET CONAN_PKG::libjpeg PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBJPEG}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBJPEG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBJPEG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBJPEG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBJPEG_DEBUG}>)
    set_property(TARGET CONAN_PKG::libjpeg PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBJPEG_LIST} ${CONAN_CXX_FLAGS_LIBJPEG_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBJPEG_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBJPEG_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBJPEG_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBJPEG_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBJPEG_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBJPEG_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBJPEG_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBJPEG_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBDEFLATE} ${CONAN_FRAMEWORKS_FOUND_LIBDEFLATE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBDEFLATE}" "${CONAN_LIB_DIRS_LIBDEFLATE}"
                                  CONAN_PACKAGE_TARGETS_LIBDEFLATE "${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES}"
                                  "" libdeflate)
    set(_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBDEFLATE_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBDEFLATE_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBDEFLATE_DEBUG}" "${CONAN_LIB_DIRS_LIBDEFLATE_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBDEFLATE_DEBUG "${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_DEBUG}"
                                  "debug" libdeflate)
    set(_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBDEFLATE_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBDEFLATE_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBDEFLATE_RELEASE}" "${CONAN_LIB_DIRS_LIBDEFLATE_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBDEFLATE_RELEASE "${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_RELEASE}"
                                  "release" libdeflate)
    set(_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBDEFLATE_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBDEFLATE_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBDEFLATE_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBDEFLATE_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBDEFLATE_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libdeflate)
    set(_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBDEFLATE_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBDEFLATE_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBDEFLATE_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBDEFLATE_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBDEFLATE_MINSIZEREL "${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libdeflate)

    add_library(CONAN_PKG::libdeflate INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libdeflate PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBDEFLATE} ${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBDEFLATE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBDEFLATE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBDEFLATE_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBDEFLATE_RELEASE} ${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBDEFLATE_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBDEFLATE_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBDEFLATE_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBDEFLATE_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBDEFLATE_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBDEFLATE_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBDEFLATE_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBDEFLATE_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBDEFLATE_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBDEFLATE_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBDEFLATE_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBDEFLATE_DEBUG} ${_CONAN_PKG_LIBS_LIBDEFLATE_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBDEFLATE_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBDEFLATE_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBDEFLATE_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libdeflate PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBDEFLATE}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBDEFLATE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBDEFLATE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBDEFLATE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBDEFLATE_DEBUG}>)
    set_property(TARGET CONAN_PKG::libdeflate PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBDEFLATE}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBDEFLATE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBDEFLATE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBDEFLATE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBDEFLATE_DEBUG}>)
    set_property(TARGET CONAN_PKG::libdeflate PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBDEFLATE_LIST} ${CONAN_CXX_FLAGS_LIBDEFLATE_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBDEFLATE_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBDEFLATE_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBDEFLATE_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBDEFLATE_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBDEFLATE_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBDEFLATE_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBDEFLATE_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBDEFLATE_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES "${CONAN_SYSTEM_LIBS_XZ_UTILS} ${CONAN_FRAMEWORKS_FOUND_XZ_UTILS} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES "${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XZ_UTILS}" "${CONAN_LIB_DIRS_XZ_UTILS}"
                                  CONAN_PACKAGE_TARGETS_XZ_UTILS "${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES}"
                                  "" xz_utils)
    set(_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_XZ_UTILS_DEBUG} ${CONAN_FRAMEWORKS_FOUND_XZ_UTILS_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XZ_UTILS_DEBUG}" "${CONAN_LIB_DIRS_XZ_UTILS_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_XZ_UTILS_DEBUG "${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_DEBUG}"
                                  "debug" xz_utils)
    set(_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_XZ_UTILS_RELEASE} ${CONAN_FRAMEWORKS_FOUND_XZ_UTILS_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XZ_UTILS_RELEASE}" "${CONAN_LIB_DIRS_XZ_UTILS_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_XZ_UTILS_RELEASE "${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_RELEASE}"
                                  "release" xz_utils)
    set(_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_XZ_UTILS_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_XZ_UTILS_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XZ_UTILS_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_XZ_UTILS_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_XZ_UTILS_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" xz_utils)
    set(_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_XZ_UTILS_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_XZ_UTILS_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XZ_UTILS_MINSIZEREL}" "${CONAN_LIB_DIRS_XZ_UTILS_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_XZ_UTILS_MINSIZEREL "${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" xz_utils)

    add_library(CONAN_PKG::xz_utils INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::xz_utils PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_XZ_UTILS} ${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XZ_UTILS_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XZ_UTILS_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XZ_UTILS_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_XZ_UTILS_RELEASE} ${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XZ_UTILS_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XZ_UTILS_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XZ_UTILS_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_XZ_UTILS_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XZ_UTILS_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XZ_UTILS_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XZ_UTILS_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_XZ_UTILS_MINSIZEREL} ${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XZ_UTILS_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XZ_UTILS_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XZ_UTILS_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_XZ_UTILS_DEBUG} ${_CONAN_PKG_LIBS_XZ_UTILS_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XZ_UTILS_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XZ_UTILS_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XZ_UTILS_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::xz_utils PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_XZ_UTILS}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_XZ_UTILS_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_XZ_UTILS_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_XZ_UTILS_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_XZ_UTILS_DEBUG}>)
    set_property(TARGET CONAN_PKG::xz_utils PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_XZ_UTILS}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_XZ_UTILS_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_XZ_UTILS_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_XZ_UTILS_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_XZ_UTILS_DEBUG}>)
    set_property(TARGET CONAN_PKG::xz_utils PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_XZ_UTILS_LIST} ${CONAN_CXX_FLAGS_XZ_UTILS_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_XZ_UTILS_RELEASE_LIST} ${CONAN_CXX_FLAGS_XZ_UTILS_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_XZ_UTILS_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_XZ_UTILS_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_XZ_UTILS_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_XZ_UTILS_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_XZ_UTILS_DEBUG_LIST}  ${CONAN_CXX_FLAGS_XZ_UTILS_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_JBIG_DEPENDENCIES "${CONAN_SYSTEM_LIBS_JBIG} ${CONAN_FRAMEWORKS_FOUND_JBIG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_JBIG_DEPENDENCIES "${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_JBIG}" "${CONAN_LIB_DIRS_JBIG}"
                                  CONAN_PACKAGE_TARGETS_JBIG "${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES}"
                                  "" jbig)
    set(_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_JBIG_DEBUG} ${CONAN_FRAMEWORKS_FOUND_JBIG_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_JBIG_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_JBIG_DEBUG}" "${CONAN_LIB_DIRS_JBIG_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_JBIG_DEBUG "${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_DEBUG}"
                                  "debug" jbig)
    set(_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_JBIG_RELEASE} ${CONAN_FRAMEWORKS_FOUND_JBIG_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_JBIG_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_JBIG_RELEASE}" "${CONAN_LIB_DIRS_JBIG_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_JBIG_RELEASE "${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_RELEASE}"
                                  "release" jbig)
    set(_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_JBIG_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_JBIG_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_JBIG_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_JBIG_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_JBIG_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_JBIG_RELWITHDEBINFO "${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" jbig)
    set(_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_JBIG_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_JBIG_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_JBIG_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_JBIG_MINSIZEREL}" "${CONAN_LIB_DIRS_JBIG_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_JBIG_MINSIZEREL "${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" jbig)

    add_library(CONAN_PKG::jbig INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::jbig PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_JBIG} ${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JBIG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JBIG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_JBIG_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_JBIG_RELEASE} ${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JBIG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JBIG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_JBIG_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_JBIG_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JBIG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JBIG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_JBIG_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_JBIG_MINSIZEREL} ${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JBIG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JBIG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_JBIG_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_JBIG_DEBUG} ${_CONAN_PKG_LIBS_JBIG_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JBIG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_JBIG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_JBIG_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::jbig PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_JBIG}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_JBIG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_JBIG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_JBIG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_JBIG_DEBUG}>)
    set_property(TARGET CONAN_PKG::jbig PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_JBIG}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_JBIG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_JBIG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_JBIG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_JBIG_DEBUG}>)
    set_property(TARGET CONAN_PKG::jbig PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_JBIG_LIST} ${CONAN_CXX_FLAGS_JBIG_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_JBIG_RELEASE_LIST} ${CONAN_CXX_FLAGS_JBIG_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_JBIG_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_JBIG_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_JBIG_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_JBIG_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_JBIG_DEBUG_LIST}  ${CONAN_CXX_FLAGS_JBIG_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES "${CONAN_SYSTEM_LIBS_ZSTD} ${CONAN_FRAMEWORKS_FOUND_ZSTD} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZSTD_DEPENDENCIES "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZSTD}" "${CONAN_LIB_DIRS_ZSTD}"
                                  CONAN_PACKAGE_TARGETS_ZSTD "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES}"
                                  "" zstd)
    set(_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_ZSTD_DEBUG} ${CONAN_FRAMEWORKS_FOUND_ZSTD_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZSTD_DEBUG}" "${CONAN_LIB_DIRS_ZSTD_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_ZSTD_DEBUG "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_DEBUG}"
                                  "debug" zstd)
    set(_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_ZSTD_RELEASE} ${CONAN_FRAMEWORKS_FOUND_ZSTD_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZSTD_RELEASE}" "${CONAN_LIB_DIRS_ZSTD_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_ZSTD_RELEASE "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELEASE}"
                                  "release" zstd)
    set(_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_ZSTD_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_ZSTD_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZSTD_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_ZSTD_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_ZSTD_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" zstd)
    set(_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_ZSTD_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_ZSTD_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZSTD_MINSIZEREL}" "${CONAN_LIB_DIRS_ZSTD_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_ZSTD_MINSIZEREL "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" zstd)

    add_library(CONAN_PKG::zstd INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::zstd PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_ZSTD} ${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZSTD_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_ZSTD_RELEASE} ${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZSTD_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_ZSTD_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZSTD_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_ZSTD_MINSIZEREL} ${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZSTD_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_ZSTD_DEBUG} ${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZSTD_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::zstd PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_ZSTD}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_ZSTD_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_ZSTD_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_ZSTD_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_ZSTD_DEBUG}>)
    set_property(TARGET CONAN_PKG::zstd PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_ZSTD}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_ZSTD_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_ZSTD_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_ZSTD_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_ZSTD_DEBUG}>)
    set_property(TARGET CONAN_PKG::zstd PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_ZSTD_LIST} ${CONAN_CXX_FLAGS_ZSTD_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_ZSTD_RELEASE_LIST} ${CONAN_CXX_FLAGS_ZSTD_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_ZSTD_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_ZSTD_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_ZSTD_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_ZSTD_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_ZSTD_DEBUG_LIST}  ${CONAN_CXX_FLAGS_ZSTD_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBWEBP} ${CONAN_FRAMEWORKS_FOUND_LIBWEBP} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBWEBP}" "${CONAN_LIB_DIRS_LIBWEBP}"
                                  CONAN_PACKAGE_TARGETS_LIBWEBP "${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES}"
                                  "" libwebp)
    set(_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBWEBP_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBWEBP_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBWEBP_DEBUG}" "${CONAN_LIB_DIRS_LIBWEBP_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBWEBP_DEBUG "${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_DEBUG}"
                                  "debug" libwebp)
    set(_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBWEBP_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBWEBP_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBWEBP_RELEASE}" "${CONAN_LIB_DIRS_LIBWEBP_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBWEBP_RELEASE "${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_RELEASE}"
                                  "release" libwebp)
    set(_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBWEBP_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBWEBP_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBWEBP_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBWEBP_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBWEBP_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libwebp)
    set(_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBWEBP_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBWEBP_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBWEBP_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBWEBP_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBWEBP_MINSIZEREL "${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libwebp)

    add_library(CONAN_PKG::libwebp INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libwebp PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBWEBP} ${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBWEBP_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBWEBP_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBWEBP_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBWEBP_RELEASE} ${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBWEBP_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBWEBP_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBWEBP_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBWEBP_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBWEBP_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBWEBP_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBWEBP_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBWEBP_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBWEBP_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBWEBP_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBWEBP_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBWEBP_DEBUG} ${_CONAN_PKG_LIBS_LIBWEBP_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBWEBP_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBWEBP_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBWEBP_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libwebp PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBWEBP}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBWEBP_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBWEBP_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBWEBP_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBWEBP_DEBUG}>)
    set_property(TARGET CONAN_PKG::libwebp PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBWEBP}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBWEBP_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBWEBP_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBWEBP_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBWEBP_DEBUG}>)
    set_property(TARGET CONAN_PKG::libwebp PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBWEBP_LIST} ${CONAN_CXX_FLAGS_LIBWEBP_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBWEBP_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBWEBP_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBWEBP_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBWEBP_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBWEBP_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBWEBP_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBWEBP_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBWEBP_DEBUG_LIST}>)

    set(CONAN_TARGETS CONAN_PKG::opencv CONAN_PKG::gtest CONAN_PKG::boost CONAN_PKG::eigen CONAN_PKG::jasper CONAN_PKG::libpng CONAN_PKG::openexr CONAN_PKG::libtiff CONAN_PKG::quirc CONAN_PKG::protobuf CONAN_PKG::ade CONAN_PKG::bzip2 CONAN_PKG::libbacktrace CONAN_PKG::libiconv CONAN_PKG::zlib CONAN_PKG::libjpeg CONAN_PKG::libdeflate CONAN_PKG::xz_utils CONAN_PKG::jbig CONAN_PKG::zstd CONAN_PKG::libwebp)

endmacro()


macro(conan_basic_setup)
    set(options TARGETS NO_OUTPUT_DIRS SKIP_RPATH KEEP_RPATHS SKIP_STD SKIP_FPIC)
    cmake_parse_arguments(ARGUMENTS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN} )

    if(CONAN_EXPORTED)
        conan_message(STATUS "Conan: called by CMake conan helper")
    endif()

    if(CONAN_IN_LOCAL_CACHE)
        conan_message(STATUS "Conan: called inside local cache")
    endif()

    if(NOT ARGUMENTS_NO_OUTPUT_DIRS)
        conan_message(STATUS "Conan: Adjusting output directories")
        conan_output_dirs_setup()
    endif()

    if(NOT ARGUMENTS_TARGETS)
        conan_message(STATUS "Conan: Using cmake global configuration")
        conan_global_flags()
    else()
        conan_message(STATUS "Conan: Using cmake targets configuration")
        conan_define_targets()
    endif()

    if(ARGUMENTS_SKIP_RPATH)
        # Change by "DEPRECATION" or "SEND_ERROR" when we are ready
        conan_message(WARNING "Conan: SKIP_RPATH is deprecated, it has been renamed to KEEP_RPATHS")
    endif()

    if(NOT ARGUMENTS_SKIP_RPATH AND NOT ARGUMENTS_KEEP_RPATHS)
        # Parameter has renamed, but we keep the compatibility with old SKIP_RPATH
        conan_set_rpath()
    endif()

    if(NOT ARGUMENTS_SKIP_STD)
        conan_set_std()
    endif()

    if(NOT ARGUMENTS_SKIP_FPIC)
        conan_set_fpic()
    endif()

    conan_check_compiler()
    conan_set_libcxx()
    conan_set_vs_runtime()
    conan_set_find_paths()
    conan_include_build_modules()
    conan_set_find_library_paths()
endmacro()


macro(conan_set_find_paths)
    # CMAKE_MODULE_PATH does not have Debug/Release config, but there are variables
    # CONAN_CMAKE_MODULE_PATH_DEBUG to be used by the consumer
    # CMake can find findXXX.cmake files in the root of packages
    set(CMAKE_MODULE_PATH ${CONAN_CMAKE_MODULE_PATH} ${CMAKE_MODULE_PATH})

    # Make find_package() to work
    set(CMAKE_PREFIX_PATH ${CONAN_CMAKE_MODULE_PATH} ${CMAKE_PREFIX_PATH})

    # Set the find root path (cross build)
    set(CMAKE_FIND_ROOT_PATH ${CONAN_CMAKE_FIND_ROOT_PATH} ${CMAKE_FIND_ROOT_PATH})
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_PROGRAM)
        set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_PROGRAM})
    endif()
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_LIBRARY)
        set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_LIBRARY})
    endif()
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_INCLUDE)
        set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_INCLUDE})
    endif()
endmacro()


macro(conan_set_find_library_paths)
    # CMAKE_INCLUDE_PATH, CMAKE_LIBRARY_PATH does not have Debug/Release config, but there are variables
    # CONAN_INCLUDE_DIRS_DEBUG/RELEASE CONAN_LIB_DIRS_DEBUG/RELEASE to be used by the consumer
    # For find_library
    set(CMAKE_INCLUDE_PATH ${CONAN_INCLUDE_DIRS} ${CMAKE_INCLUDE_PATH})
    set(CMAKE_LIBRARY_PATH ${CONAN_LIB_DIRS} ${CMAKE_LIBRARY_PATH})
endmacro()


macro(conan_set_vs_runtime)
    if(CONAN_LINK_RUNTIME)
        conan_get_policy(CMP0091 policy_0091)
        if(policy_0091 STREQUAL "NEW")
            if(CONAN_LINK_RUNTIME MATCHES "MTd")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDebug")
            elseif(CONAN_LINK_RUNTIME MATCHES "MDd")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDebugDLL")
            elseif(CONAN_LINK_RUNTIME MATCHES "MT")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded")
            elseif(CONAN_LINK_RUNTIME MATCHES "MD")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDLL")
            endif()
        else()
            foreach(flag CMAKE_C_FLAGS_RELEASE CMAKE_CXX_FLAGS_RELEASE
                         CMAKE_C_FLAGS_RELWITHDEBINFO CMAKE_CXX_FLAGS_RELWITHDEBINFO
                         CMAKE_C_FLAGS_MINSIZEREL CMAKE_CXX_FLAGS_MINSIZEREL)
                if(DEFINED ${flag})
                    string(REPLACE "/MD" ${CONAN_LINK_RUNTIME} ${flag} "${${flag}}")
                endif()
            endforeach()
            foreach(flag CMAKE_C_FLAGS_DEBUG CMAKE_CXX_FLAGS_DEBUG)
                if(DEFINED ${flag})
                    string(REPLACE "/MDd" ${CONAN_LINK_RUNTIME} ${flag} "${${flag}}")
                endif()
            endforeach()
        endif()
    endif()
endmacro()


macro(conan_flags_setup)
    # Macro maintained for backwards compatibility
    conan_set_find_library_paths()
    conan_global_flags()
    conan_set_rpath()
    conan_set_vs_runtime()
    conan_set_libcxx()
endmacro()


function(conan_message MESSAGE_OUTPUT)
    if(NOT CONAN_CMAKE_SILENT_OUTPUT)
        message(${ARGV${0}})
    endif()
endfunction()


function(conan_get_policy policy_id policy)
    if(POLICY "${policy_id}")
        cmake_policy(GET "${policy_id}" _policy)
        set(${policy} "${_policy}" PARENT_SCOPE)
    else()
        set(${policy} "" PARENT_SCOPE)
    endif()
endfunction()


function(conan_find_libraries_abs_path libraries package_libdir libraries_abs_path)
    foreach(_LIBRARY_NAME ${libraries})
        find_library(CONAN_FOUND_LIBRARY NAME ${_LIBRARY_NAME} PATHS ${package_libdir}
                     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
        if(CONAN_FOUND_LIBRARY)
            conan_message(STATUS "Library ${_LIBRARY_NAME} found ${CONAN_FOUND_LIBRARY}")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${CONAN_FOUND_LIBRARY})
        else()
            conan_message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIBRARY_NAME})
        endif()
        unset(CONAN_FOUND_LIBRARY CACHE)
    endforeach()
    set(${libraries_abs_path} ${CONAN_FULLPATH_LIBS} PARENT_SCOPE)
endfunction()


function(conan_package_library_targets libraries package_libdir libraries_abs_path deps build_type package_name)
    unset(_CONAN_ACTUAL_TARGETS CACHE)
    unset(_CONAN_FOUND_SYSTEM_LIBS CACHE)
    foreach(_LIBRARY_NAME ${libraries})
        find_library(CONAN_FOUND_LIBRARY NAME ${_LIBRARY_NAME} PATHS ${package_libdir}
                     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
        if(CONAN_FOUND_LIBRARY)
            conan_message(STATUS "Library ${_LIBRARY_NAME} found ${CONAN_FOUND_LIBRARY}")
            set(_LIB_NAME CONAN_LIB::${package_name}_${_LIBRARY_NAME}${build_type})
            add_library(${_LIB_NAME} UNKNOWN IMPORTED)
            set_target_properties(${_LIB_NAME} PROPERTIES IMPORTED_LOCATION ${CONAN_FOUND_LIBRARY})
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIB_NAME})
            set(_CONAN_ACTUAL_TARGETS ${_CONAN_ACTUAL_TARGETS} ${_LIB_NAME})
        else()
            conan_message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIBRARY_NAME})
            set(_CONAN_FOUND_SYSTEM_LIBS "${_CONAN_FOUND_SYSTEM_LIBS};${_LIBRARY_NAME}")
        endif()
        unset(CONAN_FOUND_LIBRARY CACHE)
    endforeach()

    # Add all dependencies to all targets
    string(REPLACE " " ";" deps_list "${deps}")
    foreach(_CONAN_ACTUAL_TARGET ${_CONAN_ACTUAL_TARGETS})
        set_property(TARGET ${_CONAN_ACTUAL_TARGET} PROPERTY INTERFACE_LINK_LIBRARIES "${_CONAN_FOUND_SYSTEM_LIBS};${deps_list}")
    endforeach()

    set(${libraries_abs_path} ${CONAN_FULLPATH_LIBS} PARENT_SCOPE)
endfunction()


macro(conan_set_libcxx)
    if(DEFINED CONAN_LIBCXX)
        conan_message(STATUS "Conan: C++ stdlib: ${CONAN_LIBCXX}")
        if(CONAN_COMPILER STREQUAL "clang" OR CONAN_COMPILER STREQUAL "apple-clang")
            if(CONAN_LIBCXX STREQUAL "libstdc++" OR CONAN_LIBCXX STREQUAL "libstdc++11" )
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libstdc++")
            elseif(CONAN_LIBCXX STREQUAL "libc++")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++")
            endif()
        endif()
        if(CONAN_COMPILER STREQUAL "sun-cc")
            if(CONAN_LIBCXX STREQUAL "libCstd")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=Cstd")
            elseif(CONAN_LIBCXX STREQUAL "libstdcxx")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stdcxx4")
            elseif(CONAN_LIBCXX STREQUAL "libstlport")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stlport4")
            elseif(CONAN_LIBCXX STREQUAL "libstdc++")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stdcpp")
            endif()
        endif()
        if(CONAN_LIBCXX STREQUAL "libstdc++11")
            add_definitions(-D_GLIBCXX_USE_CXX11_ABI=1)
        elseif(CONAN_LIBCXX STREQUAL "libstdc++")
            add_definitions(-D_GLIBCXX_USE_CXX11_ABI=0)
        endif()
    endif()
endmacro()


macro(conan_set_std)
    conan_message(STATUS "Conan: Adjusting language standard")
    # Do not warn "Manually-specified variables were not used by the project"
    set(ignorevar "${CONAN_STD_CXX_FLAG}${CONAN_CMAKE_CXX_STANDARD}${CONAN_CMAKE_CXX_EXTENSIONS}")
    if (CMAKE_VERSION VERSION_LESS "3.1" OR
        (CMAKE_VERSION VERSION_LESS "3.12" AND ("${CONAN_CMAKE_CXX_STANDARD}" STREQUAL "20" OR "${CONAN_CMAKE_CXX_STANDARD}" STREQUAL "gnu20")))
        if(CONAN_STD_CXX_FLAG)
            conan_message(STATUS "Conan setting CXX_FLAGS flags: ${CONAN_STD_CXX_FLAG}")
            set(CMAKE_CXX_FLAGS "${CONAN_STD_CXX_FLAG} ${CMAKE_CXX_FLAGS}")
        endif()
    else()
        if(CONAN_CMAKE_CXX_STANDARD)
            conan_message(STATUS "Conan setting CPP STANDARD: ${CONAN_CMAKE_CXX_STANDARD} WITH EXTENSIONS ${CONAN_CMAKE_CXX_EXTENSIONS}")
            set(CMAKE_CXX_STANDARD ${CONAN_CMAKE_CXX_STANDARD})
            set(CMAKE_CXX_EXTENSIONS ${CONAN_CMAKE_CXX_EXTENSIONS})
        endif()
    endif()
endmacro()


macro(conan_set_rpath)
    conan_message(STATUS "Conan: Adjusting default RPATHs Conan policies")
    if(APPLE)
        # https://cmake.org/Wiki/CMake_RPATH_handling
        # CONAN GUIDE: All generated libraries should have the id and dependencies to other
        # dylibs without path, just the name, EX:
        # libMyLib1.dylib:
        #     libMyLib1.dylib (compatibility version 0.0.0, current version 0.0.0)
        #     libMyLib0.dylib (compatibility version 0.0.0, current version 0.0.0)
        #     /usr/lib/libc++.1.dylib (compatibility version 1.0.0, current version 120.0.0)
        #     /usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1197.1.1)
        # AVOID RPATH FOR *.dylib, ALL LIBS BETWEEN THEM AND THE EXE
        # SHOULD BE ON THE LINKER RESOLVER PATH (./ IS ONE OF THEM)
        set(CMAKE_SKIP_RPATH 1 CACHE BOOL "rpaths" FORCE)
        # Policy CMP0068
        # We want the old behavior, in CMake >= 3.9 CMAKE_SKIP_RPATH won't affect the install_name in OSX
        set(CMAKE_INSTALL_NAME_DIR "")
    endif()
endmacro()


macro(conan_set_fpic)
    if(DEFINED CONAN_CMAKE_POSITION_INDEPENDENT_CODE)
        conan_message(STATUS "Conan: Adjusting fPIC flag (${CONAN_CMAKE_POSITION_INDEPENDENT_CODE})")
        set(CMAKE_POSITION_INDEPENDENT_CODE ${CONAN_CMAKE_POSITION_INDEPENDENT_CODE})
    endif()
endmacro()


macro(conan_output_dirs_setup)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})

    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})

    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
endmacro()


macro(conan_split_version VERSION_STRING MAJOR MINOR)
    #make a list from the version string
    string(REPLACE "." ";" VERSION_LIST "${VERSION_STRING}")

    #write output values
    list(LENGTH VERSION_LIST _version_len)
    list(GET VERSION_LIST 0 ${MAJOR})
    if(${_version_len} GREATER 1)
        list(GET VERSION_LIST 1 ${MINOR})
    endif()
endmacro()


macro(conan_error_compiler_version)
    message(FATAL_ERROR "Detected a mismatch for the compiler version between your conan profile settings and CMake: \n"
                        "Compiler version specified in your conan profile: ${CONAN_COMPILER_VERSION}\n"
                        "Compiler version detected in CMake: ${VERSION_MAJOR}.${VERSION_MINOR}\n"
                        "Please check your conan profile settings (conan profile show [default|your_profile_name])\n"
                        "P.S. You may set CONAN_DISABLE_CHECK_COMPILER CMake variable in order to disable this check."
           )
endmacro()

set(_CONAN_CURRENT_DIR ${CMAKE_CURRENT_LIST_DIR})

function(conan_get_compiler CONAN_INFO_COMPILER CONAN_INFO_COMPILER_VERSION)
    conan_message(STATUS "Current conanbuildinfo.cmake directory: " ${_CONAN_CURRENT_DIR})
    if(NOT EXISTS ${_CONAN_CURRENT_DIR}/conaninfo.txt)
        conan_message(STATUS "WARN: conaninfo.txt not found")
        return()
    endif()

    file (READ "${_CONAN_CURRENT_DIR}/conaninfo.txt" CONANINFO)

    # MATCHALL will match all, including the last one, which is the full_settings one
    string(REGEX MATCH "full_settings.*" _FULL_SETTINGS_MATCHED ${CONANINFO})
    string(REGEX MATCH "compiler=([-A-Za-z0-9_ ]+)" _MATCHED ${_FULL_SETTINGS_MATCHED})
    if(DEFINED CMAKE_MATCH_1)
        string(STRIP "${CMAKE_MATCH_1}" _CONAN_INFO_COMPILER)
        set(${CONAN_INFO_COMPILER} ${_CONAN_INFO_COMPILER} PARENT_SCOPE)
    endif()

    string(REGEX MATCH "compiler.version=([-A-Za-z0-9_.]+)" _MATCHED ${_FULL_SETTINGS_MATCHED})
    if(DEFINED CMAKE_MATCH_1)
        string(STRIP "${CMAKE_MATCH_1}" _CONAN_INFO_COMPILER_VERSION)
        set(${CONAN_INFO_COMPILER_VERSION} ${_CONAN_INFO_COMPILER_VERSION} PARENT_SCOPE)
    endif()
endfunction()


function(check_compiler_version)
    conan_split_version(${CMAKE_CXX_COMPILER_VERSION} VERSION_MAJOR VERSION_MINOR)
    if(DEFINED CONAN_SETTINGS_COMPILER_TOOLSET)
       conan_message(STATUS "Conan: Skipping compiler check: Declared 'compiler.toolset'")
       return()
    endif()
    if(CMAKE_CXX_COMPILER_ID MATCHES MSVC)
        # MSVC_VERSION is defined since 2.8.2 at least
        # https://cmake.org/cmake/help/v2.8.2/cmake.html#variable:MSVC_VERSION
        # https://cmake.org/cmake/help/v3.14/variable/MSVC_VERSION.html
        if(
            # 1930 = VS 17.0 (v143 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "17" AND NOT MSVC_VERSION EQUAL 1930) OR
            # 1920-1929 = VS 16.0 (v142 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "16" AND NOT((MSVC_VERSION GREATER 1919) AND (MSVC_VERSION LESS 1930))) OR
            # 1910-1919 = VS 15.0 (v141 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "15" AND NOT((MSVC_VERSION GREATER 1909) AND (MSVC_VERSION LESS 1920))) OR
            # 1900      = VS 14.0 (v140 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "14" AND NOT(MSVC_VERSION EQUAL 1900)) OR
            # 1800      = VS 12.0 (v120 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "12" AND NOT VERSION_MAJOR STREQUAL "18") OR
            # 1700      = VS 11.0 (v110 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "11" AND NOT VERSION_MAJOR STREQUAL "17") OR
            # 1600      = VS 10.0 (v100 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "10" AND NOT VERSION_MAJOR STREQUAL "16") OR
            # 1500      = VS  9.0 (v90 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "9" AND NOT VERSION_MAJOR STREQUAL "15") OR
            # 1400      = VS  8.0 (v80 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "8" AND NOT VERSION_MAJOR STREQUAL "14") OR
            # 1310      = VS  7.1, 1300      = VS  7.0
            (CONAN_COMPILER_VERSION STREQUAL "7" AND NOT VERSION_MAJOR STREQUAL "13") OR
            # 1200      = VS  6.0
            (CONAN_COMPILER_VERSION STREQUAL "6" AND NOT VERSION_MAJOR STREQUAL "12") )
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "gcc")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        set(_CHECK_VERSION ${VERSION_MAJOR}.${VERSION_MINOR})
        set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 5.0)
            conan_message(STATUS "Conan: Compiler GCC>=5, checking major version ${CONAN_COMPILER_VERSION}")
            conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
            if("${CONAN_COMPILER_MINOR}" STREQUAL "")
                set(_CHECK_VERSION ${VERSION_MAJOR})
                set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR})
            endif()
        endif()
        conan_message(STATUS "Conan: Checking correct version: ${_CHECK_VERSION}")
        if(NOT ${_CHECK_VERSION} VERSION_EQUAL ${_CONAN_VERSION})
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "clang")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        set(_CHECK_VERSION ${VERSION_MAJOR}.${VERSION_MINOR})
        set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 8.0)
            conan_message(STATUS "Conan: Compiler Clang>=8, checking major version ${CONAN_COMPILER_VERSION}")
            if("${CONAN_COMPILER_MINOR}" STREQUAL "")
                set(_CHECK_VERSION ${VERSION_MAJOR})
                set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR})
            endif()
        endif()
        conan_message(STATUS "Conan: Checking correct version: ${_CHECK_VERSION}")
        if(NOT ${_CHECK_VERSION} VERSION_EQUAL ${_CONAN_VERSION})
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "apple-clang" OR CONAN_COMPILER STREQUAL "sun-cc" OR CONAN_COMPILER STREQUAL "mcst-lcc")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        if(NOT ${VERSION_MAJOR}.${VERSION_MINOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
           conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "intel")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 19.1)
            if(NOT ${VERSION_MAJOR}.${VERSION_MINOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
               conan_error_compiler_version()
            endif()
        else()
            if(NOT ${VERSION_MAJOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR})
               conan_error_compiler_version()
            endif()
        endif()
    else()
        conan_message(STATUS "WARN: Unknown compiler '${CONAN_COMPILER}', skipping the version check...")
    endif()
endfunction()


function(conan_check_compiler)
    if(CONAN_DISABLE_CHECK_COMPILER)
        conan_message(STATUS "WARN: Disabled conan compiler checks")
        return()
    endif()
    if(NOT DEFINED CMAKE_CXX_COMPILER_ID)
        if(DEFINED CMAKE_C_COMPILER_ID)
            conan_message(STATUS "This project seems to be plain C, using '${CMAKE_C_COMPILER_ID}' compiler")
            set(CMAKE_CXX_COMPILER_ID ${CMAKE_C_COMPILER_ID})
            set(CMAKE_CXX_COMPILER_VERSION ${CMAKE_C_COMPILER_VERSION})
        else()
            message(FATAL_ERROR "This project seems to be plain C, but no compiler defined")
        endif()
    endif()
    if(NOT CMAKE_CXX_COMPILER_ID AND NOT CMAKE_C_COMPILER_ID)
        # This use case happens when compiler is not identified by CMake, but the compilers are there and work
        conan_message(STATUS "*** WARN: CMake was not able to identify a C or C++ compiler ***")
        conan_message(STATUS "*** WARN: Disabling compiler checks. Please make sure your settings match your environment ***")
        return()
    endif()
    if(NOT DEFINED CONAN_COMPILER)
        conan_get_compiler(CONAN_COMPILER CONAN_COMPILER_VERSION)
        if(NOT DEFINED CONAN_COMPILER)
            conan_message(STATUS "WARN: CONAN_COMPILER variable not set, please make sure yourself that "
                          "your compiler and version matches your declared settings")
            return()
        endif()
    endif()

    if(NOT CMAKE_HOST_SYSTEM_NAME STREQUAL ${CMAKE_SYSTEM_NAME})
        set(CROSS_BUILDING 1)
    endif()

    # If using VS, verify toolset
    if (CONAN_COMPILER STREQUAL "Visual Studio")
        if (CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "LLVM" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "llvm" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "clang" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "Clang")
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "Clang")
        elseif (CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "Intel")
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "Intel")
        else()
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "MSVC")
        endif()

        if (NOT CMAKE_CXX_COMPILER_ID MATCHES ${EXPECTED_CMAKE_CXX_COMPILER_ID})
            message(FATAL_ERROR "Incorrect '${CONAN_COMPILER}'. Toolset specifies compiler as '${EXPECTED_CMAKE_CXX_COMPILER_ID}' "
                                "but CMake detected '${CMAKE_CXX_COMPILER_ID}'")
        endif()

    # Avoid checks when cross compiling, apple-clang crashes because its APPLE but not apple-clang
    # Actually CMake is detecting "clang" when you are using apple-clang, only if CMP0025 is set to NEW will detect apple-clang
    elseif((CONAN_COMPILER STREQUAL "gcc" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU") OR
        (CONAN_COMPILER STREQUAL "apple-clang" AND NOT CROSS_BUILDING AND (NOT APPLE OR NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang")) OR
        (CONAN_COMPILER STREQUAL "clang" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang") OR
        (CONAN_COMPILER STREQUAL "sun-cc" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "SunPro") )
        message(FATAL_ERROR "Incorrect '${CONAN_COMPILER}', is not the one detected by CMake: '${CMAKE_CXX_COMPILER_ID}'")
    endif()


    if(NOT DEFINED CONAN_COMPILER_VERSION)
        conan_message(STATUS "WARN: CONAN_COMPILER_VERSION variable not set, please make sure yourself "
                             "that your compiler version matches your declared settings")
        return()
    endif()
    check_compiler_version()
endfunction()


macro(conan_set_flags build_type)
    set(CMAKE_CXX_FLAGS${build_type} "${CMAKE_CXX_FLAGS${build_type}} ${CONAN_CXX_FLAGS${build_type}}")
    set(CMAKE_C_FLAGS${build_type} "${CMAKE_C_FLAGS${build_type}} ${CONAN_C_FLAGS${build_type}}")
    set(CMAKE_SHARED_LINKER_FLAGS${build_type} "${CMAKE_SHARED_LINKER_FLAGS${build_type}} ${CONAN_SHARED_LINKER_FLAGS${build_type}}")
    set(CMAKE_EXE_LINKER_FLAGS${build_type} "${CMAKE_EXE_LINKER_FLAGS${build_type}} ${CONAN_EXE_LINKER_FLAGS${build_type}}")
endmacro()


macro(conan_global_flags)
    if(CONAN_SYSTEM_INCLUDES)
        include_directories(SYSTEM ${CONAN_INCLUDE_DIRS}
                                   "$<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_RELEASE}>"
                                   "$<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_RELWITHDEBINFO}>"
                                   "$<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_MINSIZEREL}>"
                                   "$<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DEBUG}>")
    else()
        include_directories(${CONAN_INCLUDE_DIRS}
                            "$<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_RELEASE}>"
                            "$<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_RELWITHDEBINFO}>"
                            "$<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_MINSIZEREL}>"
                            "$<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DEBUG}>")
    endif()

    link_directories(${CONAN_LIB_DIRS})

    conan_find_libraries_abs_path("${CONAN_LIBS_DEBUG}" "${CONAN_LIB_DIRS_DEBUG}"
                                  CONAN_LIBS_DEBUG)
    conan_find_libraries_abs_path("${CONAN_LIBS_RELEASE}" "${CONAN_LIB_DIRS_RELEASE}"
                                  CONAN_LIBS_RELEASE)
    conan_find_libraries_abs_path("${CONAN_LIBS_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_RELWITHDEBINFO}"
                                  CONAN_LIBS_RELWITHDEBINFO)
    conan_find_libraries_abs_path("${CONAN_LIBS_MINSIZEREL}" "${CONAN_LIB_DIRS_MINSIZEREL}"
                                  CONAN_LIBS_MINSIZEREL)

    add_compile_options(${CONAN_DEFINES}
                        "$<$<CONFIG:Debug>:${CONAN_DEFINES_DEBUG}>"
                        "$<$<CONFIG:Release>:${CONAN_DEFINES_RELEASE}>"
                        "$<$<CONFIG:RelWithDebInfo>:${CONAN_DEFINES_RELWITHDEBINFO}>"
                        "$<$<CONFIG:MinSizeRel>:${CONAN_DEFINES_MINSIZEREL}>")

    conan_set_flags("")
    conan_set_flags("_RELEASE")
    conan_set_flags("_DEBUG")

endmacro()


macro(conan_target_link_libraries target)
    if(CONAN_TARGETS)
        target_link_libraries(${target} ${CONAN_TARGETS})
    else()
        target_link_libraries(${target} ${CONAN_LIBS})
        foreach(_LIB ${CONAN_LIBS_RELEASE})
            target_link_libraries(${target} optimized ${_LIB})
        endforeach()
        foreach(_LIB ${CONAN_LIBS_DEBUG})
            target_link_libraries(${target} debug ${_LIB})
        endforeach()
    endif()
endmacro()


macro(conan_include_build_modules)
    if(CMAKE_BUILD_TYPE)
        if(${CMAKE_BUILD_TYPE} MATCHES "Debug")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_DEBUG} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "Release")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_RELEASE} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "RelWithDebInfo")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_RELWITHDEBINFO} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "MinSizeRel")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_MINSIZEREL} ${CONAN_BUILD_MODULES_PATHS})
        endif()
    endif()

    foreach(_BUILD_MODULE_PATH ${CONAN_BUILD_MODULES_PATHS})
        include(${_BUILD_MODULE_PATH})
    endforeach()
endmacro()


### Definition of user declared vars (user_info) ###

set(CONAN_USER_BOOST_stacktrace_addr2line_available "True")